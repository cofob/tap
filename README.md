# cofob Homebrew tap

A personal Homebrew tap for macOS applications.

## Install CapsLockSwitcher

[CapsLockSwitcher](https://github.com/doasync/CapsLockSwitcher) switches between two keyboard layouts using the Caps Lock key. Version 1.2 supports Intel and Apple Silicon and requires **macOS 15.2 or later**.

```sh
brew tap cofob/tap https://github.com/cofob/tap
brew install --cask cofob/tap/capslockswitcher
```

The explicit repository URL is necessary because this repository is named `tap`, rather than `homebrew-tap`.

Open CapsLockSwitcher from Applications. Grant it permission in **System Settings → Privacy & Security → Accessibility**, then select exactly two input sources in its menu bar menu. The app also offers an optional launch-at-login setting.

The cask restores the executable permission missing from the upstream ZIP and automatically removes the app's download quarantine marker, so no manual terminal command is needed before launching. The release is ad-hoc signed and not notarized; this follows the intent of the [upstream installation instructions](https://github.com/doasync/CapsLockSwitcher#installation) while retaining other extended attributes.

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

Version updates are manual. Check upstream with:

```sh
brew livecheck --cask cofob/tap/capslockswitcher
```

Update the cask version and SHA-256 together after verifying the release archive. GitHub Actions runs style, online audit, download/checksum, and installation checks on pushes and pull requests. The signing audit is excluded because the upstream release is not notarized. The Rosetta audit is excluded because it inspects the archive before the executable permission repair; CI instead verifies both architectures on the installed binary. Other audit failures remain blocking.
