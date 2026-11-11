# typed: false
# frozen_string_literal: true

class JunoCua < Formula
  desc "Headless computer use agent — screenshot, click, type, scroll from the CLI"
  homepage "https://github.com/lacymorrow/juno"
  version "0.8.274"

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lacymorrow/juno/releases/download/cua-v0.8.274/juno-cua-darwin-arm64.tar.gz"
      sha256 "70a01fe3b2e445c5a4d5271c46668cee0e2d7834eb7e1b8adef0a03684e50f39"

      def install
        bin.install "juno-cua"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/lacymorrow/juno/releases/download/cua-v0.8.274/juno-cua-darwin-x64.tar.gz"
      sha256 "b8145006246d87a5e825b7601608cb9a05a1c84df6d6009d52b15a9649a7d723"

      def install
        bin.install "juno-cua"
      end
    end
  end

  test do
    assert_match "Computer Use Agent", shell_output("#{bin}/juno-cua capabilities")
  end
end
