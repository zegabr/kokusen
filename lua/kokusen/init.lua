local M = {}

local open_cmd -- this needs to stay outside the function, or it'll re-sniff every time...
local function open_url(url)
    if not open_cmd then
        if package.config:sub(1,1) == '\\' then -- windows
            open_cmd = function(url)
                -- Should work on anything since (and including) win'95
                os.execute(string.format('start "%s"', url))
            end
            -- the only systems left should understand uname...
        elseif (io.popen("uname -s"):read'*a') == "Darwin" then -- OSX/Darwin ? (I can not test.)
            open_cmd = function(url)
                -- I cannot test, but this should work on modern Macs.
                os.execute(string.format('open "%s"', url))
            end
        else -- that ought to only leave Linux
            open_cmd = function(url)
                -- should work on X-based distros.
                os.execute(string.format('xdg-open "%s"', url))
            end
        end
    end

    open_cmd(url)
end

local function get_current_color()
    return vim.cmd[[ :echo g:colors_name ]]
end

local function get_random_color()
    -- TODO: get all nvim default colorsheme and choose a random one
    local color = "darkblue"
    return color
end

M.hit = function ()
    print("Kokusen!!")
    local current_color = get_current_color()
    local black_flash_color = get_random_color()
    -- TODO: change the colorsheme
    vim.cmd( "colorscheme  " .. black_flash_color )
    -- TODO: sleep 100ms
    -- TODO: change back the colorsheme
    -- TODO: sleep 50ms



    -- TODO: get a random coding playlist and add here
    -- open_url("https://www.youtube.com")
end
return M
