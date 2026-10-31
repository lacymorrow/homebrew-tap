# typed: false
# frozen_string_literal: true

class JunoCua < Formula
  desc "Headless computer use agent — screenshot, click, type, scroll from the CLI"
  homepage "https://github.com/lacymorrow/juno"
  version "0.8.253"

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lacymorrow/juno/releases/download/cua-v0.8.253/juno-cua-darwin-arm64.tar.gz"
      sha256 "2a8c7bd31fc0842663ec426baf2c5e0386e1a0784c58c5f90fd1ace5c0a08bf4"

      def install
        bin.install "juno-cua"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/lacymorrow/juno/releases/download/cua-v0.8.253/juno-cua-darwin-x64.tar.gz"
      sha256 "19289ca74518105b5293b2296d0b9142adf0ba90e35517bdf6607f57ecda3184"

      def install
        bin.install "juno-cua"
      end
    end
  end

  test do
    assert_match "Computer Use Agent", shell_output("#{bin}/juno-cua capabilities")
  end
end
