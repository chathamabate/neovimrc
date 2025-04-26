function SetColor(color)
    color = color or "everforest" -- have a default value
    vim.cmd.colorscheme(color)
end

SetColor() -- run at startup
