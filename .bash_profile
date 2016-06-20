# This file usually contains settings to customize the shell (terminal).
# There may also be similar files called .bashrc or .bash_login.
# For the public lesson material it does not contain any settings.

# For this custom material for SWC instructors (with a Mac!) it contains
# functions and aliases for syncing a Finder window with the current
# working directory. It also has other settings useful for teaching.


# Match materials
export PS1='$ '

#Avoid habit of clearing the screen
alias clear='echo;echo;echo;'

# Adjust a finder window everytime 'cd' is called
function set_finder_target () {
  current_dir=`pwd`
 finderPath=`osascript -e "
tell application \"Finder\" to set target of window 1  to  (\"$current_dir\" as POSIX file)"`
}

function cd_swc () {
cd "$@" && set_finder_target 
}

alias cd='cd_swc'



