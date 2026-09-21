class Lictor < Formula
  desc "Identuum-specific gate execution"
  homepage "https://github.com/ozgurcd/lictor"
  version "0.4.1"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ozgurcd/lictor/releases/download/v0.4.1/lictor_0.4.1_darwin_arm64.tar.gz"
      sha256 "2c5f1b1f5f13fef015484b96b583b29e22b3825ec4c5c6c7231e7a625693c5c4"
    else
      url "https://github.com/ozgurcd/lictor/releases/download/v0.4.1/lictor_0.4.1_darwin_amd64.tar.gz"
      sha256 "c64b20ead6dcc0898db25b216b9d3944107e366946b63fbe48be5b0e1d701507"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ozgurcd/lictor/releases/download/v0.4.1/lictor_0.4.1_linux_arm64.tar.gz"
      sha256 "96d0babe273a6cbcd5c684012a3af47ba607e79df69511618f37a745c58d8eaa"
    else
      url "https://github.com/ozgurcd/lictor/releases/download/v0.4.1/lictor_0.4.1_linux_amd64.tar.gz"
      sha256 "61f13b580e30a05a5a028b75f152347f3d1612a9267cd945237ae669b1fcd92b"
    end
  end

  def install
    bin.install "lictor"
  end

  test do
    version_document = shell_output("#{bin}/lictor version --json")
    assert_match '"schema_version":"lictor.version.v1"', version_document
    assert_match '"version":"v0.4.1"', version_document
  end
end
