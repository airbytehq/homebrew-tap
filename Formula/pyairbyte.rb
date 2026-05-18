class Pyairbyte < Formula
  desc "Python library and CLI for moving data with Airbyte connectors"
  homepage "https://github.com/airbytehq/PyAirbyte"
  url "https://files.pythonhosted.org/packages/46/ca/264b4cee26543e93a637531fd125428d1730874f41309f0877c9ac8fed0d/airbyte-0.45.0.tar.gz"
  sha256 "4433e94bf9634c3d63509090d2c3ab58bc9a0abbbf745a23bfacc9f8c892a211"
  license "Elastic-2.0"

  depends_on "python@3.12"
  depends_on "uv"

  def install
    ENV["UV_TOOL_DIR"] = libexec/"uv-tools"
    ENV["UV_TOOL_BIN_DIR"] = bin
    ENV["UV_NO_MANAGED_PYTHON"] = "1"

    system "uv", "tool", "install",
      "--python", Formula["python@3.12"].opt_bin/"python3.12",
      "--compile-bytecode",
      "--force",
      "airbyte==#{version}"
  end

  test do
    assert_match "Usage: pyairbyte", shell_output("#{bin}/pyairbyte --help")
    assert_match "Usage: pyab", shell_output("#{bin}/pyab --help")
    assert_path_exists bin/"airbyte-mcp"
  end
end
