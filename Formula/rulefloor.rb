class Rulefloor < Formula
  desc "Detect drift between declared invariants and bound checks"
  homepage "https://github.com/ozgurcd/rulefloor"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ozgurcd/rulefloor/releases/download/v0.9.0/rulefloor_0.9.0_darwin_arm64.tar.gz"
      sha256 "4a5fdfd97db146d1794f184aea39578f0c151766f2f7b8cd5abe437d131b29bb"
    else
      url "https://github.com/ozgurcd/rulefloor/releases/download/v0.9.0/rulefloor_0.9.0_darwin_amd64.tar.gz"
      sha256 "8456c48f072d9c931eb808837746e5065afa2a90b2f6cc1fad059a8d2da8880f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ozgurcd/rulefloor/releases/download/v0.9.0/rulefloor_0.9.0_linux_arm64.tar.gz"
      sha256 "bcd2fcc7604e88c69d5f9132925deb860c9c6d73ffd326e6b70e557eae48ed09"
    else
      url "https://github.com/ozgurcd/rulefloor/releases/download/v0.9.0/rulefloor_0.9.0_linux_amd64.tar.gz"
      sha256 "c60a0546663180e932fbee2c795a66508e080cf14b804a05789bf9d8366782b1"
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
