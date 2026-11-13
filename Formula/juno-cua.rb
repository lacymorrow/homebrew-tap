# typed: false
# frozen_string_literal: true

class JunoCua < Formula
  desc "Headless computer use agent — screenshot, click, type, scroll from the CLI"
  homepage "https://github.com/lacymorrow/juno"
  version "0.8.284"

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lacymorrow/juno/releases/download/cua-v0.8.284/juno-cua-darwin-arm64.tar.gz"
      sha256 "4e5c13347c569e66812739b22cf4fc9c77207f7fc7af672aa7171397a16174d1"

      def install
        bin.install "juno-cua"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/lacymorrow/juno/releases/download/cua-v0.8.284/juno-cua-darwin-x64.tar.gz"
      sha256 "fcedff4e7534d7be80669726dae8c6dca9a8edb72a5a36e31878056b25262456"

      def install
        bin.install "juno-cua"
      end
    end
  end

  test do
    assert_match "Computer Use Agent", shell_output("#{bin}/juno-cua capabilities")
  end
end
