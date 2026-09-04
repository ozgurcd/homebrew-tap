class Rulefloor < Formula
  desc "Detect drift between declared invariants and bound checks"
  homepage "https://github.com/ozgurcd/rulefloor"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ozgurcd/rulefloor/releases/download/v0.9.1/rulefloor_0.9.1_darwin_arm64.tar.gz"
      sha256 "5a18837d9380bf5b471225924cc5137a705c672570e42772545eeaaddd547dfe"
    else
      url "https://github.com/ozgurcd/rulefloor/releases/download/v0.9.1/rulefloor_0.9.1_darwin_amd64.tar.gz"
      sha256 "553f5ba0da928a5a56238d6b084f90d9cc4c17732e2d6b418cd6c5abcb8f3540"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ozgurcd/rulefloor/releases/download/v0.9.1/rulefloor_0.9.1_linux_arm64.tar.gz"
      sha256 "37015719d38a223e8706a5fcae844c0f858c90d0d2b1c96bb1c5f70864c538ba"
    else
      url "https://github.com/ozgurcd/rulefloor/releases/download/v0.9.1/rulefloor_0.9.1_linux_amd64.tar.gz"
      sha256 "989a7af3b4c83486e1bc600f9efb2030bcbf4371b0261df3f47c5d92b584acf3"
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
