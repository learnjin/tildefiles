export PS1="[%T] %~ %% "
export EDITOR=mvim

export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Versions/1.6/Home

export EC2_HOME=$HOME/lib/ec2
export EC2_PRIVATE_KEY=~/.ec2/pk-5OE2GBMWNUIP4HG2KJHIKOKMISJ5KBVL.pem
export EC2_CERT=~/.ec2/cert-5OE2GBMWNUIP4HG2KJHIKOKMISJ5KBVL.pem
export EC2_USER_ID=215406818855 

path=( /opt/local/bin /opt/local/sbin $ec2_home/bin $HOME/bin $path )
manpath=(/opt/local/share/man $manpath)
infopath=(/opt/local/share/info $infopath)

export PYTHONSTARTUP=/Users/kai/.pystartup

export GTAGSLABEL=rtags




