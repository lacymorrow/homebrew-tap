# typed: false
# frozen_string_literal: true

class JunoCua < Formula
  desc "Headless computer use agent — screenshot, click, type, scroll from the CLI"
  homepage "https://github.com/lacymorrow/juno"
  version "0.8.289"

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lacymorrow/juno/releases/download/cua-v0.8.289/juno-cua-darwin-arm64.tar.gz"
      sha256 "af214e981e3f1e86a18e666ca44e4cbc260930b37e8796bb936e428f6f241e40"

      def install
        bin.install "juno-cua"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/lacymorrow/juno/releases/download/cua-v0.8.289/juno-cua-darwin-x64.tar.gz"
      sha256 "864c05617e62618b3020c555b2691b6214cc5be300597ba7491a62898bdf034d"

      def install
        bin.install "juno-cua"
      end
    end
  end

  test do
    assert_match "Computer Use Agent", shell_output("#{bin}/juno-cua capabilities")
  end
end
