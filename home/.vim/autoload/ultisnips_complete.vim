"http://stackoverflow.com/questions/14896327/ultisnips-and-youcompleteme/18685821#18685821
"https://github.com/Valloric/YouCompleteMe/issues/36
function! g:UltiSnips_Complete()
    call UltiSnips#ExpandSnippet()
    if g:ulti_expand_res == 0
        if pumvisible()
            return "\<C-n>"
        else
            call UltiSnips#JumpForwards()
            if g:ulti_jump_forwards_res == 0
               return "\<TAB>"
            endif
        endif
    endif
    return ""
endfunction
