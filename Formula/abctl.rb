class Abctl < Formula
  desc "Airbyte's command-line tool for running Airbyte locally"
  homepage "https://github.com/airbytehq/abctl"
  url "https://github.com/airbytehq/abctl/archive/refs/tags/v0.8.0.tar.gz"
  sha256 "dd52dd5b3c357b0eafb2072d992a91deb012020f681fa0c2e7f74f5212afc4ef"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  depends_on "go" => :build

  def install
    ENV["ABCTL_VERSION"] = "v0.8.0"
    system "make", "build"
    bin.install "build/abctl"
  end

  test do
    assert_match "version: v0.8.0", shell_output("#{bin}/abctl version").strip
  end
end
