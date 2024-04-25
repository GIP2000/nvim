local Remap = require("gip.keymap")
local nnoremap = Remap.nnoremap
local vnoremap = Remap.vnoremap
local inoremap = Remap.inoremap
local xnoremap = Remap.xnoremap

xnoremap("<leader>p", '"_dP')
Remap.nmap("<leader>y", '"*y')

nnoremap("j", "gj")
nnoremap("gj", "j")
vnoremap("gj", "j")
vim.keymap.set("v", "j", "mode() ==# 'v' ? 'gj' : 'j'", { noremap = false, expr = true })

nnoremap("k", "gk")
nnoremap("gk", "k")
vnoremap("gk", "k")
vim.keymap.set("v", "k", "mode() ==# 'v' ? 'gk' : 'k'", { noremap = false, expr = true })

nnoremap("<leader>c", ":q<CR>")
nnoremap("<leader>gs", ":Git<CR>")

-- Move line up or down
nnoremap("<C-k>", ":m -2<CR>==")
nnoremap("<C-j>", ":m +1<CR>==")
inoremap("<C-j>", "<Esc>:m +1<CR>==gi")
inoremap("<C-k>", "<Esc>:m -2<CR>==gi")
vnoremap("<C-j>", ":m '>+1<CR>gv=gv")
vnoremap("<C-k>", ":m '<-2<CR>gv=gv")

-- Split stuff
nnoremap("<C-h>", "<C-w>h")
nnoremap("<C-l>", "<C-w>l")
-- nnoremap("<C-j>", "<C-w>j")
-- nnoremap("<C-k>", "<C-w>k")
nnoremap("<leader>v", "<C-w>v")
nnoremap("<leader>s", ":horizontal split<CR>")
