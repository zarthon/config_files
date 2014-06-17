# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

# Set to the name theme to load.
# Look in ~/.oh-my-zsh/themes/
export ZSH_THEME="steeef"

# Set to this to use case-sensitive completion
export CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# export DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# export DISABLE_LS_COLORS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git lol osx)
source $ZSH/oh-my-zsh.sh
export GOROOT=$HOME/go
export PATH=$PATH:$GOROOT/bin
export GOPATH=$HOME/Dropbox/UCSD/Quarter3/cse223b/gopath
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:/home/zarthon/Projects/UCSD/cse210/apache-maven-3.2.1/bin/
# Customize to your needs...

dict() { 
if [ ! -d $HOME/dict ];then 
mkdir $HOME/dict;
fi
cat $HOME/dict/dicthistory | grep " $1$" 1>/dev/null 2>/dev/null;
if [ $? -eq 0 ]
then
 less $HOME/dict/$1;
 return;
fi
 echo `date`" -> ""$1" >> $HOME/dict/dicthistory;
 curl -s "http://www.google.com/dictionary?aq=f&langpair=en|en&q="$1"&hl=en" | html2text -nobs | sed '1,/^ *Dictionary\]/d' | head -n -5 > $HOME/dict/$1;
 stat_data=`stat $HOME/dict/$1 -t | awk '{print $2}'`
 echo -n "Bytes transferred: "
 echo $stat_data
 sleep 1;
 less $HOME/dict/$1;
 echo "::Last searched words.."
 cat $HOME/dict/dicthistory;
}
dictdelete()
{
 rm $HOME/dict/$1;
 cat $HOME/dict/dicthistory | grep -v " $1$" > $HOME/dict/dicthistory.bk;
 mv $HOME/dict/dicthistory.bk $HOME/dict/dicthistory;
 echo ":: Requested item $1 successfully deleted";
}
