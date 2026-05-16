# typed: false
# frozen_string_literal: true

class JunoCua < Formula
  desc "Headless computer use agent — screenshot, click, type, scroll from the CLI"
  homepage "https://github.com/lacymorrow/juno"
  version "0.6.0"

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lacymorrow/juno/releases/download/v0.6.0/juno-cua-darwin-arm64.tar.gz"
      sha256 "ee339f6e23acb2a41447d0f640ca83c0b094543c0a2bd0be6b01ec6f6eda2901"

      def install
        bin.install "juno-cua"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/lacymorrow/juno/releases/download/v0.6.0/juno-cua-darwin-x64.tar.gz"
      sha256 "5c46aab72f9f4b05ac2f29db503bd5b45221dbea9737322d7de49384f8dd4987"

      def install
        bin.install "juno-cua"
      end
    end
  end

  test do
    assert_match "Computer Use Agent", shell_output("#{bin}/juno-cua capabilities")
  end
end
