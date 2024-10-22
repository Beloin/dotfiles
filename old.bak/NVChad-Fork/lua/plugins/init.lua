
function configureImagePreview()
  local openFl = require("scripts.open_files")
  vim.keymap.set('n', '<leader>pp', openFl.call_gweenview, {desc = '[p]review images'})  
end

configureImagePreview()

return {
  {
    -- Code formatter
    "stevearc/conform.nvim",
    opts = require("configs.conform").opts,
    event = "VeryLazy",
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = {
      git = { enable = true },
    },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "bash",
        "html",
        "javascript",
        "cpp",
        "c",
        "c_sharp",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "tsx",
        "typescript",
        "vim",
        "yaml",
      },
    },
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },

  {
    "williamboman/mason.nvim",
    opts = {
       ensure_installed = {
         "lua-language-server",
         "html-lsp",
         "clangd",
         "cmakelang",
         "clang-format",
         "cpplint",
         "clangd",
         "cpptools",
         "jedi-language-server",
         "markdownlint",
         "pylint",
         "cmake-language-server",
         "autopep8",
         "clang-format",
         "clangd",
         "cmake-language-server",
         "cmakelang",
         "codelldb",
         "cpplint",
         "cpptools",
         "debugpy",
         "doctoc",
         "hadolint",
         "jedi-language-server",
         "jsonlint",
         "markdownlint",
         "pylint",
         "vale",
         "csharpier",
         "netcoredbg"
       },
     },
  },

  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {"williamboman/mason.nvim"},
    config = function()
      require("mason-lspconfig").setup()
    end
  },

  -- Lint setup
  {
    "mfussenegger/nvim-lint",
    config = function()
      require("configs.nvimlint")
    end,
    lazy = false
  },

  {
    "rshkarin/mason-nvim-lint",
    config = function()
      require("configs.masonnvimlint")
    end,
    lazy = false
  },

  -- DAP Setup
  {
    "jay-babu/mason-nvim-dap.nvim",
    config = function()
      require("configs.masondap")
    end,
    lazy = false,
  }, 
  
  {
    "mfussenegger/nvim-dap",
    vim.keymap.set('n', '<F9>', ':lua require"dap".continue()<CR>', {desc = '[d]ebug [c]ontinue'}),
    vim.keymap.set('n', '<leader>Dc', ':lua require"dap".continue()<CR>', {desc = '[d]ebug [c]ontinue'}),

    vim.keymap.set('n', '<leader>Db', ':lua require"dap".toggle_breakpoint()<CR>', {desc = '[d]ebug [b]breakpoint'}),

    vim.keymap.set('n', '<leader>Do', ':lua require"dap".step_over()<CR>', {desc = '[d]ebug Step [o]ver'}),
    vim.keymap.set('n', '<F8>', ':lua require"dap".step_over()<CR>', {desc = '[d]ebug Step [o]ver'}),

    vim.keymap.set('n', '<leader>Di', ':lua require"dap".step_into()<CR>', {desc = '[d]ebug Step [i]nto'}),
    vim.keymap.set('n', '<leader>Dt', ':lua require"dap".step_out()<CR>', {desc = '[d]ebug Step ou[t]'}),

    lazy = false,
    config = function()
      vim.api.nvim_set_hl(0, 'DapBreakpoint', { ctermbg = 0, fg = '#993939', bg = '#31353f' })
      vim.api.nvim_set_hl(0, 'DapLogPoint', { ctermbg = 0, fg = '#61afef', bg = '#31353f' })
      vim.api.nvim_set_hl(0, 'DapStopped', { ctermbg = 0, fg = '#98c379', bg = '#31353f' })
    end
  },

  { "nvim-neotest/nvim-nio", },
  { "folke/neodev.nvim", opts = {} },

  {
    "rcarriga/nvim-dap-ui",
    dependencies = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"},
    lazy = false,

    vim.keymap.set('n', '<leader>Dut', ':lua require"dapui".toggle()<CR>', {desc = '[d]ap [u]i [t]oggle'}),

    config = function()
      require("dapui").setup()
    end
  },

  {
    "voldikss/vim-floaterm",
    lazy = false
  },

  -- This configures CMake for build, lsp and debug!
  {
    "Shatur/neovim-tasks",
    lazy=false,
    config = function()
      vim.keymap.set('n', '<leader>tcc', ":Task start cmake configure<CR>", {desc = '[c]Make [c]onfigure'})
      vim.keymap.set('n', '<leader>tcd', ":Task start cmake debug<CR>", {desc = '[c]Make [d]ebug'})
      vim.keymap.set('n', '<leader>tcr', ":Task start cmake run<CR>", {desc = '[c]Make [r]un'})
      vim.keymap.set('n', '<leader>tct', ":Task set_module_param cmake target<CR>", {desc = '[c]Make [t]arget'})
      vim.keymap.set('n', '<leader>tx', ":Task cancel<CR>", {desc = '[t]ask cancel [x]'})
      vim.keymap.set('n', '<leader>tar', ":Task set_task_param cmake run args<CR>", {desc = '[t]ask set [a]rguments for [r]un'})
      vim.keymap.set('n', '<leader>tad', ":Task set_task_param cmake run args<CR>", {desc = '[t]ask set [a]rguments for [d]ebug'})
    end
  },

  -- { 'Civitasv/cmake-tools.nvim', lazy = false },

  { 
    'Shatur/neovim-session-manager',
    lazy = false,
    vim.keymap.set('n', '<leader>sc', ':SessionManager load_current_dir_session<CR>', {desc = '[s]ession load [c]urrent'}),
    vim.keymap.set('n', '<leader>sl', ':SessionManager load_session<CR>', {desc = '[s]ession [l]oad'}),
  },

  -- Plantuml support
  { 
    'javiorfo/nvim-soil',
    lazy = true,
    ft = "plantuml",
  },

  { 'javiorfo/nvim-nyctophilia', lazy = false },

  -- Only works on WezTerm
  -- {
  --   'https://github.com/adelarsq/image_preview.nvim',
  --   vim.keymap.set('n', '<leader>pp', ':lua require("image_preview").PreviewImage()', {desc = '[p]review images'}),
  --   event = 'VeryLazy',
  --   config = function()
  --       require("image_preview").setup()
  --   end
  -- },
  -- For now, use: ./scripts.open_files

  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
    event = 'VeryLazy',
  },

  {
    "lewis6991/gitsigns.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
        require("gitsigns").setup()
    end
  },

  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,
  },

  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      local lualine = require('lualine')
      lualine.setup()
    end,
    event = 'VeryLazy',
  }

}
