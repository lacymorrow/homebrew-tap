# typed: false
# frozen_string_literal: true

class JunoCua < Formula
  desc "Headless computer use agent — screenshot, click, type, scroll from the CLI"
  homepage "https://github.com/lacymorrow/juno"
  version "0.8.280"

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lacymorrow/juno/releases/download/cua-v0.8.280/juno-cua-darwin-arm64.tar.gz"
      sha256 "eabfb0f3b7f88e1e91742b397a45f1327fe0b693a8dd30c5f90c267be07084f9"

      def install
        bin.install "juno-cua"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/lacymorrow/juno/releases/download/cua-v0.8.280/juno-cua-darwin-x64.tar.gz"
      sha256 "5719c3e739588249d8eaf0781a82ddd88aae30c14ec2395f010a2a8d3fe1f67e"

      def install
        bin.install "juno-cua"
      end
    end
  end

  test do
    assert_match "Computer Use Agent", shell_output("#{bin}/juno-cua capabilities")
  end
end
