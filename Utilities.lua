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
    if (string.lower(teamName) == "florida") then
        return {
            City = "Florida State",
            Name = "Seminoles",
            Abbreviation = "FSU",
            Colors = {
                Normal = {
                    Main = "#792b3e",
                    Light = "#8e3349"
                },
                Alternate = {
                    Main = "#ffffff",
                    Light = "#ffffff"
                },
                Endzone = "#8e3349",
                Jersey = {
                    Home = {
                        NumberInner = "#d7b87f",
                        NumberStroke = "#ffffff",
                        Helmet = "#d7b87f",
                        Jersey = "#792b3e",
                        Stripe = "#792b3e",
                        Pants = "#d7b87f",
                        HelmetTexture = "rbxassetid://14136048844",
                        Logo = "rbxassetid://14136035262"
                    },
                    Away = {
                        NumberInner = "#792b3e",
                        NumberStroke = "#ffffff",
                        Helmet = "#d7b87f",
                        Jersey = "#ffffff",
                        Stripe = "#792b3e",
                        Pants = "#ffffff",
                        HelmetTexture = "rbxassetid://14136048844",
                        Logo = "rbxassetid://14136035262"
                    }
                }
            },
        }
    elseif (string.lower(teamName) == "texas") then
        return {
            City = "Texas Tech",
            Name = "Red Raiders",
            Abbreviation = "TTU",
            Colors = {
                Normal = {
                    Main = "#cd0000",
                    Light = "#fe2121"
                },
                Alternate = {
                    Main = "#000000",
                    Light = "#171717"
                },
                Endzone = "#000000",
                Jersey = {
                    Home = {
                        NumberInner = "#ffffff",
                        NumberStroke = "#000000",
                        Helmet = "#ffffff",
                        Jersey = "#cd0000",
                        Stripe = "#ffffff",
                        Pants = "#ffffff",
                        HelmetTexture = "rbxassetid://14102464252",
                        Logo = "rbxassetid://14172533915"
                    },
                    Away = {
                        NumberInner = "#ffffff",
                        NumberStroke = "#cd0000",
                        Helmet = "#000000",
                        Jersey = "#000000",
                        Stripe = "#000000",
                        Pants = "#000000",
                        HelmetTexture = "rbxassetid://14172529295",
                        Logo = "rbxassetid://14172533915"
                    }
                }
            },
        }
    end
    return nil
end

local RSPNChannels = {
    ["RoSportProgrammingNetwork"] = "730050166",
    ["RSPN_2"] = "846285089",
    ["RSPN3"] = "846285510",
    ["RSPN4"] = "875247498",
    ["RSPN_5"] = "875247935",
    ["RSPNDeportes"] = "875248189"
}

function module:GetRSPNChannels()
    return RSPNChannels
end

function module:GetChannelID(channel)
    return RSPNChannels[channel]
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
