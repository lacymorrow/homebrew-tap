# typed: false
# frozen_string_literal: true

class JunoCua < Formula
  desc "Headless computer use agent — screenshot, click, type, scroll from the CLI"
  homepage "https://github.com/lacymorrow/juno"
  version "0.8.263"

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lacymorrow/juno/releases/download/cua-v0.8.263/juno-cua-darwin-arm64.tar.gz"
      sha256 "3d4f6eb6f2614da908c047eb547440bff6c795b2df8df2e5b37e5c4a512dc17d"

      def install
        bin.install "juno-cua"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/lacymorrow/juno/releases/download/cua-v0.8.263/juno-cua-darwin-x64.tar.gz"
      sha256 "e349e98599e5cab3e00445140e01a23a36e7eac7c0541ac001c8d325cf834d68"

      def install
        bin.install "juno-cua"
      end
    end
  end

  test do
    assert_match "Computer Use Agent", shell_output("#{bin}/juno-cua capabilities")
  end
end
