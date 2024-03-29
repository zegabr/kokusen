local M = {}

local music_radios = {
    "https://nightride.fm/stations?station=darksynth",
    "https://nightride.fm/stations?station=nightride",
    "https://nightride.fm/stations?station=horrorsynth",
}

local function get_random_url()
   return music_radios[math.random(#music_radios)]
end

local open_cmd -- this needs to stay outside the function, or it'll re-sniff every time...
M.get_me_to_the_zone = function()

    local radio_url = get_random_url()

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

    open_cmd(radio_url)
end

return M

