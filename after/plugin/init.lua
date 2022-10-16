local Remap = require("gip.keymap")
local nnoremap = Remap.nnoremap


nnoremap("<leader>f", function()
    vim.lsp.buf.formatting()
end)
