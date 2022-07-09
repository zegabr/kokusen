local M = {}

M.weak_hit = function ()
    require("kokusen.music").get_me_to_the_zone()
    print("Kokusen!!")
end

M.normal_hit = function ()
    require("kokusen.black_flash").flash_colors() -- not working
    require("kokusen.collapse").collapse_space() -- too strong (and annoying)
    M.weak_hit()
end

return M
