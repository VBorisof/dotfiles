vim.api.nvim_create_user_command(
  'Move',
  -- 'yank | new <args> | put | <line1>,<line2>d | write',
  '\'<,\'>d | new <args> | put | write',
  {
    nargs = 1,
    range = true,
    desc = 'Cut selection to new file'
  }
)

