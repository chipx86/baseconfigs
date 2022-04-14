# .zshrc

## Modularity makes things nice.
ZSHRCDIR=~/.zsh

## User specific aliases and functions

###
### Interface
###

###
### Environemnt
###
source $ZSHRCDIR/pre-localrc >/dev/null 2>&1

source $ZSHRCDIR/envrc

## Command prompt
source $ZSHRCDIR/promptrc

## Aliases
source $ZSHRCDIR/aliasrc

## Completion Control
source $ZSHRCDIR/completionrc

## Various options
source $ZSHRCDIR/optrc

## Key bindings
source $ZSHRCDIR/bindingsrc

# Functions
source $ZSHRCDIR/functionsrc

# Styles
source $ZSHRCDIR/stylerc

###
### Various Things to Run
###
source $ZSHRCDIR/runrc

# Local settings
source $ZSHRCDIR/localrc >/dev/null 2>&1

# Ensure that the first error code when starting the session is 0, so that
# the prompt won't show an error value.
true

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
