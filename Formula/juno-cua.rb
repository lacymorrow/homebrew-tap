# typed: false
# frozen_string_literal: true

class JunoCua < Formula
  desc "Headless computer use agent — screenshot, click, type, scroll from the CLI"
  homepage "https://github.com/lacymorrow/juno"
  version "0.8.269"

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lacymorrow/juno/releases/download/cua-v0.8.269/juno-cua-darwin-arm64.tar.gz"
      sha256 "ab658fba03a6c280f56f5bf7f547f970b8107952e9a362a0196b074f6c18d6af"

      def install
        bin.install "juno-cua"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/lacymorrow/juno/releases/download/cua-v0.8.269/juno-cua-darwin-x64.tar.gz"
      sha256 "77620ebd5fb9fd5c22101a6118b8762dfb41b1d5c66da438150a3d737ded0eba"

      def install
        bin.install "juno-cua"
      end
    end
  end

  test do
    assert_match "Computer Use Agent", shell_output("#{bin}/juno-cua capabilities")
  end
end
