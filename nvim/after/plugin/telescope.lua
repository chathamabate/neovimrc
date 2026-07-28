local builtin = require('telescope.builtin')

vim.keymap.set('n', '<C-t>', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<C-y>', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<C-u>', builtin.buffers, { desc = 'Telescope buffers' })
