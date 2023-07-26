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
    if (string.lower(teamName) == "arizona") then
        return {
            City = "Arizona",
            Name = "Wildcats",
            Abbreviation = "ARIZ",
            Colors = {
                Normal = {
                    Main = "#003066",
                    Light = "#023e82"
                },
                Alternate = {
                    Main = "#ffffff",
                    Light = "#ffffff"
                },
                Endzone = "#003066",
                Jersey = {
                    Home = {
                        NumberInner = "#cd0030",
                        NumberStroke = "#ffffff",
                        Helmet = "#003066",
                        Jersey = "#003066",
                        Stripe = "#003066",
                        Pants = "#003066",
                        HelmetTexture = "rbxassetid://14091411792",
                        Logo = "rbxassetid://13157798270"
                    },
                    Away = {
                        NumberInner = "#003066",
                        NumberStroke = "#cd0030",
                        Helmet = "#ffffff",
                        Jersey = "#ffffff",
                        Stripe = "#ffffff",
                        Pants = "#ffffff",
                        HelmetTexture = "rbxassetid://14091387178",
                        Logo = "rbxassetid://13157798270"
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
