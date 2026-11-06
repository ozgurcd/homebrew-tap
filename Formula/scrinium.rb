class Scrinium < Formula
  desc "Governed wiki MCP server for AI coding agents"
  homepage "https://github.com/ozgurcd/scrinium"
  url "https://github.com/ozgurcd/scrinium/archive/refs/tags/v0.4.5.tar.gz"
  sha256 "68bdccbababad359d7473abb8923b0cb36a6fea74f64d45e093b9143a3d61af0"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w -X scrinium/cmd/scrinium.version=#{version}"), "."
  end

  test do
    assert_match "scrinium #{version}", shell_output("#{bin}/scrinium version")
  end
end
