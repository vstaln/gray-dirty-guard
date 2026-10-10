<div align="center">
  <img alt="gray-dirty-guard" src="assets/icon.svg" width="120" height="120" />
  <h1>gray-dirty-guard</h1>
  <p><strong>Note uncommitted changes in the prompt context. Never blocks, never edits.</strong></p>
  <p>
    <a href="https://gray.alignment.id">Website</a> ·
    <a href="https://gray.alignment.id/plugins/gray-dirty-guard">Store</a> ·
    <a href="https://github.com/vstaln/gray-dirty-guard">Source</a> ·
    <a href="https://github.com/vstaln/gray">gray</a>
  </p>
  <p>
    <a href="LICENSE"><img alt="License: MIT" src="https://img.shields.io/badge/license-MIT-1c1c20?style=flat-square&labelColor=0a0a0b" /></a>
    <a href="https://www.rust-lang.org"><img alt="Built with Rust" src="https://img.shields.io/badge/built%20with-rust-1c1c20?style=flat-square&labelColor=0a0a0b&logo=rust&logoColor=d4a373" /></a>
    <a href="https://gray.alignment.id/plugins/gray-dirty-guard"><img alt="gray plugin" src="https://img.shields.io/badge/gray-plugin-1c1c20?style=flat-square&labelColor=0a0a0b&color=7aa2f7" /></a>
  </p>
</div>

<br/>

```bash
gray plugin install gray-dirty-guard
```

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

## Tags

`gray` `plugin` `dirty-guard` `rust`

---
Part of the [gray](https://github.com/vstaln/gray) plugin ecosystem —
the open-source AI agent harness. <https://gray.alignment.id>
