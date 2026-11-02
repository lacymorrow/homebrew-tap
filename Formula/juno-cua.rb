# typed: false
# frozen_string_literal: true

class JunoCua < Formula
  desc "Headless computer use agent — screenshot, click, type, scroll from the CLI"
  homepage "https://github.com/lacymorrow/juno"
  version "0.8.255"

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lacymorrow/juno/releases/download/cua-v0.8.255/juno-cua-darwin-arm64.tar.gz"
      sha256 "c9c90f2c0609a6385607cfcd7cda4c52385298f1a3c5b9ad6f3dde2ae5478bcd"

      def install
        bin.install "juno-cua"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/lacymorrow/juno/releases/download/cua-v0.8.255/juno-cua-darwin-x64.tar.gz"
      sha256 "8c57bfb26bfbed24e7d8677f235050a32d01f8b7f7f61f0852757bed2eadd8c8"

      def install
        bin.install "juno-cua"
      end
    end
  end

  test do
    assert_match "Computer Use Agent", shell_output("#{bin}/juno-cua capabilities")
  end
end
