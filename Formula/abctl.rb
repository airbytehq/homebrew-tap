class Abctl < Formula
  desc "Airbyte's command-line tool for running Airbyte locally"
  homepage "https://github.com/airbytehq/abctl"
  url "https://github.com/airbytehq/abctl/archive/refs/tags/v0.7.1.tar.gz"
  sha256 "0ccaf7b52b76e464404e2bcc116102d1ecde618be9778534199bcd7b0f0d6f3d"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  depends_on "go" => :build

  def install
    ENV["ABCTL_VERSION"] = "v0.7.1"
    system "make", "build"
    bin.install "build/abctl"
  end

  test do
    assert_match "version: v0.7.1", shell_output("#{bin}/abctl version").strip
  end
end
