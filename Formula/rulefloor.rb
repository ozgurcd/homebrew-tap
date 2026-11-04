class Rulefloor < Formula
  desc "Detect drift between declared invariants and bound checks"
  homepage "https://github.com/ozgurcd/rulefloor"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ozgurcd/rulefloor/releases/download/v0.9.2/rulefloor_0.9.2_darwin_arm64.tar.gz"
      sha256 "4e9a88ecb703f1a920f16dbfbb09b3043abf9497e1044ccdc9824c06ce2d3221"
    else
      url "https://github.com/ozgurcd/rulefloor/releases/download/v0.9.2/rulefloor_0.9.2_darwin_amd64.tar.gz"
      sha256 "26dec112499895eb7c6ee8959748fe024b441611448fe7c7ff680c003e25e88a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ozgurcd/rulefloor/releases/download/v0.9.2/rulefloor_0.9.2_linux_arm64.tar.gz"
      sha256 "e97091f9f102b2f7bec6cbcec123783281d120e63c2b5b3fa07f2ac4122ac96d"
    else
      url "https://github.com/ozgurcd/rulefloor/releases/download/v0.9.2/rulefloor_0.9.2_linux_amd64.tar.gz"
      sha256 "f40c762d7937442347548f4a45c2e99da964f00f6862dacc327e9c0161832de1"
    end
  end

  def install
    bin.install "rulefloor"
  end

  test do
    assert_match "rulefloor v#{version}", shell_output("#{bin}/rulefloor --version")
    assert_match "rulefloor.version.v1", shell_output("#{bin}/rulefloor version --json")
    assert_match '"version_agreement":"pass"', shell_output("#{bin}/rulefloor version --json")
    assert_match "--timings", shell_output("#{bin}/rulefloor check --help")
    capabilities = shell_output("#{bin}/rulefloor capabilities --json")
    assert_match "rulefloor.capabilities.v1", capabilities
    assert_match "ledger-diff-sentence-sha256", capabilities
    system bin/"rulefloor", "init"
    assert_match "check OK", shell_output("#{bin}/rulefloor check")
  end
end
