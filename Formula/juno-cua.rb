# typed: false
# frozen_string_literal: true

class JunoCua < Formula
  desc "Headless computer use agent — screenshot, click, type, scroll from the CLI"
  homepage "https://github.com/lacymorrow/juno"
  version "0.8.266"

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lacymorrow/juno/releases/download/cua-v0.8.266/juno-cua-darwin-arm64.tar.gz"
      sha256 "9a1b74bf04427cc5af87528e6defed9d45d4db2b7713c85dce7788ad23bbafb8"

      def install
        bin.install "juno-cua"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/lacymorrow/juno/releases/download/cua-v0.8.266/juno-cua-darwin-x64.tar.gz"
      sha256 "34db1e8ff09247217131ca6742052ce0f36d9838e5467b9482aad1773720f3f8"

      def install
        bin.install "juno-cua"
      end
    end
  end

  test do
    assert_match "Computer Use Agent", shell_output("#{bin}/juno-cua capabilities")
  end
end
