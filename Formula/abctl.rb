class Abctl < Formula
  desc "Airbyte's command-line tool for running Airbyte locally"
  homepage "https://github.com/airbytehq/abctl"
  url "https://github.com/airbytehq/abctl/archive/refs/tags/v0.9.1.tar.gz"
  sha256 "296c6014677051218fb7e7af1304460b7c2af28e1617cdc1372667b0a6b453e1"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  depends_on "go" => :build

  def install
    ENV["ABCTL_VERSION"] = "v0.9.1"
    system "make", "build"
    bin.install "build/abctl"
  end

  test do
    assert_match "version: v0.9.1", shell_output("#{bin}/abctl version").strip
  end
end
