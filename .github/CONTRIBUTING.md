# Contributing

Thanks for helping improve FR2 Reborn. You do not need to know every GitHub feature to take part.

## Report a problem

Open [Issues](../../issues/new/choose) and pick the form that fits:

- **Report a bug** for something that does not work as it should.
- **Report a crash or error box** when the game closes, freezes or shows a "Runtime error".
- **Report a LAN (friends) problem** for races with friends on the same network.

Every form asks for your game version and device (for example: version 1.1.0, Android 14, Samsung A54). Never include passwords or private account information.

## Suggest an improvement

Open Issues and choose **Suggest an improvement**. Explain the idea and how it would help players.

## Ask for help

Open Issues and choose **Ask a question**, or ask on the Discord server linked in the README.

## Send a code change

1. Create a fork of the repository with the Fork button.
2. Make your change in your fork.
3. Open your fork and choose Contribute, then Open pull request.
4. Fill in the pull request form: what changed, how you checked it, screenshots.

Please keep each change focused. Do not add game saves, signing keys, passwords, private account details or built app files.

---

## Running the project

The game is a [Solar2D](https://solar2d.com) project (Lua 5.1).

- **Phone layout:** open `main.lua` in the Solar2D Simulator.
- **PC layout and controls:** on Windows run `PCMode.bat` (it sets `FR2_PC_UI=1` and starts the Simulator), or set that environment variable yourself.
- The Simulator console shows everything the game prints, including errors with their stack traceback.

## Debugging guide

**Where the code lives**

| Folder | What is in it |
| --- | --- |
| `lua/scenes` | Screens: menus, lobbies, the race (`gamePlay.lua`), results (`postLobby.lua`) |
| `lua/overlays` | Pop-ups over a screen: shop purchase, daily spin, leagues, clans |
| `lua/gameLogic` | The race: runners (`player.lua`), bots (`botModule.lua`), power-ups |
| `lua/game/powerups` | One file per power-up |
| `lua/modules` | Shared logic: saves, leagues, clans, 2 vs 2 scoring, keyboard navigation |
| `lua/network` | LAN play (`lanNet.lua`, `lanSession.lua`) and the original online code |
| `config` | Store items, maps, prizes and game settings (JSON) |

**Getting logs**

- **Simulator / Windows:** the console window. Copy the lines around the problem.
- **Android:** `adb logcat -s Corona` while the problem happens.
- **iOS:** Xcode > Window > Devices and Simulators > Open Console.
- **Extra output:** `lua/modules/debugMode.lua` has switches per area (`network`, `spine`, `main`...). Set one on, for example `composer.debugger.network = true` in `configuration.lua`, to print that area's details.
- **On screen:** `composer.debugger.fpsGame = true` shows the frame rate during races; `composer.debugger.memoryCheck = true` shows memory use.

**Saves**

The save is `data.sqlite3` in the app's documents folder, with a JSON backup next to it (`save_backup.json`). If a save problem is reported, a copy of the backup (with private details removed) helps to reproduce it. A change to the save's layout needs `saveData.VERSION` raised and a migration step in `lua/modules/saveData.lua`.

**LAN races**

One device hosts, the others join over the local network. The host announces its game with UDP broadcasts on port 48828 and runs the race over TCP port 48829, relaying everyone's moves in the original game server's messages (`lua/network/lanSession.lua`). To test on one computer, run two copies of the game: host in one, use **Join address** with `127.0.0.1` in the other. Messages that fail in a race are printed with a `LAN:` prefix.

**Bots**

Bots (`lua/gameLogic/botModule.lua`) look ahead with physics ray casts: they jump walls and ground traps, avoid jumping into hanging blades, jump for power-up boxes when their slot is empty, keep power-ups for the right moment (the hunter's mark goes on you) and use shields against attacks. A bot left well behind you gets a little extra pace, at most 8% (`CATCH_UP_*`). Their tuning values are at the top of the file.

## Checks before a pull request

GitHub checks every pull request: all Lua files must compile with Lua 5.1 and all JSON files must be valid (see `.github/workflows/checks.yml`). You can run the same check yourself:

```sh
find . -name "*.lua" -print0 | xargs -0 -n1 luac5.1 -p
find . -name "*.json" -print0 | xargs -0 -n1 python3 -m json.tool > /dev/null
```

Then try the screens you changed in the Simulator, at 30 and 60 FPS for anything that moves, and with the PC layout for anything on screen.
