# typed: false
# frozen_string_literal: true

class JunoCua < Formula
  desc "Headless computer use agent — screenshot, click, type, scroll from the CLI"
  homepage "https://github.com/lacymorrow/juno"
  version "0.8.242"

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lacymorrow/juno/releases/download/cua-v0.8.242/juno-cua-darwin-arm64.tar.gz"
      sha256 "b8aef25fbcc8608ed5c5c6293933747401bc2a3925a9b97bff5e10071ff60dfa"

      def install
        bin.install "juno-cua"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/lacymorrow/juno/releases/download/cua-v0.8.242/juno-cua-darwin-x64.tar.gz"
      sha256 "dd8e3e5ca7a238785e0ae97607a55cc807e194c9121d4a165c604366c968edeb"

      def install
        bin.install "juno-cua"
      end
    end
  end

  test do
    assert_match "Computer Use Agent", shell_output("#{bin}/juno-cua capabilities")
  end
end
