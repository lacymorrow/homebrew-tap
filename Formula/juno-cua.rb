# typed: false
# frozen_string_literal: true

class JunoCua < Formula
  desc "Headless computer use agent — screenshot, click, type, scroll from the CLI"
  homepage "https://github.com/lacymorrow/juno"
  version "0.8.260"

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lacymorrow/juno/releases/download/cua-v0.8.260/juno-cua-darwin-arm64.tar.gz"
      sha256 "633299a905eef61eb0e0bbfd78f1183dde83ded22d7f5ee109801340332a45c4"

      def install
        bin.install "juno-cua"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/lacymorrow/juno/releases/download/cua-v0.8.260/juno-cua-darwin-x64.tar.gz"
      sha256 "e962d66bd64d58f153ada7686fe8e882a1b3eec95645246a0296ccba0405f420"

      def install
        bin.install "juno-cua"
      end
    end
  end

  test do
    assert_match "Computer Use Agent", shell_output("#{bin}/juno-cua capabilities")
  end
end
