# cofob Homebrew tap

A personal Homebrew tap for macOS applications.

## Install CapsLockSwitcher

[CapsLockSwitcher](https://github.com/cofob/CapsLockSwitcher) switches between two keyboard layouts using the Caps Lock key. This tap ships cofob's fork of [doasync/CapsLockSwitcher](https://github.com/doasync/CapsLockSwitcher), with simpler permission setup. Version 1.2.2 supports Intel and Apple Silicon and requires **macOS 15.2 or later**.

```sh
brew tap cofob/tap https://github.com/cofob/tap
brew install --cask cofob/tap/capslockswitcher
```

The explicit repository URL is necessary because this repository is named `tap`, rather than `homebrew-tap`.

Open CapsLockSwitcher from Applications. The native macOS permission prompt requests registration in System Settings automatically. Enable CapsLockSwitcher in **Privacy & Security → Accessibility** (called **Device Control and Data Access** on some newer macOS versions), then select exactly two input sources in its menu bar menu. Permission changes are detected automatically. The app also offers an optional launch-at-login setting.

The fork runs without App Sandbox so it can request Accessibility access and handle Caps Lock system-wide. Accessibility access still requires your approval. The release is ad-hoc signed and not notarized; the cask automatically removes its download quarantine marker while retaining other extended attributes, so no manual terminal command is needed before launching.

With switching active, **Caps Lock** switches layouts and **Command+Caps Lock** turns normal Caps Lock on or off. Either Command key works.

### Upgrade or uninstall

```sh
brew update
brew upgrade --cask cofob/tap/capslockswitcher
```

```sh
brew uninstall --cask cofob/tap/capslockswitcher
```

Uninstalling quits the app and removes its application bundle. Saved preferences are retained.

## Maintenance

Version updates are manual. Check the fork's releases with:

```sh
brew livecheck --cask cofob/tap/capslockswitcher
```

Update the cask version and SHA-256 together after verifying the release archive. GitHub Actions runs style, online audit, download/checksum, and installation checks on pushes and pull requests. The signing audit is excluded because the release is not notarized; CI verifies its ad-hoc signature and both binary architectures. Other audit failures remain blocking.
