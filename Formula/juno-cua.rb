# typed: false
# frozen_string_literal: true

class JunoCua < Formula
  desc "Headless computer use agent — screenshot, click, type, scroll from the CLI"
  homepage "https://github.com/lacymorrow/juno"
  version "0.8.304"

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lacymorrow/juno/releases/download/cua-v0.8.304/juno-cua-darwin-arm64.tar.gz"
      sha256 "c3b0b922458432eb91e53b17fad27c7c9c6709c1d2ebc8fa9791152dc2bc5687"

      def install
        bin.install "juno-cua"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/lacymorrow/juno/releases/download/cua-v0.8.304/juno-cua-darwin-x64.tar.gz"
      sha256 "9aab3f6cfde76cc3a04de1abfbb0ebd3bdc75dd0ea0e76924cc51f4d7bde76bb"

      def install
        bin.install "juno-cua"
      end
    end
  end

  test do
    assert_match "Computer Use Agent", shell_output("#{bin}/juno-cua capabilities")
  end
end
