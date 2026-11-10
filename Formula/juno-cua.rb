# typed: false
# frozen_string_literal: true

class JunoCua < Formula
  desc "Headless computer use agent — screenshot, click, type, scroll from the CLI"
  homepage "https://github.com/lacymorrow/juno"
  version "0.8.272"

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lacymorrow/juno/releases/download/cua-v0.8.272/juno-cua-darwin-arm64.tar.gz"
      sha256 "8df694c5a8f728134015d9c6aca824b870a40cb1bdac11f251dab78b1805eed6"

      def install
        bin.install "juno-cua"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/lacymorrow/juno/releases/download/cua-v0.8.272/juno-cua-darwin-x64.tar.gz"
      sha256 "c2b9e1f6ecc5b947907d3d9702130be7cbc7bb450d4344d60464fbc98eeed0f6"

      def install
        bin.install "juno-cua"
      end
    end
  end

  test do
    assert_match "Computer Use Agent", shell_output("#{bin}/juno-cua capabilities")
  end
end
