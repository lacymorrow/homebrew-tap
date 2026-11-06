# typed: false
# frozen_string_literal: true

class JunoCua < Formula
  desc "Headless computer use agent — screenshot, click, type, scroll from the CLI"
  homepage "https://github.com/lacymorrow/juno"
  version "0.8.268"

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lacymorrow/juno/releases/download/cua-v0.8.268/juno-cua-darwin-arm64.tar.gz"
      sha256 "cd0d80dd30c7d4d2302c1aae8350ba7218a7b85271237d87c6da10ca0ec03ac1"

      def install
        bin.install "juno-cua"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/lacymorrow/juno/releases/download/cua-v0.8.268/juno-cua-darwin-x64.tar.gz"
      sha256 "a2b95c7b8bd90671d9870d476aa0a3506e73be4db70905b677a6e339d3513ae4"

      def install
        bin.install "juno-cua"
      end
    end
  end

  test do
    assert_match "Computer Use Agent", shell_output("#{bin}/juno-cua capabilities")
  end
end
