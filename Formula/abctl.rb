class Abctl < Formula
  desc "Airbyte's command-line tool for running Airbyte locally"
  homepage "https://github.com/airbytehq/abctl"
  url "https://github.com/airbytehq/abctl/archive/refs/tags/v0.9.2.tar.gz"
  sha256 "919bf591a742826f28afecd7ae65b42b2d66e855b087df041b6d0feb64918cf8"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  depends_on "go" => :build

  def install
    ENV["ABCTL_VERSION"] = "v0.9.2"
    system "make", "build"
    bin.install "build/abctl"
  end

  test do
    assert_match "version: v0.9.2", shell_output("#{bin}/abctl version").strip
  end
end
