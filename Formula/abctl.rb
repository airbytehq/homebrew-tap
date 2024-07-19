class Abctl < Formula
  desc "Airbyte's command-line tool for running Airbyte locally"
  homepage "https://github.com/airbytehq/abctl"
  url "https://github.com/airbytehq/abctl/archive/refs/tags/v0.8.2.tar.gz"
  sha256 "0d89afdb3df5668fcb4ad7d289056189d2bc8d9b82b7cf5c354df7cdd9aa9f4d"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  depends_on "go" => :build

  def install
    ENV["ABCTL_VERSION"] = "v0.8.2"
    system "make", "build"
    bin.install "build/abctl"
  end

  test do
    assert_match "version: v0.8.2", shell_output("#{bin}/abctl version").strip
  end
end
