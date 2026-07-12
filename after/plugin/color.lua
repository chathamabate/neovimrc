function SetColor(color)
    color = color or "gruvbox-material" -- have a default value
    vim.cmd.colorscheme(color)
    vim.o.background = "dark"
end

SetColor() -- run at startup
