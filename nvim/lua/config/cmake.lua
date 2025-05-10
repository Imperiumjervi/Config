vim.api.nvim_create_user_command("BuildTarget", function(opt)
  local target = opt.args
  if target == "" then
    print("Por favor especifica un target.")
    return
  end

  local build_dir = "build"

  if vim.fn.isdirectory(build_dir) == 0 then
    vim.fn.mkdir(build_dir)
  end

  local configure_cmd = string.format("cmake -S . -B %s", build_dir)
  local build_cmd = string.format("cmake --build %s --target %s", build_dir, target)

  vim.cmd("!" .. configure_cmd)
  vim.cmd("!" .. build_cmd)
end, {
  nargs = 1,
  desc = "Compila el target especificado con CMake."
})
