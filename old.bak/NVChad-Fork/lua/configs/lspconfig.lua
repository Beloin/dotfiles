local configs = require("nvchad.configs.lspconfig")

local on_attach = configs.on_attach
local on_init = configs.on_init
local capabilities = configs.capabilities

local lspconfig = require "lspconfig"
local servers = { "html", "cssls", "clangd", "omnisharp", "ast-grep", "lua-language-server", "sqlls", "cmake-language-server"}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_init = on_init,
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

lspconfig["cmake-language-server"].setup({
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "/home/beloin/.local/share/nvim/mason/bin/cmake-language-server" },
})

lspconfig.omnisharp.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "/home/beloin/.local/share/nvim/mason/packages/omnisharp/omnisharp" },
  -- Enables support for reading code style, naming convention and analyzer
  -- settings from .editorconfig.
  enable_editorconfig_support = true,
  -- If true, MSBuild project system will only load projects for files that
  -- were opened in the editor. This setting is useful for big C# codebases
  -- and allows for faster initialization of code navigation features only
  -- for projects that are relevant to code that is being edited. With this
  -- setting enabled OmniSharp may load fewer projects and may thus display
  -- incomplete reference lists for symbols.
  enable_ms_build_load_projects_on_demand = false,
  -- Enables support for roslyn analyzers, code fixes and rulesets.
  enable_roslyn_analyzers = false,
  -- Specifies whether 'using' directives should be grouped and sorted during
  -- document formatting.
  organize_imports_on_format = true,
  -- Enables support for showing unimported types and unimported extension
  -- methods in completion lists. When committed, the appropriate using
  -- directive will be added at the top of the current file. This option can
  -- have a negative impact on initial completion responsiveness,
  -- particularly for the first few completion sessions after opening a
  -- solution.
  enable_import_completion = true,
  -- Specifies whether to include preview versions of the .NET SDK when
  -- determining which version to use for project loading.
  sdk_include_prereleases = true,
  -- Only run analyzers against open files when 'enableRoslynAnalyzers' is
  -- true
  analyze_open_documents_only = false,
})

function opts(desc)
  return { buffer = bufnr, desc = desc }
end

local map = vim.keymap.set
map('n', 'gI', vim.lsp.buf.implementation, { desc = "Go to Implementation" })
map('n', 'ga', vim.lsp.buf.type_definition, { desc = "Go to Type Defitinion" })

map('n', '<M-CR>', vim.lsp.buf.code_action, { desc = "Code Action" })
map('i', '<M-CR>', vim.lsp.buf.code_action, { desc = "Code Action" })

map("i", "<C-p>", vim.lsp.buf.signature_help, opts "Lsp Show signature help")
map("n", "<C-p>", vim.lsp.buf.signature_help, opts "Lsp Show signature help")

map("i", "<C-b>", vim.lsp.buf.definition, opts "Lsp Go to definition")
map("n", "<C-b>", vim.lsp.buf.definition, opts "Lsp Go to definition")
