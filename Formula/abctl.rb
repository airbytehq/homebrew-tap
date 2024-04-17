class Abctl < Formula
  desc "Airbyte's command line tool for running Airbyte locally"
  homepage "https://github.com/airbytehq/abctl"
  url "https://github.com/airbytehq/abctl/archive/refs/tags/v0.1.2.tar.gz"
  sha256 "f9677b45bfb97b06ec28d69fe70d97523e092782af1bb7b47db1761f5169ad2d"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end
  
  # depends_on "cmake" => :build
  depends_on "go" => :build

  def install
    ENV["ABCTL_VERSION"] = "v0.1.2"
    system "make", "build"
    bin.install "build/abctl"
  end

  test do
    assert_equal "version: v0.1.2", shell_output("#{bin}/abctl version").strip
  end
end
