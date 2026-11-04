class Tessera < Formula
  desc "Check TypeScript HTTP clients against server handlers"
  homepage "https://github.com/ozgurcd/tessera"
  url "https://github.com/ozgurcd/tessera/releases/download/v0.1.2/identuum-tessera-0.1.2.tgz"
  sha256 "4d8e170663820e3691f3c7665456243dcbeccc00272bb803b32a761a4043afd3"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink libexec.glob("bin/*")
  end

  test do
    assert_match "selftest: 29/29 passed", shell_output("#{bin}/tessera selftest")
  end
end
