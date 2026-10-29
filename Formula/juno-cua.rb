# typed: false
# frozen_string_literal: true

class JunoCua < Formula
  desc "Headless computer use agent — screenshot, click, type, scroll from the CLI"
  homepage "https://github.com/lacymorrow/juno"
  version "0.8.246"

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lacymorrow/juno/releases/download/cua-v0.8.246/juno-cua-darwin-arm64.tar.gz"
      sha256 "33030ff98c6b59d554ce6744d42651a18095823ad63200785407999a0c3228ef"

      def install
        bin.install "juno-cua"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/lacymorrow/juno/releases/download/cua-v0.8.246/juno-cua-darwin-x64.tar.gz"
      sha256 "546836de5156e6a3ac08799279d978e5123f6974e747c991eebe792dd658c6cd"

      def install
        bin.install "juno-cua"
      end
    end
  end

  test do
    assert_match "Computer Use Agent", shell_output("#{bin}/juno-cua capabilities")
  end
end
