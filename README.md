# Secret Entrances, Confounding Rooms: Enfer's Trial

This is a WIP Godot port of the game we created for Game Off 2024, theme "Secret". A minimalistic, action-based dungeon crawler.

If you want to play the original GameMaker version, please check out the [appropriate branch](../gamemaker).

# Playing

Note that this port is heavily work-in-progress, it can barely be called a game yet, for a complete experience please play the [GameMaker version](../gamemaker) for now.

Because of this incomplete state, the binary builds (meant only for testing), for now, are available exclusively through GitHub Actions.
We'll move to a more user-friendly form of distribution once the port is in a more presentable state.

If, understanding that, you still want to download a binary build:
1. Create a GitHub account if you don't have one.
    * This will no longer be required once we have a proper release system in place, so if you're uncomfortable with that, please wait just a bit longer.
2. Open [this page](https://github.com/andOlga/game-off-2024/actions/workflows/nightly.yml?query=is%3Acompleted).
3. Click on the *very first* link with the checkmark near it, which will point to the latest available build.
4. Under "Artifacts", pick your platform and download the relevant archive.
5. Extract it and run the executable file inside.

# Building

If you want to modify the game (add/remove rooms, enemies, items), use it as a base for your own project, or just build a native version for your own platform, you should:

1. Read and accept the game's [LICENSE](LICENSE.md).
2. [Download](https://github.com/andOlga/game-off-2024/archive/refs/heads/godot.zip) the game's code.
3. [Download](https://godotengine.org/download/archive/4.4-stable/) Godot 4.4-stable for your platform.
4. Open Godot, click the Import button and point it to the downloaded zip file.
5. Optionally, make whatever changes you deem necessary.
6. Navigate to Project -> Export -> Export All -> Release.
