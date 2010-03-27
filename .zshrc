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

