# typed: false
# frozen_string_literal: true

class JunoCua < Formula
  desc "Headless computer use agent — screenshot, click, type, scroll from the CLI"
  homepage "https://github.com/lacymorrow/juno"
  version "0.8.276"

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lacymorrow/juno/releases/download/cua-v0.8.276/juno-cua-darwin-arm64.tar.gz"
      sha256 "fa4249b2bbb609883ca2250880825cf6eebab4d5975c55b2c0187117906862d3"

      def install
        bin.install "juno-cua"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/lacymorrow/juno/releases/download/cua-v0.8.276/juno-cua-darwin-x64.tar.gz"
      sha256 "04ff4a6534c9ca039f9c6c8deb7d8a4827ad8201149459788f9c6c5473a5325c"

      def install
        bin.install "juno-cua"
      end
    end
  end

  test do
    assert_match "Computer Use Agent", shell_output("#{bin}/juno-cua capabilities")
  end
end
