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
local auto_select = true
local luasnip = require("luasnip")
local cmp = require("cmp")
cmp.setup({
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    completion = {
        completeopt = "menu,menuone" .. (auto_select and "" or ",noselect"),
        autocomplete = { require("cmp.types").cmp.TriggerEvent.TextChanged },
    },
    preselect = auto_select and cmp.PreselectMode.Item or cmp.PreselectMode.None,
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        ["<C-u>"] = cmp.mapping.scroll_docs(-4),
        ["<C-d>"] = cmp.mapping.scroll_docs(4),
        ["<C-l>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping.confirm({ select = auto_select }),
        -- LuaSnip jump mappings
        ["<TAB>"] = cmp.mapping(function(fallback)
            if luasnip.jumpable(1) then
                luasnip.jump(1)
            else
                fallback()
            end
        end, { "i", "s" }),
        ["<S-TAB>"] = cmp.mapping(function(fallback)
            if luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { "i", "s" }),
    }),
    sources = cmp.config.sources({
        { name = "nvim_lsp_signature_help", group_index = 1 },
        { name = "nvim_lsp", group_index = 1 },
        { name = "luasnip", group_index = 2 },
        { name = "copilot", group_index = 3 },
    }, {
        { name = "path", group_index = 1 },
        { name = "buffer", group_index = 1 },
    }),
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
