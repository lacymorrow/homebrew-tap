# typed: false
# frozen_string_literal: true

class JunoCua < Formula
  desc "Headless computer use agent — screenshot, click, type, scroll from the CLI"
  homepage "https://github.com/lacymorrow/juno"
  version "0.8.301"

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lacymorrow/juno/releases/download/cua-v0.8.301/juno-cua-darwin-arm64.tar.gz"
      sha256 "f1f30007b257163a9233a221f2eec0af3e3ef9ad6683c21cae15c83357abe730"

      def install
        bin.install "juno-cua"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/lacymorrow/juno/releases/download/cua-v0.8.301/juno-cua-darwin-x64.tar.gz"
      sha256 "3510a189e915cd56cd2c217c6951abcdd9d3f025975deec9d7d171275f525acc"

      def install
        bin.install "juno-cua"
      end
    end
  end

  test do
    assert_match "Computer Use Agent", shell_output("#{bin}/juno-cua capabilities")
  end
end
