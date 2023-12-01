
return {
    "nvim-telescope/telescope.nvim",
    tag = '0.1.4',
    dependencies = {
	'nvim-lua/plenary.nvim'
    },
    config = function()
	require("telescope").setup {
	    defaults = {
		mappings = {
		    i = {
			["<C-h>"] = "which_key"
		    }
		}
	    },
	    extensions = {
		fzf = {
		    fuzzy = true,
		    override_generic_sorter = true,
		    override_file_sorter = true,
		    case_mode = "smart_case",
		}
	    }
	}
    end
}

