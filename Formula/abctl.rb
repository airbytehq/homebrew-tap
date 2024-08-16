class Abctl < Formula
  desc "Airbyte's command-line tool for running Airbyte locally"
  homepage "https://github.com/airbytehq/abctl"
  url "https://github.com/airbytehq/abctl/archive/refs/tags/v0.12.1.tar.gz"
  sha256 "fb6f1d4f82d2a7a9d9bc08229904967a7a81966f48b5f2ef62bfb32609c7ffb1"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  depends_on "go" => :build

  def install
    ENV["ABCTL_VERSION"] = "v0.12.1"
    system "make", "build"
    bin.install "build/abctl"
  end

  test do
    assert_match "version: v0.12.1", shell_output("#{bin}/abctl version").strip
  end
end
