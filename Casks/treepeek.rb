cask "treepeek" do
  version "0.1.1"
  sha256 "774959b7bbbc83ae247b46516c92f74149e6273f3443fea0a2d8d37f807ed3b6"

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
