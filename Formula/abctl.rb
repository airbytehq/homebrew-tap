class Abctl < Formula
  desc "Airbyte's command-line tool for running Airbyte locally"
  homepage "https://github.com/airbytehq/abctl"
  url "https://github.com/airbytehq/abctl/archive/refs/tags/v0.5.0.tar.gz"
  sha256 "d7c75cdf69d7685a6242387e594374a1bf6447837bec8f89954ad674f18ad2de"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  depends_on "go" => :build

  def install
    ENV["ABCTL_VERSION"] = "v0.5.0"
    system "make", "build"
    bin.install "build/abctl"
  end

  test do
    assert_match "version: v0.5.0", shell_output("#{bin}/abctl version").strip
  end
end
