# typed: false
# frozen_string_literal: true

class JunoCua < Formula
  desc "Headless computer use agent — screenshot, click, type, scroll from the CLI"
  homepage "https://github.com/lacymorrow/juno"
  version "0.8.265"

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lacymorrow/juno/releases/download/cua-v0.8.265/juno-cua-darwin-arm64.tar.gz"
      sha256 "b9dd50c7618633cd657f58285e80f61ff620bf2bcad37be4f87ba7a370ffbe37"

      def install
        bin.install "juno-cua"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/lacymorrow/juno/releases/download/cua-v0.8.265/juno-cua-darwin-x64.tar.gz"
      sha256 "cab6567972dc297d8d546c3cea09d834e7c02aa110ca5d54a12abdfcd3d057da"

      def install
        bin.install "juno-cua"
      end
    end
  end

  test do
    assert_match "Computer Use Agent", shell_output("#{bin}/juno-cua capabilities")
  end
end
