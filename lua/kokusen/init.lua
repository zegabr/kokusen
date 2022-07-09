local M = {}

M.hit = function ()
    require("kokusen.black_flash").flash_colors() -- not working
    require("kokusen.collapse").collapse_space()
    require("kokusen.music").open_url("https://www.youtube.com")
    print("Kokusen!!")
end

return M
