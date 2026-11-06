# typed: false
# frozen_string_literal: true

class JunoCua < Formula
  desc "Headless computer use agent — screenshot, click, type, scroll from the CLI"
  homepage "https://github.com/lacymorrow/juno"
  version "0.8.267"

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lacymorrow/juno/releases/download/cua-v0.8.267/juno-cua-darwin-arm64.tar.gz"
      sha256 "a2c2170e82261058931409add691733d13a2e8bbc928eab6398633f02b212a5f"

      def install
        bin.install "juno-cua"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/lacymorrow/juno/releases/download/cua-v0.8.267/juno-cua-darwin-x64.tar.gz"
      sha256 "41b985bf60f9566f0f2bfcfaeb3e93beea7e14da3533446f2f6fce77cef4ede4"

      def install
        bin.install "juno-cua"
      end
    end
  end

  test do
    assert_match "Computer Use Agent", shell_output("#{bin}/juno-cua capabilities")
  end
end
