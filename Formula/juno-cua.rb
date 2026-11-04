# typed: false
# frozen_string_literal: true

class JunoCua < Formula
  desc "Headless computer use agent — screenshot, click, type, scroll from the CLI"
  homepage "https://github.com/lacymorrow/juno"
  version "0.8.258"

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lacymorrow/juno/releases/download/cua-v0.8.258/juno-cua-darwin-arm64.tar.gz"
      sha256 "6ddeee1f03bcee5574c77f96173704c579cd88340b5050090ec137a795175cf1"

      def install
        bin.install "juno-cua"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/lacymorrow/juno/releases/download/cua-v0.8.258/juno-cua-darwin-x64.tar.gz"
      sha256 "5713d068a39d8d795b07b5218768ec691d3877fd79430a6b7a5aabc0000aefc4"

      def install
        bin.install "juno-cua"
      end
    end
  end

  test do
    assert_match "Computer Use Agent", shell_output("#{bin}/juno-cua capabilities")
  end
end
