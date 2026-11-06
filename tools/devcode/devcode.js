#!/usr/bin/env node
// Makes dev codes: signed codes that unlock things for one player's account.
//
//   node tools/devcode/devcode.js keygen            make a new signing key (once)
//   node tools/devcode/devcode.js sign <DEV-ID>     make a "max account" code for a player
//
// The player finds their Dev ID in the hidden Dev menu (Settings, tap the title 7 times).
// The private key stays in tools/devcode/dev-signing-key.json, which git ignores: anyone
// holding it can make codes, so keep it private and back it up. The game only carries the
// public half (lua/modules/devUnlockKey.lua) and checks codes with it.
//
// The codes are Schnorr signatures in a 2048-bit prime field (256-bit subgroup) with a
// 128-bit challenge, so a code is 49 bytes: 1 action byte, 16 challenge bytes, 32 bytes of s.

"use strict";
const crypto = require("crypto");
const fs = require("fs");
const path = require("path");

const KEY_FILE = path.join(__dirname, "dev-signing-key.json");
const LUA_KEY_FILE = path.join(__dirname, "..", "..", "lua", "modules", "devUnlockKey.lua");

const P_BITS = 2048;
const Q_BITS = 256;
const LIMB_BITS = 24; // the Lua side works in 24-bit limbs (doubles hold 53 bits exactly)
const LIMBS = Math.ceil(P_BITS / LIMB_BITS);
const ACTIONS = { max: 1 };
const ALPHABET = "0123456789ABCDEFGHJKMNPQRSTVWXYZ"; // Crockford base32

function randomBelow(n) {
  const bytes = Math.ceil(n.toString(2).length / 8) + 8;
  return BigInt("0x" + crypto.randomBytes(bytes).toString("hex")) % n;
}

function modPow(base, exp, mod) {
  let result = 1n;
  base %= mod;
  while (exp > 0n) {
    if (exp & 1n) result = (result * base) % mod;
    base = (base * base) % mod;
    exp >>= 1n;
  }
  return result;
}

function modInverse(a, mod) {
  let [r0, r1] = [((a % mod) + mod) % mod, mod];
  let [s0, s1] = [1n, 0n];
  while (r1 !== 0n) {
    const q = r0 / r1;
    [r0, r1] = [r1, r0 - q * r1];
    [s0, s1] = [s1, s0 - q * s1];
  }
  if (r0 !== 1n) throw new Error("no inverse");
  return ((s0 % mod) + mod) % mod;
}

function toBytes(n, length) {
  const hex = n.toString(16).padStart(length * 2, "0");
  if (hex.length > length * 2) throw new Error("number too large");
  return Buffer.from(hex, "hex");
}

function fromBytes(buffer) {
  return BigInt("0x" + (buffer.length ? buffer.toString("hex") : "0"));
}

// Dev IDs are typed by people: ignore case, dashes and spaces, read O as 0 and I/L as 1
function normalizeId(text) {
  return String(text).toUpperCase().replace(/[^0-9A-Z]/g, "").replace(/O/g, "0").replace(/[IL]/g, "1");
}

function base32(buffer) {
  let bits = 0;
  let value = 0;
  let out = "";
  for (const byte of buffer) {
    value = (value << 8) | byte;
    bits += 8;
    while (bits >= 5) {
      out += ALPHABET[(value >>> (bits - 5)) & 31];
      bits -= 5;
    }
    value &= (1 << bits) - 1;
  }
  if (bits > 0) out += ALPHABET[(value << (5 - bits)) & 31];
  return out;
}

function message(devId, action) {
  return Buffer.from("FR2R-DEV|v1|" + normalizeId(devId) + "|" + action, "utf8");
}

function challenge(r, msg) {
  const digest = crypto.createHash("sha256").update(Buffer.concat([toBytes(r, P_BITS / 8), msg])).digest();
  return digest.subarray(0, 16);
}

function sign(key, devId, action) {
  const p = BigInt(key.p), q = BigInt(key.q), g = BigInt(key.g), x = BigInt(key.x);
  const k = randomBelow(q - 1n) + 1n;
  const r = modPow(g, k, p);
  const c = challenge(r, message(devId, action));
  const s = (k + x * fromBytes(c)) % q;
  const code = base32(Buffer.concat([Buffer.from([action]), c, toBytes(s, Q_BITS / 8)]));
  return code.match(/.{1,5}/g).join("-");
}

