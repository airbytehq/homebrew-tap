class AirbyteCloudCli < Formula
  desc "CLI for Airbyte Cloud"
  homepage "https://github.com/airbytehq/PyAirbyte"
  url "https://github.com/airbytehq/PyAirbyte.git",
      tag:      "v0.45.0",
      revision: "8fb66f25154b455dafae7b533597c7794c693cf5"
  license "Elastic-2.0"

  depends_on "uv"

  def pour_bottle?
    false
  end

  def install
    ENV["UV_TOOL_DIR"] = libexec/"uv-tools"
    ENV["UV_TOOL_BIN_DIR"] = bin
    ENV["UV_PYTHON_INSTALL_DIR"] = libexec/"uv-python"
    ENV["UV_MANAGED_PYTHON"] = "1"

    system "uv", "tool", "install",
      "--managed-python",
      "--python", "3.12",
      "--compile-bytecode",
      "--force",
      "airbyte-cloud-cli==#{version}"
  end

  test do
    assert_match "Usage: pyab", shell_output("#{bin}/pyab --help")
  end
end
