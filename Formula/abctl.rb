class Abctl < Formula
  desc "Airbyte's command-line tool for running Airbyte locally"
  homepage "https://github.com/airbytehq/abctl"
  url "https://github.com/airbytehq/abctl/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "02233c6662b892921f60d9e76c918a32fb8e469334eec0b30615ede45f5b8a0c"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  depends_on "go" => :build

  def install
    ENV["ABCTL_VERSION"] = "v0.2.0"
    system "make", "build"
    bin.install "build/abctl"
  end

  test do
    assert_match "version: v0.2.0", shell_output("#{bin}/abctl version").strip
  end
end
