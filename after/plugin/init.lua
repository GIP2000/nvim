local Remap = require("gip.keymap")
local nnoremap = Remap.nnoremap


nnoremap("<leader>lf", function()
    vim.lsp.buf.formatting()
end)
