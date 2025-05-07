-- ~/.config/nvim/lua/create_workspace.lua

local api = vim.api
local fn = vim.fn

local function write_file(path, content)
  local f = io.open(path, "w")
  if f then
    f:write(content)
    f:close()
  else
    print("No se pudo crear el archivo: " .. path)
  end
end

local function create_workspace(name)
  local cwd = fn.getcwd()
  local root = cwd .. "/" .. name
  local project = root .. "/ejemplo1"

  fn.mkdir(project .. "/include", "p")
  fn.mkdir(project .. "/src", "p")
  fn.mkdir(project, "p")
  fn.mkdir(root .. "/.vscode", "p")

  -- multi-projects.code-workspace
  write_file(root .. "/multi-projects.code-workspace", [[
{
  "folders": [
    { "name": "]] .. name .. [[", "path": "]] .. name .. [[" }
  ],
  "settings": {
    "cmake.sourceDirectory": "${workspaceFolder}"
  },
  "extensions": {
    "recommendations": [
      "ms-vscode.cpptools",
      "ms-vscode.cmake-tools"
    ]
  }
}
]])

  -- CMakeLists.txt global
  write_file(root .. "/CMakeLists.txt", [[
cmake_minimum_required(VERSION 3.16)
project(MultiProject)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)
add_subdirectory(ejemplo1)
]])

  -- CMakeLists.txt del proyecto
  write_file(project .. "/CMakeLists.txt", [[
cmake_minimum_required(VERSION 3.16)
project(ejemplo1)
file(GLOB SRC_FILES
    "${CMAKE_CURRENT_SOURCE_DIR}/src/*.cpp"
    "${CMAKE_CURRENT_SOURCE_DIR}/main.cpp"
)
add_executable(ejemplo1 ${SRC_FILES})
target_include_directories(ejemplo1
  PRIVATE
    "${CMAKE_CURRENT_SOURCE_DIR}/include"
)
]])

  -- main.cpp
  write_file(project .. "/main.cpp", [[
#include <iostream>
#include "include/clasepordefecto.hpp"

int main() {
    ClasePorDefecto obj;
    obj.saludar();
    return 0;
}
]])

  -- clase por defecto
  write_file(project .. "/include/clasepordefecto.hpp", [[
#pragma once
#include <iostream>

class ClasePorDefecto {
public:
    void saludar();
};
]])

  write_file(project .. "/src/clasepordefecto.cpp", [[
#include "include/clasepordefecto.hpp"

void ClasePorDefecto::saludar() {
    std::cout << "Hola desde ClasePorDefecto" << std::endl;
}
]])

  -- launch.json en .vscode global
  write_file(root .. "/.vscode/launch.json", [[
{
  "version": "0.2.0",
  "configurations": [
    {
      "name": "Debug Ejemplo1",
      "type": "cppdbg",
      "request": "launch",
      "program": "${workspaceFolder}/build/bin/ejemplo1",
      "args": [],
      "cwd": "${workspaceFolder}",
      "console": "integratedTerminal",
      "MIMode": "gdb",
      "miDebuggerPath": "/usr/bin/gdb",
      "preLaunchTask": "Build Ejemplo1"
    }
  ]
}
]])

  -- tasks.json en .vscode global
  write_file(root .. "/.vscode/tasks.json", [[
{
  "version": "2.0.0",
  "tasks": [
    {
      "label": "CMake: Configure",
      "type": "shell",
      "command": "cmake",
      "args": [
        "-S", "${workspaceFolder}",
        "-B", "${workspaceFolder}/build"
      ],
      "group": "build"
    },
    {
      "label": "Build Ejemplo1",
      "type": "shell",
      "command": "cmake",
      "args": [
        "--build", "${workspaceFolder}/build",
        "--target", "ejemplo1"
      ],
      "group": "build",
      "problemMatcher": ["$gcc"],
      "dependsOn": "CMake: Configure"
    }
  ]
}
]])

  print("Workspace creado en: " .. root)
end

api.nvim_create_user_command("CreateWorkspace", function(opts)
  create_workspace(opts.args)
end, {
  nargs = 1,
  complete = "file"
})
