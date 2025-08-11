class Lash < Formula
  desc "Terminal-based AI assistant for developers"
  homepage "https://github.com/lacymorrow/lash"
  url "https://github.com/lacymorrow/lash/archive/refs/tags/v0.4.2.tar.gz"
  sha256 "4951eedfc0f56d6068d8abaeab16d9be43d92eceaa05448700a29479fecdf4ca"
  license "MIT"
  head "https://github.com/lacymorrow/lash.git", branch: "main"

  depends_on "go" => :build

  def install
    ldflags = "-s -w -X github.com/lacymorrow/lash/internal/version.Version=v#{version}"
    system "go", "build", "-trimpath", "-ldflags=#{ldflags}", "-o", bin/"lash", "."

    (buildpath/"lash.bash").write Utils.safe_popen_read(bin/"lash", "completion", "bash")
    (buildpath/"_lash").write Utils.safe_popen_read(bin/"lash", "completion", "zsh")
    (buildpath/"lash.fish").write Utils.safe_popen_read(bin/"lash", "completion", "fish")
    bash_completion.install buildpath/"lash.bash" => "lash"
    zsh_completion.install buildpath/"_lash"
    fish_completion.install buildpath/"lash.fish"

    (buildpath/"lash.1").write Utils.safe_popen_read(bin/"lash", "man")
    system "gzip", buildpath/"lash.1"
    man1.install buildpath/"lash.1.gz"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/lash --version")
  end
end