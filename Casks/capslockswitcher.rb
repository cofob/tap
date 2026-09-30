cask "capslockswitcher" do
  version "1.2.1"
  sha256 "26d7260edfc391e04c9b44e0627cb28d3ec520e2f419fc107e39974b2b55aa24"

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
    EOS
  end
end
