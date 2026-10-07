class Lictor < Formula
  desc "Identuum-specific gate execution"
  homepage "https://github.com/ozgurcd/lictor"
  version "0.4.6"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ozgurcd/lictor/releases/download/v0.4.6/lictor_0.4.6_darwin_arm64.tar.gz"
      sha256 "191b9012134fd8857a8da2f7b088f6f68c19493c2200a509450db60e6f3c52d2"
    else
      url "https://github.com/ozgurcd/lictor/releases/download/v0.4.6/lictor_0.4.6_darwin_amd64.tar.gz"
      sha256 "f403af45c23ae32399163a725f7551c5e0af1cc1224f31d659418b5b6f37982a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ozgurcd/lictor/releases/download/v0.4.6/lictor_0.4.6_linux_arm64.tar.gz"
      sha256 "fe3c0bb55acb3665ed7938f5d13a051cf5c5baf3f689a50395d9e438492b4568"
    else
      url "https://github.com/ozgurcd/lictor/releases/download/v0.4.6/lictor_0.4.6_linux_amd64.tar.gz"
      sha256 "1f3869fb2d52804f5069c9f54c0eaae3260fd6f28c0896cfb16b5e942295d583"
    end
  end

  def install
    bin.install "lictor"
  end

  test do
    version_document = shell_output("#{bin}/lictor version --json")
    assert_match '"schema_version":"lictor.version.v1"', version_document
    assert_match '"version":"v0.4.6"', version_document
  end
end
