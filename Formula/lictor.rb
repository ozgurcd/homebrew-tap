class Lictor < Formula
  desc "Identuum-specific gate execution"
  homepage "https://github.com/ozgurcd/lictor"
  version "0.2.0"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ozgurcd/lictor/releases/download/v0.2.0/lictor_0.2.0_darwin_arm64.tar.gz"
      sha256 "45044c79768fb6a7ba673e7a9cf00104a28b8970996861be432560317ca40813"
    else
      url "https://github.com/ozgurcd/lictor/releases/download/v0.2.0/lictor_0.2.0_darwin_amd64.tar.gz"
      sha256 "44d69c94d7d61a9d426cdf0e36af8b54490b09689e21d7b32be587c3f0711746"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ozgurcd/lictor/releases/download/v0.2.0/lictor_0.2.0_linux_arm64.tar.gz"
      sha256 "bd7cd877e8ef34bd9ae991abffb5d905bd098ea78b261b4b88a72386f7132abf"
    else
      url "https://github.com/ozgurcd/lictor/releases/download/v0.2.0/lictor_0.2.0_linux_amd64.tar.gz"
      sha256 "d30e294ee962596d36eb8f9c86e1e84db46495059aa2d1c6ec19f529b8cdbf00"
    end
  end

  def install
    bin.install "lictor"
  end

  test do
    version_document = shell_output("#{bin}/lictor version --json")
    assert_match '"schema_version":"lictor.version.v1"', version_document
    assert_match '"version":"v0.2.0"', version_document
  end
end
