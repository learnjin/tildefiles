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

function ec(){
    /Applications/Emacs.app/Contents/MacOS/bin/emacsclient -n $@ 2>/dev/null
    if [ $? != 0 ]; then
        /usr/bin/open -a /Applications/Emacs.app  $@
    fi
}

alias mysqlstart='sudo /opt/local/bin/mysqld_safe5'
alias mysqlstop='/opt/local/bin/mysqladmin5 -u root -p shutdown'

#directory aliases
alias -g pj='~/Desktop/Projects'
alias -g wd='~/Desktop/Projects/Doxter/Workspace/'

alias v='mvim'
alias ll='ls -l'

if [[ -s /Users/kai/.rvm/scripts/rvm ]] ; then source /Users/kai/.rvm/scripts/rvm ; fi

function vm(){
if [ -d $1 ]; then
  vim -c ":NERDTree $1" & 2>&1 > /dev/null
else
  mvim $1 &
fi
}
. ~/.zsh/config
. ~/.zsh/aliases
. ~/.zsh/completion

# use .localrc for settings specific to one system
[[ -f ~/.localrc ]] && .  ~/.localrc
