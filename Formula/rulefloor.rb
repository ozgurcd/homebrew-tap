class Rulefloor < Formula
  desc "Detect drift between declared invariants and bound checks"
  homepage "https://github.com/ozgurcd/rulefloor"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ozgurcd/rulefloor/releases/download/v0.8.0/rulefloor_0.8.0_darwin_arm64.tar.gz"
      sha256 "520a273ea522d45092477e7055bd040228eca084415472f5fd14debda4300e2f"
    else
      url "https://github.com/ozgurcd/rulefloor/releases/download/v0.8.0/rulefloor_0.8.0_darwin_amd64.tar.gz"
      sha256 "12084ed49fedebee39fcb72f412101f59c0ca36890851c88e4809c3d58959b83"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ozgurcd/rulefloor/releases/download/v0.8.0/rulefloor_0.8.0_linux_arm64.tar.gz"
      sha256 "36fc59b1d083d4a9f094442dc79a470465c09abdd365cdad5f72a9df9ed896c4"
    else
      url "https://github.com/ozgurcd/rulefloor/releases/download/v0.8.0/rulefloor_0.8.0_linux_amd64.tar.gz"
      sha256 "9b2f2c11ebeda4d8bf82bb14f91a4dbfe06d79960e3cc0795d50f7814cee3175"
    end
  end

  def install
    bin.install "rulefloor"
  end

  test do
    assert_match "rulefloor v#{version}", shell_output("#{bin}/rulefloor --version")
    assert_match "rulefloor.version.v1", shell_output("#{bin}/rulefloor version --json")
    assert_match '"version_agreement":"pass"', shell_output("#{bin}/rulefloor version --json")
    assert_match "rulefloor.capabilities.v1", shell_output("#{bin}/rulefloor capabilities --json")
    system bin/"rulefloor", "init"
    assert_match "check OK", shell_output("#{bin}/rulefloor check")
  end
end
