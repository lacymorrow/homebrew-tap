# typed: false
# frozen_string_literal: true

class JunoCua < Formula
  desc "Headless computer use agent — screenshot, click, type, scroll from the CLI"
  homepage "https://github.com/lacymorrow/juno"
  version "0.8.271"

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lacymorrow/juno/releases/download/cua-v0.8.271/juno-cua-darwin-arm64.tar.gz"
      sha256 "dc37d71f31dc6eb0f565cde78ac53433fbac539b387c546c3794e6f19b0d5f6b"

      def install
        bin.install "juno-cua"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/lacymorrow/juno/releases/download/cua-v0.8.271/juno-cua-darwin-x64.tar.gz"
      sha256 "ae2b4b09c7f224fe40142b4f0bacf705d9a34025563a831fb548f47a8daa4f53"

      def install
        bin.install "juno-cua"
      end
    end
  end

  test do
    assert_match "Computer Use Agent", shell_output("#{bin}/juno-cua capabilities")
  end
end
