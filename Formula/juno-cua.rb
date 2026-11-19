# typed: false
# frozen_string_literal: true

class JunoCua < Formula
  desc "Headless computer use agent — screenshot, click, type, scroll from the CLI"
  homepage "https://github.com/lacymorrow/juno"
  version "0.8.298"

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lacymorrow/juno/releases/download/cua-v0.8.298/juno-cua-darwin-arm64.tar.gz"
      sha256 "eb2f83982146f97be1c6ec95598356fd7bd5828c957e7a0bb6fe7f5e5ee8018c"

      def install
        bin.install "juno-cua"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/lacymorrow/juno/releases/download/cua-v0.8.298/juno-cua-darwin-x64.tar.gz"
      sha256 "41673730d548c669d8b4ceb377d5c629dd34e9fca62cb58e7f5e6dbf2a5dd72f"

      def install
        bin.install "juno-cua"
      end
    end
  end

  test do
    assert_match "Computer Use Agent", shell_output("#{bin}/juno-cua capabilities")
  end
end
