# typed: false
# frozen_string_literal: true

class JunoCua < Formula
  desc "Headless computer use agent — screenshot, click, type, scroll from the CLI"
  homepage "https://github.com/lacymorrow/juno"
  version "0.8.295"

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lacymorrow/juno/releases/download/cua-v0.8.295/juno-cua-darwin-arm64.tar.gz"
      sha256 "fdf10be40d993bc86515c49084a6a7941efc43ee94cc119dd318f65bc04f8074"

      def install
        bin.install "juno-cua"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/lacymorrow/juno/releases/download/cua-v0.8.295/juno-cua-darwin-x64.tar.gz"
      sha256 "dfa9c8580654066c8ef5654fe8d1f4e960a76d09e1265a00ce4e5eeb07feb278"

      def install
        bin.install "juno-cua"
      end
    end
  end

  test do
    assert_match "Computer Use Agent", shell_output("#{bin}/juno-cua capabilities")
  end
end
