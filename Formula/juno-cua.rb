# typed: false
# frozen_string_literal: true

class JunoCua < Formula
  desc "Headless computer use agent — screenshot, click, type, scroll from the CLI"
  homepage "https://github.com/lacymorrow/juno"
  version "0.8.300"

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lacymorrow/juno/releases/download/cua-v0.8.300/juno-cua-darwin-arm64.tar.gz"
      sha256 "afe08c5fb4da43486d660afa37025066be805757e3b84cc878042f6681dc6d50"

      def install
        bin.install "juno-cua"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/lacymorrow/juno/releases/download/cua-v0.8.300/juno-cua-darwin-x64.tar.gz"
      sha256 "ce63d48ac63f74b9a1273d7a459d1fb0d38c9c506b5490fb7bedc8aea692443a"

      def install
        bin.install "juno-cua"
      end
    end
  end

  test do
    assert_match "Computer Use Agent", shell_output("#{bin}/juno-cua capabilities")
  end
end
