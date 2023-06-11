require("gip.set")
require("gip.packer")
require("gip.remap")
require("gip.telescope")
require("gip.neogit")

local augroup = vim.api.nvim_create_augroup
GIPGroup = augroup('GIP', {})

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup('HighlightYank', {})
local netrw_group = augroup('NetRw', {})

function R(name)
    require("plenary.reload").reload_module(name)
end

autocmd('TextYankPost', {
    group = yank_group,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 40,
        })
    end,
})

autocmd({ "BufWritePre" }, {
    group = GIPGroup,
    pattern = "*",
    command = "%s/\\s\\+$//e",
})

autocmd({ "BufWritePre" }, {
    group = GIPGroup,
    pattern = "*",
    callback = function()
        vim.lsp.buf.format()
    end
})

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
