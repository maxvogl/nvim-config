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
					null_ls.builtins.formatting.isort, -- python
					-- null_ls.builtins.formatting.black,  -- python
					-- diagnostics (Linter)
					require("none-ls.diagnostics.eslint_d"), -- javascript
					require("none-ls.diagnostics.flake8"), -- python
          -- MYPY is in my opinion to aggressive -> sometimes doesn`t find
          -- installed packages or it is hard to fix this problem!
          -- Anyway this snippet should help to find yout virtual environment
          -- deppending on your OS and which environment you are using!
					--null_ls.builtins.diagnostics.mypy.with({
					--	extra_args = function()
					--		local virtual = os.getenv("VIRTUAL_ENV") or os.getenv("CONDA_PREFIX") or "/usr"
					--		return { "--python-executable", virtual .. "/bin/python3" }
					--	end,
					--}),
					-- require("none-ls.diagnostics.ruff"), -- python
				},
			})

			vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, {})
		end,
	},
}
