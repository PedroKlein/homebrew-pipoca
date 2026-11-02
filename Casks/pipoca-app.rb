cask "pipoca-app" do
  version "0.1.0"
  sha256 "aa44171462ce8c8fb4b5281d71f2636446f30f732a342296bd698fdcbad188f0"

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
    Pipoca isn't signed by Apple yet. The first time, open it with
    right-click > Open, or allow it under System Settings > Privacy & Security.
  EOS
end
