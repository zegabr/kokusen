local M = {}

M.flash_colors = function()
    vim.cmd[[
        let current = g:colors_name
        let flash = 'koehler'

        let i = 0
        while i < 10
            let i = i+1
            execute 'colorscheme ' .. flash

            redraw
            while g:colors_name != current
                execute 'colorscheme ' .. current
            endwhile
            redraw
        endwhile
    ]]
end

return M

