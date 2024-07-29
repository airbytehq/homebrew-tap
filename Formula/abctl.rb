class Abctl < Formula
  desc "Airbyte's command-line tool for running Airbyte locally"
  homepage "https://github.com/airbytehq/abctl"
  url "https://github.com/airbytehq/abctl/archive/refs/tags/v0.10.0.tar.gz"
  sha256 "a8c78da8f38f849e5a4fb195b399393eecaa70c0af917b882ff1dc92c772c16c"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  depends_on "go" => :build

  def install
    ENV["ABCTL_VERSION"] = "v0.10.0"
    system "make", "build"
    bin.install "build/abctl"
  end

  test do
    assert_match "version: v0.10.0", shell_output("#{bin}/abctl version").strip
  end
end
