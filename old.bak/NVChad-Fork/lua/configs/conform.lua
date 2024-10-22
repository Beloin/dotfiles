-- local options = {
--   lsp_fallback = true,

--   formatters_by_ft = {
--     lua = { "stylua" },
--     c = { "clang-format" },
--     cpp = { "clang-format" },
--   },
  
-- }

-- require("conform").setup(options)

local M = {}

M.opts = {
	-- format_on_save = {
	-- 	timeout_ms = 500,
	-- 	lsp_fallback = true,
	-- },
	formatters = {
		xmlformat = {
			cmd = { "xmlformat" },
			args = { "--selfclose", "-" },
		},
	},
	formatters_by_ft = {
		cs = { "csharpier" },
		html = { "prettier" },
		json = { "prettier" },
		lua = { "stylua" },
		markdown = { "prettier", "injected" },
		xml = { "xmlformat" },
		cpp = { "clang-format" },
		c = { "clang-format" },
		cmake = { "cmake-format" },
		sql = { "sql-formatter" }
		-- yaml = { "yamlfix" },
	},
	lsp_fallback = true,
}

return M