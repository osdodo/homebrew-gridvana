#!/bin/bash
# Usage: ./update-cask.sh <version>   e.g. ./update-cask.sh 0.1.0
set -euo pipefail

VERSION=${1:?Usage: $0 <version>}
CASK="Casks/gridvana.rb"
BASE="https://github.com/osdodo/gridvana/releases/download/v${VERSION}"

sha() { curl -fsSL "$BASE/Gridvana-v${VERSION}-macos-$1.zip" | shasum -a 256 | awk '{print $1}'; }
ARM_SHA=$(sha aarch64)
INTEL_SHA=$(sha x86_64)

sed -i '' "s/version \".*\"/version \"$VERSION\"/" "$CASK"
sed -i '' "s/arm:   \"[0-9a-f]*\"/arm:   \"$ARM_SHA\"/" "$CASK"
sed -i '' "s/intel: \"[0-9a-f]*\"/intel: \"$INTEL_SHA\"/" "$CASK"

echo "Updated $CASK to $VERSION (aarch64 $ARM_SHA, x86_64 $INTEL_SHA)"
