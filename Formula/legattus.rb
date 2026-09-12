class Legattus < Formula
  desc "Deterministic orchestration for coding-agent tool workflows"
  homepage "https://github.com/ozgurcd/legattus"
  version "0.1.2"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://api.github.com/repos/ozgurcd/legattus/releases/assets/560095435",
          headers: [
            "Accept: application/octet-stream",
            "Authorization: Bearer #{ENV.fetch("HOMEBREW_GITHUB_API_TOKEN", "")}",
            "X-GitHub-Api-Version: 2022-11-28",
          ]
      sha256 "3533cf814405629d9b50f902bc0cd89274662900d0f0929e603867b4bd22f859"
    else
      url "https://api.github.com/repos/ozgurcd/legattus/releases/assets/560095431",
          headers: [
            "Accept: application/octet-stream",
            "Authorization: Bearer #{ENV.fetch("HOMEBREW_GITHUB_API_TOKEN", "")}",
            "X-GitHub-Api-Version: 2022-11-28",
          ]
      sha256 "5c4a3cbee7bac84637a2ae82fdb851053d66f9894bad891603d125dd48bb7709"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://api.github.com/repos/ozgurcd/legattus/releases/assets/560095429",
          headers: [
            "Accept: application/octet-stream",
            "Authorization: Bearer #{ENV.fetch("HOMEBREW_GITHUB_API_TOKEN", "")}",
            "X-GitHub-Api-Version: 2022-11-28",
          ]
      sha256 "495bf1129b846d4ad84e5448b9b06861417126cceaf25ed20478ed03245fc353"
    else
      url "https://api.github.com/repos/ozgurcd/legattus/releases/assets/560095433",
          headers: [
            "Accept: application/octet-stream",
            "Authorization: Bearer #{ENV.fetch("HOMEBREW_GITHUB_API_TOKEN", "")}",
            "X-GitHub-Api-Version: 2022-11-28",
          ]
      sha256 "87bbd7e6efc70045858f70ec8fd385b13d5dbf01ed72053e13737693c884e85a"
    end
  end

  def install
    bin.install "legattus"
  end

  test do
    version_document = shell_output("#{bin}/legattus version --json")
    assert_match '"version":"v0.1.2"', version_document
    assert_match '"version_agreement":"pass"', version_document

    capabilities = shell_output("#{bin}/legattus capabilities --json")
    assert_match "legattus.capabilities.v5", capabilities
    assert_match "legattus_completion_status", capabilities
    assert_match "legattus_findings", capabilities
    assert_match "legattus_workflow", capabilities
  end
end
