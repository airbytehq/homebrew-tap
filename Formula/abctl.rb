class Abctl < Formula
  desc "Airbyte's command-line tool for running Airbyte locally"
  homepage "https://github.com/airbytehq/abctl"
  url "https://github.com/airbytehq/abctl/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "34b09a5949b2d71ef2a8c8a1f2a06794b02a8f69272f6cece19421b1457f45eb"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  depends_on "go" => :build

  def install
    ENV["ABCTL_VERSION"] = "v0.3.0"
    system "make", "build"
    bin.install "build/abctl"
  end

  test do
    assert_match "version: v0.3.0", shell_output("#{bin}/abctl version").strip
  end
end
