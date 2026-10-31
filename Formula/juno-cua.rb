# typed: false
# frozen_string_literal: true

class JunoCua < Formula
  desc "Headless computer use agent — screenshot, click, type, scroll from the CLI"
  homepage "https://github.com/lacymorrow/juno"
  version "0.8.254"

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lacymorrow/juno/releases/download/cua-v0.8.254/juno-cua-darwin-arm64.tar.gz"
      sha256 "6f9e2820afec044b04836f60fa83bc3183becc473a19e2e6977899073da2ae7c"

      def install
        bin.install "juno-cua"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/lacymorrow/juno/releases/download/cua-v0.8.254/juno-cua-darwin-x64.tar.gz"
      sha256 "3d6616bcdeb3a38550e5e03abf2ca537eedd3ddf5caa59dc7842278a8ca831be"

      def install
        bin.install "juno-cua"
      end
    end
  end

  test do
    assert_match "Computer Use Agent", shell_output("#{bin}/juno-cua capabilities")
  end
end
