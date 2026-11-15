cask "maxwell" do
  version "0.1.43"
  sha256 "ff9fc9dc6c3f9298fb289ccca1572ca248ef5e3ded20e181fa4f5555587bdd90"

  url "https://github.com/robinsadeghpour/maxwell/releases/download/v#{version}/Maxwell-v#{version}.dmg"
  name "Maxwell"
  desc "Session manager for Claude Code"
  homepage "https://runmaxwell.com/"

  livecheck do
    url :url
    strategy :github_latest
  end

  # Maxwell updates itself ("Restart to update"), so `brew upgrade` leaves it alone.
  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "Maxwell.app"

  # The hook helper stays: Claude Code calls it until the hooks are removed (see caveats).
  zap trash: [
    "~/.config/maxwell",
    "~/.local/state/maxwell",
    "~/Library/Caches/dev.maxwell.app",
    "~/Library/Caches/maxwell-slack",
    "~/Library/HTTPStorages/maxwell-slack",
    "~/Library/Preferences/dev.maxwell.app.plist",
    "~/Library/WebKit/dev.maxwell.app",
  ]

  caveats <<~EOS
    Open Maxwell: Set up Maxwell connects it to Claude Code.
    Before you uninstall, choose Maxwell › Uninstall Hooks.
  EOS
end
