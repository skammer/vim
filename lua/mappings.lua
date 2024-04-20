U = require('utils')

function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.keymap.set(mode, lhs, rhs, options)
end

function show_documentation()
    if vim.bo.filetype == 'vim' then
        vim.api.nvim_command([['h '.expand('<cword>')]])
    else
        vim.api.nvim_command([[:call CocActionAsync('doHover')]])
    end
end

function check_back_space()
    local col = vim.api.nvim_win_get_cursor(0)[2]
    return (col == 0 or vim.api.nvim_get_current_line():sub(col, col):match("%s")) and true
end
