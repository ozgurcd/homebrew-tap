class Rulefloor < Formula
  desc "Detect drift between declared invariants and bound checks"
  homepage "https://github.com/ozgurcd/rulefloor"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ozgurcd/rulefloor/releases/download/v0.9.3/rulefloor_0.9.3_darwin_arm64.tar.gz"
      sha256 "fe618eb793f9c37cde7122c2ed7596c1e8968074dacdffba4285ca942a629a41"
    else
      url "https://github.com/ozgurcd/rulefloor/releases/download/v0.9.3/rulefloor_0.9.3_darwin_amd64.tar.gz"
      sha256 "4668120f3d117c5c6a648c4b85455fb83de4497f3b8f3964360e8dde18aa2911"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ozgurcd/rulefloor/releases/download/v0.9.3/rulefloor_0.9.3_linux_arm64.tar.gz"
      sha256 "f539e8422741834f88a59c6ae4b71ac5b0827c27250174ce8d43af31f2a4749a"
    else
      url "https://github.com/ozgurcd/rulefloor/releases/download/v0.9.3/rulefloor_0.9.3_linux_amd64.tar.gz"
      sha256 "ad853cbc6dcc9601aaa713f939b63206f68d4bb259f5d17c4631942fc079ea97"
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
