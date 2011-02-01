
echo "SOURCING .bashrc"

export HISTFILESIZE=10000
export HISTCONTROL=ignoredups

alias ls='ls -G'
alias ll='ls -l -G'

alias mysqlstart='sudo /opt/local/bin/mysqld_safe5'
alias mysqlstop='/opt/local/bin/mysqladmin5 -u root -p shutdown'
#alias mysql='mysql5'
alias octave='/Applications/Octave.app/Contents/Resources/bin/octave'
alias openemacs='/usr/bin/open /Applications/Emacs.app'
alias hist='history | grep $1'

alias sim='cd ~/Documents/Projects/Diplomarbeit/simulation'
alias wr='cd ~/Documents/Projects/Diplomarbeit/latex'
alias gf='cd /Applications/NetBeans/glassfish-v2ur2'
alias da='cd ~/Documents/Projects/Diplomarbeit'

PATH=$PATH:/opt/local/bin


# enable multiline history
shopt -s cmdhist

# autocorrect path misspelling
shopt -s cdspell


#################### FUNCTIONS ################

function ec(){ 
    /Applications/Emacs.app/Contents/MacOS/bin/emacsclient -n $@ 2>/dev/null
    if [ $? != 0 ]; then
        /usr/bin/open -a /Applications/Emacs.app  $@
    fi
}

if [[ -s /Users/kai/.rvm/scripts/rvm ]] ; then source /Users/kai/.rvm/scripts/rvm ; fi

