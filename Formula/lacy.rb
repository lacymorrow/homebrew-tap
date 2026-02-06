# typed: false
# frozen_string_literal: true

class Lacy < Formula
  desc "Talk to your shell - natural language to AI, commands to shell"
  homepage "https://lacy.sh"
  url "https://github.com/lacymorrow/lacy/archive/refs/tags/v1.6.5.tar.gz"
  sha256 "826a30564c5549888567911b6de3a9475fe7d7d5875ad48f7400afe1467a0067"
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
