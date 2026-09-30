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

### First launch

The upstream release is not notarized, so macOS may block its first launch. The [upstream installation instructions](https://github.com/doasync/CapsLockSwitcher#installation) recommend:

```sh
xattr -cr /Applications/CapsLockSwitcher.app
```

This clears all extended attributes, including the download quarantine marker, from the app. Run it manually only if you trust the upstream release. The cask preserves Homebrew's default quarantine handling and does not run this command automatically.

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

Update the cask version and SHA-256 together after verifying the release archive. GitHub Actions runs style, online audit, and download/checksum checks on pushes and pull requests. The signing audit is excluded because the upstream release is not notarized; other audit failures remain blocking.
