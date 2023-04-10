local Remap = require("gip.keymap")
local nnoremap = Remap.nnoremap
local vnoremap = Remap.vnoremap
local inoremap = Remap.inoremap
local xnoremap = Remap.xnoremap

xnoremap("<leader>p", "\"_dP")

nnoremap("<leader>c", ":q<CR>")

-- Move line up or down
nnoremap("<C-k>", ":m -2<CR>==")
nnoremap("<C-j>", ":m +1<CR>==")
inoremap("<C-j>", "<Esc>:m +1<CR>==gi")
inoremap("<C-k>", "<Esc>:m -2<CR>==gi")
vnoremap("<C-j>", ":m '>+1<CR>gv=gv")
vnoremap("<C-k>", ":m '<-2<CR>gv=gv")

-- Split stuff
-- deprecated due to yabai
-- nnoremap("<C-h>", "<C-w>h")
-- nnoremap("<C-l>", "<C-w>l")
nnoremap("<leader>v", "<C-w>v")

nnoremap("<leader>e", "<cmd>Ex<CR>")
