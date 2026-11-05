# typed: false
# frozen_string_literal: true

class JunoCua < Formula
  desc "Headless computer use agent — screenshot, click, type, scroll from the CLI"
  homepage "https://github.com/lacymorrow/juno"
  version "0.8.261"

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lacymorrow/juno/releases/download/cua-v0.8.261/juno-cua-darwin-arm64.tar.gz"
      sha256 "8dd2caf50987c0de007fa1cf994cccd2f3cec958ed6fe5677248f25ff05c4e22"

      def install
        bin.install "juno-cua"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/lacymorrow/juno/releases/download/cua-v0.8.261/juno-cua-darwin-x64.tar.gz"
      sha256 "9d3a4afd6ed73628c362ac2753bdf9304fa5eda938803a9e61992d7cff1e632d"

      def install
        bin.install "juno-cua"
      end
    end
  end

  test do
    assert_match "Computer Use Agent", shell_output("#{bin}/juno-cua capabilities")
  end
end
