# homebrew-pipoca

Homebrew formula and cask for [Pipoca](https://github.com/PedroKlein/pipoca).

```sh
brew install pedroklein/pipoca/pipoca
brew install --cask pedroklein/pipoca/pipoca-app
```

`pipoca` is the command-line server for macOS and Linux. `pipoca-app` is the desktop app for Apple silicon Macs, which bundles its own `pipoca` and updates itself. It isn't signed with an Apple Developer ID yet, so macOS says it's damaged until you run `xattr -dr com.apple.quarantine /Applications/Pipoca.app` once. Both are updated here by Pipoca's release workflow.
