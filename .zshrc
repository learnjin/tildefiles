HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.history
setopt ShareHistory ExtendedHistory HistIgnoreDups HistFindNoDups
setopt HistIgnoreSpace HistNoStore


# set vi mode
bindkey -v
bindkey "^r" history-incremental-search-backward

# enable completion if you haven't already
autoload -U compinit
compinit
 
# load capistrano completion
source ~/.zsh/cap_completion
source ~/.zsh/rake_completion

alias mysqlstart='sudo /opt/local/bin/mysqld_safe5'
alias mysqlstop='/opt/local/bin/mysqladmin5 -u root -p shutdown'

#directory aliases
alias -g pj='~/Desktop/Projects'
alias -g wd='~/Workspace/doxter'

alias ll='ls -l'

# imitate MacOS's clibpboard commands
if [[ `uname` == 'Linux' ]]; then
  alias pbcopy='xclip -selection clipboard'
  alias pbpaste='xclip -selection clipboard -o'
fi

# RVM
if [[ -s ~/.rvm/scripts/rvm ]] ; then source ~/.rvm/scripts/rvm ; fi

# use .localrc for settings specific to one system
[[ -f ~/.localrc ]] && .  ~/.localrc
