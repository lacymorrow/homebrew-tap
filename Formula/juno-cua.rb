# typed: false
# frozen_string_literal: true

class JunoCua < Formula
  desc "Headless computer use agent — screenshot, click, type, scroll from the CLI"
  homepage "https://github.com/lacymorrow/juno"
  version "0.8.303"

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lacymorrow/juno/releases/download/cua-v0.8.303/juno-cua-darwin-arm64.tar.gz"
      sha256 "f321cb607a16dfe000036cd3250223f1cce4f13ede2d062f290269b3b9e248f4"

      def install
        bin.install "juno-cua"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/lacymorrow/juno/releases/download/cua-v0.8.303/juno-cua-darwin-x64.tar.gz"
      sha256 "2a2ee34083f968659fa8c7b372b826f27c00cae3a4e7e10a22bac11fc7b8148f"

      def install
        bin.install "juno-cua"
      end
    end
  end

  test do
    assert_match "Computer Use Agent", shell_output("#{bin}/juno-cua capabilities")
  end
end
