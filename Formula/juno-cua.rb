# typed: false
# frozen_string_literal: true

class JunoCua < Formula
  desc "Headless computer use agent — screenshot, click, type, scroll from the CLI"
  homepage "https://github.com/lacymorrow/juno"
  version "0.8.285"

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lacymorrow/juno/releases/download/cua-v0.8.285/juno-cua-darwin-arm64.tar.gz"
      sha256 "9c8c7167bea02e702cf9c38710d352bd89d76e7263aac4d90a1d93785bc21024"

      def install
        bin.install "juno-cua"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/lacymorrow/juno/releases/download/cua-v0.8.285/juno-cua-darwin-x64.tar.gz"
      sha256 "29b67940c2fd11f69abebd51e6ea6bba0e1ec1bd392c83cbabf9687b53139ecc"

      def install
        bin.install "juno-cua"
      end
    end
  end

  test do
    assert_match "Computer Use Agent", shell_output("#{bin}/juno-cua capabilities")
  end
end
