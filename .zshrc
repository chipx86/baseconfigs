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

which autojump

if [ "$?" -eq "0" ]; then
	function preexec() {
		(autojump -a "$(pwd -P)"&)>/dev/null
	}

	alias jumpstat="autojump --stat"

	function j { new_path="$(autojump $@)";if [ -n "$new_path" ]; then echo -e "\\033[31m${new_path}\\033[0m"; cd "$new_path";fi }
fi
