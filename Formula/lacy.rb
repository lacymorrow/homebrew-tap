# typed: false
# frozen_string_literal: true

class Lacy < Formula
  desc "Talk to your shell - natural language to AI, commands to shell"
  homepage "https://lacy.sh"
  url "https://github.com/lacymorrow/lacy/archive/refs/tags/v1.8.9.tar.gz"
  sha256 "ad106492d6bdedc36b5e1bb7974ebd2daab460e7897ff8910ad2f8db74832d5e"
  license "MIT"
  head "https://github.com/lacymorrow/lacy.git", branch: "main"

  depends_on "zsh" => :optional

  def install
    prefix.install Dir["*"]
    bin.install_symlink prefix/"bin/lacy"
  end

  def post_install
    lacy_home = Pathname.new(Dir.home)/".lacy"

    # Symlink ~/.lacy → Homebrew prefix so bin/lacy and plugins find their files
    if lacy_home.symlink?
      lacy_home.unlink if lacy_home.readlink != prefix
    end
    unless lacy_home.exist?
      lacy_home.make_symlink(prefix)
    end

    # Detect shell and RC file
    login_shell = File.basename(ENV.fetch("SHELL", "zsh"))
    case login_shell
    when "bash"
      rc_file = if OS.mac?
        Pathname.new(Dir.home)/".bash_profile"
      else
        Pathname.new(Dir.home)/".bashrc"
      end
      plugin_file = "lacy.plugin.bash"
    else
      rc_file = Pathname.new(Dir.home)/".zshrc"
      plugin_file = "lacy.plugin.zsh"
    end

    source_line = "source #{lacy_home}/#{plugin_file}"

    # Add source line to RC file if not already present
    if rc_file.exist?
      rc_content = rc_file.read
      unless rc_content.include?("lacy.plugin")
        rc_file.open("a") do |f|
          f.puts ""
          f.puts "# Lacy Shell"
          f.puts source_line
        end
      end
    else
      rc_file.write("\n# Lacy Shell\n#{source_line}\n")
    end

    # Create default config if none exists
    config_file = lacy_home/"config.yaml"
    unless config_file.exist?
      config_file.write <<~YAML
        # Lacy Shell Configuration
        # https://github.com/lacymorrow/lacy

        # AI CLI tool selection
        # Options: lash, claude, opencode, gemini, codex, custom, or empty for auto-detect
        agent_tools:
          active:
          # custom_command: "your-command -flags"

        # Operating modes
        modes:
          default: auto  # Options: shell, agent, auto

        # Smart auto-detection settings
        auto_detection:
          enabled: true
          confidence_threshold: 0.7
      YAML
    end
  end

  def caveats
    <<~EOS
      Lacy Shell has been installed and configured.

      Restart your terminal or run:

        source ~/.zshrc

      Then run `lacy setup` to choose your AI tool and preferences.

      For the best experience, install an AI CLI tool:

        brew install lacymorrow/tap/lash    # Recommended

      Commands:
        lacy setup    Interactive settings
        lacy status   Show installation status
        lacy doctor   Diagnose issues
        mode          Show/change mode (shell/agent/auto)
        tool          Show/change AI tool
        ask "query"   Direct query to AI
        Ctrl+Space    Toggle between modes

      Learn more: https://lacy.sh
    EOS
  end

  test do
    assert_predicate prefix/"lacy.plugin.zsh", :exist?
    assert_predicate bin/"lacy", :exist?
  end
end
