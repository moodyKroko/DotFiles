# Aliases {{{

# Git {{{
alias gs='git status -sb'
alias gaa='git add --all'
alias gb='git branch'
alias clone='git clone'
alias gco='git checkout'
alias gcob='git checkout -b'
alias gd='git diff'
alias fetch='git fetch'
alias gc='git commit -m $2'
alias gp='git push'
alias gpo='git push origin'
alias gpl='git pull'
alias gplo='git pull origin'
alias tag='git tag'
alias newtag='git tag -a'
alias gl="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

    # }}}

# system {{{
alias myip='curl http://ipecho.net/plain; echo'
alias ..='cd ..'
alias ~='cd ~'
alias ls='ls -F --color=auto'
alias l.='ls -d .* --color=auto'
alias ll='ls -lh'
alias la='ls -lA'
alias rm='rm -iv'
alias myip='curl http://ipecho.net/plain; echo'
alias c='clear'
alias mkdir='mkdir -pv'
alias now='date +"%T"'
alias nowtime=now
alias nowdate='date +"%d-%m-%Y"'
# confirmation
alias mv='mv -i'
alias cp='cp -i'
alias ln='ln -i'
alias wget='wget -c'

    # }}}

# grep {{{
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

    # }}}

# configurations {{{
alias bshconf='vim ~/.bashrc'
alias gconfig='vim ~/.gitconfig'
alias vconfig='vim /c/Users/james/AppData/Local/nvim/init.vim'

alias vim='C:/tools/neovim/Neovim/bin/nvim.exe'
alias python='python3'

    # }}}

# }}}

# Prompt style {{{
if test -f /etc/profile.d/git-sdk.sh
then
	TITLEPREFIX=SDK-${MSYSTEM#MINGW}
else
	TITLEPREFIX=$MSYSTEM
fi

if test -f ~/.config/git/git-prompt.sh
then
	. ~/.config/git/git-prompt.sh
else
	PS1='\[\033]0;$TITLE$PWD\007\]' # set window title
	PS1="$PS1"'\n'                 # new line
	PS1="$PS1"'\[\033[32m\]'       # change to green
	PS1="$PS1"'\u@\h '             # user@host<space>
	#PS1="$PS1"'\[\033[35m\]'       # change to purple
	#PS1="$PS1"'$MSYSTEM '          # show MSYSTEM
	PS1="$PS1"'\[\033[33m\]'       # change to brownish yellow
	PS1="$PS1"'\W'                 # current working directory
	if test -z "$WINELOADERNOEXEC"
	then
		GIT_EXEC_PATH="$(git --exec-path 2>/dev/null)"
		COMPLETION_PATH="${GIT_EXEC_PATH%/libexec/git-core}"
		COMPLETION_PATH="${COMPLETION_PATH%/lib/git-core}"
		COMPLETION_PATH="$COMPLETION_PATH/share/git/completion"
		if test -f "$COMPLETION_PATH/git-prompt.sh"
		then
			. "$COMPLETION_PATH/git-completion.bash"
			. "$COMPLETION_PATH/git-prompt.sh"
			PS1="$PS1"'\[\033[36m\]'  # change color to cyan
			PS1="$PS1"'`__git_ps1`'   # bash function
		fi
	fi
	PS1="$PS1"'\[\033[0m\]'        # change color
	PS1="$PS1"'\n'                 # new line
	PS1="$PS1"'$ '                 # prompt: always $
fi

MSYS2_PS1="$PS1"               # for detection by MSYS2 SDK's bash.basrc
PROMPT_DIRTRIM=1

# Evaluate all user-specific Bash completion scripts (if any)
if test -z "$WINELOADERNOEXEC"
then
	for c in "$HOME"/bash_completion.d/*.bash
	do
		# Handle absence of any scripts (or the folder) gracefully
		test ! -f "$c" ||
		. "$c"
	done
fi
# }}}

# Git status options
export GIT_PS1_SHOWSTASHSTATE=true
export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWUNTRACKEDFILES=true
export GIT_PS1_SHOWUPSTREAM="auto"
