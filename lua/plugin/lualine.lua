return {
    'nvim-lualine/lualine.nvim', -- plugin to install
    event = { -- Lazy loading
	'BufReadPre',
	'BufNewFile'
    },
    config = function ()
	local status_ok, lualine = pcall(require, 'lualine')
	if not status_ok then
	    return
	end

	lualine.setup({
	    options = {
		icons_enabled = true,
		theme = 'ayu_dark',
	    },
	    sections = {
		lualine_a = {
		    {
			'filename',
			path = 1,
		    },
		},
	    },
	})
    end
}
