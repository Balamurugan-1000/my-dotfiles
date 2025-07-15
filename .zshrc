### === Oh My Zsh === ###
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"

plugins=(
  git
  z
  zsh-autosuggestions
  zsh-syntax-highlighting
  zsh-completions
  zsh-history-substring-search
)

source $ZSH/oh-my-zsh.sh

# Completion tweaks
autoload -Uz compinit && compinit
zstyle ':completion:*' menu select
zstyle ':completion:*:descriptions' format '%F{yellow}-- %d --%f'

### === Aliases === ###
alias cls='clear'
alias ls='eza --icons'
alias cat='batcat'
alias runhttps='python manage.py runserver_plus --cert-file cert.crt'

# Neovim app profiles
alias chad='NVIM_APPNAME="chad" nvim'
alias lazy='NVIM_APPNAME="lazyvim" nvim'
alias kick='NVIM_APPNAME="kick" nvim'

### === Preferred Editor === ###
export EDITOR='nvim'
export VISUAL='nvim'

### === PATH Setup (in proper order) === ###
# User-local binaries
export PATH="$HOME/.local/bin:$PATH"

# Custom Python via pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv >/dev/null 2>&1; then
  eval "$(pyenv init --path)"
fi

# Rust
export PATH="$HOME/.cargo/bin:$PATH"
source "$HOME/.cargo/env" 2>/dev/null || true

# Go
export PATH="$HOME/go/bin:$PATH"

# Bun (JavaScript runtime)
export PATH="$HOME/.bun/bin:$PATH"

# Node (via NVM)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && source "$NVM_DIR/bash_completion"

# Snap (Ubuntu packages)
export PATH="/snap/bin:$PATH"

# Core system paths (as fallback, safe to override above)
export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:$PATH"

### === Environment === ###
# Uncomment if needed
# export LANG=en_US.UTF-8
# export ARCHFLAGS="-arch $(uname -m)"
# export HIST_STAMPS="yyyy-mm-dd"

### === Optional Settings === ###
# Enable command correction
ENABLE_CORRECTION="true"

# Better performance for large repos
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Optional: case-insensitive completion
# CASE_SENSITIVE="false"
# HYPHEN_INSENSITIVE="true"

# Start agent and load key on shell startup
eval "$(ssh-agent -s)" > /dev/null
ssh-add -q ~/.ssh/id_ed25519 2>/dev/null


# pnpm
export PNPM_HOME="/home/balamurugan/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

export PATH="$HOME/.scripts:$PATH"
