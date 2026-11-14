# typed: false
# frozen_string_literal: true

class JunoCua < Formula
  desc "Headless computer use agent — screenshot, click, type, scroll from the CLI"
  homepage "https://github.com/lacymorrow/juno"
  version "0.8.288"

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lacymorrow/juno/releases/download/cua-v0.8.288/juno-cua-darwin-arm64.tar.gz"
      sha256 "36d427baf149c9ebaeb65b632c46e00e0ecdc669cffcfc95a9f9743799fc1634"

      def install
        bin.install "juno-cua"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/lacymorrow/juno/releases/download/cua-v0.8.288/juno-cua-darwin-x64.tar.gz"
      sha256 "b79490b6550db1029b4656c0a91d8d7cba97fa7d57e9073c655bf1caca0c58dd"

      def install
        bin.install "juno-cua"
      end
    end
  end

  test do
    assert_match "Computer Use Agent", shell_output("#{bin}/juno-cua capabilities")
  end
end
