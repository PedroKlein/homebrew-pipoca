cask "pipoca-app" do
  version "0.1.2"
  sha256 "89388868a9c175d7b69a75768c0edd7145962f43b88a2aa9fc3a221270b65f24"

  url "https://github.com/PedroKlein/pipoca/releases/download/v#{version}/Pipoca_#{version}_aarch64.dmg"
  name "Pipoca"
  desc "Desktop app for running Pi coding-agent sessions"
  homepage "https://github.com/PedroKlein/pipoca"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on arch: :arm64

  app "Pipoca.app"

  zap trash: [
    "~/Library/Application Support/dev.pipoca.desktop",
    "~/Library/Caches/dev.pipoca.desktop",
    "~/Library/Logs/dev.pipoca.desktop",
    "~/Library/WebKit/dev.pipoca.desktop",
  ]

  caveats <<~EOS
    Pipoca isn't signed with an Apple Developer ID yet, so macOS says it
    is damaged. Clear the download's quarantine flag once to open it:
      xattr -dr com.apple.quarantine #{appdir}/Pipoca.app
    Updates the app installs itself don't need this.
  EOS
end
