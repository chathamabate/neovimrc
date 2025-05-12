function SetColor(color)
    color = color or "kanagawa-dragon" -- have a default value
    vim.cmd.colorscheme(color)
end

SetColor() -- run at startup
