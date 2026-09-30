class Lictor < Formula
  desc "Identuum-specific gate execution"
  homepage "https://github.com/ozgurcd/lictor"
  version "0.4.3"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ozgurcd/lictor/releases/download/v0.4.3/lictor_0.4.3_darwin_arm64.tar.gz"
      sha256 "bfa8820150cca90644bfb4b136a8b9adb7cfa0b9e3ab85323c37034b66d2bc35"
    else
      url "https://github.com/ozgurcd/lictor/releases/download/v0.4.3/lictor_0.4.3_darwin_amd64.tar.gz"
      sha256 "21e85d1073f49b2e19b03515387410159f2fa3911eca30322f83e401859ad20c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ozgurcd/lictor/releases/download/v0.4.3/lictor_0.4.3_linux_arm64.tar.gz"
      sha256 "fc9af73f3f469cf351e8f80fa6c616a425d7dae51360336d5018db2852beb4dd"
    else
      url "https://github.com/ozgurcd/lictor/releases/download/v0.4.3/lictor_0.4.3_linux_amd64.tar.gz"
      sha256 "9a2142d3abc326e9461cea5a09f158de2c84e6853f1233fbf13b7ddc0dd5fc72"
    end
  end

  def install
    bin.install "lictor"
  end

  test do
    version_document = shell_output("#{bin}/lictor version --json")
    assert_match '"schema_version":"lictor.version.v1"', version_document
    assert_match '"version":"v0.4.3"', version_document
  end
end
