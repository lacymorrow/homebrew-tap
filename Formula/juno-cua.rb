# typed: false
# frozen_string_literal: true

class JunoCua < Formula
  desc "Headless computer use agent — screenshot, click, type, scroll from the CLI"
  homepage "https://github.com/lacymorrow/juno"
  version "0.8.294"

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lacymorrow/juno/releases/download/cua-v0.8.294/juno-cua-darwin-arm64.tar.gz"
      sha256 "e188c2fa559f54975aa3ffebd72e88f4f2d22affebc5785ea34496b8d4deda8c"

      def install
        bin.install "juno-cua"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/lacymorrow/juno/releases/download/cua-v0.8.294/juno-cua-darwin-x64.tar.gz"
      sha256 "f021c4fe804fab975d4b92e4cceb793029f94946b61d668e3e9b29a7c9ec6248"

      def install
        bin.install "juno-cua"
      end
    end
  end

  test do
    assert_match "Computer Use Agent", shell_output("#{bin}/juno-cua capabilities")
  end
end
