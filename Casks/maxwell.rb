cask "maxwell" do
  version "0.1.28"
  sha256 "89940fce8639f0d56dd076cd109ec14cdcb3e5f7af6587db69cd60f6c182c099"

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
