require("mason").setup({
})

require('mason-lspconfig').setup({
    -- Replace the language servers listed here 
    -- with the ones you want to install
    ensure_installed = {
	'lua_ls',
    },
    automatic_installation = false,
    handlers = nil,
})

-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set("n", "<space>e", vim.diagnostic.open_float)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd("LspAttach", {
    desc = "LSP actions",
    group = vim.api.nvim_create_augroup("UserLspConfig", {}),
    callback = function(event)
	-- Enable completion triggered by <c-x><c-o>
	vim.bo[event.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

	-- Buffer local mappings
	-- See `:help vim.lsp.*` for documentation on any of the below functions
	local options = {
	    buffer = event.buf
	}

	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, options)
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, options)
	vim.keymap.set("n", "K", vim.lsp.buf.hover, options)
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, options)
	vim.keymap.set("n", "<space>", vim.lsp.buf.signature_help, options)
	vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, options)
	vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, options)
	vim.keymap.set("n", "<space>wl",
	    function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	    end,
	    options
	)
        vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, options)
	vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, options)
	vim.keymap.set({"n", "v"}, "<space>ca", vim.lsp.buf.code_action, options)
	vim.keymap.set("n", "gr", vim.lsp.buf.references, options)
	vim.keymap.set("n", "<space>f",
	    function()
		vim.lsp.buf.format {
		    async = true
		}
	    end,
	    options
	)
    end
})

local luasnip = require("luasnip")
local cmp = require("cmp")

cmp.setup({
    sources = {
	{
	    name = "nvim_lsp"
	},
	{
	    name = "luasnip"
	}
    },
    mapping = cmp.mapping.preset.insert({
	-- Enter key confirms completion item
	["<CR>"] = cmp.mapping.confirm({
	    select = true,
	    behaviour = cmp.ConfirmBehavior.Replace,
	}),
	-- Ctrl + space triggers completion menu
	["<C-Space>"] = cmp.mapping.complete(),
    }),
    snippet = {
	expand = function(args)
	    luasnip.lsp_expand(args.body)
	end,
    },
})

