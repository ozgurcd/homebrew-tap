class Rulefloor < Formula
  desc "Machine-checked rule ledger: pin invariants to the tests that prove them"
  homepage "https://github.com/ozgurcd/rulefloor"
  url "https://github.com/ozgurcd/rulefloor/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "08c4446f27b9a6ec2f406de9afbe3ab9991169283eac056909dee53abb75f905"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w -X main.version=v#{version}"), "."
  end

  test do
    assert_match "rulefloor v#{version}", shell_output("#{bin}/rulefloor --version")
    system bin/"rulefloor", "init"
    assert_match "check OK", shell_output("#{bin}/rulefloor check")
  end
end
