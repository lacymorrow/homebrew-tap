# typed: false
# frozen_string_literal: true

class JunoCua < Formula
  desc "Headless computer use agent — screenshot, click, type, scroll from the CLI"
  homepage "https://github.com/lacymorrow/juno"
  version "0.8.264"

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lacymorrow/juno/releases/download/cua-v0.8.264/juno-cua-darwin-arm64.tar.gz"
      sha256 "16c5c235b1df8dc35b140143c2e33346d5cd4ac4a18432f4e78d0de39abada3d"

      def install
        bin.install "juno-cua"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/lacymorrow/juno/releases/download/cua-v0.8.264/juno-cua-darwin-x64.tar.gz"
      sha256 "a865c70e7fee17433a0c8bc4262272c8f6c73d001b0b1f6e8dd8af681df815f4"

      def install
        bin.install "juno-cua"
      end
    end
  end

  test do
    assert_match "Computer Use Agent", shell_output("#{bin}/juno-cua capabilities")
  end
end
