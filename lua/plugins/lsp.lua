return {
	{
		"williamboman/mason.nvim",
		cmd = { "Mason", "MasonInstall", "MasonUpdate" },
		opts = function()
			return require "configs.mason"
		end,
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			'saghen/blink.cmp'
		},
		event = "User FilePost",
		config = function()
			require("configs.lspconfig").defaults()
		end,
	},
}
