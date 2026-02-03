# typed: false
# frozen_string_literal: true

class Lacy < Formula
  desc "Talk directly to your shell - natural language to AI agent routing"
  homepage "https://github.com/lacymorrow/lacy-shell"
  url "https://github.com/lacymorrow/lacy-shell/archive/refs/tags/v1.3.0.tar.gz"
  sha256 "89b7aadbcfef62e3d8b60cf9a58d4a13efe60db0f0d370d7d0d0a5cc4a4070f1"
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
