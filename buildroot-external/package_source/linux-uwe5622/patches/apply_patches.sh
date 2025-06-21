#!/bin/bash
set -e

SCRIPT_PATH="$(readlink -f "$0")"
PATCH_DIR="$(dirname "$SCRIPT_PATH")"
SRC_DIR="$(dirname "$PATCH_DIR")"

cd "$SRC_DIR"

shopt -s nullglob
patch_files=("$PATCH_DIR"/*.patch)
if [ ${#patch_files[@]} -eq 0 ]; then
    echo "No patch files found in $PATCH_DIR"
    exit 0
fi


for patch in "${patch_files[@]}"; do
    echo "Applying $patch ..."
    patch -p1 < "$patch"
done

echo "All patches applied successfully."