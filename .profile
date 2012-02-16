# MacPorts Installer addition on 2009-06-02_at_11:15:44: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:~/Library/android-sdk-macosx/tools:~/.gem/ruby/1.8/bin:$PATH
export PATH="/System/Library/Frameworks/JavaVM.framework/Versions/1.6.0/Home/bin:~/bin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.

export JAVA_HOME="/System/Library/Frameworks/JavaVM.framework/Versions/1.6.0/Home"
export ANT_HOME=/usr/share/ant
export GRAILS_HOME="/opt/local/share/java/grails"
export CATALINA_OPTS="-server -Xmx256m"
export RABBITMQ_NODENAME='svz-pcn-205'
export CFLAGS="-O2 -pipe"
export CXXFLAGS=${CFLAGS}
export MAKEOPTS="-j4"
export PYTHONSTARTUP=~/.pythonstartup
export M2_REPO=~/.m2
export ANDROID_HOME=~/Library/android-sdk-macosx

# history management
export HISTCONTROL=ignoredups
PROMPT_COMMAND="history -a; $PROMPT_COMMAND"
export HISTSIZE=10000

export EDITOR=vim
export GREP_OPTIONS='--color=auto' GREP_COLOR='1;32'
export C_INCLUDE_PATH=/opt/local/include
export CXX_INCLUDE_PATH=/opt/local/include
export CPATH=/opt/local/include
export LIBRARY_PATH=/opt/local/lib
export DYLD_FALLBACK_LIBRARY_PATH=/opt/local/include:/opt/local/lib
export CPPFLAGS="-I/opt/local/include"

# for https://github.com/sickill/stderred
# export DYLD_INSERT_LIBRARIES=${HOME}/project/stderred/lib/stderred.dylib 
# export DYLD_FORCE_FLAT_NAMESPACE=1

export MAVEN_OPTS="-Xmx2048m -XX:MaxPermSize=512m"

# convenient ssh handling
SSHAGENT=$(which ssh-agent)
SSHADD=$(which ssh-add)
SSHAGENTARGS="-s -t 21600" # add with lifetime 6h
SSH_ENV="$HOME/.ssh/environment"

function start_agent {
     echo "Initialising new SSH agent..."
     ${SSHAGENT} ${SSHAGENTARGS}
     echo "...success"
     ${SSHADD};
}

function check_agent {
    ps -ef | grep "${SSHAGENT} ${SSHAGENTARGS}$" > /dev/null || {
         start_agent;
    }
}
 
alias ssh='check_agent; ssh'

# enable color support of ls and also add handy aliases
if [ "$TERM" != "dumb" ] && [ -x /usr/bin/dircolors ]; then
    # eval "`/usr/bin/dircolors -b`"
    eval `/usr/bin/dircolors $HOME/.dir_colors`
    alias ls='ls --color=auto'
    #alias dir='ls --color=auto --format=vertical'
    #alias vdir='ls --color=auto --format=long'

    #alias grep='grep --color=auto'
    #alias fgrep='fgrep --color=auto'
    #alias egrep='egrep --color=auto'
fi

alias ll='ls -l'
alias la='ls -lAh'
alias l='ls -CF'
alias free='top -l 1 | grep Phys'
alias top='top -o cpu'
alias grep="grep --exclude='all-wcprops' --exclude='*.tmp' --exclude='entries' --exclude='*.svn-base' --exclude='*.svn*' "
alias meld='/Applications/DiffMerge.app/Contents/MacOS/diffmerge.sh'
