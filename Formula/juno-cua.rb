# typed: false
# frozen_string_literal: true

class JunoCua < Formula
  desc "Headless computer use agent — screenshot, click, type, scroll from the CLI"
  homepage "https://github.com/lacymorrow/juno"
  version "0.8.259"

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lacymorrow/juno/releases/download/cua-v0.8.259/juno-cua-darwin-arm64.tar.gz"
      sha256 "6a245cb1a3cf4da78f46e8ccef5f9e2503841a0cf51a214128a104f8a45ec027"

      def install
        bin.install "juno-cua"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/lacymorrow/juno/releases/download/cua-v0.8.259/juno-cua-darwin-x64.tar.gz"
      sha256 "12e0238b99e92876748974ef973609435fc73c701fe7bfcb6814e7da212fa580"

      def install
        bin.install "juno-cua"
      end
    end
  end

  test do
    assert_match "Computer Use Agent", shell_output("#{bin}/juno-cua capabilities")
  end
end
