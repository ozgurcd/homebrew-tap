class Legattus < Formula
  desc "Deterministic orchestration for coding-agent tool workflows"
  homepage "https://github.com/ozgurcd/legattus"
  version "0.1.7"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://api.github.com/repos/ozgurcd/legattus/releases/assets/569667583",
          headers: [
            "Accept: application/octet-stream",
            "Authorization: Bearer #{ENV.fetch("HOMEBREW_GITHUB_API_TOKEN", "")}",
            "X-GitHub-Api-Version: 2022-11-28",
          ]
      sha256 "939ab12907fec1c1bfec2164083727177e965bdeed2ac3345c317fd54a5f9564"
    else
      url "https://api.github.com/repos/ozgurcd/legattus/releases/assets/569667584",
          headers: [
            "Accept: application/octet-stream",
            "Authorization: Bearer #{ENV.fetch("HOMEBREW_GITHUB_API_TOKEN", "")}",
            "X-GitHub-Api-Version: 2022-11-28",
          ]
      sha256 "8b6ea8a59094423692ef8c2d981e904de59a5f4afbd2372321cfc83c519892e5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://api.github.com/repos/ozgurcd/legattus/releases/assets/569667586",
          headers: [
            "Accept: application/octet-stream",
            "Authorization: Bearer #{ENV.fetch("HOMEBREW_GITHUB_API_TOKEN", "")}",
            "X-GitHub-Api-Version: 2022-11-28",
          ]
      sha256 "7645a14a2b7a89a0b507b270899196eab8c061ceade0741fda18929221bfba0e"
    else
      url "https://api.github.com/repos/ozgurcd/legattus/releases/assets/569667585",
          headers: [
            "Accept: application/octet-stream",
            "Authorization: Bearer #{ENV.fetch("HOMEBREW_GITHUB_API_TOKEN", "")}",
            "X-GitHub-Api-Version: 2022-11-28",
          ]
      sha256 "740f4632a2fb450197d16c7824775068d9911c6096f429730b3132e1b311cea6"
    end
  end

  def install
    bin.install "legattus"
  end

  test do
    version_document = shell_output("#{bin}/legattus version --json")
    assert_match '"version":"v0.1.7"', version_document
    assert_match '"version_agreement":"pass"', version_document

    capabilities = shell_output("#{bin}/legattus capabilities --json")
    assert_match "legattus.capabilities.v7", capabilities
    assert_match "legattus.executable-authority.v1", capabilities
    assert_match "legattus_completion_status", capabilities
    assert_match "legattus_findings", capabilities
    assert_match "legattus_workflow", capabilities
  end
end
