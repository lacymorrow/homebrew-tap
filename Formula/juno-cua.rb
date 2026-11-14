# typed: false
# frozen_string_literal: true

class JunoCua < Formula
  desc "Headless computer use agent — screenshot, click, type, scroll from the CLI"
  homepage "https://github.com/lacymorrow/juno"
  version "0.8.287"

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lacymorrow/juno/releases/download/cua-v0.8.287/juno-cua-darwin-arm64.tar.gz"
      sha256 "b3fb6082eb72e294f055c619131e1d458ed506e951890e691419ba7896d7d36d"

      def install
        bin.install "juno-cua"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/lacymorrow/juno/releases/download/cua-v0.8.287/juno-cua-darwin-x64.tar.gz"
      sha256 "46ae7e40d30833f2c7cf0ed4a1939a0d4890e41dc292d007b0cbe49ef29068a8"

      def install
        bin.install "juno-cua"
      end
    end
  end

  test do
    assert_match "Computer Use Agent", shell_output("#{bin}/juno-cua capabilities")
  end
end
