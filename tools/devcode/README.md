# Dev codes

Dev codes let a developer unlock things on one player's account. A code only works for the player it was made for, and only someone with the private signing key can make one.

## Giving a player a maxed account

1. The player opens **Settings** and taps the **Settings** title 7 times. The Dev menu opens and shows their Dev ID, for example `AHAQ3-DS90B`.
2. They send you that ID.
3. You run:

   ```
   node tools/devcode/devcode.js sign AHAQ3-DS90B
   ```

4. Send them the code it prints. They type or paste it into the Dev menu and press **Redeem**.

A "max" code gives them:

* every shop item: animals, skins, hats, facewear, necks, trails, feet, backwear and power up skins, including the hidden and dev ones. This includes the achievement reward items.
* the wins every master skin asks for
* coins up to 9,999,999 and gems up to 999,999 (it never lowers them)

Checking a code takes a second or two. The game keeps drawing while it checks.

## The key

* `tools/devcode/dev-signing-key.json` is the **private** key. Git ignores it. Anyone with this file can make codes, so share it only with trusted developers, and keep a backup somewhere safe.
* `lua/modules/devUnlockKey.lua` is the **public** key the game uses to check codes. Commit it.
* `node tools/devcode/devcode.js keygen --force` makes a new key pair. Every code made with the old key stops working once players update.

Needs Node.js 16 or newer, and nothing else.
