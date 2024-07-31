class Abctl < Formula
  desc "Airbyte's command-line tool for running Airbyte locally"
  homepage "https://github.com/airbytehq/abctl"
  url "https://github.com/airbytehq/abctl/archive/refs/tags/v0.11.0.tar.gz"
  sha256 "5f6ce02fc041a7a5097ad728905e469e184111ac9dcaf12967bcdde4e330604d"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  depends_on "go" => :build

  def install
    ENV["ABCTL_VERSION"] = "v0.11.0"
    system "make", "build"
    bin.install "build/abctl"
  end

  test do
    assert_match "version: v0.11.0", shell_output("#{bin}/abctl version").strip
  end
end
