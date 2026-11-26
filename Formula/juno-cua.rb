# typed: false
# frozen_string_literal: true

class JunoCua < Formula
  desc "Headless computer use agent — screenshot, click, type, scroll from the CLI"
  homepage "https://github.com/lacymorrow/juno"
  version "0.8.305"

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lacymorrow/juno/releases/download/cua-v0.8.305/juno-cua-darwin-arm64.tar.gz"
      sha256 "6fbd7dfe75f87a67b4d067f9a3f2e3b881c9e9396e6609c280423138f997b40a"

      def install
        bin.install "juno-cua"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/lacymorrow/juno/releases/download/cua-v0.8.305/juno-cua-darwin-x64.tar.gz"
      sha256 "216580bc9802b937a65fd64f0cf0899690772d5550c8ca9240c0a94086e187c8"

      def install
        bin.install "juno-cua"
      end
    end
  end

  test do
    assert_match "Computer Use Agent", shell_output("#{bin}/juno-cua capabilities")
  end
end
