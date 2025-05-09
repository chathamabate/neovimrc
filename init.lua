
require("core.mappings")
require("core.plugins")

-- Turn on GUI colors.
vim.opt.termguicolors = true

vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4

vim.opt.number = true

vim.opt.wrap = false

vim.opt.colorcolumn = "100"

vim.api.nvim_create_autocmd("FileType", {
  pattern = "lua",
  callback = function()
    vim.opt_local.expandtab = true
    vim.opt_local.shiftwidth = 2
    vim.opt_local.tabstop = 2
  end,
})

-- Show virtual text for diagnostics.
vim.diagnostic.config({
  virtual_text = true,  -- Shows inline text for diagnostics
  signs = true,         -- Shows signs in the gutter
  update_in_insert = true,  -- Updates diagnostics while typing
})

-- Globally toggle diagnostics.
local function toggle_diags()
    vim.diagnostic.enable(not vim.diagnostic.is_enabled())
end

-- Toggle diagnostics in current window.
local function toggle_diags_curr()
    vim.diagnostic.enable(not vim.diagnostic.is_enabled(), {bufnr=0})
end

vim.keymap.set('n', 'gE', toggle_diags)
vim.keymap.set('n', 'ge', toggle_diags_curr)
vim.keymap.set('n', '<C-u>', function () 
  vim.wo.relativenumber = not vim.wo.relativenumber
end)

vim.keymap.set('i', '{<CR>', '{<CR>}<Esc>ko', { noremap = true })
vim.keymap.set('i', '[<CR>', '[<CR>]<Esc>ko', { noremap = true })
vim.keymap.set('i', '(<CR>', '(<CR>)<Esc>ko', { noremap = true })


