# typed: false
# frozen_string_literal: true

class JunoCua < Formula
  desc "Headless computer use agent — screenshot, click, type, scroll from the CLI"
  homepage "https://github.com/lacymorrow/juno"
  version "0.8.286"

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lacymorrow/juno/releases/download/cua-v0.8.286/juno-cua-darwin-arm64.tar.gz"
      sha256 "fcb40dcca092c8e4249ca71bdf6a91b80b37d9f2f2a73218c47690fffe771f36"

      def install
        bin.install "juno-cua"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/lacymorrow/juno/releases/download/cua-v0.8.286/juno-cua-darwin-x64.tar.gz"
      sha256 "e6d03cc70c4135ead99f63f82ded7d604c963993907f4a515c00b80e0b04843f"

      def install
        bin.install "juno-cua"
      end
    end
  end

  test do
    assert_match "Computer Use Agent", shell_output("#{bin}/juno-cua capabilities")
  end
end
