local lsp = require("lsp-zero")
local Remap = require("gip.keymap")
local nnoremap = Remap.nnoremap
local inoremap = Remap.inoremap
lsp.preset("recommended")

lsp.on_attach(function()
    nnoremap("K", function()
        vim.lsp.buf.hover()
    end)
    nnoremap("gd", function()
        vim.lsp.buf.definition()
    end)
    nnoremap("gi", function()
        vim.lsp.buf.implementation()
    end)
    nnoremap("<leader>vws", function()
        vim.lsp.buf.workspace_symbol()
    end)
    nnoremap("<leader>ld", function()
        vim.diagnostic.open_float()
    end)
    nnoremap("[d", function()
        vim.diagnostic.goto_next()
    end)
    nnoremap("]d", function()
        vim.diagnostic.goto_prev()
    end)
    nnoremap("<leader>la", function()
        vim.lsp.buf.code_action()
    end)
    nnoremap("gr", function()
        vim.lsp.buf.references()
    end)
    nnoremap("<leader>lr", function()
        vim.lsp.buf.rename()
    end)
    nnoremap("<leader>lh", function()
        vim.lsp.buf.signature_help()
    end)
end)


require('mason-lspconfig').setup({
  -- Replace the language servers listed here
  -- with the ones you want to install
  ensure_installed = {'tsserver', 'rust_analyzer'},
  handlers = {
    lsp.default_setup,
  },
})

local cmp = require("cmp")
cmp.setup({
    sources = {
        { name = 'cmp_tabnine' },
        { name = "nvim_lsp" },
    },
    mapping = {
        ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
        ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
        ["<C-y>"] = cmp.mapping.confirm({ select = true }),
        ["<C-Space>"] = cmp.mapping.complete(),
    }
})

lsp.setup()
