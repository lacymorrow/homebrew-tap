# typed: false
# frozen_string_literal: true

class JunoCua < Formula
  desc "Headless computer use agent — screenshot, click, type, scroll from the CLI"
  homepage "https://github.com/lacymorrow/juno"
  version "0.8.257"

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lacymorrow/juno/releases/download/cua-v0.8.257/juno-cua-darwin-arm64.tar.gz"
      sha256 "85c2029cec159e3df8d882c4b2af0e9812911585a8808d038f2af709f0b5eb06"

      def install
        bin.install "juno-cua"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/lacymorrow/juno/releases/download/cua-v0.8.257/juno-cua-darwin-x64.tar.gz"
      sha256 "71e4f9018685dc2941a5f470f54275a22bdf3cfb79f09c38756cc38888cdb9ac"

      def install
        bin.install "juno-cua"
      end
    end
  end

  test do
    assert_match "Computer Use Agent", shell_output("#{bin}/juno-cua capabilities")
  end
end
