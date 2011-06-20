#!/bin/sh
# install-tildefiles.sh
# this script does some after cloning tasks needed
# to get all the tildefiles running.

# build the C extension for the command-t plugin
cd ~/.vim/bundle/command_t/ruby/command-t
ruby extconf.rb
make


