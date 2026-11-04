class Tessera < Formula
  desc "Check TypeScript HTTP clients against server handlers"
  homepage "https://github.com/ozgurcd/tessera"
  url "https://github.com/ozgurcd/tessera/releases/download/v0.1.1/identuum-tessera-0.1.1.tgz"
  sha256 "17ef1c78147e741281475f45d0b604abf71d199eb3c09202493666e1ea6e90e6"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink libexec.glob("bin/*")
  end

  test do
    assert_match "selftest: 23/23 passed", shell_output("#{bin}/tessera selftest")
  end
end
