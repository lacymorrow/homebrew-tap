# typed: false
# frozen_string_literal: true

class Cliamp < Formula
  desc "A retro terminal music player inspired by Winamp 2.x"
  homepage "https://github.com/lacymorrow/cliamp"
  version "0.0.0"
  license "MIT"

  depends_on "ffmpeg" => :recommended
  depends_on "yt-dlp" => :recommended

  on_macos do
    on_arm do
      url "https://github.com/lacymorrow/cliamp/releases/download/v0.0.0/cliamp-darwin-arm64.tar.gz"
      sha256 ""

      def install
        bin.install "cliamp"
      end
    end
    on_intel do
      url "https://github.com/lacymorrow/cliamp/releases/download/v0.0.0/cliamp-darwin-amd64.tar.gz"
      sha256 ""

      def install
        bin.install "cliamp"
      end
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/lacymorrow/cliamp/releases/download/v0.0.0/cliamp-linux-arm64.tar.gz"
      sha256 ""

      def install
        bin.install "cliamp"
      end
    end
    on_intel do
      url "https://github.com/lacymorrow/cliamp/releases/download/v0.0.0/cliamp-linux-amd64.tar.gz"
      sha256 ""

      def install
        bin.install "cliamp"
      end
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cliamp --version")
  end
end
