# typed: false
# frozen_string_literal: true

class JunoCua < Formula
  desc "Headless computer use agent — screenshot, click, type, scroll from the CLI"
  homepage "https://github.com/lacymorrow/juno"
  version "0.8.273"

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lacymorrow/juno/releases/download/cua-v0.8.273/juno-cua-darwin-arm64.tar.gz"
      sha256 "80224c13e1c00831fc0894adc137afc2c1ca1541c996edbb0dab372482cc82cf"

      def install
        bin.install "juno-cua"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/lacymorrow/juno/releases/download/cua-v0.8.273/juno-cua-darwin-x64.tar.gz"
      sha256 "9073d7244ab9883b0806bfb05eeff1e76b49c7ede9b4d6d1d6602d4175bee3f7"

      def install
        bin.install "juno-cua"
      end
    end
  end

  test do
    assert_match "Computer Use Agent", shell_output("#{bin}/juno-cua capabilities")
  end
end
