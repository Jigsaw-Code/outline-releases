The Outline Client for Windows is based on Electron and uses the [auto update feature](https://www.electron.build/auto-update) from electron-builder.

This directory is the "auto update directory" and **cannot be easily changed** because
clients are checking it for updates; `stable/` holds the current stable binary and is
what the website links to (the separation allows us perform staged rollouts).

The update configuration is in the `latest.yml` files. It's location is specified in the `release_action.sh` scripts at https://github.com/Jigsaw-Code/outline-client/blob/master/electron/release_action.sh.

The clients for the other platforms are updated via their respective app stores.
