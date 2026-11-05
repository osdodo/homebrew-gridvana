# Homebrew Tap for Gridvana

Homebrew tap for [Gridvana](https://github.com/osdodo/gridvana).

## Installation

```bash
brew install --cask osdodo/gridvana/gridvana
```

The app is ad-hoc signed, not notarized. The cask removes the quarantine
attribute after install so Gatekeeper does not report it as damaged. If you
installed the app another way (e.g. the zip) and macOS blocks it:

```bash
xattr -dr com.apple.quarantine /Applications/Gridvana.app
```

## Updating the cask

After a `vX.Y.Z` release is published on osdodo/gridvana:

```bash
./update-cask.sh X.Y.Z
git commit -am "gridvana X.Y.Z"
```
