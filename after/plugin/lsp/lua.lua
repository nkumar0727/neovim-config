local lspconfig = require("lspconfig")
local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

lspconfig.lua_ls.setup({
    capabilities = lsp_capabilities,
    on_init = function(client)
	local path = client.workspace_folders[1].name
	if not vim.loop.fs_stat(path.."/.luarc.json") and not vim.loop.fs_stat(path.."/.luarc.jsonc") then
	    local settings = {
		Lua = {
		    runtime = {
			-- Tell the language server which version of Lua you're using
			-- Most likely LuaJIT in the case of Neovim
			version = "LuaJIT"
		    },
		    diagnostics = {
			-- Get the language server to recognize the 'vim' global
			globals = {
			    "vim"
			}
		    },
		    workspace = {
			checkThirdParty = false,
			library = {
			    vim.env.VIMRUNTIME
			}
		    }
		}
	    }

	    client.config.settings = vim.tbl_deep_extend("force", client.config.settings, settings)
	    client.notify("workspace/didChangeConfiguration", {
		settings = client.config.settings
	    })
	end
	return true
    end
})

