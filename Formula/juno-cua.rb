# typed: false
# frozen_string_literal: true

class JunoCua < Formula
  desc "Headless computer use agent — screenshot, click, type, scroll from the CLI"
  homepage "https://github.com/lacymorrow/juno"
  version "0.8.241"

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lacymorrow/juno/releases/download/cua-v0.8.241/juno-cua-darwin-arm64.tar.gz"
      sha256 "2efa9ae9c55894e117ce864098300014412b993ce5fc91695b7c1b0b33ad36cc"

      def install
        bin.install "juno-cua"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/lacymorrow/juno/releases/download/cua-v0.8.241/juno-cua-darwin-x64.tar.gz"
      sha256 "82d93bcb1849bf68b40d2cd27006e652c123c8fdcba32603dcbb1ba8bc163ee2"

      def install
        bin.install "juno-cua"
      end
    end
  end

  test do
    assert_match "Computer Use Agent", shell_output("#{bin}/juno-cua capabilities")
  end
end
