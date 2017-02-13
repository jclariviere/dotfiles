# Default template: https://github.com/robbyrussell/oh-my-zsh/blob/master/templates/zshrc.zsh-template

## oh-my-zsh config {{{

# Path to the oh-my-zsh installation
export ZSH=$HOME/.oh-my-zsh

# Themes can be found in ~/.oh-my-zsh/themes/
# If set to "random", it'll load a random theme each time that oh-my-zsh is loaded
ZSH_THEME="bash-like"

# Disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Show the command execution timestamp in the history command output
HIST_STAMPS="yyyy-mm-dd"

# Use this custom folder instead of $ZSH/custom
ZSH_CUSTOM=$HOME/dotfiles/zsh/oh-my-zsh/custom

# Plugins can be found in ~/.oh-my-zsh/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh
# }}}

## User config {{{

# VISUAL and EDITOR: http://unix.stackexchange.com/a/73486
export VISUAL=vim
export EDITOR="$VISUAL"
# }}}

## Aliases and functions {{{

# Pipe stuff into this command to both show the output and copy it to clipboard
alias copy-output="xclip -f -selection primary | xclip -f -selection clipboard"

# Copy file content to X clipboard
copy-file() {
    cat "$1" | xclip -f -selection primary | xclip -selection clipboard
}
# }}}

# vim: foldmethod=marker
