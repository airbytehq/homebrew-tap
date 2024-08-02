class Abctl < Formula
  desc "Airbyte's command-line tool for running Airbyte locally"
  homepage "https://github.com/airbytehq/abctl"
  url "https://github.com/airbytehq/abctl/archive/refs/tags/v0.11.1.tar.gz"
  sha256 "3aadcb4162849f92f065327706cc5562db003b9cfe0aa0679a41b4fa0f442df2"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  depends_on "go" => :build

  def install
    ENV["ABCTL_VERSION"] = "v0.11.1"
    system "make", "build"
    bin.install "build/abctl"
  end

  test do
    assert_match "version: v0.11.1", shell_output("#{bin}/abctl version").strip
  end
end
