class Pipoca < Formula
  desc "Run Pi coding-agent sessions on your own machines, from any browser"
  homepage "https://github.com/PedroKlein/pipoca"
  version "0.1.2"

  on_macos do
    on_arm do
      url "https://github.com/PedroKlein/pipoca/releases/download/v#{version}/pipoca-darwin-arm64"
      sha256 "819baabaac6cc01c51d5ebcd102d393f000dfe296b282021ec7a276c7e390c01"
    end
    on_intel do
      url "https://github.com/PedroKlein/pipoca/releases/download/v#{version}/pipoca-darwin-x64"
      sha256 "6be3712bfd26105424f13ce6176fbd82e67e5dcd5d9fea64341896962bf6827f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/PedroKlein/pipoca/releases/download/v#{version}/pipoca-linux-arm64"
      sha256 "b86251a2552ba07160341f1aa90953d11611687af2cc98e6cee8491590093a5f"
    end
    on_intel do
      url "https://github.com/PedroKlein/pipoca/releases/download/v#{version}/pipoca-linux-x64"
      sha256 "959e5cc06226dd141b190975c28c157b9326c77c575e11b6deea82b485e49b3c"
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
