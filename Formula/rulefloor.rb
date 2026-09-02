class Rulefloor < Formula
  desc "Detect drift between declared invariants and bound checks"
  homepage "https://github.com/ozgurcd/rulefloor"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ozgurcd/rulefloor/releases/download/v0.8.1/rulefloor_0.8.1_darwin_arm64.tar.gz"
      sha256 "ba9d5054e4c311d68eeab4ff18800c458188885102c48f985220e354849217d2"
    else
      url "https://github.com/ozgurcd/rulefloor/releases/download/v0.8.1/rulefloor_0.8.1_darwin_amd64.tar.gz"
      sha256 "b387b582fc23cdce52fda5e07d1e03725cf91af9366c465f9902230b012d2101"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ozgurcd/rulefloor/releases/download/v0.8.1/rulefloor_0.8.1_linux_arm64.tar.gz"
      sha256 "2d9aa5c0f02058a827df7ffd5fe84e2c55eacb081e9b709cc2ffe8cb28357759"
    else
      url "https://github.com/ozgurcd/rulefloor/releases/download/v0.8.1/rulefloor_0.8.1_linux_amd64.tar.gz"
      sha256 "c4605008455a87651f8f1ad43bf420ba1bec898000db6e45a98782ac8ff291d4"
    end
  end

  def install
    bin.install "rulefloor"
  end

  test do
    assert_match "rulefloor v#{version}", shell_output("#{bin}/rulefloor --version")
    assert_match "rulefloor.version.v1", shell_output("#{bin}/rulefloor version --json")
    assert_match '"version_agreement":"pass"', shell_output("#{bin}/rulefloor version --json")
    capabilities = shell_output("#{bin}/rulefloor capabilities --json")
    assert_match "rulefloor.capabilities.v1", capabilities
    assert_match "ledger-diff-sentence-sha256", capabilities
    system bin/"rulefloor", "init"
    assert_match "check OK", shell_output("#{bin}/rulefloor check")
  end
end
