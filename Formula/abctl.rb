class Abctl < Formula
  desc "Airbyte's command-line tool for running Airbyte locally"
  homepage "https://github.com/airbytehq/abctl"
  url "https://github.com/airbytehq/abctl/archive/refs/tags/v0.3.2.tar.gz"
  sha256 "52989fa9abff70ebdeb96a2094c43badbfac0249080a71c60ffa0a9d47bfe8bd"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  depends_on "go" => :build

  def install
    ENV["ABCTL_VERSION"] = "v0.3.2"
    system "make", "build"
    bin.install "build/abctl"
  end

  test do
    assert_match "version: v0.3.2", shell_output("#{bin}/abctl version").strip
  end
end
