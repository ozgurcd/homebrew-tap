class Scrinium < Formula
  desc "Governed wiki MCP server for AI coding agents"
  homepage "https://github.com/ozgurcd/scrinium"
  url "https://github.com/ozgurcd/scrinium/archive/refs/tags/v0.2.2.tar.gz"
  sha256 "a24892f06b4e7b37d0f7b73c540555b4740fbbbb3d7be965e5f6ef68540e08ec"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w -X scrinium/cmd/scrinium.version=#{version}"), "."
  end

  test do
    assert_match "scrinium #{version}", shell_output("#{bin}/scrinium version")
  end
end
