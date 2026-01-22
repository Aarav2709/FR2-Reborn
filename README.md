# FR2-Reborn

FR2-Reborn is a **mobile-first Solar2D game project** based on the legacy Fun Run 2 codebase.
This repository is primarily intended for **Android and iOS** builds and is **not optimized for desktop gameplay**.

The project is currently in an **unstable and incomplete state**. Many systems are partially implemented or broken due to resolution changes, asset scaling issues, and legacy assumptions from older devices.

## Project Status

* Actively being debugged and restructured
* UI layout, sprite scaling, and powerups are currently broken
* Resolution handling is in transition from legacy low-resolution setups to modern 16:9 mobile displays
* Desktop simulator support is limited and unreliable

This repository should be treated as a **work-in-progress**, not a finished or playable game.

## Target Platforms

* Android (primary)
* iOS (secondary)

Desktop platforms:

* Not officially supported
* Solar2D Simulator is used only for development and debugging

## Engine and Technology

* Engine: Solar2D (Corona SDK legacy)
* Language: Lua (LuaJIT runtime)
* Scene management: Composer
* Physics: Solar2D physics (Box2D)
* Rendering: Mobile GPU oriented pipeline

## Resolution and Scaling

The game logic and assets were originally designed for **low internal resolutions** and are being adapted to modern phone resolutions such as:

* 1280x720
* 1920x1080

Current issues include:

* Overscaled UI
* Misaligned sprites
* Incorrect anchor and content scaling
* Powerups rendering at wrong sizes or positions

These issues are expected and are part of ongoing fixes.

## Legal Notice

This is a fan-made, non-commercial project.
It is not affiliated with Dirtybit or the original Fun Run developers.

All original trademarks and assets belong to their respective owners.

## License

MIT License. See the LICENSE file for details.
