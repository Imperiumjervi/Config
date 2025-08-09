return {
    -- 🖥️ Dashboard con ASCII de NVIM
    {
        "nvimdev/dashboard-nvim",
        event = "VimEnter",
        dependencies = {  "echasnovski/mini.icons"},
        config = function()
            local db = require("dashboard")
            db.setup({
                theme = "doom",
                config = {
                    header = {
                        "",
                        "",
                        "", 
                        "",
                        "",
                        "",
                        "",
                        "",
                        " ███╗   ██╗██╗   ██╗██╗███╗   ███╗",
                        " ████╗  ██║██║   ██║██║████╗ ████║",
                        " ██╔██╗ ██║██║   ██║██║██╔████╔██║",
                        " ██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║",
                        " ██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║",
                        " ╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝",
                        "",
                        "          Welcome to Neovim by Jeffer",
                    },
                    center = {
                        { icon = "📂 ", desc = "Explorar archivos", key = "e", action = "NvimTreeToggle" },
                        { icon = "🔍  ", desc = "Buscar archivo", key = "f", action = "Telescope find_files" },
                        { icon = "📄  ", desc = "Nuevo archivo", key = "n", action = "enew" },
                        { icon = "💾  ", desc = "Guardar sesión", key = "s", action = "SessionSave" },
                        { icon = "🚪  ", desc = "Salir", key = "q", action = "qa" },
                    },
                    footer = {
                        " hecho con Neovim + Lazy",
                    },
                }
            })
        end
    },
}
