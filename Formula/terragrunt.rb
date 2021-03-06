class Terragrunt < Formula
  desc "Thin wrapper for Terraform e.g. for locking state"
  homepage "https://terragrunt.gruntwork.io/"
  url "https://github.com/gruntwork-io/terragrunt/archive/v0.29.6.tar.gz"
  sha256 "72c7b3ccfcd111f77abe22f1806a4f9939733dad8ec46dd067d7e45dd0d4876a"
  license "MIT"

  bottle do
    sha256 cellar: :any_skip_relocation, arm64_big_sur: "83ef342c9237d2b5145ef0b3e8af2198915111ed2cf654e354992c701bca5bb4"
    sha256 cellar: :any_skip_relocation, big_sur:       "8b65428f5783e68970cc3c370ef1f44ce678ebc79884097e82fdd482129d1c33"
    sha256 cellar: :any_skip_relocation, catalina:      "69def323ef9bf7a0dbdc4eafe4c00617b7dac23b30e77ceb2fea7eeb3fb31eb7"
    sha256 cellar: :any_skip_relocation, mojave:        "dd51da086fa2a5172cacff9e84827c1fafcefcc8589f8a7522ccbc7c9d260fa0"
  end

  depends_on "go" => :build
  depends_on "terraform"

  def install
    system "go", "build", "-ldflags", "-s -w -X main.VERSION=v#{version}", *std_go_args
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/terragrunt --version")
  end
end
