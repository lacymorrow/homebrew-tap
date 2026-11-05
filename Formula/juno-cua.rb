# typed: false
# frozen_string_literal: true

class JunoCua < Formula
  desc "Headless computer use agent — screenshot, click, type, scroll from the CLI"
  homepage "https://github.com/lacymorrow/juno"
  version "0.8.262"

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lacymorrow/juno/releases/download/cua-v0.8.262/juno-cua-darwin-arm64.tar.gz"
      sha256 "fb6ef79bee7bfc265e0fdf36cf1a32e40016f0a0e907f27422e4afe926ab25ea"

      def install
        bin.install "juno-cua"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/lacymorrow/juno/releases/download/cua-v0.8.262/juno-cua-darwin-x64.tar.gz"
      sha256 "0674bcf58de2b66f250e2ebe089a4d8c7c9e887ff411462a8f4df20477f54572"

      def install
        bin.install "juno-cua"
      end
    end
  end

  test do
    assert_match "Computer Use Agent", shell_output("#{bin}/juno-cua capabilities")
  end
end
