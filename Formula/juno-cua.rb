# typed: false
# frozen_string_literal: true

class JunoCua < Formula
  desc "Headless computer use agent — screenshot, click, type, scroll from the CLI"
  homepage "https://github.com/lacymorrow/juno"
  version "0.8.41"

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lacymorrow/juno/releases/download/cua-v0.8.41/juno-cua-darwin-arm64.tar.gz"
      sha256 "6ac285fd54f279685bdba862281bfbae88733539454a0321cb06e62d26a68b2a"

      def install
        bin.install "juno-cua"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/lacymorrow/juno/releases/download/cua-v0.8.41/juno-cua-darwin-x64.tar.gz"
      sha256 "a224f571b23d2d287efdc4521ea8ebac1848611ee6119b6d726d1dd7234b46d8"

      def install
        bin.install "juno-cua"
      end
    end
  end

  test do
    assert_match "Computer Use Agent", shell_output("#{bin}/juno-cua capabilities")
  end
end