function verify(key, devId, action, c, s) {
  const p = BigInt(key.p), g = BigInt(key.g), y = BigInt(key.y);
  const r = (modPow(g, s, p) * modPow(modInverse(y, p), fromBytes(c), p)) % p;
  return challenge(r, message(devId, action)).equals(c);
}

function makeGroup() {
  const q = crypto.generatePrimeSync(Q_BITS, { bigint: true });
  const low = (1n << BigInt(P_BITS - 1)) / q + 1n;
  const span = (1n << BigInt(P_BITS)) / q - low;
  let p;
  for (;;) {
    let k = low + randomBelow(span);
    k += k & 1n; // even k makes p odd
    p = k * q + 1n;
    if (p.toString(2).length === P_BITS && crypto.checkPrimeSync(p, { checks: 64 })) break;
  }
  let g = 1n;
  for (let h = 2n; g === 1n; h++) g = modPow(h, (p - 1n) / q, p);
  return { p, q, g };
}

// the Lua checker's constants: numbers as hex in 24-bit limbs, and Montgomery forms
function luaKeyFile(key) {
  const p = BigInt(key.p), g = BigInt(key.g), y = BigInt(key.y);
  const R = 1n << BigInt(LIMBS * LIMB_BITS);
  const B = 1n << BigInt(LIMB_BITS);
  const yInv = modInverse(y, p);
  const hex = (n) => n.toString(16).padStart((LIMBS * LIMB_BITS) / 4, "0");
  const lines = [
    "-- public half of the dev code key, made by tools/devcode/devcode.js keygen (do not edit)",
    "-- numbers are big-endian hex; *M values are in Montgomery form (times 2^" + LIMBS * LIMB_BITS + " mod p)",
    "return {",
    "  limbs = " + LIMBS + ",",
    "  bytes = " + P_BITS / 8 + ",",
    "  n0 = " + ((B - modInverse(p, B)) % B).toString() + ",",
    '  p = "' + hex(p) + '",',
    '  gM = "' + hex((g * R) % p) + '",',
    '  yInvM = "' + hex((yInv * R) % p) + '",',
    '  gyInvM = "' + hex((((g * yInv) % p) * R) % p) + '",',
    '  oneM = "' + hex(R % p) + '"',
    "}",
    ""
  ];
  return lines.join("\n");
}

function loadKey() {
  if (!fs.existsSync(KEY_FILE)) {
    console.error("No signing key at " + KEY_FILE + ". Ask the key holder for it, or run keygen for a new one.");
    process.exit(1);
  }
  return JSON.parse(fs.readFileSync(KEY_FILE, "utf8"));
}

function main() {
  const [command, ...args] = process.argv.slice(2);
  if (command === "keygen") {
    if (fs.existsSync(KEY_FILE) && !args.includes("--force")) {
      console.error("A signing key already exists. A new key makes every old code invalid; pass --force if you mean it.");
      process.exit(1);
    }
    console.log("Making a 2048-bit group, this takes a few seconds...");
    const { p, q, g } = makeGroup();
    const x = randomBelow(q - 1n) + 1n;
    const key = { p: p.toString(), q: q.toString(), g: g.toString(), x: x.toString(), y: modPow(g, x, p).toString() };
    fs.writeFileSync(KEY_FILE, JSON.stringify(key, null, 2) + "\n", { mode: 0o600 });
    fs.writeFileSync(LUA_KEY_FILE, luaKeyFile(key));
    console.log("Private key: " + KEY_FILE + " (keep it private and backed up)");
    console.log("Public key for the game: " + LUA_KEY_FILE + " (commit this one)");
  } else if (command === "sign") {
    const devId = normalizeId(args[0] || "");
    const actionName = args[1] || "max";
    if (devId.length < 6) {
      console.error("Usage: node tools/devcode/devcode.js sign <DEV-ID> [max]");
      process.exit(1);
    }
    if (!ACTIONS[actionName]) {
      console.error("Unknown action " + actionName + ". Known: " + Object.keys(ACTIONS).join(", "));
      process.exit(1);
    }
    const key = loadKey();
    const code = sign(key, devId, ACTIONS[actionName]);
    console.log(code);
  } else if (command === "lua") {
    fs.writeFileSync(LUA_KEY_FILE, luaKeyFile(loadKey()));
    console.log("Wrote " + LUA_KEY_FILE);
  } else {
    console.log("Usage:\n  node tools/devcode/devcode.js keygen\n  node tools/devcode/devcode.js sign <DEV-ID> [max]");
    process.exit(command ? 1 : 0);
  }
}

module.exports = { sign, verify, normalizeId, base32, message, ACTIONS };

if (require.main === module) main();
