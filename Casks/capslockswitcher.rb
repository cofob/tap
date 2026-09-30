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

  uninstall quit: "com.doasync.CapsLockSwitcher"

  caveats do
    <<~EOS
      CapsLockSwitcher requires macOS 15.2 or later.
      Grant Accessibility permission in System Settings > Privacy & Security > Accessibility.
      After launching the app, select two input sources in its menu bar menu.
      The upstream release is not notarized; see the tap README for launch instructions.
    EOS
  end
end
