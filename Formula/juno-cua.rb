# typed: false
# frozen_string_literal: true

class JunoCua < Formula
  desc "Headless computer use agent — screenshot, click, type, scroll from the CLI"
  homepage "https://github.com/lacymorrow/juno"
  version "0.8.290"

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lacymorrow/juno/releases/download/cua-v0.8.290/juno-cua-darwin-arm64.tar.gz"
      sha256 "d0231bcceaa6044702fbc59d0380b74520b5f09b021fe18be8fa975db073b780"

      def install
        bin.install "juno-cua"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/lacymorrow/juno/releases/download/cua-v0.8.290/juno-cua-darwin-x64.tar.gz"
      sha256 "28a80e4008bbe8f344d2f659c990b318119a63e95508116940743865e78e93f6"

      def install
        bin.install "juno-cua"
      end
    end
  end

  test do
    assert_match "Computer Use Agent", shell_output("#{bin}/juno-cua capabilities")
  end
end
