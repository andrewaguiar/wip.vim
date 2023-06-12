function! s:WIPFile() abort
  let l:wip = system("echo \"$(git rev-parse --show-toplevel|tr '\.' '-')--at--$(git branch | grep \\* | cut -d ' ' -f2)\"")
  return ($HOME . "/.wip.vim/" . l:wip . ".md")
endfunction

function! s:EnsureWIPDirExists() abort
  if !isdirectory($HOME . "/.wip.vim/")
    call mkdir($HOME . "/.wip.vim/", "p")
  endif
endfunction

" WIP: creates the WIP file
command! -bar -nargs=? WIP
      \ call s:WIP() |

function! s:WIP() abort
  call s:EnsureWIPDirExists()
  let l:wipfile = s:WIPFile()
  execute ("e " . s:WIPFile())
endfunction

" WIPClean: removes the current WIP file
command! -bar -nargs=? WIPClean
      \ call s:WIPClean() |

function! s:WIPClean() abort
  call s:EnsureWIPDirExists()
  let l:wipfile = s:WIPFile()
  call system("rm -rf " . l:wipfile)
endfunction

" WIPCleanAll: removes all WIP files
command! -bar -nargs=? WIPCleanAll
      \ call s:WIPCleanAll() |

function! s:WIPCleanAll() abort
  call system("rm -rf " . $HOME . "/.wip.vim/*")
endfunction
