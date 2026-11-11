# typed: false
# frozen_string_literal: true

class JunoCua < Formula
  desc "Headless computer use agent — screenshot, click, type, scroll from the CLI"
  homepage "https://github.com/lacymorrow/juno"
  version "0.8.275"

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lacymorrow/juno/releases/download/cua-v0.8.275/juno-cua-darwin-arm64.tar.gz"
      sha256 "15d1bd82a9cf622d95d62820b047ab5c045f21989f0ad171e1434a0238ea2aed"

      def install
        bin.install "juno-cua"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/lacymorrow/juno/releases/download/cua-v0.8.275/juno-cua-darwin-x64.tar.gz"
      sha256 "b2f156b269f9b382645af7d8ffa3f51ca9c7c01861294f68038820cc07a74d84"

      def install
        bin.install "juno-cua"
      end
    end
  end

  test do
    assert_match "Computer Use Agent", shell_output("#{bin}/juno-cua capabilities")
  end
end
