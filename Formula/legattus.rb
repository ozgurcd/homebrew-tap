class Legattus < Formula
  desc "Deterministic orchestration for coding-agent tool workflows"
  homepage "https://github.com/ozgurcd/legattus"
  version "0.1.1"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://api.github.com/repos/ozgurcd/legattus/releases/assets/557309362",
          headers: [
            "Accept: application/octet-stream",
            "Authorization: Bearer #{ENV.fetch("HOMEBREW_GITHUB_API_TOKEN", "")}",
            "X-GitHub-Api-Version: 2022-11-28",
          ]
      sha256 "60655d8f06a3ad1a3ca4d7f716720bb65f04d5c50cc877cf5a47dcfa86544f18"
    else
      url "https://api.github.com/repos/ozgurcd/legattus/releases/assets/557309363",
          headers: [
            "Accept: application/octet-stream",
            "Authorization: Bearer #{ENV.fetch("HOMEBREW_GITHUB_API_TOKEN", "")}",
            "X-GitHub-Api-Version: 2022-11-28",
          ]
      sha256 "87e8f6a9f0a85f86985f266506497d8b37bf821abd2a9e1b0b366507846b6ffe"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://api.github.com/repos/ozgurcd/legattus/releases/assets/557309367",
          headers: [
            "Accept: application/octet-stream",
            "Authorization: Bearer #{ENV.fetch("HOMEBREW_GITHUB_API_TOKEN", "")}",
            "X-GitHub-Api-Version: 2022-11-28",
          ]
      sha256 "6a0b9b9dd1ec4a37fc74b4b822e9a054e3edd25c3cecdb202a2198fefb10853f"
    else
      url "https://api.github.com/repos/ozgurcd/legattus/releases/assets/557309361",
          headers: [
            "Accept: application/octet-stream",
            "Authorization: Bearer #{ENV.fetch("HOMEBREW_GITHUB_API_TOKEN", "")}",
            "X-GitHub-Api-Version: 2022-11-28",
          ]
      sha256 "e564e21be752914e3e6cc31d28f253fadb453d6ebf79b2e38adb328bb7a4e75b"
    end
  end

  def install
    bin.install "legattus"
  end

  test do
    version_document = shell_output("#{bin}/legattus version --json")
    assert_match '"version":"v0.1.1"', version_document
    assert_match '"version_agreement":"pass"', version_document

    capabilities = shell_output("#{bin}/legattus capabilities --json")
    assert_match "legattus.capabilities.v4", capabilities
    assert_match "legattus_completion_status", capabilities
    assert_match "legattus_findings", capabilities
  end
end
