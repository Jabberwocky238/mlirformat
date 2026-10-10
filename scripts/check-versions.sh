#!/bin/sh
# Every crate in the repository shares one version: mlirformat, mlirformat-macros, and the
# mlirformat-macros dependency of mlirformat. With an argument (a release tag), it must match too.
set -eu
cd "$(dirname "$0")/.."
version_of() { sed -n 's/^version = "\(.*\)"/\1/p' "$1" | head -1; }
main=$(version_of Cargo.toml)
macros=$(version_of macros/Cargo.toml)
dependency=$(sed -n 's/^mlirformat-macros = .*version = "\([^"]*\)".*/\1/p' Cargo.toml)
status=0
check() {
    if [ "$2" != "$main" ]; then
        echo "error: $1 is $2, mlirformat is $main" >&2
        status=1
    fi
}
check "mlirformat-macros" "$macros"
check "the mlirformat-macros dependency" "$dependency"
if [ $# -gt 0 ]; then
    check "the tag" "$1"
fi
[ $status -eq 0 ] && echo "versions: $main"
exit $status
