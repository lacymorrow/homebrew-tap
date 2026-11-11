# typed: false
# frozen_string_literal: true

class JunoCua < Formula
  desc "Headless computer use agent — screenshot, click, type, scroll from the CLI"
  homepage "https://github.com/lacymorrow/juno"
  version "0.8.277"

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lacymorrow/juno/releases/download/cua-v0.8.277/juno-cua-darwin-arm64.tar.gz"
      sha256 "ba6e966f41d7579f37fe0748996d899b51a74f7386acf9d6c809d68d962e46f6"

      def install
        bin.install "juno-cua"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/lacymorrow/juno/releases/download/cua-v0.8.277/juno-cua-darwin-x64.tar.gz"
      sha256 "b29756d5f462258258a61c6516b3165d973598ea6b4ef27c61716434caffedbe"

      def install
        bin.install "juno-cua"
      end
    end
  end

  test do
    assert_match "Computer Use Agent", shell_output("#{bin}/juno-cua capabilities")
  end
end
