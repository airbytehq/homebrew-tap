class Abctl < Formula
  ABCTL_VERSION = "v0.22.0".freeze

  desc "Airbyte's command-line tool for running Airbyte locally"
  homepage "https://github.com/airbytehq/abctl"
  url "https://github.com/airbytehq/abctl.git",
      tag: ABCTL_VERSION

  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  depends_on "go" => :build

  def install
    ENV["ABCTL_VERSION"] = ABCTL_VERSION
    system "make", "build"
    bin.install "build/abctl"
  end

  test do
    assert_equal "version: #{ABCTL_VERSION}", shell_output("#{bin}/abctl version").lines[0].strip
  end
end
