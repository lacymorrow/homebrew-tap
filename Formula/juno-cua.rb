# typed: false
# frozen_string_literal: true

class JunoCua < Formula
  desc "Headless computer use agent — screenshot, click, type, scroll from the CLI"
  homepage "https://github.com/lacymorrow/juno"
  version "0.8.249"

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lacymorrow/juno/releases/download/cua-v0.8.249/juno-cua-darwin-arm64.tar.gz"
      sha256 "97198d606f00dd329dd6e4ad5b00530298786df1e58c2caeacb922c1310f9bf9"

      def install
        bin.install "juno-cua"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/lacymorrow/juno/releases/download/cua-v0.8.249/juno-cua-darwin-x64.tar.gz"
      sha256 "489af4a4f3606d1c90d1efc52837460843dceb73f71555dc728a68a708c0f4cb"

      def install
        bin.install "juno-cua"
      end
    end
  end

  test do
    assert_match "Computer Use Agent", shell_output("#{bin}/juno-cua capabilities")
  end
end
