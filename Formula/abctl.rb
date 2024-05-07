class Abctl < Formula
  desc "Airbyte's command-line tool for running Airbyte locally"
  homepage "https://github.com/airbytehq/abctl"
  url "https://github.com/airbytehq/abctl/archive/refs/tags/v0.3.1.tar.gz"
  sha256 "b02e4f5937c6d09acc8a58854333704fdaccc14e84f0a7da6425311d869221dc"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  depends_on "go" => :build

  def install
    ENV["ABCTL_VERSION"] = "v0.3.1"
    system "make", "build"
    bin.install "build/abctl"
  end

  test do
    assert_match "version: v0.3.1", shell_output("#{bin}/abctl version").strip
  end
end
