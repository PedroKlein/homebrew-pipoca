class Pipoca < Formula
  desc "Run Pi coding-agent sessions on your own machines, from any browser"
  homepage "https://pipoca.dev"
  version "0.1.4"

  on_macos do
    on_arm do
      url "https://github.com/PedroKlein/pipoca/releases/download/v#{version}/pipoca-darwin-arm64"
      sha256 "90fa9f6063eb43c7eeb11a4b7f60f5f303ca14fa559d5f633a37fc1089682575"
    end
    on_intel do
      url "https://github.com/PedroKlein/pipoca/releases/download/v#{version}/pipoca-darwin-x64"
      sha256 "70ceadd7a47824c9ceafb93b8276ee67b5072f8edad4ddd18d59ff29afd51cd2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/PedroKlein/pipoca/releases/download/v#{version}/pipoca-linux-arm64"
      sha256 "426c1213616dbd27cd44b576a5a1cf0e3c9e989e4a49591d11d26ca835929742"
    end
    on_intel do
      url "https://github.com/PedroKlein/pipoca/releases/download/v#{version}/pipoca-linux-x64"
      sha256 "b886502040ce83eb0f664f4219323396e96cbebbe6e901595092755411b037ca"
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
