require('trim').setup({
    ft_blocklist = {},
    patterns = {
        [[%s/\(\n\n\)\n\+/\1/]], -- replace multiple blank lines with a single line
    },
    trim_on_write = false,
    highlight = true
})
vim.keymap.set("n", "<Leader>x", ":Trim<CR>")