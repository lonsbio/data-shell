# data-shell: Finder and bash sync

Custom material for [Software Carpentry](http://software-carpentry.org/) instructors (with a Mac!) for syncing a Finder window with the current working directory in `bash`. It also has other changes to `clear` and `PS1` useful for teaching the `shell-novice` lesson.

See this [video](https://youtu.be/pMAWjMS_rww) for a short demonstration.

## Requirements

- Mac OS X (tested on 10.11, others likely will be ok)

## Usage

The only file that currently differs from the canonical lessons is `.bash_profile`, which contains the functions that can imported into the shell by:

```
source .bash_profile
```


## How

Applescript is trigged by an alias of `cd` and run after a success.

```bash
function set_finder_target () {
  current_dir=`pwd`
 finderPath=`osascript -e "
tell application \"Finder\" to set target of window 1  to  (\"$current_dir\" as POSIX file)"`
}

function cd_swc () {
cd "$@" && set_finder_target
}

alias cd='cd_swc'
```
### Download

However for ease of use in preparing for a lesson, the file structure can be [downloaded from the archive directly on GitHub](https://github.com/lonsbio/data-shell/archive/shell_gui_link.zip) and then renamed from `data-shell-shell_gui_link` to `data-shell`. It can then be used by the instructor in place of the files the learners have.


### Local clone

This clone also works if emulating "Nelle" on a Mac filesystem. On a clean user installation of the username `nelle` open a terminal and a Finder window. In terminal:

```
cd ~/Desktop
git clone https://github.com/lonsbio/data-shell.git
source data-shell/.bash_profile
cd data-shell
```



#### Modify or update from SWC

To get only the `data-shell` changes, the following can be performed when using the local clone:

```
# get only the data-shell directory from upstream
git remote add upstream https://github.com/swcarpentry/shell-novice
git fetch upstream gh-pages
git checkout upstream/gh-pages
git subtree split --prefix=data-shell -b temp_compare_upstream

# compare to current and merge
git checkout shell_gui_link
git merge temp_compare_upstream
git branch -D temp_compare_upstream

```
