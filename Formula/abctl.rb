class Abctl < Formula
  desc "Airbyte's command-line tool for running Airbyte locally"
  homepage "https://github.com/airbytehq/abctl"
  url "https://github.com/airbytehq/abctl/archive/refs/tags/v0.2.2.tar.gz"
  sha256 "6013da1ed0c43f27d02d9f2a90e8091f9ab2517d6efe0c56a1978bc80f13ce3e"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  depends_on "go" => :build

  def install
    ENV["ABCTL_VERSION"] = "v0.2.2"
    system "make", "build"
    bin.install "build/abctl"
  end

  test do
    assert_match "version: v0.2.2", shell_output("#{bin}/abctl version").strip
  end
end
