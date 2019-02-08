function! s:WIPFile() abort
  let l:wip = system("echo \"$(git rev-parse --show-toplevel) @ $(git branch | grep \\* | cut -d ' ' -f2)\" | /usr/bin/md5sum |/bin/cut -f1 -d \" \"")
  return "~/.wip/" . l:wip
endfunction

function! s:EnsureWIPDirExists() abort
  if !isdirectory("~/.wip/")
    call mkdir("~/.wip/", "p")
  endif
endfunction

command! -bar -nargs=? WIP
      \ call s:WIP() |

function! s:WIP() abort
  l:EnsureWIPDirExists()
  let l:wipfile = s:WIPFile()

  execute ("e " . s:WIPFile())
endfunction

command! -bar -nargs=? WIPClean
      \ call s:WIPClean() |

function! s:WIPClean() abort
  l:EnsureWIPDirExists()
  let l:wipfile = s:WIPFile()

  system("rm -rf " . l:wipfile)
endfunction
