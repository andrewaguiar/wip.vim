# WIP (Fast and simple notes based on projects and git branches)

## Motivation

Sometimes working in a task I want to take notes about the code, about the task I am doing
itself and mark some files I am working on. Generally I simply created a WIP file in my
documents and always used that file. But as I started working on other branches and projects
this files usually became a mess. I started then separate this WIP files by projects and branches.

Wip does the same, but in a automated way, it gets your current project plus your current git branch
and creates a markdown file based in `CURRENT_PROJECT @ CURRENT_BRANCH` md5 in `$HOME/.wip` folder, like:

```
$HOME/.wip/4e46d54966c32d7597e5f5a06c467c7d.md
```

If you change projects or branches you don't need to worry about changing files for yourself, wip automatically
uses another files to it, so the only command you need to run to make your quick notes is `wip` =).

## Installing

```vim
call plug#begin()
Plug 'andrewaguiar/wip.vim'
call plug#end()
```

## Usage

Wip allows you create simple notes (markdown files) based on the project and the current branch
you are working on.

As long as you are inside a git repository you can run:

```shell
:WIP
```

Wip will create a text file (based on the "git current repo @ git current branch" md5) in `$HOME/.wip.vim` and open this file
using `vim`.
This way you can make quick notes, as you change to other projects or even branches wip will open new files,
so you don't need to remember where you stored your notes.

To remove the current WIP file from `$HOME/.wip.vim` use:

```vim
:WIPClean
```

To remove all WIP files from `$HOME/.wip.vim` use:

```vim
:WIPCleanAll
```
