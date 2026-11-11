# typed: false
# frozen_string_literal: true

class JunoCua < Formula
  desc "Headless computer use agent — screenshot, click, type, scroll from the CLI"
  homepage "https://github.com/lacymorrow/juno"
  version "0.8.279"

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lacymorrow/juno/releases/download/cua-v0.8.279/juno-cua-darwin-arm64.tar.gz"
      sha256 "763708f231ecda429bf68486b95575c0d2c328e14a160b9bfabd172dbcbedb11"

      def install
        bin.install "juno-cua"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/lacymorrow/juno/releases/download/cua-v0.8.279/juno-cua-darwin-x64.tar.gz"
      sha256 "16e2cce389e139f283c988bb34d5ad86ef3592001a501895895c3c79085af589"

      def install
        bin.install "juno-cua"
      end
    end
  end

  test do
    assert_match "Computer Use Agent", shell_output("#{bin}/juno-cua capabilities")
  end
end
