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

-- Create an autocommand for when LSP attaches to a buffer
-- local inlay_check_timer = vim.loop.new_timer()
-- vim.api.nvim_create_autocmd("LspAttach", {
--     callback = function(ev)
--         -- Create a repeating timer that checks every second
--         inlay_check_timer:start(0, 1000, vim.schedule_wrap(function()
--             -- Check if inlay hints are available and enable them
--             if vim.lsp.inlay_hint and vim.api.nvim_get_mode().mode ~= 'i' then
--                 vim.lsp.inlay_hint.enable(true)  -- Enable inlay hints when ready
--             end
--         end))
--     end,
-- })
-- Enable inlay hints only in normal mode
-- vim.api.nvim_create_autocmd({ 'InsertEnter' }, {
--     callback = function()
--         if vim.lsp.inlay_hint then
--             vim.lsp.inlay_hint.enable(false, { bufnr = 0 })
--         end
--     end,
-- })
-- vim.api.nvim_create_autocmd({ 'InsertLeave' }, {
--     callback = function()
--         if vim.lsp.inlay_hint then
--             vim.lsp.inlay_hint.enable(true, { bufnr = 0 })
--         end
--     end,
-- })
