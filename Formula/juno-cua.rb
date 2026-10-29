# typed: false
# frozen_string_literal: true

class JunoCua < Formula
  desc "Headless computer use agent — screenshot, click, type, scroll from the CLI"
  homepage "https://github.com/lacymorrow/juno"
  version "0.8.244"

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lacymorrow/juno/releases/download/cua-v0.8.244/juno-cua-darwin-arm64.tar.gz"
      sha256 "19748ba6b347e5683f1830deee31978865599ea6b6c8cbd9a3dc390c20257ede"

      def install
        bin.install "juno-cua"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/lacymorrow/juno/releases/download/cua-v0.8.244/juno-cua-darwin-x64.tar.gz"
      sha256 "0e540a97c2015a88c053ec7a28cb8c974257ac17c00c3860ebfde1d7bfa6c00c"

      def install
        bin.install "juno-cua"
      end
    end
  end

  test do
    assert_match "Computer Use Agent", shell_output("#{bin}/juno-cua capabilities")
  end
end
