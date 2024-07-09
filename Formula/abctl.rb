class Abctl < Formula
  desc "Airbyte's command-line tool for running Airbyte locally"
  homepage "https://github.com/airbytehq/abctl"
  url "https://github.com/airbytehq/abctl/archive/refs/tags/v0.7.0.tar.gz"
  sha256 "8274b2dbb398698a767c569c9810e9f858b2ded3487b931724dfdf96e8c2b907"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  depends_on "go" => :build

  def install
    ENV["ABCTL_VERSION"] = "v0.7.0"
    system "make", "build"
    bin.install "build/abctl"
  end

  test do
    assert_match "version: v0.7.0", shell_output("#{bin}/abctl version").strip
  end
end
