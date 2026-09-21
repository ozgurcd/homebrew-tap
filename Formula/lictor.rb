class Lictor < Formula
  desc "Identuum-specific gate execution"
  homepage "https://github.com/ozgurcd/lictor"
  version "0.4.0"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ozgurcd/lictor/releases/download/v0.4.0/lictor_0.4.0_darwin_arm64.tar.gz"
      sha256 "3980c61cdc6f26a1cb3b842fc2f0c0cec7285f2e47192e12bd9111bd39f4baeb"
    else
      url "https://github.com/ozgurcd/lictor/releases/download/v0.4.0/lictor_0.4.0_darwin_amd64.tar.gz"
      sha256 "0619b88c72d2e7a9d866621864508a368bcf56d4c3f821640468c93d94b73ee6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ozgurcd/lictor/releases/download/v0.4.0/lictor_0.4.0_linux_arm64.tar.gz"
      sha256 "640562be814651bd8de1bd3731c27a0436346fe88a8036c8fdacf49f71644199"
    else
      url "https://github.com/ozgurcd/lictor/releases/download/v0.4.0/lictor_0.4.0_linux_amd64.tar.gz"
      sha256 "85e275003f2947b74ff3858a9dfc07d3cc1fe36dac89ab32cb7aaf4672b9a1f0"
    end
  end

  def install
    bin.install "lictor"
  end

  test do
    version_document = shell_output("#{bin}/lictor version --json")
    assert_match '"schema_version":"lictor.version.v1"', version_document
    assert_match '"version":"v0.4.0"', version_document
  end
end
