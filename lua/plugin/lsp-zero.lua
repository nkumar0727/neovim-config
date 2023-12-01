return {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    -- TODO: include this once you're ready to manual config
    --[[
    lazy = true,
    config = false,
    init = function()
	-- Dsable automatic setup, we are doing it manually
	vim.g.lsp_zero_extend_cmp = 0
	vim.g.lsp_zero_extend_lspconfig = 0
    end
    ]]--
}

