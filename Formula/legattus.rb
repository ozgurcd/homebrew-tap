class Legattus < Formula
  desc "Deterministic orchestration for coding-agent tool workflows"
  homepage "https://github.com/ozgurcd/legattus"
  version "0.1.5"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://api.github.com/repos/ozgurcd/legattus/releases/assets/566489272",
          headers: [
            "Accept: application/octet-stream",
            "Authorization: Bearer #{ENV.fetch("HOMEBREW_GITHUB_API_TOKEN", "")}",
            "X-GitHub-Api-Version: 2022-11-28",
          ]
      sha256 "9c9fd0511539257b05d1c80eb8a3afe0ed324bb11738f610e458bd9005936b42"
    else
      url "https://api.github.com/repos/ozgurcd/legattus/releases/assets/566489266",
          headers: [
            "Accept: application/octet-stream",
            "Authorization: Bearer #{ENV.fetch("HOMEBREW_GITHUB_API_TOKEN", "")}",
            "X-GitHub-Api-Version: 2022-11-28",
          ]
      sha256 "a70ee41edff88496ab65d26cf1a44b9c4d743eda5c1b871706e12bddc7c8715a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://api.github.com/repos/ozgurcd/legattus/releases/assets/566489269",
          headers: [
            "Accept: application/octet-stream",
            "Authorization: Bearer #{ENV.fetch("HOMEBREW_GITHUB_API_TOKEN", "")}",
            "X-GitHub-Api-Version: 2022-11-28",
          ]
      sha256 "5ae8cc2440ba77cc069777a4be5b4dcd1cb70ab26448a8eca3bbc3f1c314ce47"
    else
      url "https://api.github.com/repos/ozgurcd/legattus/releases/assets/566489273",
          headers: [
            "Accept: application/octet-stream",
            "Authorization: Bearer #{ENV.fetch("HOMEBREW_GITHUB_API_TOKEN", "")}",
            "X-GitHub-Api-Version: 2022-11-28",
          ]
      sha256 "f016dfbbd62032b1834679e4f262d0fbe8c0e5ec9a4b950be01276b764c4cc78"
    end
  end

  def install
    bin.install "legattus"
  end

  test do
    version_document = shell_output("#{bin}/legattus version --json")
    assert_match '"version":"v0.1.5"', version_document
    assert_match '"version_agreement":"pass"', version_document

    capabilities = shell_output("#{bin}/legattus capabilities --json")
    assert_match "legattus.capabilities.v6", capabilities
    assert_match "legattus.executable-authority.v1", capabilities
    assert_match "legattus_completion_status", capabilities
    assert_match "legattus_findings", capabilities
    assert_match "legattus_workflow", capabilities
  end
end
