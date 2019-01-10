Many of the files in here, e.g. `*.yml`, are for automatic updates, powered by https://www.electron.build/auto-update/.

Note:
- `Outline-Manager.zip` is for auto-updates on macOS
- the paths in `*.yml` are specified by the `package_*_action.sh` scripts in `src/server_manager/electron_app`
- `stable/` holds the current stable binaries and is what the website links to (the separation allows us perform staged rollouts).
