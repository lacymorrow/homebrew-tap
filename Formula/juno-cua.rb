# typed: false
# frozen_string_literal: true

class JunoCua < Formula
  desc "Headless computer use agent — screenshot, click, type, scroll from the CLI"
  homepage "https://github.com/lacymorrow/juno"
  version "0.8.245"

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lacymorrow/juno/releases/download/cua-v0.8.245/juno-cua-darwin-arm64.tar.gz"
      sha256 "4740bdda4ed760f8ac76b01b733fb86269dbc03d10b3244246297971f91e1bd5"

      def install
        bin.install "juno-cua"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/lacymorrow/juno/releases/download/cua-v0.8.245/juno-cua-darwin-x64.tar.gz"
      sha256 "034ad49495efa8bf9cbcee18f90794aa10a1e11a755332363105de464d08919b"

      def install
        bin.install "juno-cua"
      end
    end
  end

  test do
    assert_match "Computer Use Agent", shell_output("#{bin}/juno-cua capabilities")
  end
end
