class Pipoca < Formula
  desc "Run Pi coding-agent sessions on your own machines, from any browser"
  homepage "https://github.com/PedroKlein/pipoca"
  version "0.1.1"

  on_macos do
    on_arm do
      url "https://github.com/PedroKlein/pipoca/releases/download/v#{version}/pipoca-darwin-arm64"
      sha256 "aceb3ece66a93bdae23c4d65bdfdbbad921c6944c808d353b82cf0db27a5546f"
    end
    on_intel do
      url "https://github.com/PedroKlein/pipoca/releases/download/v#{version}/pipoca-darwin-x64"
      sha256 "d9a28418820b240ea9e44e5d0b068b4ca64485af9f6bf7d3f3a2159cda517e47"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/PedroKlein/pipoca/releases/download/v#{version}/pipoca-linux-arm64"
      sha256 "90d2bc890b2e60bba971535e6cd23943d0bdd3161a991e850b0273ab6959dda0"
    end
    on_intel do
      url "https://github.com/PedroKlein/pipoca/releases/download/v#{version}/pipoca-linux-x64"
      sha256 "ab9f3335bc6bde1e102db186adbddc74ba308f8567f2d843e655c720508cdeec"
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
    assert_match "pipoca up", shell_output("#{bin}/pipoca help 2>&1", 2)
  end
end
