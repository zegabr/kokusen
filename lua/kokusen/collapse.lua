local M = {}

-- TODO: make it silent
-- colapse your code as if it had been hit by a black flash
M.collapse_space = function()
    -- erase from 40% to 60% (of the whole file)
    -- sort remaining file from 20% to 90%
    vim.api.nvim_input("40%V60%d20%V90%:sort<cr>")
end

return M
