class Abctl < Formula
  desc "Airbyte's command-line tool for running Airbyte locally"
  homepage "https://github.com/airbytehq/abctl"
  url "https://github.com/airbytehq/abctl/archive/refs/tags/v0.9.0.tar.gz"
  sha256 "244dd7a986d2291bd179ba1c9d838ee8fa1a7ead532db1048c10a67fda97c997"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  depends_on "go" => :build

  def install
    ENV["ABCTL_VERSION"] = "v0.9.0"
    system "make", "build"
    bin.install "build/abctl"
  end

  test do
    assert_match "version: v0.9.0", shell_output("#{bin}/abctl version").strip
  end
end
