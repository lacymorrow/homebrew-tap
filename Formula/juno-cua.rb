# typed: false
# frozen_string_literal: true

class JunoCua < Formula
  desc "Headless computer use agent — screenshot, click, type, scroll from the CLI"
  homepage "https://github.com/lacymorrow/juno"
  version "0.8.250"

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lacymorrow/juno/releases/download/cua-v0.8.250/juno-cua-darwin-arm64.tar.gz"
      sha256 "79873bf3a394ef9ef66c5c471521592d504e22c3ac0acd02a6d2f9263e1fdde5"

      def install
        bin.install "juno-cua"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/lacymorrow/juno/releases/download/cua-v0.8.250/juno-cua-darwin-x64.tar.gz"
      sha256 "213d9cd15e4c15065eb1d140327b4c660fdcfea3e7f900d7502af6abb92b5e44"

      def install
        bin.install "juno-cua"
      end
    end
  end

  test do
    assert_match "Computer Use Agent", shell_output("#{bin}/juno-cua capabilities")
  end
end
