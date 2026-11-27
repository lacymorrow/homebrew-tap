# typed: false
# frozen_string_literal: true

class JunoCua < Formula
  desc "Headless computer use agent — screenshot, click, type, scroll from the CLI"
  homepage "https://github.com/lacymorrow/juno"
  version "0.8.306"

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lacymorrow/juno/releases/download/cua-v0.8.306/juno-cua-darwin-arm64.tar.gz"
      sha256 "a3f0b6da1cca8e0850e139e76feb98e2f02a10844871fbcaab7f834dc3bcd85b"

      def install
        bin.install "juno-cua"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/lacymorrow/juno/releases/download/cua-v0.8.306/juno-cua-darwin-x64.tar.gz"
      sha256 "8577672c3dbd0ea12971511c8f854032b07537253efc1017892ddfb4b3382ad5"

      def install
        bin.install "juno-cua"
      end
    end
  end

  test do
    assert_match "Computer Use Agent", shell_output("#{bin}/juno-cua capabilities")
  end
end
