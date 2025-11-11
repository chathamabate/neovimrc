function SetColor(color)
    color = color or "everforest" -- have a default value
    vim.cmd.colorscheme(color)
    vim.o.background = "dark"
end

SetColor() -- run at startup
