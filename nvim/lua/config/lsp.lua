vim.keymap.set("n", "<Leader>m", ":Mason<CR>")
vim.keymap.set("n", "<Leader>d", vim.diagnostic.open_float, { desc = "Show diagnostics under cursor" })
vim.keymap.set("n", "<C-k>", vim.lsp.buf.hover, { desc = "Show hover documentation" })
vim.keymap.set("n", "<Leader>i", vim.lsp.buf.format, { desc = "Format current document" })
vim.keymap.set("n", "<Leader>ca", vim.lsp.buf.code_action, { desc = "Show code actions" })
vim.keymap.set("n", "<Leader>rn", vim.lsp.buf.rename, { desc = "Rename current symbol" })

require('lspconfig').rust_analyzer.setup {
    settings = {
        ['rust-analyzer'] = {
            check = {
                command = 'clippy',
                extraArgs = { '--all-features' },
            },
        },
    },
}
