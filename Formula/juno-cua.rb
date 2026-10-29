# typed: false
# frozen_string_literal: true

class JunoCua < Formula
  desc "Headless computer use agent — screenshot, click, type, scroll from the CLI"
  homepage "https://github.com/lacymorrow/juno"
  version "0.8.247"

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lacymorrow/juno/releases/download/cua-v0.8.247/juno-cua-darwin-arm64.tar.gz"
      sha256 "12ff78b44dfdbe16125b1ba3715407e38a26b650afbf488236b24362b2c5ea33"

      def install
        bin.install "juno-cua"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/lacymorrow/juno/releases/download/cua-v0.8.247/juno-cua-darwin-x64.tar.gz"
      sha256 "85d48fab5b07c2d7190c15c991cac47e508911c5e54719ab11f48757d91b2c66"

      def install
        bin.install "juno-cua"
      end
    end
  end

  test do
    assert_match "Computer Use Agent", shell_output("#{bin}/juno-cua capabilities")
  end
end
