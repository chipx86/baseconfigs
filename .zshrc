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

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
