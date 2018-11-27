Many of the files in here, e.g. `*.yml`, are for automatic updates, powered by https://www.electron.build/auto-update/.

Note:
- `Outline-Manager.zip` is for auto-updates on macOS
- `*.blockmap` is for differential (smaller!) downloads (**but the `.blockmap` for Windows is temporarily disabled owing to https://github.com/Jigsaw-Code/outline-server/issues/282**)
- the paths in `*.yml` are specified by the `package_*_action.sh` scripts in `src/server_manager/electron_app`
- `latest-mac.json` is for versions 1.1.6 and earlier (we moved to electron-updater 3.x in 1.1.7 which no longer generates/uses this file)
- `stable/` holds the current stable binaries and is what the website links to (the separation allows us perform staged rollouts).
