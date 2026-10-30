# typed: false
# frozen_string_literal: true

class JunoCua < Formula
  desc "Headless computer use agent — screenshot, click, type, scroll from the CLI"
  homepage "https://github.com/lacymorrow/juno"
  version "0.8.251"

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lacymorrow/juno/releases/download/cua-v0.8.251/juno-cua-darwin-arm64.tar.gz"
      sha256 "6f7eb01f9235b93e1c7c3d2d33dcfdff78641330c8659258aa40bbd6f63f8fdb"

      def install
        bin.install "juno-cua"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/lacymorrow/juno/releases/download/cua-v0.8.251/juno-cua-darwin-x64.tar.gz"
      sha256 "85d1d295d7a1620c22b8dd15272b96ef5d27db9088353d95291653f0d7e3682f"

      def install
        bin.install "juno-cua"
      end
    end
  end

  test do
    assert_match "Computer Use Agent", shell_output("#{bin}/juno-cua capabilities")
  end
end
