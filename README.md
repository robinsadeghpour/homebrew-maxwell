# Homebrew tap for Maxwell

[Maxwell](https://runmaxwell.com) is the session manager for Claude Code.

```sh
brew install --cask robinsadeghpour/maxwell/maxwell
```

Maxwell updates itself: when a new release is ready it shows **Restart to update**. The cask sets `auto_updates`, so `brew upgrade` leaves it alone. Use `brew upgrade --greedy maxwell` if you'd rather update through Homebrew.

Every Maxwell release updates `Casks/maxwell.rb` automatically. Source and issues: [robinsadeghpour/maxwell](https://github.com/robinsadeghpour/maxwell).
