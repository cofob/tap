cask "capslockswitcher" do
  version "1.2"
  sha256 "7fd789fe96feaef9a0b8ca0454effd92d7775506e18ffd10bc7248aac869ea30"

  url "https://github.com/doasync/CapsLockSwitcher/releases/download/#{version}-app/CapsLockSwitcher.app.zip"
  name "CapsLockSwitcher"
  desc "Switch between two keyboard layouts using the Caps Lock key"
  homepage "https://github.com/doasync/CapsLockSwitcher"

  livecheck do
    url :url
    regex(/^(\d+(?:\.\d+)+)-app$/i)
    strategy :github_latest
  end

  depends_on macos: :sequoia

  app "CapsLockSwitcher.app"

  preflight_steps do
    # The upstream ZIP does not preserve executable permissions.
    set_permissions "CapsLockSwitcher.app/Contents/MacOS/CapsLockSwitcher", "0755", recursive: false
  end

  postflight_steps do
    # Upstream's ad-hoc signed release is not notarized.
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/CapsLockSwitcher.app"]
  end

  uninstall quit: "com.doasync.CapsLockSwitcher"

  caveats do
    <<~EOS
      CapsLockSwitcher requires macOS 15.2 or later.
      Grant Accessibility permission in System Settings > Privacy & Security > Accessibility.
      After launching the app, select two input sources in its menu bar menu.
    EOS
  end
end
