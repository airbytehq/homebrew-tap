class Abctl < Formula
  desc "Airbyte's command-line tool for running Airbyte locally"
  homepage "https://github.com/airbytehq/abctl"
  url "https://github.com/airbytehq/abctl/archive/refs/tags/v0.13.0.tar.gz"
  sha256 "e0c7b764ace9bbf8b08334b6da730296e410d01a0e28f7f8809f61105fec77fb"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  depends_on "go" => :build

  def install
    ENV["ABCTL_VERSION"] = "v0.13.0"
    system "make", "build"
    bin.install "build/abctl"
  end

  test do
    assert_match "version: v0.13.0", shell_output("#{bin}/abctl version").strip
  end
end
