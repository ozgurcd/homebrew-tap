class Rulefloor < Formula
  desc "Machine-checked rule ledger: pin invariants to the tests that prove them"
  homepage "https://github.com/ozgurcd/rulefloor"
  url "https://github.com/ozgurcd/rulefloor/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "0b786b90caca8a57868ecee234f8a1c835809c39cd53ee28a330c085fbaae7f1"
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
