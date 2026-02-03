# typed: false
# frozen_string_literal: true

class Lacy < Formula
  desc "Talk directly to your shell - natural language to AI agent routing"
  homepage "https://github.com/lacymorrow/lacy-shell"
  url "https://github.com/lacymorrow/lacy-shell/archive/refs/tags/v1.1.1.tar.gz"
  sha256 "9c2bb0e9e0cd64bd3d7a92c6454fd63b4f6b8a3f0843028591d79da05a8ced6a"
  license "MIT"
  head "https://github.com/lacymorrow/lacy-shell.git", branch: "main"

  depends_on "zsh" => :optional

  def install
    prefix.install Dir["*"]
  end

  def caveats
    <<~EOS
      To activate lacy, add this to your ~/.zshrc:

        source #{opt_prefix}/lacy-shell.plugin.zsh

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

      Learn more: https://github.com/lacymorrow/lacy-shell
    EOS
  end

  test do
    assert_predicate prefix/"lacy-shell.plugin.zsh", :exist?
  end
end
