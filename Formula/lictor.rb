class Lictor < Formula
  desc "Identuum-specific gate execution"
  homepage "https://github.com/ozgurcd/lictor"
  version "0.4.7"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ozgurcd/lictor/releases/download/v0.4.7/lictor_0.4.7_darwin_arm64.tar.gz"
      sha256 "f96c8d833990af3862835175d1af8a61380eecf10a5344ba0e232958fcc6d500"
    else
      url "https://github.com/ozgurcd/lictor/releases/download/v0.4.7/lictor_0.4.7_darwin_amd64.tar.gz"
      sha256 "8d664ce4d9f1dba111ecac0026ebf49168a7bd3add8b50c49a08804126d975da"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ozgurcd/lictor/releases/download/v0.4.7/lictor_0.4.7_linux_arm64.tar.gz"
      sha256 "9c445a73f20cb1f561f30aa904d6c10233decdf24cb263f9ca835b6562315b7f"
    else
      url "https://github.com/ozgurcd/lictor/releases/download/v0.4.7/lictor_0.4.7_linux_amd64.tar.gz"
      sha256 "ec2751474226a577482ce360d956567ec671b0eaa8a15cf6558ef7475db9afb4"
    end
  end

  def install
    bin.install "lictor"
  end

  test do
    version_document = shell_output("#{bin}/lictor version --json")
    assert_match '"schema_version":"lictor.version.v1"', version_document
    assert_match '"version":"v0.4.7"', version_document
  end
end
