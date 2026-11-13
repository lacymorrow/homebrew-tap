# typed: false
# frozen_string_literal: true

class JunoCua < Formula
  desc "Headless computer use agent — screenshot, click, type, scroll from the CLI"
  homepage "https://github.com/lacymorrow/juno"
  version "0.8.282"

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lacymorrow/juno/releases/download/cua-v0.8.282/juno-cua-darwin-arm64.tar.gz"
      sha256 "dd87094aa87da35e530dcca87f0b545fa4066f2c63520eab761954da4265de55"

      def install
        bin.install "juno-cua"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/lacymorrow/juno/releases/download/cua-v0.8.282/juno-cua-darwin-x64.tar.gz"
      sha256 "6fd5f76490155ad119f21e6804a30efa64dff06b0cbf6ede17a863b507bab209"

      def install
        bin.install "juno-cua"
      end
    end
  end

  test do
    assert_match "Computer Use Agent", shell_output("#{bin}/juno-cua capabilities")
  end
end
