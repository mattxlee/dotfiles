vim.cmd [[
    function! ToggleGstatus() abort
        let g:prev_window = winnr()
        for l:winnr in range(1, winnr('$'))
            if !empty(getwinvar(l:winnr, 'fugitive_status'))
                exe l:winnr 'close'
                return
            endif
        endfor
        keepalt Git
        exe g:prev_window . 'wincmd w'
    endfunction
]]
