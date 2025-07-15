-- ─────────────────────────────────────────────────────────────
-- 1. Carga de dependencias básicas
-- ─────────────────────────────────────────────────────────────
local lspconfig         = require("lspconfig")
local cmp               = require("cmp")
local cmp_capabilities  = require("cmp_nvim_lsp").default_capabilities()

-- Función que se ejecuta al adjuntar cualquier servidor LSP
local function on_attach(_, bufnr)
  local map = function(mode, lhs, rhs, desc)
    vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
  end
  map("n", "gd", vim.lsp.buf.definition,   "Ir a definición")
  map("n", "K",  vim.lsp.buf.hover,        "Documentación flotante")
  map("n", "<F2>", vim.lsp.buf.rename,     "Renombrar símbolo")
end

-- ─────────────────────────────────────────────────────────────
-- 2. Servidores LSP estándar
-- ─────────────────────────────────────────────────────────────
lspconfig.clangd.setup{
  cmd         = { "clangd", "--compile-commands-dir=./" },
  capabilities = cmp_capabilities,
  on_attach    = on_attach,
}

lspconfig.ts_ls.setup{            -- ← nombre correcto: tsserver
  capabilities = cmp_capabilities,
  on_attach    = on_attach,
}

lspconfig.pyright.setup{
  capabilities = cmp_capabilities,
  on_attach    = on_attach,
}

lspconfig.html.setup{
  capabilities = cmp_capabilities,
  on_attach    = on_attach,
}

-- ─────────────────────────────────────────────────────────────
-- 3. Configuración puntual para Java (JDTLS)
--    Necesitas también el plugin:
--      { "mfussenegger/nvim-jdtls", ft = "java" }
-- ─────────────────────────────────────────────────────────────
local function setup_jdtls()
  local jdtls = require("jdtls")            -- ¡Ojo a la minúscula!
  local home  = vim.env.HOME

  -- Crea un workspace por proyecto (lo exige JDTLS)
  local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
  local workspace_dir = home .. "/.cache/jdtls/" .. project_name

  local config = {
    cmd = { "jdtls", "-data", workspace_dir },

    -- Detecta la raíz del proyecto (git, maven, gradle…)
    root_dir = jdtls.setup.find_root{
      ".git", "mvnw", "gradlew", "pom.xml", "build.gradle",
    },

    capabilities = cmp_capabilities,
    on_attach    = on_attach,
  }

  jdtls.start_or_attach(config)
end

-- Inicia JDTLS solo cuando abras un *.java
vim.api.nvim_create_autocmd("FileType", {
  pattern  = "java",
  callback = setup_jdtls,
})

-- ─────────────────────────────────────────────────────────────
-- 4. nvim‑cmp (autocompletado)
-- ─────────────────────────────────────────────────────────────
cmp.setup({
  mapping = {
    ["<Tab>"]   = cmp.mapping.select_next_item(),
    ["<S-Tab>"] = cmp.mapping.select_prev_item(),
    ["<CR>"]    = cmp.mapping.confirm({ select = true }),
  },
  sources = {
    { name = "nvim_lsp" },
    { name = "buffer"   },
    { name = "path"     },
  },
})

