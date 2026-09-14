cask "treepeek" do
  version "0.1.0"
  sha256 "61beea88f857f92c587fbf8c2e042adc311c1755d9764461f0724e2798c50c00"

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
