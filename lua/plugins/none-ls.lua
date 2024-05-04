return {
	{
		"nvimtools/none-ls.nvim",
		dependencies = {
			"nvimtools/none-ls-extras.nvim",
		},
		config = function()
			local null_ls = require("null-ls")

			null_ls.setup({
				sources = {
					-- formatting
					null_ls.builtins.formatting.stylua, -- Lua
					null_ls.builtins.formatting.prettier, -- javascript
					-- diagnostics
					require("none-ls.diagnostics.eslint_d"), -- javascript
				},
			})

			vim.keymap.set("n", "<C-f>", vim.lsp.buf.format, {})
		end,
	},
}
