class Legattus < Formula
  desc "Deterministic orchestration for coding-agent tool workflows"
  homepage "https://github.com/ozgurcd/legattus"
  version "0.1.8"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://api.github.com/repos/ozgurcd/legattus/releases/assets/569818024",
          headers: [
            "Accept: application/octet-stream",
            "Authorization: Bearer #{ENV.fetch("HOMEBREW_GITHUB_API_TOKEN", "")}",
            "X-GitHub-Api-Version: 2022-11-28",
          ]
      sha256 "7c8e32fc856a0e1871e14cb31fb343a5569f377adc275da944f8802b63c8720c"
    else
      url "https://api.github.com/repos/ozgurcd/legattus/releases/assets/569818025",
          headers: [
            "Accept: application/octet-stream",
            "Authorization: Bearer #{ENV.fetch("HOMEBREW_GITHUB_API_TOKEN", "")}",
            "X-GitHub-Api-Version: 2022-11-28",
          ]
      sha256 "1e5f076b563f0473db9a3e518eaaf234e8e535d579592521bed1883485a5cd0f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://api.github.com/repos/ozgurcd/legattus/releases/assets/569818021",
          headers: [
            "Accept: application/octet-stream",
            "Authorization: Bearer #{ENV.fetch("HOMEBREW_GITHUB_API_TOKEN", "")}",
            "X-GitHub-Api-Version: 2022-11-28",
          ]
      sha256 "62fa1d4f743498833e516487d52b4a6737bb41f8f4b04043667f18262c6e65f7"
    else
      url "https://api.github.com/repos/ozgurcd/legattus/releases/assets/569818023",
          headers: [
            "Accept: application/octet-stream",
            "Authorization: Bearer #{ENV.fetch("HOMEBREW_GITHUB_API_TOKEN", "")}",
            "X-GitHub-Api-Version: 2022-11-28",
          ]
      sha256 "c4427f3a113d1c94fcfedab9a90cfa2fa80d883c037affd3e38447903dfdf795"
    end
  end

  def install
    bin.install "legattus"
  end

  test do
    version_document = shell_output("#{bin}/legattus version --json")
    assert_match '"version":"v0.1.8"', version_document
    assert_match '"version_agreement":"pass"', version_document

    capabilities = shell_output("#{bin}/legattus capabilities --json")
    assert_match "legattus.capabilities.v7", capabilities
    assert_match "legattus.executable-authority.v1", capabilities
    assert_match "legattus_completion_status", capabilities
    assert_match "legattus_findings", capabilities
    assert_match "legattus_workflow", capabilities
  end
end
