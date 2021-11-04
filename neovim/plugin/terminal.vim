" create a better terminal experience
"
" - close buffer when exiting with error_code = 0
" - disable line numbers in terminal buffers
" - set background color to black

func! s:getExitStatus() abort
    let ln = line('$')
    while ln >= 1
        let l = getline(ln)
        let ln -= 1
        let exitCode = substitute(l, '^\[Process exited \([0-9]\+\)\]$', '\1', '')
        if l != '' && l == exitCode
            break
        elseif exitCode != ''
            return str2nr(exitCode)
        endif
    endwhile
    throw 'Could not determine exit status for buffer, ' . expand('%')
endfunc

func! s:afterTermClose() abort
    if s:getExitStatus() == 0
        bdelete!
    endif
endfunc

hi BlackBg guibg=black
function TerminalBufferSettings()
    setlocal winhighlight=Normal:BlackBg 
    setlocal nonumber
    setlocal norelativenumber
endfunction

augroup TERM
    autocmd!
    autocmd TermOpen term://*/zsh call TerminalBufferSettings()
    autocmd TermClose term://*/zsh call timer_start(20, { -> s:afterTermClose() })
augroup END
