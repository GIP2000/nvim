local Remap = require("gip.keymap")
local nnoremap = Remap.nnoremap

nnoremap("<leader>ff", function()
	require("telescope.builtin").find_files()
end)

nnoremap("<leader>fr", function()
	require("telescope.builtin").resume()
end)

nnoremap("<leader>fd", function()
	require("telescope.builtin").diagnostics()
end)

nnoremap("<leader>flr", function()
	require("telescope.builtin").lsp_references()
end)

nnoremap("<leader>fli", function()
	require("telescope.builtin").lsp_implementations()
end)

nnoremap("<leader>fw", function()
	require("telescope.builtin").live_grep({ search = vim.fn.expand("<cword>") })
end)
