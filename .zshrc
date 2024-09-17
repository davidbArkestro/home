zsh::init() {

    autoload -Uz add-zsh-hook
    autoload -U colors && colors
    autoload -Uz compaudit
    compaudit
    autoload -Uz compinit
    compinit -C -d $HOME/.zcompdump

}

zsh::cdpath::init() {

    cdpath=()
    cdpath+=("$HOME/Documents/Python")
    cdpath+=("$HOME/Documents/Python/TechAcademy")
}

zsh::history::init() {

    setopt BANG_HIST              # Treat the '!' character specially during expansion.
    setopt EXTENDED_HISTORY       # Write the history file in the ':start:elapsed;command' format.
    setopt SHARE_HISTORY          # Share history between all sessions.
    setopt HIST_EXPIRE_DUPS_FIRST # Expire a duplicate event first when trimming history.
    setopt HIST_IGNORE_DUPS       # Do not record an event that was just recorded again.
    setopt HIST_IGNORE_ALL_DUPS   # Delete an old recorded event if a new event is a duplicate.
    setopt HIST_FIND_NO_DUPS      # Do not display a previously found event.
    setopt HIST_IGNORE_SPACE      # Do not record an event starting with a space.
    setopt HIST_SAVE_NO_DUPS      # Do not write a duplicate event to the history file.
    setopt HIST_VERIFY            # Do not execute immediately upon history expansion.
    setopt HIST_BEEP              # Beep when accessing non-existent history.

    export HISTFILE="$ZDOTDIR/.zsh_history"
    export HISTSIZE=10000
    export SAVEHIST=10000

}

zsh::colors::init() {

    . "$HOME/Documents/Python/TechAcademy/zsh-users/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
}

homebrew::bootstrap() {

    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
}

shell::path::init() {

#    export PATH=""
    export PATH="$PATH:/opt/X11/bin"
    export PATH="$PATH:/opt/homebrew/bin"
    export PATH="$PATH:/opt/homebrew/sbin"
    export PATH="$PATH:/usr/local/bin"
    export PATH="$PATH:/usr/local/sbin"
    export PATH="$PATH:/usr/bin"
    export PATH="$PATH:/usr/sbin"
    export PATH="$PATH:/bin"
    export PATH="$PATH:/sbin"
    export PATH="$PATH:/.local/bin"
    export PATH="$PATH:/opt/homebrew/opt/postgresql@14/bin"

}

shell::env::init() {

  export AWS_PAGER=””
  export GH_PAGER=””
  export GIT_PAGER=””
  export PAGER=””
  # export MANPAGER=”sh -c 'col -bx | bat -l man -p’”

  export EDITOR=”code” # zsh will set key bindings based on this
  # or use bindkey -v or bindkey -e 

  export LESS="-R"
  export RUBY_SHELL="ripe"
  # export VIRTUAL_ENV_DISABLE_PROMPT=true
  
}

homebrew::init() {
    
    local homebrew_prefix=$(brew --config | awk -F: '/PREFIX/ { print $2 }' | sed -e 's, ,,g')
    export HOMEBREW_NO_ANALYTICS=1
    export HOMEBREW_EDITOR=vim
    export HOMEBREW_PREFIX="$homebrew_prefix"

}

homebrew::install() {

    brew install shfmt
    brew install skim
    brew install fzf
    brew install coreutils
    brew install parallel
    brew install shellcheck

    brew install recode

    brew install tree
    brew install curl
    brew install wget

    brew install htop
    brew install lsof
    brew install zsh

    brew install ack
    brew install ag
    brew install bat
    brew install fd
    brew install rg
    brew install jc
    brew install jp
    brew install jq
    brew install yq
    brew install pdfgrep
    brew install xsv

    brew install git
    brew install git-delta
    brew install git-extras
    brew install git-lfs
    brew install git-quick-stats
    brew install git-secret
    brew install tig
    brew install gh
    brew install act


}


zsh::init
shell::path::init
zsh::cdpath::init
homebrew::init
zsh::colors::init
shell::env::init