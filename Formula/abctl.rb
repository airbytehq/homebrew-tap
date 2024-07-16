class Abctl < Formula
  desc "Airbyte's command-line tool for running Airbyte locally"
  homepage "https://github.com/airbytehq/abctl"
  url "https://github.com/airbytehq/abctl/archive/refs/tags/v0.7.2.tar.gz"
  sha256 "e96e4ea2ee41d112b4e655dd931226e17ae6705825cddcbd6194455a09c289cf"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  depends_on "go" => :build

  def install
    ENV["ABCTL_VERSION"] = "v0.7.2"
    system "make", "build"
    bin.install "build/abctl"
  end

  test do
    assert_match "version: v0.7.2", shell_output("#{bin}/abctl version").strip
  end
end
