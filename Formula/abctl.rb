class Abctl < Formula
  desc "Airbyte's command-line tool for running Airbyte locally"
  homepage "https://github.com/airbytehq/abctl"
  url "https://github.com/airbytehq/abctl/archive/refs/tags/v0.13.1.tar.gz"
  sha256 "e01a6fb8ab83fb787ad5cdc0b46e58eebcda64f4aefd6068d782ffcf308ac631"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  depends_on "go" => :build

  def install
    ENV["ABCTL_VERSION"] = "v0.13.1"
    system "make", "build"
    bin.install "build/abctl"
  end

  test do
    assert_match "version: v0.13.1", shell_output("#{bin}/abctl version").strip
  end
end
