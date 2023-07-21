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
    if (string.lower(teamName) == "florida state") then
                return {
            City = "Florida State",
            Name = "Seminoles",
            Abbreviation = "FSU",
            Colors = {
                Normal = {
                    Main = "#792b3e",
                    Light = "#8e344a"
                },
                Alternate = {
                    Main = "#ffffff",
                    Light = "#ffffff"
                },
                Endzone = "#8e344a",
                Jersey = {
                    Home = {
                        NumberInner = "#d1b989",
                        NumberStroke = "#fffffff",
                        Helmet = "#d1b989",
                        Jersey = "#792b3e",
                        Stripe = "#792b3e",
                        Pants = "#d1b989",
                        HelmetTexture = "rbxassetid://14136048844",
                        Logo = "rbxassetid://14136035262"
                    },
                    Away = {
                        NumberInner = "#792b3e",
                        NumberStroke = "#d1b989",
                        Helmet = "#ffffff",
                        Jersey = "#ffffff",
                        Stripe = "#792b3e",
                        Pants = "#ffffff",
                        HelmetTexture = "rbxassetid://14136048844",
                        Logo = "rbxassetid://14136035262"
                    }
                }
            },
        }
    elseif (string.lower(teamName) == "clemson") then
        return {
            City = "Clemson",
            Name = "Tigers",
            Abbreviation = "CLEM",
            Colors = {
                Normal = {
                    Main = "#f56600",
                    Light = "#ff7e22"
                },
                Alternate = {
                    Main = "#ffffff",
                    Light = "#ffffff"
                },
                Endzone = "#ff7e22",
                Jersey = {
                    Home = {
                        NumberInner = "#ffffff",
                        NumberStroke = "#4e2586",
                        Helmet = "#f56600",
                        Jersey = "#f56600",
                        Stripe = "#f56600",
                        Pants = "#f56600",
                        HelmetTexture = "rbxassetid://14136050366",
                        Logo = "rbxassetid://14136029678"
                    },
                    Away = {
                        NumberInner = "#f56600",
                        NumberStroke = "#4e2586",
                        Helmet = "#f56600",
                        Jersey = "#ffffff",
                        Stripe = "#ffffff",
                        Pants = "#ffffff",
                        HelmetTexture = "rbxassetid://14136050366",
                        Logo = "rbxassetid://14136029678"
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
