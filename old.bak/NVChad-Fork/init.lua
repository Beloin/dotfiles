vim.g.base46_cache = vim.fn.stdpath "data" .. "/nvchad/base46/"
vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
    config = function()
      require "options"
    end,
  },

  { import = "plugins" },
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "nvchad.autocmds"

vim.schedule(function()
  require "mappings"
end)


-- This adds on VimEnter autocmds

local autocmd = vim.api.nvim_create_autocmd
autocmd('VimEnter', {  
  callback = function()
    local gsn = require('gitsigns')
    gsn.toggle_current_line_blame()
  end,
  once = true
})

-- autocmd('VimEnter', {  
--   callback = function()
--     local args = vim.v.argv
--     if #args > 1 then
--       if args[3] == '.' then
--         require('session-manager').load_current_dir_session()
--       end
--     end
--     print(args)
--   end,
--   once = true
-- })

autocmd('TextYankPost', {
  callback = function() vim.highlight.on_yank() end,
  desc = "Briefly highlight yanked text"
})