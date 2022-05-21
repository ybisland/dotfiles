vim.o.sessionoptions="blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal"  --For a better experience

local opts = {
  log_level = 'info',
  auto_session_enable_last_session = false,
  -- auto_session_root_dir = vim.fn.stdpath('data').."/sessions/", -- /Users/name/.local/share/nvim
  auto_session_root_dir = ".nvim/sessions/", -- /Users/name/.local/share/nvim
  auto_session_enabled = true,
  auto_save_enabled = nil,
  auto_restore_enabled = nil,
  auto_session_suppress_dirs = nil,
  -- the configs below are lua only
  bypass_session_save_file_types = nil
}

require('auto-session').setup(opts)
