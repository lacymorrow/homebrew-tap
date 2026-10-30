# typed: false
# frozen_string_literal: true

class JunoCua < Formula
  desc "Headless computer use agent — screenshot, click, type, scroll from the CLI"
  homepage "https://github.com/lacymorrow/juno"
  version "0.8.248"

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lacymorrow/juno/releases/download/cua-v0.8.248/juno-cua-darwin-arm64.tar.gz"
      sha256 "c636364f0c26811be9aec1478ab3092a185495b1b4ed2604996a5dd27fe893ec"

      def install
        bin.install "juno-cua"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/lacymorrow/juno/releases/download/cua-v0.8.248/juno-cua-darwin-x64.tar.gz"
      sha256 "e2f785e4bdc345ebd8daeb64f23c49b442c8011e5d85f94675d6796e6daedc2b"

      def install
        bin.install "juno-cua"
      end
    end
  end

  test do
    assert_match "Computer Use Agent", shell_output("#{bin}/juno-cua capabilities")
  end
end
