local Services = {
    HTTP = game:GetService("HttpService")
}

-----------------------------------------------------------------------
-- Script API Declarations
-----------------------------------------------------------------------
local isfile = isfile
local readfile = readfile
local writefile = writefile

local module = {}

function module:GetTeam(teamName)
    if (string.lower(teamName) == "colorado state") then
        return {
            City = "Colorado State",
            Name = "Rams",
            Abbreviation = "CSU",
            Colors = {
                Normal = {
                    Main = "#184c27",
                    Light = "#c3c474"
                },
                Alternate = {
                    Main = "#ffffff",
                    Light = "#184c27"
                },
                Endzone = "#184c27",
                Jersey = {
                    Home = {
                        NumberInner = "#ffffff",
                        NumberStroke = "#c3c474",
                        Helmet = "#184c27",
                        Jersey = "#184c27",
                        Stripe = "#184c27",
                        Pants = "#184c27",
                        HelmetTexture = "rbxassetid://14269519410",
                        Logo = "rbxassetid://14269521660"
                    },
                    Away = {
                        NumberInner = "#184c27",
                        NumberStroke = "#c3c474",
                        Helmet = "#184c27",
                        Jersey = "#ffffff",
                        Stripe = "#ffffff",
                        Pants = "#c3c474",
                        HelmetTexture = "rbxassetid://14269519410",
                        Logo = "rbxassetid://14269521660"
                    }
                }
            },
        }
    elseif (string.lower(teamName) == "north carolina") then
        return {
            City = "North Carolina",
            Name = "Tar Heels",
            Abbreviation = "UNC",
            Colors = {
                Normal = {
                    Main = "#7dafd6",
                    Light = "#ffffff"
                },
                Alternate = {
                    Main = "#ffffff",
                    Light = "#7dafd6"
                },
                Endzone = "#7dafd6",
                Jersey = {
                    Home = {
                        NumberInner = "#ffffff",
                        NumberStroke = "#000000",
                        Helmet = "#7dafd6",
                        Jersey = "#7dafd6",
                        Stripe = "#7dafd6",
                        Pants = "#7dafd6",
                        HelmetTexture = "rbxassetid://14269485286",
                        Logo = "rbxassetid://14269478234"
                    },
                    Away = {
                        NumberInner = "#7dafd6",
                        NumberStroke = "#000000",
                        Helmet = "#ffffff",
                        Jersey = "#ffffff",
                        Stripe = "#ffffff",
                        Pants = "#ffffff",
                        HelmetTexture = "rbxassetid://14102464252",
                        Logo = "rbxassetid://14269482449"
                    }
                }
            },
        }
    end
    return nil
end

function module:FormatClock(seconds : number)
    local minutes = (seconds - seconds%60)/60
    seconds = seconds-minutes*60
    local zero = ""
    if (seconds < 10) then
        zero = "0"
    end

    return minutes .. ":" .. zero .. seconds
end

function module:FormatNumber(number : number)
    if (number == 1) then
        return "1st"
    elseif (number == 2) then
        return "2nd"
    elseif (number == 3) then
        return "3rd"
    elseif (number == 4) then
        return "4th"
    elseif (number >= 5) then
        return "OT " .. number-4
    end
end

local DefaultConfig = {
    GameInfo = {
        Away = "AWAY_TEAM_HERE",
        AwayRank = 0,
        Home = "HOME_TEAM_HERE",
        HomeRank = 0,
        Primetime = "false",
        Series = "SERIES_HERE",
        Season = "SEASON_HERE",
        League = "LEAGUE_HERE"
    },
    Settings = {
        AssetsFilePath = "",
        AutoTwitchClipping = "false",
        AutoTwitchUpdates = "false",
        Channel = "",
        SendToWebhook = "false",
        TwitchAuthCode = "",
        UploadStatsToDatabase = "false",
        UploadToRealtimeAPI = "false"
    }
}
function ReadConfigArray(default, compare)
    local returnTable = {}

    for i,v in pairs(compare) do
        if (default[i] and type(default[i]) == type(v)) then
            if (type(v) == "table") then
                returnTable[i] = ReadConfigArray(default[i], v)
            else
                returnTable[i] = v
            end
        elseif (default[i]) then
            returnTable[i] = default[i]
        end
    end

    for i,v in pairs(default) do
        if not (returnTable[i]) then
            returnTable[i] = v
        end
    end

    return returnTable
end

function module:GetConfig()
    local succ,result = pcall(function()
        return readfile("config.json")
    end)
    if (succ) then
        succ,result = pcall(function()
            return Services["HTTP"]:JSONDecode(result)
        end)
    end
    if not (succ) then
        writefile("config.json", Services["HTTP"]:JSONEncode(DefaultConfig))
        print("[Utilities] Failed to get the config file. We returned the default config.")
        return DefaultConfig
    end

    local config = ReadConfigArray(DefaultConfig,result)
    writefile("config.json", Services["HTTP"]:JSONEncode(config))
    print("[Utilities] Successfully got the config file.")
    return config
end

return module
