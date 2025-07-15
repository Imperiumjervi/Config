local M = {}

-- Función para generar Makefile básico
function M.generate_makefile(project_path, project_name)
  local makefile_content = string.format([[
CXX = g++
CXXFLAGS = -std=c++17 -Wall -Wextra -O2

TARGET = %s
SRC = $(wildcard src/*.cpp)

all: $(TARGET)

$(TARGET): $(SRC)
	$(CXX) $(CXXFLAGS) -Iinclude -o $(TARGET) $(SRC)

clean:
	rm -f $(TARGET)
]], project_name)

  local makefile = io.open(project_path .. "/Makefile", "w")
  if makefile then
    makefile:write(makefile_content)
    makefile:close()
    return true
  end
  return false
end

-- Verificar/crear estructura básica del proyecto
function M.ensure_project_structure(project_path)
  local created = false

  -- Crear directorios si no existen
  if vim.fn.isdirectory(project_path .. "/src") == 0 then
    vim.fn.mkdir(project_path .. "/src", "p")
    created = true
  end

  if vim.fn.isdirectory(project_path .. "/include") == 0 then
    vim.fn.mkdir(project_path .. "/include", "p")
    created = true
  end

  -- Crear main.cpp básico si no existe
  local main_cpp = project_path .. "/src/main.cpp"
  if vim.fn.filereadable(main_cpp) == 0 then
    local file = io.open(main_cpp, "w")
    if file then
      file:write('#include <iostream>\n\nint main() {\n    std::cout << "Hola mundo desde el comando NewProject" << std::endl;\n    return 0;\n}\n')
      file:close()
      created = true
    end
  end

  -- Crear Makefile si no existe o está vacío
  local makefile_path = project_path .. "/Makefile"
  if vim.fn.filereadable(makefile_path) == 0 or vim.fn.getfsize(makefile_path) == 0 then
    if M.generate_makefile(project_path, vim.fn.fnamemodify(project_path, ":t")) then
      created = true
    end
  end

  return created
end

return M
