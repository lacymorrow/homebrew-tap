# typed: false
# frozen_string_literal: true

class JunoCua < Formula
  desc "Headless computer use agent — screenshot, click, type, scroll from the CLI"
  homepage "https://github.com/lacymorrow/juno"
  version "0.8.302"

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lacymorrow/juno/releases/download/cua-v0.8.302/juno-cua-darwin-arm64.tar.gz"
      sha256 "751f634d6596d87e81f8222372e2884e35bd8233c894236cbe989198ef34cedd"

      def install
        bin.install "juno-cua"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/lacymorrow/juno/releases/download/cua-v0.8.302/juno-cua-darwin-x64.tar.gz"
      sha256 "15fc118b5249989c431cb6813dc83626852c54cb3b2b21ab8c2f3e2ac76e4a35"

      def install
        bin.install "juno-cua"
      end
    end
  end

  test do
    assert_match "Computer Use Agent", shell_output("#{bin}/juno-cua capabilities")
  end
end
