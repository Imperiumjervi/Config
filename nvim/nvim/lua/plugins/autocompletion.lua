return {
    -- 🤖 GitHub Copilot
    { "github/copilot.vim" ,
    config = function()
    	vim.g.copilot_no_tab_map = true
	vim.api.nvim_set_keymap("i", "<Tab>", 'copilot#Accept("<CR>")', {silent = true, expr = true})
		vim.cmd("Copilot enable")

	end},

    -- ⚡ Autocompletado nvim-cmp
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline"
        },
        config = function()
            local cmp = require("cmp")
            cmp.setup({
                mapping = {
                    ["<Tab>"] = cmp.mapping.select_next_item(),
                    ["<S-Tab>"] = cmp.mapping.select_prev_item(),
                    ["<CR>"] = cmp.mapping.confirm({ select = true }),
                },
                sources = {
                    { name = "nvim_lsp" },
                    { name = "buffer" },
                    { name = "path" },
                }
            })
        end
    },
}
