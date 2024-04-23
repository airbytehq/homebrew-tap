class Abctl < Formula
  desc "Airbyte's command-line tool for running Airbyte locally"
  homepage "https://github.com/airbytehq/abctl"
  url "https://github.com/airbytehq/abctl/archive/refs/tags/v0.1.3.tar.gz"
  sha256 "dee004f4a1f178b9ba96abd404d787f380897445a8cb98c3458217c2bfc2e8fb"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  depends_on "go" => :build

  def install
    ENV["ABCTL_VERSION"] = "v0.1.3"
    system "make", "build"
    bin.install "build/abctl"
  end

  test do
    assert_match "version: v0.1.3", shell_output("#{bin}/abctl version").strip
  end
end
