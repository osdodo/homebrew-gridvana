cask "gridvana" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.1.2"
  sha256 arm:   "e5a010c6c419ab683d81728cd0829f14a678bdd0305a61b249e89dd6564ced15",
         intel: "a5cedaa76e3cce526a7f4ca4c49f4fccfad5be40a9aa62607fcbb4e909087eec"

  url "https://github.com/osdodo/gridvana/releases/download/v#{version}/Gridvana-v#{version}-macos-#{arch}.zip"
  name "Gridvana"
  desc "Collaborative pixel art and animation editor for humans and AI agents"
  homepage "https://github.com/osdodo/gridvana"

  app "Gridvana.app"

  # Ad-hoc signed, not notarized: without this Gatekeeper reports the app as damaged.
  postflight_steps do
    run "/usr/bin/xattr",
        args:           ["-dr", "com.apple.quarantine", "{{appdir}}/Gridvana.app"],
        writable_paths: ["Gridvana.app"],
        writable_base:  :appdir
  end
end
