# typed: false
# frozen_string_literal: true

class JunoCua < Formula
  desc "Headless computer use agent — screenshot, click, type, scroll from the CLI"
  homepage "https://github.com/lacymorrow/juno"
  version "0.8.243"

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lacymorrow/juno/releases/download/cua-v0.8.243/juno-cua-darwin-arm64.tar.gz"
      sha256 "84c9acd7e0da8376394d16954ce0c8251364deb4ab74c3f77b8d16c25104198b"

      def install
        bin.install "juno-cua"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/lacymorrow/juno/releases/download/cua-v0.8.243/juno-cua-darwin-x64.tar.gz"
      sha256 "5fddfc4150c562026c615de181e8aedb4b3905f8032ac41a96e6ffa96eb59246"

      def install
        bin.install "juno-cua"
      end
    end
  end

  test do
    assert_match "Computer Use Agent", shell_output("#{bin}/juno-cua capabilities")
  end
end
