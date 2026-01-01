-- shortcuts
vim.keymap.set("n", "<Leader>m", ":Mason<CR>")
vim.keymap.set("n", "<Leader>d", vim.diagnostic.open_float, { desc = "Show diagnostics under cursor" })
vim.keymap.set("n", "<C-k>", vim.lsp.buf.hover, { desc = "Show hover documentation" })
vim.keymap.set("n", "<Leader>rn", vim.lsp.buf.rename, { desc = "Rename current symbol" })
vim.keymap.set("n", "<Leader>rs", ":LspRestart<CR>", { desc = "Restart LSP" })
vim.keymap.set("n", "<Leader>ca", vim.lsp.buf.code_action, { desc = "Show code actions" })
vim.keymap.set("n", "<leader>cl", function()
    vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end, { desc = "Toggle inlay hints" })

-- format code
require("conform").setup({
    formatters_by_ft = {
        htmldjango = { "djlint" },
    },
})

vim.api.nvim_create_user_command("Format", function(args)
    local range = nil
    if args.count ~= -1 then
        local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
        range = {
            start = { args.line1, 0 },
            ["end"] = { args.line2, end_line:len() },
        }
    end
    require("conform").format({ async = true, lsp_format = "fallback", range = range })
end, { range = true })
vim.keymap.set("n", "<Leader>i", ":Format<CR>", { desc = "Format current document" })

-- mason
require("mason").setup(
    {
        ui = {
            width = 0.9,
            height = 0.9,
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

-- specific language servers settings
vim.lsp.config("rust_analyzer", {
    settings = {
        ["rust-analyzer"] = {
            check = {
                command = "clippy"
            }
        }
    }
})

-- tree-sitter
require("nvim-treesitter").setup({
    -- A list of parser names, or "all" (the listed parsers MUST always be installed)
    ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline" },

    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,

    -- Automatically install missing parsers when entering buffer
    -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
    auto_install = true,

    -- List of parsers to ignore installing (or "all")
    ignore_install = {},

    ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
    -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

    highlight = {
        enable = true,

        -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
        -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
        -- the name of the parser)
        -- list of language that will be disabled
        -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
        disable = function(lang, buf)
            local max_filesize = 100 * 1024 -- 100 KB
            local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
            if ok and stats and stats.size > max_filesize then
                return true
            end
        end,

        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = false,
    },
})

-- cmp
vim.diagnostic.config({
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = "󰅚 ",
            [vim.diagnostic.severity.WARN] = "󰀪 ",
            [vim.diagnostic.severity.HINT] = "󰌵 ",
            [vim.diagnostic.severity.INFO] = "󰋽 ",
        },
    },
})

local auto_select = true
local luasnip = require("luasnip")
local cmp = require("cmp")

luasnip.filetype_extend("htmldjango", { "html" })

cmp.setup({
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    completion = {
        completeopt = "menu,menuone" .. (auto_select and "" or ",noselect"),
        -- autocomplete = false,
    },
    preselect = auto_select and cmp.PreselectMode.Item or cmp.PreselectMode.None,
    window = {
        completion = cmp.config.window.bordered({ winhighlight = "Normal:CmpNormal,CursorLine:CmpSel" }),
        documentation = cmp.config.window.bordered({ winhighlight = "Normal:CmpNormal" }),
    },
    mapping = cmp.mapping.preset.insert({
        ["<C-u>"] = cmp.mapping.scroll_docs(-4),
        ["<C-d>"] = cmp.mapping.scroll_docs(4),
        ["<C-l>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<C-y>"] = cmp.mapping.confirm({ select = auto_select }),
        -- LuaSnip jump mappings
        ["<C-f>"] = cmp.mapping(function(fallback)
            if luasnip.jumpable(1) then
                luasnip.jump(1)
            else
                fallback()
            end
        end, { "i", "s" }),
        ["<C-b>"] = cmp.mapping(function(fallback)
            if luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { "i", "s" }),
    }),
    sources = cmp.config.sources({
        { name = "nvim_lsp_signature_help", group_index = 2 },
        { name = "nvim_lsp",                group_index = 2 },
        { name = "luasnip",                 group_index = 2 },
    }, {
        { name = "path", group_index = 2 },
        -- { name = "buffer", group_index = 2 },
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

-- flutter
require("flutter-tools").setup()

-- crates
require("crates").setup {
    lsp = {
        enabled = true,
        actions = true,
        completion = true,
        hover = true,
    },
    popup = {
        border = "rounded",
    }
}
