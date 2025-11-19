# Dev Container Templates for ColonyOS Executors

Dev container templates that streamline local development of ColonyOS executors. Each template provisions a full multi-container environment (database + ColonyOS server + your dev container) with credentials auto-generated and injected as environment variables.

## Published Templates

Use the registry identifiers directly when creating a dev container configuration:

* `ghcr.io/ossko/colonyos-executor-devcontainers/go` – Go executor development
* `ghcr.io/ossko/colonyos-executor-devcontainers/python` – Python executor development

## What You Get

When a template is applied it automatically launches:

* A TimescaleDB instance seeded for ColonyOS use
* A ColonyOS server reachable from the dev container
* Your language-specific development container with the ColonyOS CLI installed
* Unique credentials / IDs exported as environment variables (e.g. `COLONIES_COLONY_ID`, `COLONIES_USER_ID`, `COLONIES_EXECUTOR_ID`)

## Prerequisites

* VS Code (or Codespaces) with the [Dev Containers extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)
* Docker daemon running locally (for VS Code on your machine)

## Quick Start (VS Code)

1. Create a new directory for your project and open it in VS Code.
2. Open the Command Palette: “Dev Containers: Open Folder in Container…”.
3. Choose where to store devcontainer configuration files (in project or separate).
4. In the template input box, paste one of:
	 * `ghcr.io/ossko/colonyos-executor-devcontainers/go`
	 * `ghcr.io/ossko/colonyos-executor-devcontainers/python`
5. (Optional) Add additional Dev Container features.
6. Confirm and let VS Code build & start the environment.

After the build completes you will be attached to the dev container with a ready ColonyOS environment.

## Verifying the Environment

Inside the dev container terminal run:

```bash
colonies server status
```

Example output:

```bash
╭──────────────────┬──────────────────────╮
│ Server version   │ dev                  │
│ Server buildtime │ 2025-11-19 09:29:52Z │
│ CLI version      │ 1.9.0                │
│ CLI buildtime    │ 2025-10-26 10:08:29Z │
│   HTTP TLS       │ false                │
│   HTTP Port      │ 50080                │
│   HTTP Insecure  │ false                │
│   HTTP Host      │ 0.0.0.0              │
│   HTTP Host      │ localhost            │
│ Server Backends  │ http                 │
│ Client Backends  │ http                 │
╰──────────────────┴──────────────────────╯
```

## Provisioning a Development Colony

To begin executor development, create a colony, user, and executor using the generated IDs. Run these inside the dev container shell:

```bash
# Create a development colony (IDs are already exported as env vars)
colonies colony add \
	--name="$COLONIES_COLONY_NAME" \
	--colonyid="$COLONIES_COLONY_ID"

# Add a user (change the name if desired)
colonies user add \
	--name=devuser \
	--userid="$COLONIES_USER_ID"

# Register and approve an executor (rename/type to match your project)
colonies executor add \
	--name=devexecutor \
	--type=dev \
	--executorid="$COLONIES_EXECUTOR_ID" \
	--approve
```

You can now scaffold your executor (e.g. initialize a Go module or create a Python package) and begin implementing task handling logic.

## Common Environment Variables
See .env files within the /configuration -directory mounted in the devcontainer.

## Updating
To pick up template updates: reopen in container and choose “Rebuild Container” or delete the `.devcontainer` folder and re-select the template.

## Contributing
Issues and PRs are welcome. Please keep changes minimal and focused; propose larger adjustments first via an issue for discussion.

## License
See `LICENSE` in the repository root.

---
Happy hacking with ColonyOS executors!