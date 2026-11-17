# typed: false
# frozen_string_literal: true

class JunoCua < Formula
  desc "Headless computer use agent — screenshot, click, type, scroll from the CLI"
  homepage "https://github.com/lacymorrow/juno"
  version "0.8.293"

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lacymorrow/juno/releases/download/cua-v0.8.293/juno-cua-darwin-arm64.tar.gz"
      sha256 "ebc5c6fc1a11e159c35759e72603ae383bd885fb082ac3ff0ae6767ab1c678bd"

      def install
        bin.install "juno-cua"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/lacymorrow/juno/releases/download/cua-v0.8.293/juno-cua-darwin-x64.tar.gz"
      sha256 "7bbf6ab22d4266f23c9fcbbabc099dff55e6d6878510a334cf6d650f54299bed"

      def install
        bin.install "juno-cua"
      end
    end
  end

  test do
    assert_match "Computer Use Agent", shell_output("#{bin}/juno-cua capabilities")
  end
end
