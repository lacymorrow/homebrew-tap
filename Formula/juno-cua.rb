# typed: false
# frozen_string_literal: true

class JunoCua < Formula
  desc "Headless computer use agent — screenshot, click, type, scroll from the CLI"
  homepage "https://github.com/lacymorrow/juno"
  version "0.8.283"

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lacymorrow/juno/releases/download/cua-v0.8.283/juno-cua-darwin-arm64.tar.gz"
      sha256 "14cd5903ac1d87d7c74dc8a15ce4c6ff1463eaca905bccd9cfa7e3f92334e82e"

      def install
        bin.install "juno-cua"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/lacymorrow/juno/releases/download/cua-v0.8.283/juno-cua-darwin-x64.tar.gz"
      sha256 "4d3515fa6034882ffea3d694c4be29b816b10bc0bf60ce0865a9df883195848a"

      def install
        bin.install "juno-cua"
      end
    end
  end

  test do
    assert_match "Computer Use Agent", shell_output("#{bin}/juno-cua capabilities")
  end
end
