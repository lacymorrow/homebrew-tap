# typed: false
# frozen_string_literal: true

class Lash < Formula
  desc "The AI coding agent built for the terminal."
  homepage "https://github.com/lacymorrow/lash"
  version "1.7.7"

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/lacymorrow/lash/releases/download/v1.7.7/lashcode-darwin-x64.zip"
      sha256 ""

      def install
        bin.install "lash"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/lacymorrow/lash/releases/download/v1.7.7/lashcode-darwin-arm64.zip"
      sha256 ""

      def install
        bin.install "lash"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/lacymorrow/lash/releases/download/v1.7.7/lashcode-linux-x64.tar.gz"
      sha256 ""
      def install
        bin.install "lash"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/lacymorrow/lash/releases/download/v1.7.7/lashcode-linux-arm64.tar.gz"
      sha256 ""
      def install
        bin.install "lash"
      end
    end
  end
end
