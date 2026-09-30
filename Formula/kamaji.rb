# frozen_string_literal: true

# Generated from Kamaji's homebrew/kamaji.rb.in and verified release archives.
class Kamaji < Formula
  desc "Build and automate tasks with dependency graphs and verified local caching"
  homepage "https://github.com/ozgurcd/kamaji"
  version "0.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ozgurcd/kamaji/releases/download/v0.3.0/kamaji_v0.3.0_darwin_arm64.tar.gz"
      sha256 "69ed8390d27b6eac377054c455780757de6b2f726169e88a1ec70f5b93ac4ff5"
    end
    on_intel do
      url "https://github.com/ozgurcd/kamaji/releases/download/v0.3.0/kamaji_v0.3.0_darwin_amd64.tar.gz"
      sha256 "deefdf4e4891bafc9114e6088d0a4226831e12b2e726ada356d5b9711e65fe24"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ozgurcd/kamaji/releases/download/v0.3.0/kamaji_v0.3.0_linux_arm64.tar.gz"
      sha256 "e757d889b63b1780795961a62ec56b1cae2cbbf4cbae4fb90c08282f25a7ab5c"
    end
    on_intel do
      url "https://github.com/ozgurcd/kamaji/releases/download/v0.3.0/kamaji_v0.3.0_linux_amd64.tar.gz"
      sha256 "fb125002160ea4b709406234daf628bd04156db5beb020b685eb0d3639ca2167"
    end
  end

  def install
    bin.install "kamaji"
  end

  test do
    assert_equal "v#{version}", shell_output("#{bin}/kamaji version 2>&1").strip
    capabilities = JSON.parse(shell_output("#{bin}/kamaji capabilities"))
    assert_equal "kamaji.capabilities.v1", capabilities.fetch("schema")
    assert_includes capabilities.fetch("build_commands"), "build"

    (testpath/"kamaji.toml").write <<~TOML
      version = 1
      default = ["greet"]
      [[targets]]
      name = "greet"
      command = ["/bin/sh", "-c", "printf hello > greeting.txt"]
      outputs = ["greeting.txt"]
      cache = true
    TOML
    plan = JSON.parse(shell_output("#{bin}/kamaji plan --json"))
    assert_equal "kamaji.plan.v1", plan.fetch("schema")
    refute_path_exists testpath/".kamaji"
    result = JSON.parse(shell_output("#{bin}/kamaji build --expect-plan #{plan.fetch("id")} --json"))
    assert result.fetch("success")
    assert_equal plan.fetch("id"), result.fetch("plan")
    assert_equal "executed", result.fetch("targets").first.fetch("status")
    assert_equal "hello", (testpath/"greeting.txt").read
    (testpath/"greeting.txt").unlink
    cached = JSON.parse(shell_output("#{bin}/kamaji build --json"))
    assert_equal "cached", cached.fetch("targets").first.fetch("status")
    assert_equal "hello", (testpath/"greeting.txt").read
    history = JSON.parse(shell_output("#{bin}/kamaji history #{cached.fetch("id")}"))
    assert_equal cached, history
  end
end
