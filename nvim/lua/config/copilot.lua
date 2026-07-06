vim.keymap.set('i', '<c-y>', 'copilot#Accept("\\<CR>")', {
    expr = true,
    replace_keycodes = false
})
vim.keymap.set('i', '<C-e>', '<Plug>(copilot-accept-line)')
vim.keymap.set('i', '<C-f>', '<Plug>(copilot-accept-word)')
vim.g.copilot_no_tab_map = true
