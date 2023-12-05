return {
    "williamboman/mason.nvim",
    config = function()
	require("mason").setup({
	    -- Max packages installed at once; rest are queued
	    max_concurrent_installers = 4,
	    github = {
		---@since 1.0.0
		-- The template URL to use when downloading assets from GitHub.
		-- The placeholders are the following (in order):
		-- 1. The repository (e.g. "rust-lang/rust-analyzer")
		-- 2. The release version (e.g. "v0.3.0")
		-- 3. The asset name (e.g. "rust-analyzer-v0.3.0-x86_64-unknown-linux-gnu.tar.gz")
		download_url_template = "https://github.com/%s/releases/download/%s/%s",
	    },
	    ui = {
		-- Check for new versions when opening the :Mason window
		check_outdated_packages_on_open = true,
		icons = {
		    package_installed = "✓",
		    package_pending = "➜",
		    package_uninstalled = "✗"
		}
	    }
	})
    end
}

