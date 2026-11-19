# typed: false
# frozen_string_literal: true

class JunoCua < Formula
  desc "Headless computer use agent — screenshot, click, type, scroll from the CLI"
  homepage "https://github.com/lacymorrow/juno"
  version "0.8.299"

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lacymorrow/juno/releases/download/cua-v0.8.299/juno-cua-darwin-arm64.tar.gz"
      sha256 "78ce3931752ca54a664d3f5c665c1b97a01298a1e42e96d00d72e051aec678ab"

      def install
        bin.install "juno-cua"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/lacymorrow/juno/releases/download/cua-v0.8.299/juno-cua-darwin-x64.tar.gz"
      sha256 "17407620aa125979a72685c09d95fdf119b75642c4327abbc0e25e67bffe62f7"

      def install
        bin.install "juno-cua"
      end
    end
  end

  test do
    assert_match "Computer Use Agent", shell_output("#{bin}/juno-cua capabilities")
  end
end
