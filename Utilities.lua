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
    if (string.lower(teamName) == "notre dame") then
        return {
            City = "Notre Dame",
            Name = "Fighting Irish",
            Abbreviation = "ND",
            Colors = {
                Normal = {
                    Main = "#0a2242",
                    Light = "#163e75"
                },
                Alternate = {
                    Main = "#007641",
                    Light = "#049654"
                },
                Endzone = "#c99700",
                Jersey = {
                    Home = {
                        NumberInner = "#ffffff",
                        NumberStroke = "#c99700",
                        Helmet = "#c99700",
                        Jersey = "#0a2242",
                        Stripe = "#FFFFFF",
                        Pants = "#c99700",
                        HelmetTexture = "rbxassetid://14101953431",
                        Logo = "rbxassetid://14101954597"
                    },
                    Away = {
                        NumberInner = "#0a2242",
                        NumberStroke = "#c99700",
                        Helmet = "#c99700",
                        Jersey = "#007641",
                        Stripe = "#0a2242",
                        Pants = "#c99700",
                        HelmetTexture = "rbxassetid://14101953431",
                        Logo = "rbxassetid://14101954597"
                    }
                }
            },
        }
    elseif (string.lower(teamName) == "syracuse") then
        return {
            City = "Syracuse",
            Name = "Orange",
            Abbreviation = "SYR",
            Colors = {
                Normal = {
                    Main = "#02193d",
                    Light = "#042a65"
                },
                Alternate = {
                    Main = "#ffffff",
                    Light = "#ffffff"
                },
                Endzone = "#f04e1e",
                Jersey = {
                    Home = {
                        NumberInner = "#ffffff",
                        NumberStroke = "#f04e1e",
                        Helmet = "#f04e1e",
                        Jersey = "#02193d",
                        Stripe = "#02193d",
                        Pants = "#f04e1e",
                        HelmetTexture = "rbxassetid://14101957893",
                        Logo = "rbxassetid://14101955354"
                    },
                    Away = {
                        NumberInner = "#f04e1e",
                        NumberStroke = "#02193d",
                        Helmet = "#f04e1e",
                        Jersey = "#ffffff",
                        Stripe = "#ffffff",
                        Pants = "#f04e1e",
                        HelmetTexture = "rbxassetid://14101957893",
                        Logo = "rbxassetid://14101955354"
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
