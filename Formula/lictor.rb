class Lictor < Formula
  desc "Identuum-specific gate execution"
  homepage "https://github.com/ozgurcd/lictor"
  version "0.1.0"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://api.github.com/repos/ozgurcd/lictor/releases/assets/574915641",
          headers: [
            "Accept: application/octet-stream",
            "Authorization: Bearer #{ENV.fetch("HOMEBREW_GITHUB_API_TOKEN", "")}",
            "X-GitHub-Api-Version: 2022-11-28",
          ]
      sha256 "babb70fd8ff4acd0d72862a1f965ebea8461835194b299949e30a52430a5d5f4"
    else
      url "https://api.github.com/repos/ozgurcd/lictor/releases/assets/574915642",
          headers: [
            "Accept: application/octet-stream",
            "Authorization: Bearer #{ENV.fetch("HOMEBREW_GITHUB_API_TOKEN", "")}",
            "X-GitHub-Api-Version: 2022-11-28",
          ]
      sha256 "e21c93fa9f39c8707996c2fa8e0f1f89f41a763269abbe41c1fa18a73bab4af7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://api.github.com/repos/ozgurcd/lictor/releases/assets/574915640",
          headers: [
            "Accept: application/octet-stream",
            "Authorization: Bearer #{ENV.fetch("HOMEBREW_GITHUB_API_TOKEN", "")}",
            "X-GitHub-Api-Version: 2022-11-28",
          ]
      sha256 "2d82acb9ed34d64f5d5feef03e9f1ecbefba307e4b671f6a1a5b7253864e36f0"
    else
      url "https://api.github.com/repos/ozgurcd/lictor/releases/assets/574915643",
          headers: [
            "Accept: application/octet-stream",
            "Authorization: Bearer #{ENV.fetch("HOMEBREW_GITHUB_API_TOKEN", "")}",
            "X-GitHub-Api-Version: 2022-11-28",
          ]
      sha256 "c051b5fa995211de4b4910395dc10b46d7b7c05be32c6af87e65345bd4eca739"
    end
  end

  def install
    bin.install "lictor"
  end

  test do
    version_document = shell_output("#{bin}/lictor version --json")
    assert_match '"schema_version":"lictor.version.v1"', version_document
    assert_match '"version":"v0.1.0"', version_document
  end
end
