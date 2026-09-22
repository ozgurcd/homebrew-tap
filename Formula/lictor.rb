class Lictor < Formula
  desc "Identuum-specific gate execution"
  homepage "https://github.com/ozgurcd/lictor"
  version "0.4.2"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ozgurcd/lictor/releases/download/v0.4.2/lictor_0.4.2_darwin_arm64.tar.gz"
      sha256 "ac39ce7d94c9d9623840c2ec203bae1e42d1435570fc9620079edcde756add44"
    else
      url "https://github.com/ozgurcd/lictor/releases/download/v0.4.2/lictor_0.4.2_darwin_amd64.tar.gz"
      sha256 "c50806f8adbf82a7820d9aca86546c347b1b8162621f1e44ea99f45f26d28ac2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ozgurcd/lictor/releases/download/v0.4.2/lictor_0.4.2_linux_arm64.tar.gz"
      sha256 "5e734761bf2564b7f0a78ce5ca4e1b26f26fb0c2b2fa2404fafa1ff040dd7964"
    else
      url "https://github.com/ozgurcd/lictor/releases/download/v0.4.2/lictor_0.4.2_linux_amd64.tar.gz"
      sha256 "0757b9d1842c0ef0fc1446a6b94fc1128a16fb465ab6fb221f3923a74bdc54c6"
    end
  end

  def install
    bin.install "lictor"
  end

  test do
    version_document = shell_output("#{bin}/lictor version --json")
    assert_match '"schema_version":"lictor.version.v1"', version_document
    assert_match '"version":"v0.4.2"', version_document
  end
end
