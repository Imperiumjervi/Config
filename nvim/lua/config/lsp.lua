local lspconfig = require("lspconfig")

-- Configurar LSP para C++, JavaScript y Python
lspconfig.clangd.setup{cmd = {"clangd", "--compile-commands-dir=./"}} -- C++
lspconfig.ts_ls.setup{}    -- JavaScript
lspconfig.pyright.setup{}  -- Python
lspconfig.html.setup{}    -- HTML

--Configurar JDTLS (Java)
local function setup_jdtls()
	local Jdtls = require("jdtls")
	local home = os.getenv("HOME")
	local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
	local workspace_dir = home .. "/.local/share/eclipse" .. project_name

	local config = {
		cmd = {"jdtls", "-data", workspace_dir},
		root_dir = Jdtls.setup.find_root({".git", "mvnw", "gradlew", "pom.xml", "build.gradle"}),
	}

	jdtls.start_or_attach(config)
end

--Activar JDTLS para Java
vim.api.nvim_create_autocmd("FileType", {
	pattern = "java",
	callback = function()
		setup_jdtls()
	end,
})

-- Configurar autocompletado con nvim-cmp
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
  },
})

