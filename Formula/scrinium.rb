class Scrinium < Formula
  desc "Governed wiki MCP server for AI coding agents"
  homepage "https://github.com/ozgurcd/scrinium"
  url "https://github.com/ozgurcd/scrinium/archive/refs/tags/v0.4.1.tar.gz"
  sha256 "b09fc3d726eaf39a4372be1a1af3e877ddf5a3db12b2920c21619aa88ffc3e76"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w -X scrinium/cmd/scrinium.version=#{version}"), "."
  end

  test do
    assert_match "scrinium #{version}", shell_output("#{bin}/scrinium version")
  end
end
