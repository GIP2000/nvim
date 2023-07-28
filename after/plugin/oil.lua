local oil = require("oil")
local Remap = require("gip.keymap")
oil.setup()
local nnoremap = Remap.nnoremap

nnoremap("<leader>e", "<cmd>Oil<CR>")
