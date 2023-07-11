local db = require('dashboard')

db.setup({
theme = 'doom',
  config = {
    header = {},
    center = {
        { icon = '  ', keymap = 'SPC f', key = 'f', desc = 'Find file', action = 'Telescope find_files' },
        { icon = '  ', keymap = 'SPC h', key = 'h', desc = 'Recent files', action = 'Telescope oldfiles' },
        { icon = '  ', keymap = 'SPC g', key = 'g', desc = 'Find Word', action = 'Telescope live_grep' },
    },
    footer = {}
  }
})
