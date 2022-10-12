local Remap = require("gip.keymap")
local nnoremap = Remap.nnoremap

nnoremap("<Leader>ff", function()
    require('telescope.builtin').find_files()
end)

nnoremap("<leader>fw", function()
    require('telescope.builtin').live_grep { search = vim.fn.expand("<cword>") }
end)
