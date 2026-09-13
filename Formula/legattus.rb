class Legattus < Formula
  desc "Deterministic orchestration for coding-agent tool workflows"
  homepage "https://github.com/ozgurcd/legattus"
  version "0.1.3"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://api.github.com/repos/ozgurcd/legattus/releases/assets/560944017",
          headers: [
            "Accept: application/octet-stream",
            "Authorization: Bearer #{ENV.fetch("HOMEBREW_GITHUB_API_TOKEN", "")}",
            "X-GitHub-Api-Version: 2022-11-28",
          ]
      sha256 "f6c93e09527b0a45cecc942930b83d4d88611774edf19cbf6f7b94e84c2ea369"
    else
      url "https://api.github.com/repos/ozgurcd/legattus/releases/assets/560944018",
          headers: [
            "Accept: application/octet-stream",
            "Authorization: Bearer #{ENV.fetch("HOMEBREW_GITHUB_API_TOKEN", "")}",
            "X-GitHub-Api-Version: 2022-11-28",
          ]
      sha256 "88e1f693babcb8d967d646a3bb2220912aa2dbe7bfed8fce9f7bacd5ad5dc3c4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://api.github.com/repos/ozgurcd/legattus/releases/assets/560944012",
          headers: [
            "Accept: application/octet-stream",
            "Authorization: Bearer #{ENV.fetch("HOMEBREW_GITHUB_API_TOKEN", "")}",
            "X-GitHub-Api-Version: 2022-11-28",
          ]
      sha256 "02aefb3f4761b09043e89d6b2d54f6ac6aee58e9667d6be04a6d90861c683ecb"
    else
      url "https://api.github.com/repos/ozgurcd/legattus/releases/assets/560944015",
          headers: [
            "Accept: application/octet-stream",
            "Authorization: Bearer #{ENV.fetch("HOMEBREW_GITHUB_API_TOKEN", "")}",
            "X-GitHub-Api-Version: 2022-11-28",
          ]
      sha256 "1f2269621a7ca90e3ec2dfdbf2017191c5710e3b07fdf017c6db58d44f5432ed"
    end
  end

  def install
    bin.install "legattus"
  end

  test do
    version_document = shell_output("#{bin}/legattus version --json")
    assert_match '"version":"v0.1.3"', version_document
    assert_match '"version_agreement":"pass"', version_document

    capabilities = shell_output("#{bin}/legattus capabilities --json")
    assert_match "legattus.capabilities.v6", capabilities
    assert_match "legattus.executable-authority.v1", capabilities
    assert_match "legattus_completion_status", capabilities
    assert_match "legattus_findings", capabilities
    assert_match "legattus_workflow", capabilities
  end
end
