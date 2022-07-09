local M = {}

Colors = {
    current_color = "gruvbox", -- TODO: this should be a constant having the user current color scheme. using vim.cmd[[echo g:colors_name ]] does not seems to return a constant, it is called every time I try to access the variable
    black_flash_color = "darkblue", -- TODO: get all nvim default colorscheme and choose a random one
}

local function sleep()
    local str = "."
    for _ = 1, 111111 do
        str = str .. "."
    end
end

-- TODO: this is not changing color, or it is changing only once
M.flash_colors = function()
    sleep()
    vim.cmd("colorscheme " .. Colors.black_flash_color) -- darkblue
    -- print(vim.inspect(Colors))
    vim.cmd("colorscheme " .. Colors.current_color) -- gruvbox
end

return M
