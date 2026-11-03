# typed: false
# frozen_string_literal: true

class JunoCua < Formula
  desc "Headless computer use agent — screenshot, click, type, scroll from the CLI"
  homepage "https://github.com/lacymorrow/juno"
  version "0.8.256"

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lacymorrow/juno/releases/download/cua-v0.8.256/juno-cua-darwin-arm64.tar.gz"
      sha256 "8c080090ae8981acc635194d1ce90ab71634aeafeafaa9891a89e4f4f4f7eea1"

      def install
        bin.install "juno-cua"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/lacymorrow/juno/releases/download/cua-v0.8.256/juno-cua-darwin-x64.tar.gz"
      sha256 "442a0acbca19cbc234f9812a269fc3a2387d0830565e8a852ec9f7b8e62d4bc0"

      def install
        bin.install "juno-cua"
      end
    end
  end

  test do
    assert_match "Computer Use Agent", shell_output("#{bin}/juno-cua capabilities")
  end
end
