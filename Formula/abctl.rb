class Abctl < Formula
  desc "Airbyte's command-line tool for running Airbyte locally"
  homepage "https://github.com/airbytehq/abctl"
  url "https://github.com/airbytehq/abctl/archive/refs/tags/v0.2.1.tar.gz"
  sha256 "704070b22fd94a1d9d6ab101fe11638d692e5a7f3771809ca9936613a4c187e3"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  depends_on "go" => :build

  def install
    ENV["ABCTL_VERSION"] = "v0.2.1"
    system "make", "build"
    bin.install "build/abctl"
  end

  test do
    assert_match "version: v0.2.1", shell_output("#{bin}/abctl version").strip
  end
end
