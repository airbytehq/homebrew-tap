class Abctl < Formula
  desc "Airbyte's command-line tool for running Airbyte locally"
  homepage "https://github.com/airbytehq/abctl"
  url "https://github.com/airbytehq/abctl/archive/refs/tags/v0.12.0.tar.gz"
  sha256 "3994d1f1c3aa1f89399610386088ea644e7f0fed22efdde20034d8caf5ad1356"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  depends_on "go" => :build

  def install
    ENV["ABCTL_VERSION"] = "v0.12.0"
    system "make", "build"
    bin.install "build/abctl"
  end

  test do
    assert_match "version: v0.12.0", shell_output("#{bin}/abctl version").strip
  end
end
