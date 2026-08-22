class Scrinium < Formula
  desc "Governed wiki MCP server for AI coding agents"
  homepage "https://github.com/ozgurcd/scrinium"
  url "https://github.com/ozgurcd/scrinium/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "fbbc9cdeb884b55b2e3642e1f8de52a93f03de6e6872800d92b15ecb0ce69465"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w -X scrinium/cmd/scrinium.version=#{version}"), "."
  end

  test do
    assert_match "scrinium #{version}", shell_output("#{bin}/scrinium version")
  end
end
