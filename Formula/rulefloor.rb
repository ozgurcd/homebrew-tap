class Rulefloor < Formula
  desc "Machine-checked rule ledger: pin invariants to the tests that prove them"
  homepage "https://github.com/ozgurcd/rulefloor"
  url "https://github.com/ozgurcd/rulefloor/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "62b7c6c3f35b5bf8aefd2625079e290d5b9af7dd57152a3a0281a2e0ea3d2954"
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
