# ~/.zshrc

# ZSH config
export ZSH="/home/nate/.oh-my-zsh"
ZSH_THEME="endo"
plugins=(git k)
source $ZSH/oh-my-zsh.sh

# Automatically update without prompting.
DISABLE_UPDATE_PROMPT="true"


# Preferences
export LANG=en_US.UTF-8
export EDITOR="nvim"


# Path
export PATH=$PATH:/usr/local/go/bin    # Go
export PATH=$PATH:$(go env GOPATH)/bin # Go
export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"
export DENO_INSTALL="/home/nate/.deno" # Deno
export PATH="$DENO_INSTALL/bin:$PATH"  # Deno
export PATH=$PATH:/home/nate/flutter/bin/
source $HOME/.cargo/env # Rust


# CLI helpers
eval "$(fasd --init auto)"
eval "$(thefuck --alias)"


# Aliases
alias an="sudo apt install"
alias au="sudo apt update"
alias ag="sudo apt upgrade"
alias nv="nvim"
alias f="fuck"
alias gplme="cp ~/Projects/licenses/gplv3.txt ./LICENSE"
alias hr="printf '─%.0s' {1..$(tput cols)}"
deltag() { git tag -d $1 && git push --delete origin $1 }
alias xt="sleep 2 && xdotool type"
alias bfg="java -jar /home/nate/apps/bfg-1.14.0.jar"
alias clip="xclip -selection clipboard"
dockerclean() {
	docker kill $(docker ps -aq)
	docker rm $(docker ps -aq)
	docker image rm $(docker image ls -aq)
}
sshedit() {
    nv ~/.ssh/configs/"$1".conf
    cat ~/.ssh/configs/*.conf > ~/.ssh/config
}

# GTK VTE Fix
if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
        source /etc/profile.d/vte.sh
fi

# Android development
export ANDROID_NDK_HOME=/home/nate/Android/android-ndk-r21e
export ANDROID_HOME=/home/nate/Android/Sdk/
