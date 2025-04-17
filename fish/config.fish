if status is-interactive
    # Commands to run in interactive sessions can go here
end

# ~/.config/fish/config.fish

set -gx EDITOR nvim
set -gx PATH $HOME/.cargo/bin $PATH

# Starship prompt
starship init fish | source

# Add your aliases
alias lg='lazygit'
alias gs='git status'
alias c='clear'

set -U fish_color_command green
set -U fish_color_param cyan
set -U fish_color_quote yellow
set -U fish_color_redirection magenta
set -U fish_color_comment brgray
set -U fish_color_error red
set -U fish_color_end brblue
set -U fish_color_operator blue
set -U fish_color_escape brcyan
set -U fish_color_autosuggestion brblack

