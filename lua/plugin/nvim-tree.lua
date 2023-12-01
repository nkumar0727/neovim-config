local function on_attach_fn(bufnr)
    local api = require("nvim-tree.api")

    local function options(desc)
	return {
	    desc = "nvim-tree: " .. desc,
	    buffer = bufnr, 
	    noremap = true, 
	    silent = true,
	    nowait = true,
	}
    end

    -- default mappings
    api.config.mappings.default_on_attach(bufnr)
    -- custom mappings
    -- See here for more: https://github.com/nvim-tree/nvim-tree.lua/blob/master/doc/nvim-tree-lua.txt
    vim.keymap.set('n', '<C-t>', api.tree.change_root_to_parent, options("Up"))
    vim.keymap.set('n', '?', api.tree.toggle_help, options("Help"))
    vim.keymap.set("n", "v", api.node.open.vertical, options("Open: Vertical Split"))
    vim.keymap.set("n", "s", api.node.open.horizontal, options("Open: Horizontal Split"))
end

return {
    "nvim-tree/nvim-tree.lua",
    lazy = false,
    priority = 999,
    dependencies = {
	"nvim-tree/nvim-web-devicons",
    },
    config = function()
	require("nvim-tree").setup {
	    on_attach = on_attach_fn,
	}
    end,
}
