
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local function my_on_attach(bufnr)
  local api = require "nvim-tree.api"

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true }
  end

  -- default mappings
  api.config.mappings.default_on_attach(bufnr)
  api.tree.toggle_enable_filters()

  -- custom mappings

  -- Example custom mapping
  vim.keymap.set('n', '?',     api.tree.toggle_help, opts('Help'))

  vim.keymap.set('n', 'r',     api.tree.reload, opts('Reload'))
  vim.keymap.set('n', 'C',     api.tree.change_root_to_node, opts('Change Root'))
  vim.keymap.set('n', 'p',     api.node.navigate.parent, opts('Parent Dir'))
  vim.keymap.set('n', 'P',     'gg', opts('Root Dir'))
  vim.keymap.set('n', 's',     api.node.open.vertical, opts('Vert Split'))
  vim.keymap.set('n', 'I',     api.tree.toggle_hidden_filter, opts('Toggle dotfiles'))
  vim.keymap.set('n', 'T',     api.tree.toggle_gitignore_filter, opts('Toggle gitignores'))
end

-- pass to setup along with your other options
require("nvim-tree").setup {
  on_attach = my_on_attach,
  actions = {
    open_file = {
      quit_on_open = false,
      resize_window = true,
      window_picker = {
        enable = false,  -- prevent reusing existing windows
      },
    },
  },
  view = {
    preserve_window_proportions = true,
  },
}

-- Global mapping.
vim.api.nvim_set_keymap("n", "<C-p>", ":NvimTreeFindFile<CR>", {silent = true, noremap = true})

