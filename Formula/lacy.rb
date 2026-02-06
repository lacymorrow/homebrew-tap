# typed: false
# frozen_string_literal: true

class Lacy < Formula
  desc "Talk to your shell - natural language to AI, commands to shell"
  homepage "https://lacy.sh"
  url "https://github.com/lacymorrow/lacy/archive/refs/tags/v1.6.3.tar.gz"
  sha256 "0dad91e1a1a7f94322892c79002e7dbd8d388038d3116f9918427724b1cb3e94"
  license "MIT"
  head "https://github.com/lacymorrow/lacy.git", branch: "main"

  depends_on "zsh" => :optional

  def install
    prefix.install Dir["*"]
  end

  def caveats
    <<~EOS
      To activate lacy, add this to your ~/.zshrc:

        source #{opt_prefix}/lacy.plugin.zsh

      Then restart your terminal or run:

        source ~/.zshrc

      For the best experience, install an AI CLI tool:

        brew install lacymorrow/tap/lash    # Recommended
        # or: npm install -g lash-cli

      Commands:
        mode          Show/change mode (shell/agent/auto)
        tool          Show/change AI tool
        ask "query"   Direct query to AI
        Ctrl+Space    Toggle between modes

      Learn more: https://lacy.sh
    EOS
  end

  test do
    assert_predicate prefix/"lacy.plugin.zsh", :exist?
  end
end
