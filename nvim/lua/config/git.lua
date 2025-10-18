local save_winid

local function is_fugitive_buf(winid)
    local buf = vim.api.nvim_win_get_buf(winid)
    local filetype = vim.api.nvim_buf_get_option(buf, 'filetype')
    return  filetype == 'fugitive' or filetype == 'gitcommit'
end

local function open_fugitive_status()
    local winid = vim.api.nvim_get_current_win()
    if not is_fugitive_buf(winid) then
        save_winid = winid
    end
    vim.cmd("Git")
end

local function close_fugitive_status()
    local do_restore = false
    local curr_winid = vim.api.nvim_get_current_win()
    for _, winid in ipairs(vim.api.nvim_list_wins()) do
        if is_fugitive_buf(winid) then
            if curr_winid == winid then
                do_restore = true
            end
            vim.api.nvim_win_close(winid, false)
        end
    end
    if do_restore and vim.api.nvim_win_is_valid(save_winid) then
        vim.api.nvim_set_current_win(save_winid)
    end
end

require('gitsigns').setup({})

vim.keymap.set("n", "<C-g>", open_fugitive_status)
vim.keymap.set('n', '<C-h>', close_fugitive_status)
