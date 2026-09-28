# typed: false
# frozen_string_literal: true

class JunoCua < Formula
  desc "Headless computer use agent — screenshot, click, type, scroll from the CLI"
  homepage "https://github.com/lacymorrow/juno"
  version "0.8.2"

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lacymorrow/juno/releases/download/cua-v0.8.2/juno-cua-darwin-arm64.tar.gz"
      sha256 "b02681e4ae230e4dbad8a659221be67f21bc6b1be7cf2fe13df262c9494c0f60"

      def install
        bin.install "juno-cua"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/lacymorrow/juno/releases/download/cua-v0.8.2/juno-cua-darwin-x64.tar.gz"
      sha256 "7c448e4593f45832fc1c474f4b40fc0c5c46a651141ecbd8241abe2c6c5d89f2"

      def install
        bin.install "juno-cua"
      end
    end
  end

  test do
    assert_match "Computer Use Agent", shell_output("#{bin}/juno-cua capabilities")
  end
end
