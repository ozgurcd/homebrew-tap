class Lictor < Formula
  desc "Identuum-specific gate execution"
  homepage "https://github.com/ozgurcd/lictor"
  version "0.4.5"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ozgurcd/lictor/releases/download/v0.4.5/lictor_0.4.5_darwin_arm64.tar.gz"
      sha256 "f8d20837134d4817a271140095b027e3456b4edc286efdcd1d05cb09f0610c2c"
    else
      url "https://github.com/ozgurcd/lictor/releases/download/v0.4.5/lictor_0.4.5_darwin_amd64.tar.gz"
      sha256 "d745c72936956cd8049fd12a2390c397fc0a2bcc646681f1cedddeab30ea0111"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ozgurcd/lictor/releases/download/v0.4.5/lictor_0.4.5_linux_arm64.tar.gz"
      sha256 "077475f93775285c0efd950365f290a63a303201101261c74588eba02d5d8656"
    else
      url "https://github.com/ozgurcd/lictor/releases/download/v0.4.5/lictor_0.4.5_linux_amd64.tar.gz"
      sha256 "b688c6ce8840cb61704b8d380290930ab5b41cc0d643686e633c99c4f084f133"
    end
  end

  def install
    bin.install "lictor"
  end

  test do
    version_document = shell_output("#{bin}/lictor version --json")
    assert_match '"schema_version":"lictor.version.v1"', version_document
    assert_match '"version":"v0.4.5"', version_document
  end
end
