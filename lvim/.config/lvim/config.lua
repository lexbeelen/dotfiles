vim.log.level = "warn"
vim.opt.relativenumber = true -- set relative numbered lines
lvim.format_on_save.enabled = true
lvim.colorscheme = "tokyonight"
lvim.transparent_window = true
lvim.leader = "space"
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"

-- Disable Arrow Keys in Vim
lvim.keys.normal_mode["<Up>"] = "<Nop>"
lvim.keys.normal_mode["<Down>"] = "<Nop>"
lvim.keys.normal_mode["<Left>"] = "<Nop>"
lvim.keys.normal_mode["<Right>"] = "<Nop>"

lvim.builtin.which_key.mappings["t"] = {
  name = "+Trouble",
  r = { "<cmd>Trouble lsp_references<cr>", "References" },
  f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
  d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnostics" },
  q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
  l = { "<cmd>Trouble loclist<cr>", "LocationList" },
  w = { "<cmd>Trouble workspace_diagnostics<cr>", "Workspace Diagnostics" },
}

lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.terminal.direction = "float"
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false

lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "javascript",
  "json",
  "lua",
  "php",
  "python",
  "typescript",
  "tsx",
  "css",
  "rust",
  "java",
  "yaml",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enable = true

local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  {
    command = "prettier",
    extra_args = { "--print-with", "100" },
    filetypes = { "typescript", "typescriptreact", "css" },
  },
  {
    command = "phpcsfixer",
    filetypes = { "php" }
  },
  {
    command = "blade-formatter",
    filetypes = { "php" }
  }
}

local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  { command = "eslint",  filetypes = { "typescript", "typescriptreact" } },
  { command = "phpcs",   filetypes = { "php" } },
  { command = "phpstan", filetypes = { "php" } }
}

lvim.plugins = {
  {
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
  },
  {
    "jwalton512/vim-blade"
  },
  {
    "editorconfig/editorconfig-vim"
  }
}

local lsp_manager = require("lvim.lsp.manager")
lsp_manager.setup("intelephense")

local dap = require("dap")
local mason_path = vim.fn.glob(vim.fn.stdpath("data") .. "/mason/")
dap.adapters.php = {
  type = "executable",
  command = "node",
  args = { mason_path .. "packages/php-debug-adapter/extension/out/phpDebug.js" },
}
dap.configurations.php = {
  {
    name = "Listen for Xdebug",
    type = "php",
    request = "launch",
    port = 9003,
  },
  {
    name = "Debug currently open script",
    type = "php",
    request = "launch",
    port = 9003,
    cwd = "${fileDirname}",
    program = "${file}",
    runtimeExecutable = "php",
  },
}
