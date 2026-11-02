cask "pipoca-app" do
  version "0.1.1"
  sha256 "6fb1e008c04f33cda1de8680596dc2e44f70de51a02deeb1daa4d2dd7b567ec4"

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
