class Abctl < Formula
  desc "Airbyte's command-line tool for running Airbyte locally"
  homepage "https://github.com/airbytehq/abctl"
  url "https://github.com/airbytehq/abctl/archive/refs/tags/v0.8.1.tar.gz"
  sha256 "901f36ee8284272f224474f11e16be26140fcd53de287112b3e42278b93ed762"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  depends_on "go" => :build

  def install
    ENV["ABCTL_VERSION"] = "v0.8.1"
    system "make", "build"
    bin.install "build/abctl"
  end

  test do
    assert_match "version: v0.8.1", shell_output("#{bin}/abctl version").strip
  end
end
