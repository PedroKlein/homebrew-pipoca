cask "pipoca-app" do
  version "0.1.3"
  sha256 "c6ebe41bc733f436d76e327584307c3ad100c15ad36ff94d276f30f42102bef5"

  url "https://github.com/PedroKlein/pipoca/releases/download/v#{version}/Pipoca_#{version}_aarch64.dmg"
  name "Pipoca"
  desc "Desktop app for running Pi coding-agent sessions"
  homepage "https://pipoca.dev"

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
