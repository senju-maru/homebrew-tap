cask "treepeek" do
  version "0.1.3"
  sha256 "0c9aa6753d5ddbb4625a1d22b3a97bf23c6f2fdae42a687118f537fd29d808ee"

  url "https://download.treepeek.com/TreePeek-#{version}.dmg"
  name "TreePeek"
  desc "Git worktrees and coding-agent attention at the screen edge"
  homepage "https://treepeek.com/"

  # v1 is neither signed nor notarized. Homebrew quarantines the app, Gatekeeper blocks the first
  # launch, and --no-quarantine no longer exists. Open System Settings > Privacy & Security once
  # and click Open Anyway. This is why the cask lives in a tap: homebrew-cask stopped accepting
  # casks that fail Gatekeeper on 2026-09-01.
  livecheck do
    url "https://treepeek.com/appcast.xml"
    strategy :sparkle
  end

  auto_updates true
  depends_on macos: :sonoma

  app "TreePeek.app"

  zap trash: [
    "~/Library/Application Support/TreePeek",
    "~/Library/Caches/com.treepeek.app",
    "~/Library/HTTPStorages/com.treepeek.app",
    "~/Library/Preferences/com.treepeek.app.plist",
  ]
end
