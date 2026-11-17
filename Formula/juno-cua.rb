# typed: false
# frozen_string_literal: true

class JunoCua < Formula
  desc "Headless computer use agent — screenshot, click, type, scroll from the CLI"
  homepage "https://github.com/lacymorrow/juno"
  version "0.8.292"

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lacymorrow/juno/releases/download/cua-v0.8.292/juno-cua-darwin-arm64.tar.gz"
      sha256 "a44717824798b7cf4d2b1237c2d87bde132c931bb3f83f939383c639f1d7ca93"

      def install
        bin.install "juno-cua"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/lacymorrow/juno/releases/download/cua-v0.8.292/juno-cua-darwin-x64.tar.gz"
      sha256 "744c32ef2c9fb1e0bd56e9b4d252e18796872f762686e0aed6e6edfc13263624"

      def install
        bin.install "juno-cua"
      end
    end
  end

  test do
    assert_match "Computer Use Agent", shell_output("#{bin}/juno-cua capabilities")
  end
end
