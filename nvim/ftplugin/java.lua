local config = {
    cmd = {'/usr/bin/jdtls'},
    root_dir = vim.fs.dirname(vim.fs.find({'.gradle', '.git'}, { upward = true })[1]),
}
require('jdtls').start_or_attach(config)
