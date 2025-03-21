# Secret Entrances, Confounding Rooms: Enfer's Trial

This is a Godot port of the game we created for Game Off 2024, theme "Secret". A minimalistic, action-based dungeon crawler.

# Playing

Binary builds are not available yet, this port is WIP. If you want to play the original GameMaker version, please check out the [appropriate branch](../gamemaker).

# Building

If you want to modify the game (add/remove rooms, enemies, items), use it as a base for your own project, or just build a native version for your own platform, you should:

1. Read and accept the game's [LICENSE](LICENSE.md).
2. Open [project.godot](project.godot) and look for the line that starts with `config/features`. This will let you identify the correct Godot version to use for the build.
3. [Download](https://godotengine.org/download/archive/) the latest stable patch for the appropriate Godot version (for example, if `config/features` points to 4.4, download the latest stable 4.4.X build).
4. Open Godot, click the Import button and point it to `project.godot`.
5. Navigate to Project -> Export -> Export All -> Release.
