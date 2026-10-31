# typed: false
# frozen_string_literal: true

class JunoCua < Formula
  desc "Headless computer use agent — screenshot, click, type, scroll from the CLI"
  homepage "https://github.com/lacymorrow/juno"
  version "0.8.252"

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lacymorrow/juno/releases/download/cua-v0.8.252/juno-cua-darwin-arm64.tar.gz"
      sha256 "f89cbfbc07f6e61d35d7ce8ecdea2c791a73a4e7bf271d38e75a170ecdc59d7c"

      def install
        bin.install "juno-cua"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/lacymorrow/juno/releases/download/cua-v0.8.252/juno-cua-darwin-x64.tar.gz"
      sha256 "e24cad7c30eed6cdc8e64d68199dc162bfc21e0aef531dbcc3824496559b1980"

      def install
        bin.install "juno-cua"
      end
    end
  end

  test do
    assert_match "Computer Use Agent", shell_output("#{bin}/juno-cua capabilities")
  end
end
