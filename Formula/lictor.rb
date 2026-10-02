class Lictor < Formula
  desc "Identuum-specific gate execution"
  homepage "https://github.com/ozgurcd/lictor"
  version "0.4.4"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ozgurcd/lictor/releases/download/v0.4.4/lictor_0.4.4_darwin_arm64.tar.gz"
      sha256 "2572465842bae8c439b0d5a79eba088bca2ce1bf8bdaff8ecc985639e97ac4bb"
    else
      url "https://github.com/ozgurcd/lictor/releases/download/v0.4.4/lictor_0.4.4_darwin_amd64.tar.gz"
      sha256 "72d13808d2b894fdcebd9e27bf1cfac694da0f0aae494b9c5a07483890427367"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ozgurcd/lictor/releases/download/v0.4.4/lictor_0.4.4_linux_arm64.tar.gz"
      sha256 "6af0d77bbebb2aba44c6efafbbe460370164e1535b45846098608959e5905a91"
    else
      url "https://github.com/ozgurcd/lictor/releases/download/v0.4.4/lictor_0.4.4_linux_amd64.tar.gz"
      sha256 "d2c3e29ee8a9942eb9c82f595d6702bb52bc5673f9787dbba17c1de5bfed8c85"
    end
  end

  def install
    bin.install "lictor"
  end

  test do
    version_document = shell_output("#{bin}/lictor version --json")
    assert_match '"schema_version":"lictor.version.v1"', version_document
    assert_match '"version":"v0.4.4"', version_document
  end
end
