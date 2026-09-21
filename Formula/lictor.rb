class Lictor < Formula
  desc "Identuum-specific gate execution"
  homepage "https://github.com/ozgurcd/lictor"
  version "0.3.0"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ozgurcd/lictor/releases/download/v0.3.0/lictor_0.3.0_darwin_arm64.tar.gz"
      sha256 "1f437907dbd632f73a919565fedbd1978586c2315967465bed9c8935a9adccf7"
    else
      url "https://github.com/ozgurcd/lictor/releases/download/v0.3.0/lictor_0.3.0_darwin_amd64.tar.gz"
      sha256 "21db7d8309adb6c87226022384f739f9d29e8d720274b64ec7be7ec7b4ec9996"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ozgurcd/lictor/releases/download/v0.3.0/lictor_0.3.0_linux_arm64.tar.gz"
      sha256 "dfd302d758717e1508bf438b958eaec4a39bdd7a4912867af33744b1557e4d76"
    else
      url "https://github.com/ozgurcd/lictor/releases/download/v0.3.0/lictor_0.3.0_linux_amd64.tar.gz"
      sha256 "ebd02bc2ae8f111405ea118df6eb8371c8778fa6ab72e22713794e4b37024e44"
    end
  end

  def install
    bin.install "lictor"
  end

  test do
    version_document = shell_output("#{bin}/lictor version --json")
    assert_match '"schema_version":"lictor.version.v1"', version_document
    assert_match '"version":"v0.3.0"', version_document
  end
end
