require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })

map("n", "<leader>fm", function()
  require("conform").format()
end, { desc = "File Format with conform" })

map("i", "jk", "<ESC>", { desc = "Escape insert mode" })

-- tnoremap <Esc> <C-\><C-n>
map("t", "<ESC>", "<C-\\><C-n>", { desc = "Escape insert mode" })

-- TODO: Add Format with conform when using C-M-l
map("i", "<C><M-l>", function()
  require("conform").format()
end, { desc = "File Format with conform" })
-- map('i', "<F2>", )