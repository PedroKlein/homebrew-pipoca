class Pipoca < Formula
  desc "Run Pi coding-agent sessions on your own machines, from any browser"
  homepage "https://github.com/PedroKlein/pipoca"
  version "0.1.0"

  on_macos do
    on_arm do
      url "https://github.com/PedroKlein/pipoca/releases/download/v#{version}/pipoca-darwin-arm64"
      sha256 "6f8cfa34a50a64523c6ea40890b14e7fa8ba05e7dcb8a2d922e609bce18633f5"
    end
    on_intel do
      url "https://github.com/PedroKlein/pipoca/releases/download/v#{version}/pipoca-darwin-x64"
      sha256 "c1136919968816b5e49ecdb2ef3504b7d6336b42ae293347392456aab7b906d2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/PedroKlein/pipoca/releases/download/v#{version}/pipoca-linux-arm64"
      sha256 "378449549669fe389522c49c1cc0d5c4a5c4bf738ab8636d97122da036f4c0c5"
    end
    on_intel do
      url "https://github.com/PedroKlein/pipoca/releases/download/v#{version}/pipoca-linux-x64"
      sha256 "b125947dc1f8b955e0bc222ec4f78461022c3b7d2b526978960abc6eda11c90e"
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
