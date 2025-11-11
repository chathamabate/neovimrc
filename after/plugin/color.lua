function SetColor(color)
    color = color or "gruvbox" -- have a default value
    vim.cmd.colorscheme(color)
end

SetColor() -- run at startup
