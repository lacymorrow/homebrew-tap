# typed: false
# frozen_string_literal: true

class JunoCua < Formula
  desc "Headless computer use agent — screenshot, click, type, scroll from the CLI"
  homepage "https://github.com/lacymorrow/juno"
  version "0.8.281"

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lacymorrow/juno/releases/download/cua-v0.8.281/juno-cua-darwin-arm64.tar.gz"
      sha256 "e31643422779d0407cd638568bc275a69b052d9acb1e7e04203c425156d38ad5"

      def install
        bin.install "juno-cua"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/lacymorrow/juno/releases/download/cua-v0.8.281/juno-cua-darwin-x64.tar.gz"
      sha256 "01a68c3cd27d14dc20f605b553df1bedf06d6e769ea2776e57b6c02d6914b90d"

      def install
        bin.install "juno-cua"
      end
    end
  end

  test do
    assert_match "Computer Use Agent", shell_output("#{bin}/juno-cua capabilities")
  end
end
