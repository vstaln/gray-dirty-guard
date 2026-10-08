# gray-dirty-guard

Inject a one-line uncommitted-changes note into context at turn start. Port of pi's dirty-repo-guard extension.

Pi blocked session switches behind a UI prompt; this port informs instead:
every `prompt/context` call gets `Note: the working tree has N uncommitted
changes (M modified, U untracked).` when the session cwd is a dirty git
work tree, `{}` otherwise. Never blocks, never edits.

A sidecar plugin for [gray](https://github.com/vstaln/gray), scaffolded by
[gray-account](https://github.com/vstaln/gray-account).

## Wire methods used

- `plugin/manifest`, `plugin/shutdown`
- `prompt/context` (claimed via `hooks`) — the dirty-tree note
- `command/run` — `/dirty` status, `/dirty on|off` (persisted at
  `~/.gray/dirty-guard/disabled`; default ON)

No capabilities required.

## Install

```sh
gray plugin install dirty-guard
```

## Develop

```sh
cargo test
gray account check      # entry point + manifest handshake
gray account publish    # check → build → release → publish to the gray registry
```

Bump `version` in `Cargo.toml` before each `publish`; the registry refuses to
republish a version.
