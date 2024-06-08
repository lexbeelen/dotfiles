return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"rnvim-wree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		vim.keymap.set("n", "<leader>ee", ":Neotree toggle filesystem reveal left<CR>", {})
		vim.keymap.set("n", "<leader>eb", ":Neotree toggle buffers reveal left<CR>", {})
	end,
}
