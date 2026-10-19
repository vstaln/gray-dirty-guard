#!/bin/sh
here="$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)"
sys="$(uname -s)"
case "$sys" in
MINGW* | MSYS* | CYGWIN*) rel="x86_64-pc-windows-msvc/gray-dirty-guard.exe" ;;
Darwin*)
    case "$(uname -m)" in
    arm64) rel="aarch64-apple-darwin/gray-dirty-guard" ;;
    *) rel="x86_64-apple-darwin/gray-dirty-guard" ;;
    esac ;;
*)
    case "$(uname -m)" in
    aarch64 | arm64) rel="aarch64-unknown-linux-musl/gray-dirty-guard" ;;
    *) rel="x86_64-unknown-linux-musl/gray-dirty-guard" ;;
    esac ;;
esac
if [ -x "$here/$rel" ]; then exec "$here/$rel" "$@"; fi
for cand in "$here/target/release/gray-dirty-guard.exe" "$here/target/release/gray-dirty-guard" "$here/target/debug/gray-dirty-guard.exe" "$here/target/debug/gray-dirty-guard"; do
    if [ -x "$cand" ]; then exec "$cand" "$@"; fi
done
echo "gray-dirty-guard binary not found in $here" >&2
exit 1
