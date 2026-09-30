cask "capslockswitcher" do
  version "1.2.2"
  sha256 "505eea5bb3163621377dfccab504276aa18e0aad52ffce00388364ed02c74f83"

  url "https://github.com/cofob/CapsLockSwitcher/releases/download/v#{version}/CapsLockSwitcher.app.zip"
  name "CapsLockSwitcher"
  desc "Switch between two keyboard layouts using the Caps Lock key"
  homepage "https://github.com/cofob/CapsLockSwitcher"

  livecheck do
    url :url
    regex(/^v?(\d+(?:\.\d+)+)$/i)
    strategy :github_latest
  end

  depends_on macos: :sequoia

  app "CapsLockSwitcher.app"

  postflight_steps do
    # The fork's ad-hoc signed release is not notarized.
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/CapsLockSwitcher.app"]
  end

  uninstall quit: "com.doasync.CapsLockSwitcher"

  caveats do
    <<~EOS
      CapsLockSwitcher requires macOS 15.2 or later.
      Follow the native permission prompt and enable CapsLockSwitcher in System Settings.
      After launching the app, select two input sources in its menu bar menu.
      Caps Lock switches layouts; Command+Caps Lock turns normal Caps Lock on or off.
    EOS
  end
end
