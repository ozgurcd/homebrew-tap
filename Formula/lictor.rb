class Lictor < Formula
  desc "Identuum-specific gate execution"
  homepage "https://github.com/ozgurcd/lictor"
  version "0.1.0"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ozgurcd/lictor/releases/download/v0.1.0/lictor_0.1.0_darwin_arm64.tar.gz"
      sha256 "babb70fd8ff4acd0d72862a1f965ebea8461835194b299949e30a52430a5d5f4"
    else
      url "https://github.com/ozgurcd/lictor/releases/download/v0.1.0/lictor_0.1.0_darwin_amd64.tar.gz"
      sha256 "e21c93fa9f39c8707996c2fa8e0f1f89f41a763269abbe41c1fa18a73bab4af7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ozgurcd/lictor/releases/download/v0.1.0/lictor_0.1.0_linux_arm64.tar.gz"
      sha256 "2d82acb9ed34d64f5d5feef03e9f1ecbefba307e4b671f6a1a5b7253864e36f0"
    else
      url "https://github.com/ozgurcd/lictor/releases/download/v0.1.0/lictor_0.1.0_linux_amd64.tar.gz"
      sha256 "c051b5fa995211de4b4910395dc10b46d7b7c05be32c6af87e65345bd4eca739"
    end
  end

  def install
    bin.install "lictor"
  end

  test do
    version_document = shell_output("#{bin}/lictor version --json")
    assert_match '"schema_version":"lictor.version.v1"', version_document
    assert_match '"version":"v0.1.0"', version_document
  end
end
