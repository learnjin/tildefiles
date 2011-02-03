
My dotfiles. To install:

    cd ~
    git clone git://github.com/learnjin/tildefiles.git
    mv tildefiles/.git .
    rm -rf tildefiles
    git remote rm origin
    git remote add origin git://github.com/learnjin/tildefiles.git

And to overwrite your dotfiles with the ones from
the repository:

    git reset --hard

And finally pull down the submodules.

    git submodules init
    git submodule update


Do add new files force add or ignore directories in `.gitignore`

    git add -f SOME_NEW_FILE
    echo >> "!NEW_DIR/" >> .gitignore


