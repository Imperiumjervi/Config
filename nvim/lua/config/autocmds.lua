local utils = require("config.utils")

-- Comando NewProject
vim.api.nvim_create_user_command("NewProject", function(opts)
  local project_name = opts.args
  local project_path = vim.fn.getcwd() .. "/" .. project_name

  if vim.fn.isdirectory(project_path) == 0 then
    vim.fn.mkdir(project_path, "p")
    utils.ensure_project_structure(project_path)
    vim.notify("Proyecto '" .. project_name .. "' creado con estructura básica", vim.log.levels.INFO)
    vim.cmd("edit " .. project_path .. "/src/main.cpp")
  else
    vim.notify("El proyecto ya existe", vim.log.levels.ERROR)
  end
end, { nargs = 1, desc = "Crea un nuevo proyecto con estructura básica" })

-- Comando BuildProject
vim.api.nvim_create_user_command("BuildProject", function()
  local project_path = vim.fn.getcwd()
  local project_name = vim.fn.fnamemodify(project_path, ":t")

  -- Verificar/crear estructura del proyecto
  local newly_created = utils.ensure_project_structure(project_path)
  if newly_created then
    vim.notify("Estructura del proyecto generada automáticamente", vim.log.levels.WARN)
  end

  -- Compilar usando make
  vim.notify("Compilando proyecto con Make...", vim.log.levels.INFO)
  require("toggleterm").exec("make", 15, 60, project_path)

  -- Ejecutar el binario
  vim.defer_fn(function()
    local executable = project_path .. "/" .. project_name
    if vim.fn.executable(executable) == 1 then
      require("toggleterm").exec(executable, 15, 60, project_path)
    else
      vim.notify("No se pudo encontrar el ejecutable. Revisa los errores.", vim.log.levels.ERROR)
    end
  end, 2000)
end, { desc = "Compila y ejecuta el proyecto (genera estructura si falta)" })



