# typed: false
# frozen_string_literal: true

class JunoCua < Formula
  desc "Headless computer use agent — screenshot, click, type, scroll from the CLI"
  homepage "https://github.com/lacymorrow/juno"
  version "0.8.240"

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lacymorrow/juno/releases/download/cua-v0.8.240/juno-cua-darwin-arm64.tar.gz"
      sha256 "d647e5a012563ba247c0ffedae835dd9000333fe4fc72237c1ade31cf421cf8f"

      def install
        bin.install "juno-cua"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/lacymorrow/juno/releases/download/cua-v0.8.240/juno-cua-darwin-x64.tar.gz"
      sha256 "f669b652ffebec98816df2420a677e1d64f73faf3c0cb021be57296be869a728"

      def install
        bin.install "juno-cua"
      end
    end
  end

  test do
    assert_match "Computer Use Agent", shell_output("#{bin}/juno-cua capabilities")
  end
end
