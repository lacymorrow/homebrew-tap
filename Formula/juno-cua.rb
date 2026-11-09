# typed: false
# frozen_string_literal: true

class JunoCua < Formula
  desc "Headless computer use agent — screenshot, click, type, scroll from the CLI"
  homepage "https://github.com/lacymorrow/juno"
  version "0.8.270"

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lacymorrow/juno/releases/download/cua-v0.8.270/juno-cua-darwin-arm64.tar.gz"
      sha256 "dae153a8413c4e61485434adbfcddf27abb5ea75c9eeef8e8a7c859659bfa91f"

      def install
        bin.install "juno-cua"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/lacymorrow/juno/releases/download/cua-v0.8.270/juno-cua-darwin-x64.tar.gz"
      sha256 "ce6b372708d07f4999073d3e6e23e826ae4845ed6a20ae204e64a632cb0874c3"

      def install
        bin.install "juno-cua"
      end
    end
  end

  test do
    assert_match "Computer Use Agent", shell_output("#{bin}/juno-cua capabilities")
  end
end
