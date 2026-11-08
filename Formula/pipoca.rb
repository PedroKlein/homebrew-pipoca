class Pipoca < Formula
  desc "Run Pi coding-agent sessions on your own machines, from any browser"
  homepage "https://github.com/PedroKlein/pipoca"
  version "0.1.3"

  on_macos do
    on_arm do
      url "https://github.com/PedroKlein/pipoca/releases/download/v#{version}/pipoca-darwin-arm64"
      sha256 "3b44385987410ddc33a8030f99880e7b654c2419ee9a25e3e43a324ffbb19b89"
    end
    on_intel do
      url "https://github.com/PedroKlein/pipoca/releases/download/v#{version}/pipoca-darwin-x64"
      sha256 "caa6a2938b7c1794111902940c48c339fedf957dbec8f32c2155496e8ed55bd3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/PedroKlein/pipoca/releases/download/v#{version}/pipoca-linux-arm64"
      sha256 "9e59ea97ac4b95234135d9b4d6940ffd64ccc1fbfe96e15f2bbd4729b4fbd482"
    end
    on_intel do
      url "https://github.com/PedroKlein/pipoca/releases/download/v#{version}/pipoca-linux-x64"
      sha256 "ce491999560971840930dbb4643d6672dc74791818190fa10eb296e6075867fe"
    end
  end

  livecheck do
    url :stable
    strategy :github_latest
  end

  def install
    bin.install Dir["pipoca-*"].first => "pipoca"
  end

  test do
    assert_match "pipoca up", shell_output("#{bin}/pipoca --help")
  end
end
