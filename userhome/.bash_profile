export PATH=$PATH:/Applications/SageMath-8.0.app/

export PATH="/opt/local/bin:/opt/local/sbin:$PATH"

export PATH=/usr/local:$PATH
export PYENV_ROOT=/usr/local/var/pyenv

if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi

if [ $TERM == 'screen' ]; then
	export PS1='\u@\h:\W\$ '
        export PROMPT_COMMAND='echo -ne "\033k\033\0134\033k$(basename $(pwd))\033\\"'
else
	export PS1='\u@\h:\W\$ '
fi
