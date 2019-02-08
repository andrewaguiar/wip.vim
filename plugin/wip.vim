command! -bar -nargs=? WIP
      \ call s:WIP() |

function! s:WIP() abort
  let l:wip = system("echo \"$(git rev-parse --show-toplevel) @ $(git branch | grep \\* | cut -d ' ' -f2)\" | /usr/bin/md5sum |/bin/cut -f1 -d \" \"")
  let l:wipfile = "~/.wip/" . l:wip

  if !isdirectory("~/.wip/")
    call mkdir("~/.wip/", "p")
  endif

  execute ("e " . l:wipfile)
endfunction
