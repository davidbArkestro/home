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
    cdpath+=("$HOME/Users/david/Documents/Python")
    cdpath+=("$HOME/Users/david/Documents/Python/TechAcademy/home")
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
   export HISTSIZE=1000
   export SAVEHIST=1000   
}

zsh::alias::init() {
    alias g=’git’
    alias ll=’ls -alFGh’
}

shell::env::init() {
  export AWS_PAGER=”” 
  export GH_PAGER=””
  export GIT_PAGER=””
  export PAGER=””
  # export MANPAGER=”sh -c 'col -bx | bat -l man -p’”

  export EDITOR="code" # zsh will set key bindings based on this
  # or use bindkey -v or bindkey -e 

  export LESS="-R"
  export RUBY_SHELL="ripe"
  # export VIRTUAL_ENV_DISABLE_PROMPT=true

}

homebrew::bootstrap() {
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
}

homebrew::init() {
   local homebrew_prefix=$(brew --config | awk -F: '/PREFIX/ { print $2 }' | sed -e 's, ,,g')
   export HOMEBREW_NO_ANALYTICS=1
   export HOMEBREW_EDITOR=vim
   export HOMEBREW_PREFIX="$homebrew_prefix"
}

zsh::init
zsh::cdpath::init