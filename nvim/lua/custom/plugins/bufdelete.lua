return {
  "famiu/bufdelete.nvim",
  config = function()
    vim.keymap.set('n', '<leader>bd', ':Bdelete<CR>')
    vim.keymap.set('n', '<leader>bw', ':Bwipeout<CR>')
  end,
}
