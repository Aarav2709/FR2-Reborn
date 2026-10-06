# Pull request

Thank you for helping improve FR2 Reborn. Plain language is perfect; delete the parts that don't apply.

## What changed?

<!-- A short description. Link the issue it fixes, for example "Fixes #12". -->

## Type of change

- [ ] Bug fix
- [ ] New feature
- [ ] Menus, layout or art
- [ ] Gameplay or balance (racing, bots, power-ups)
- [ ] Multiplayer (LAN)
- [ ] Performance
- [ ] Documentation or GitHub files

## How did you check it?

<!-- What you opened or tried. If you could not run it, say so. -->

Tested on:

- [ ] Solar2D Simulator (phone layout)
- [ ] Solar2D Simulator with PC controls (`PCMode.bat` / `FR2_PC_UI=1`)
- [ ] Android device
- [ ] iOS device
- [ ] Windows build

What I tried (modes, maps, screens):

## Screenshots or video

<!-- Before and after, if a screen changed. A short clip helps for gameplay changes. -->

## Checklist

- [ ] The CI check (Lua syntax and JSON) passes.
- [ ] No new global variables (everything is `local` unless it has to be shared).
- [ ] Gameplay or timing changes work at both 30 and 60 FPS (Settings > frame rate).
- [ ] Screen changes work with PC keyboard navigation and on wide and tall screens.
- [ ] Old saves still load (if the save changed, `saveData.VERSION` and a migration were added).
- [ ] LAN changes were tried with two devices (or two copies of the game) on one network.
- [ ] No saves, signing keys, passwords, private details or built app files are included.
