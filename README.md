# FR2 Reborn

FR2 Reborn is a **mobile first Solar2D game project** inspired by the legacy Fun Run 2 experience.

The project is a **full code rewrite**, built using original game assets provided by Dirtybit through publicly available APKs. All gameplay systems, rendering logic, and architecture are rewritten and maintained independently.

The game is currently **near completion**, with the remaining work focused on UI completion, polish, and a small set of known issues.

## Project Status

FR2 Reborn is **not released publicly**.

The game is currently tested only by:
* Core developers
* A closed group of internal testers

Public release will occur **only at version 1.0.0**, once all known issues are resolved and all UI systems are completed.

Most historical bugs related to maps, crashes, rendering, scaling, physics, and gameplay systems have already been fixed.

## Known Issues

The following issues are still pending and must be resolved before version 1.0.0:

* Map name appears doubled
* Coins and coin icons are misaligned
* Item preview does not function
* Lobby bear does not display the selected avatar correctly
* Skin changing is not functional
* Powerups appear visually glitched

All other previously reported issues have been resolved.

## UI Completion Status

Not all user interfaces are finalized.

Some UI screens are:
* Incomplete
* Temporarily placeholder
* Missing final layout or animations

UI completion is a required milestone before public release and is actively being worked on.

## Target Platforms

* Android is the primary target platform
* iOS is supported as a secondary platform

Desktop platforms are not officially supported. The Solar2D simulator is used strictly for development and debugging.

## Engine and Technology

* Engine: Solar2D
* Language: Lua using LuaJIT
* Scene management: Composer
* Physics engine: Box2D via Solar2D
* Rendering: Mobile GPU focused rendering pipeline

## Resolution and Scaling

The original game logic and assets were designed for low internal resolutions. The project has been adapted for modern mobile displays, including common aspect ratios such as 16 by 9.

Major fixes already completed:
* UI scaling consistency
* Sprite anchoring and positioning
* Camera anchoring and movement
* Powerup sizing and placement
* Map tiling and background alignment

Minor visual inconsistencies may still exist on uncommon screen sizes.

## Assets and Attribution

This is a **fan made, non commercial project**.

All original game assets, trademarks, and intellectual property belong to **Dirtybit**. Assets used in this project originate from official Fun Run 2 APKs made publicly available by Dirtybit.

FR2 Reborn does not claim ownership of any original assets and exists purely as a technical and educational rewrite of the game logic.

## Legal Notice

This project is not affiliated with Dirtybit or the original Fun Run development team.

All rights to original assets and trademarks remain with their respective owners.

## Public Release!

This will be the **first public release** of FR2 Reborn. Estimated release date is estimated to be in Q1-Q2 of 2026.

Release conditions:
* All known issues resolved
* All UI screens fully completed
* Stable gameplay experience
* No critical crashes
* Release ready Android build
* Optional iOS build depending on stability

Until version 1.0.0 is released, the project remains private and accessible only to developers and internal testers. If you're interested in making the game release faster, feel free to join our [Discord Server](https://discord.gg/k8XM2k23kd) and apply for being a tester! This makes us way easier to fix the bugs and also, you get exclusive credits and special rewards right in the game!

## License

The source code in this repository is released under the MIT License. See the LICENSE file for details.
