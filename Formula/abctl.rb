class Abctl < Formula
  desc "Airbyte's command-line tool for running Airbyte locally"
  homepage "https://github.com/airbytehq/abctl"
  url "https://github.com/airbytehq/abctl/archive/refs/tags/v0.4.0.tar.gz"
  sha256 "aca6666f18a1f8864e2150f848d2ddfa6ebbbdf8301139b3ce4098567387a1b8"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  depends_on "go" => :build

  def install
    ENV["ABCTL_VERSION"] = "v0.4.0"
    system "make", "build"
    bin.install "build/abctl"
  end

  test do
    assert_match "version: v0.4.0", shell_output("#{bin}/abctl version").strip
  end
end
