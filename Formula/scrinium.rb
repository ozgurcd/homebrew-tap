class Scrinium < Formula
  desc "Governed wiki MCP server for AI coding agents"
  homepage "https://github.com/ozgurcd/scrinium"
  url "https://github.com/ozgurcd/scrinium/archive/refs/tags/v0.4.6.tar.gz"
  sha256 "b4f83772786fdb45952e71d64c38f938c833b83c6ed06d5d40a1138c4cc9ba49"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w -X scrinium/cmd/scrinium.version=#{version}"), "."
  end

  test do
    assert_match "scrinium #{version}", shell_output("#{bin}/scrinium version")
  end
end
