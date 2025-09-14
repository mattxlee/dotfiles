-- shortcuts
vim.keymap.set("n", "<Leader>m", ":Mason<CR>")
vim.keymap.set("n", "<Leader>d", vim.diagnostic.open_float, { desc = "Show diagnostics under cursor" })
vim.keymap.set("n", "<C-k>", vim.lsp.buf.hover, { desc = "Show hover documentation" })
vim.keymap.set("n", "<Leader>i", vim.lsp.buf.format, { desc = "Format current document" })
vim.keymap.set("n", "<Leader>ca", vim.lsp.buf.code_action, { desc = "Show code actions" })
vim.keymap.set("n", "<Leader>rn", vim.lsp.buf.rename, { desc = "Rename current symbol" })
vim.keymap.set("n", "<Leader>rs", ":LspRestart<CR>", { desc = "Restart LSP" })
vim.keymap.set("n", "<leader>l", function()
    vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end, { desc = "Toggle inlay hints" })

-- mason
require("mason").setup(
    {
        ui = {
            backdrop = 100,
        }
    }
)

-- mason-lspconfig
require("mason-lspconfig").setup({
    ensure_installed = { "lua_ls", "vimls" },
    automatic_installation = true,
    automatic_enable = true,
})

-- cmp
local cmp = require("cmp")
cmp.setup({
    snippet = {
        expand = function(args)
            require("luasnip").lsp_expand(args.body)
        end,
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        ["<C-u>"] = cmp.mapping.scroll_docs(-4),
        ["<C-d>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<TAB>"] = cmp.mapping.confirm({ select = true }),
    }),
    sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" },
    }, {
        { name = "path" },
        { name = "buffer" },
    })
})
cmp.setup.filetype("gitcommit", {
    sources = cmp.config.sources({
        { name = "git" },
    }, {
        { name = "buffer" },
    })
})

-- cmp-git
require("cmp_git").setup()

-- use clippy with rust-analyzer
require('lspconfig').rust_analyzer.setup {
    settings = {
        ['rust-analyzer'] = {
            check = {
                command = 'clippy',
                extraArgs = {},
            },
        },
    }
}
