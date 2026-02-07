# typed: false
# frozen_string_literal: true

class Lash < Formula
  desc "The AI coding agent built for the terminal."
  homepage "https://github.com/lacymorrow/lash"
  version "1.1.54"

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/lacymorrow/lash/releases/download/v1.1.54/lash-cli-darwin-x64.zip"
      sha256 ""

      def install
        bin.install "lash"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/lacymorrow/lash/releases/download/v1.1.54/lash-cli-darwin-arm64.zip"
      sha256 ""

      def install
        bin.install "lash"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/lacymorrow/lash/releases/download/v1.1.54/lash-cli-linux-x64.tar.gz"
      sha256 ""
      def install
        bin.install "lash"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/lacymorrow/lash/releases/download/v1.1.54/lash-cli-linux-arm64.tar.gz"
      sha256 ""
      def install
        bin.install "lash"
      end
    end
  end
end
