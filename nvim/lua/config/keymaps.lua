local keymap = vim.keymap.set

-- Navegación
keymap("n", "<C-n>", ":NvimTreeToggle<CR>", { desc = "Toggle file explorer" })

-- Diagnósticos
keymap("n", "<leader>,", vim.diagnostic.open_float, { desc = "Mostrar errores" })

-- Construcción de proyectos
keymap("n", "<leader>bp", ":BuildProject<CR>", { desc = "Build and run project" })
keymap("n", "<leader>np", ":NewProject ", { desc = "Create new project" })

-- Guardar y cerrar
keymap("n", "<leader>w", ":w<CR>", { desc = "Guardar archivo" })
keymap("n", "<leader>q", ":q<CR>", { desc = "Cerrar archivo" })
keymap("n", "<leader>Q", ":qa<CR>", { desc = "Cerrar todo" })


-- Limpiar busquedas resaltadas
keymap("n", "<leader>h", ":nohlsearch<CR>", { desc = "Limpiar busquedas resaltadas" })

-- Copiar al portapapeles
keymap("n", "<leader>y", "\"+y", { desc = "Copiar al portapapeles" })

-- Ejecutar main.cpp
keymap("n", "<leader>r", ":!g++ -o %:r % && ./%:r<CR>", { desc = "Ejecutar main.cpp" })
