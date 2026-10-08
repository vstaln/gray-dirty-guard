<p align="center">
  <img src="assets/gray-logo.svg" alt="gray" width="96">
</p>
<h1 align="center">gray-dirty-guard</h1>
<p align="center">Warns the agent at turn start when the session repo has uncommitted changes.</p>
<p align="center">
  <a href="https://github.com/vstaln/gray-dirty-guard/blob/main/LICENSE"><img alt="MIT License" src="https://img.shields.io/badge/license-MIT-blue.svg"></a>
  <img alt="gray plugin" src="https://img.shields.io/badge/gray-plugin-7aa2f7.svg">
  <img alt="rust" src="https://img.shields.io/badge/built%20with-rust-orange.svg">
</p>

Every `prompt/context` call gets `Note: the working tree has N uncommitted
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

---
Part of the [gray](https://github.com/vstaln/gray) plugin ecosystem —
the open-source AI agent harness. <https://gray.alignment.id>
