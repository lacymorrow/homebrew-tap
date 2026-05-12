# typed: false
# frozen_string_literal: true

class JunoCua < Formula
  desc "Headless computer use agent — screenshot, click, type, scroll from the CLI"
  homepage "https://github.com/lacymorrow/juno"
  version "0.5.3"

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lacymorrow/juno/releases/download/v0.5.3/juno-cua-darwin-arm64.tar.gz"
      sha256 "37eabc3dedacca3075856cb6fda41ffb1fe233d6ebb3d55f229ed43bb0abb335"

      def install
        bin.install "juno-cua"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/lacymorrow/juno/releases/download/v0.5.3/juno-cua-darwin-x64.tar.gz"
      sha256 "cadeb40114eb29bede8a1995b880055f940bc122f80de02bbe460bbbad2f257b"

      def install
        bin.install "juno-cua"
      end
    end
  end

  test do
    assert_match "Computer Use Agent", shell_output("#{bin}/juno-cua capabilities")
  end
end
