class Abctl < Formula
  desc "Airbyte's command-line tool for running Airbyte locally"
  homepage "https://github.com/airbytehq/abctl"
  url "https://github.com/airbytehq/abctl/archive/refs/tags/v0.12.2.tar.gz"
  sha256 "73fa910e999ca5b094f054e493edf6409a68625d9783b582e764a5f869f2b6f4"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  depends_on "go" => :build

  def install
    ENV["ABCTL_VERSION"] = "v0.12.2"
    system "make", "build"
    bin.install "build/abctl"
  end

  test do
    assert_match "version: v0.12.2", shell_output("#{bin}/abctl version").strip
  end
end
