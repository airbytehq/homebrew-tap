class Abctl < Formula
  desc "Airbyte's command-line tool for running Airbyte locally"
  homepage "https://github.com/airbytehq/abctl"
  url "https://github.com/airbytehq/abctl/archive/refs/tags/v0.6.0.tar.gz"
  sha256 "eeb59a4dcdd7a472ed51f1df9b5628e34469047f4070f113bd49a63716942b40"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  depends_on "go" => :build

  def install
    ENV["ABCTL_VERSION"] = "v0.6.0"
    system "make", "build"
    bin.install "build/abctl"
  end

  test do
    assert_match "version: v0.6.0", shell_output("#{bin}/abctl version").strip
  end
end
