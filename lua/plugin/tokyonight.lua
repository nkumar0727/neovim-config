return {
    "folke/tokyonight.nvim",
    lazy = false, -- load during startup; this is the main colorscheme
    priority = 1000, -- load before all other start plugins
    config = function()
	-- load the colorscheme here
	vim.cmd[[colorscheme tokyonight-night]]
    end,
}

