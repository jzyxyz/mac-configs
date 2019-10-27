# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

alias datefmt='date +%m-%d-%Y'

# Path to your oh-my-zsh installation.
export ZSH="/Users/zhongyuanjin/.oh-my-zsh"
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion" ] && . "/usr/local/opt/nvm/etc/bash_completion"  # This loads nvm bash_completion
export PATH="/usr/local/opt/ruby/bin:$PATH"
export PATH="/Users/zhongyuanjin/Sourcecode/macos-config/shellscripts:$PATH"
export PATH="/Users/zhongyuanjin/Sourcecode/macos-config:$PATH"
export LDFLAGS="-L/usr/local/opt/ruby/lib"
export PATH="/usr/local/opt/flutter/bin:$PATH"
export CPPFLAGS="-I/usr/local/opt/ruby/include"
export PATH="$PATH:$(ruby -e 'puts Gem.bindir')"

alias lens='node /Users/zhongyuanjin/Sourcecode/SpotifyLens/run.js'
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
source $(dirname $(gem which colorls))/tab_complete.sh

alias frun='flutter emulators --launch apple_ios_simulator'

#------------------
# Zsh hooks
#------------------

# Enable the addition of zsh hook functions
autoload -U add-zsh-hook

# Load NVM and NVM bash completion
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" 

# Automatically switch and load node versions when a directory has a `.nvmrc` file
load-nvmrc() {
  local node_version="$(nvm version)" # Current node version
  local nvmrc_path="$(nvm_find_nvmrc)" # Path to the .nvmrc file

  # Check if there exists a .nvmrc file
  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    # Check if the node version in .nvmrc is installed on the computer
    if [ "$nvmrc_node_version" = "N/A" ]; then
      # Install the node version in .nvmrc on the computer and switch to that node version
      nvm install
    # Check if the current node version matches the version in .nvmrc
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      # Switch node versions
      nvm use
    fi
  # If there isn't an .nvmrc make sure to set the current node version to the default node version
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
# Run load-nvmrc on initial shell load
load-nvmrc

# Set the tab title to the current working directory before each prompt
function tabTitle () {
  window_title="\033]0;${PWD##*/}\007"
  echo -ne "$window_title"
}

function killat () {
  lsof -ti tcp:$1 | xargs kill
}

function md() { [ $# = 1 ] && mkdir -p "$@" && cd "$@" || echo "Error - no directory passed!"; }

# Executes load-nvmrc when the present working directory (pwd) changes
# add-zsh-hook chpwd load-nvmrc
# Executes tabTitle before each prompt
add-zsh-hook precmd tabTitle

# Allow the use of the z plugin to easily navigate directories
. /usr/local/etc/profile.d/z.sh

# Set Spaceship ZSH as a prompt
autoload -U promptinit
promptinit
prompt spaceship

source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Git Aliases
alias gitlog='git log --oneline --decorate --graph --all'
# Remove local branches that have already been merged in the remote repository
alias gcmb="git branch --merged | grep -Ev '(^\*|master)' | xargs git branch -d"
# Sets the upstream branch to be the same branch as the locally named branch
alias gset='git branch --set-upstream-to=origin/`git symbolic-ref --short HEAD`'
# Do an interactive rebase back N number of commits (e.g. grn 3)
grn() { git rebase -i HEAD~"$1"; }
# Do an interactive rebase to a supplied commit hash (e.g. grbc 80e1625)
grbic() { git rebase -i "$1"; }

# General Aliases

# Open .zshrc to be editor in VS Code
alias change="code ~/.zshrc"
# Re-run source command on .zshrc to update current terminal session with new settings
alias update="source ~/.zshrc"
alias cl="colorls"
# cd into iCloud drive folder in terminal
alias icloud="cd ~/Library/Mobile\ Documents/com~apple~CloudDocs"
# View files/folder alias using colorsls (https://github.com/athityakumar/colorls)
alias treehere='colorls -x --almost-all --tree=1'
alias ll='colorls --group-directories-first --almost-all --long --sd --gs'
alias src='cd ~/Sourcecode'
alias crs='cd ~/Courses'

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git docker docker-compose npm node)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"



# heroku autocomplete setup
HEROKU_AC_ZSH_SETUP_PATH=/Users/zhongyuanjin/Library/Caches/heroku/autocomplete/zsh_setup && test -f $HEROKU_AC_ZSH_SETUP_PATH && source $HEROKU_AC_ZSH_SETUP_PATH;
# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/zhongyuanjin/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/zhongyuanjin/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/zhongyuanjin/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/zhongyuanjin/Downloads/google-cloud-sdk/completion.zsh.inc'; fi
function gi() { curl -sLw n https://www.gitignore.io/api/$@ ;}
