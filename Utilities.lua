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
    elseif (string.lower(teamName) == "florida") then
        return {
            City = "Florida State",
            Name = "Seminoles",
            Abbreviation = "FSU",
            Colors = {
                Normal = {
                    Main = "#792b3e",
                    Light = "#92364c"
                },
                Alternate = {
                    Main = "#ffffff",
                    Light = "#ffffff"
                },
                Endzone = "#792b3e",
                Jersey = {
                    Home = {
                        NumberInner = "#d1b989",
                        NumberStroke = "#ffffff",
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
                        Stripe = "#ffffff",
                        Pants = "#ffffff",
                        HelmetTexture = "rbxassetid://14136048844",
                        Logo = "rbxassetid://14136035262"
                    }
                }
            },
        }
    elseif (string.lower(teamName) == "illinois") then
        return {
            City = "Illinois",
            Name = "Fighting Illini",
            Abbreviation = "ILL",
            Colors = {
                Normal = {
                    Main = "#eb461c",
                    Light = "#fa653f"
                },
                Alternate = {
                    Main = "#ffffff",
                    Light = "#ffffff"
                },
                Endzone = "#eb461c",
                Jersey = {
                    Home = {
                        NumberInner = "#0b2146",
                        NumberStroke = "#0b2146",
                        Helmet = "#eb461c",
                        Jersey = "#eb461c",
                        Stripe = "#eb461c",
                        Pants = "#eb461c",
                        HelmetTexture = "rbxassetid://14305114893",
                        Logo = "rbxassetid://14305129123"
                    },
                    Away = {
                        NumberInner = "#eb461c",
                        NumberStroke = "#eb461c",
                        Helmet = "#ffffff",
                        Jersey = "#ffffff",
                        Stripe = "#ffffff",
                        Pants = "#ffffff",
                        HelmetTexture = "rbxassetid://14102464252",
                        Logo = "rbxassetid://14305138608"
                    }
                }
            },
        }
    elseif (string.lower(teamName) == "kansas") then
        return {
            City = "Kansas",
            Name = "Jayhawks",
            Abbreviation = "KU",
            Colors = {
                Normal = {
                    Main = "#004fb9",
                    Light = "#fe2121"
                },
                Alternate = {
                    Main = "#ffffff",
                    Light = "#ffffff"
                },
                Endzone = "#035cd3",
                Jersey = {
                    Home = {
                        NumberInner = "#ffffff",
                        NumberStroke = "#ba4858",
                        Helmet = "#004fb9",
                        Jersey = "#004fb9",
                        Stripe = "#ba4858",
                        Pants = "#004fb9",
                        HelmetTexture = "rbxassetid://14230064266",
                        Logo = "rbxassetid://14230066804"
                    },
                    Away = {
                        NumberInner = "#004fb9",
                        NumberStroke = "#ba4858",
                        Helmet = "#ffffff",
                        Jersey = "#ffffff",
                        Stripe = "#004fb9",
                        Pants = "#ffffff",
                        HelmetTexture = "rbxassetid://14102464252",
                        Logo = "rbxassetid://14230066804"
                    }
                }
            },
        }
    elseif (string.lower(teamName) == "indiana") then
        return {
            City = "Indiana",
            Name = "Hoosiers",
            Abbreviation = "IND",
            Colors = {
                Normal = {
                    Main = "#9a0000",
                    Light = "#ba0404"
                },
                Alternate = {
                    Main = "#ffffff",
                    Light = "#ffffff"
                },
                Endzone = "#ffffff",
                Jersey = {
                    Home = {
                        NumberInner = "#ffffff",
                        NumberStroke = "#9a0000",
                        Helmet = "#9a0000",
                        Jersey = "#9a0000",
                        Stripe = "#ffffff",
                        Pants = "#ffffff",
                    },
                    Away = {
                        NumberInner = "#9a0000",
                        NumberStroke = "#ffffff",
                        Helmet = "#9a0000",
                        Jersey = "#ffffff",
                        Stripe = "#ffffff",
                        Pants = "#ffffff",
                    }
                }
            },
        }
    elseif (string.lower(teamName) == "connecticut") then
        return {
            City = "Connecticut",
            Name = "Huskies",
            Abbreviation = "CONN",
            Colors = {
                Normal = {
                    Main = "#070d33",
                    Light = "#0c1554"
                },
                Alternate = {
                    Main = "#ffffff",
                    Light = "#ffffff"
                },
                Endzone = "#070d33",
                Jersey = {
                    Home = {
                        NumberInner = "#ffffff",
                        NumberStroke = "#ffffff",
                        Helmet = "#070d33",
                        Jersey = "#070d33",
                        Stripe = "#070d33",
                        Pants = "#070d33",
                        HelmetTexture = "rbxassetid://14082617721",
                        Logo = "rbxassetid://14082583575"
                    },
                    Away = {
                        NumberInner = "#070d33",
                        NumberStroke = "#ffffff",
                        Helmet = "#070d33",
                        Jersey = "#ffffff",
                        Stripe = "#ffffff",
                        Pants = "#070d33",
                        HelmetTexture = "rbxassetid://14082617721",
                        Logo = "rbxassetid://14082583575"
                    }
                }
            },
        }
    elseif (string.lower(teamName) == "arizona") then
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
    elseif (string.lower(teamName) == "georgia") then
        return {
            City = "Georgia",
            Name = "Bulldogs",
            Abbreviation = "UGA",
            Colors = {
                Normal = {
                    Main = "#cd0030",
                    Light = "#e8053a"
                },
                Alternate = {
                    Main = "#ffffff",
                    Light = "#ffffff"
                },
                Endzone = "#cd0030",
                Jersey = {
                    Home = {
                        NumberInner = "#ffffff",
                        NumberStroke = "#040203",
                        Helmet = "#cd0030",
                        Jersey = "#cd0030",
                        Stripe = "#cd0030",
                        Pants = "#ffffff",
                        HelmetTexture = "rbxassetid://14091515996",
                        Logo = "rbxassetid://14091374120"
                    },
                    Away = {
                        NumberInner = "#000001",
                        NumberStroke = "#cd0030",
                        Helmet = "#cd0030",
                        Jersey = "#ffffff",
                        Stripe = "#ffffff",
                        Pants = "#ffffff",
                        HelmetTexture = "rbxassetid://14091515996",
                        Logo = "rbxassetid://14091374120"
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
    elseif (string.lower(teamName) == "colorado state") then
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
    elseif (string.lower(teamName) == "ucf") then
        return {
            City = "UCF",
            Name = "Knights",
            Abbreviation = "UCF",
            Colors = {
                Normal = {
                    Main = "#b79a61",
                    Light = "#ccad6f"
                },
                Alternate = {
                    Main = "#ffffff",
                    Light = "#ffffff"
                },
                Endzone = "#b79a61",
                Jersey = {
                    Home = {
                        NumberInner = "#ffffff",
                        NumberStroke = "#1d1f1a",
                        Helmet = "#ffffff",
                        Jersey = "#b79a61",
                        Stripe = "#b79a61",
                        Pants = "#ffffff",
                        HelmetTexture = "rbxassetid://14102464252",
                        Logo = "rbxassetid://14102465358"
                    },
                    Away = {
                        NumberInner = "#b79a61",
                        NumberStroke = "#1d1f1a",
                        Helmet = "#ffffff",
                        Jersey = "#ffffff",
                        Stripe = "#ffffff",
                        Pants = "#b79a61",
                        HelmetTexture = "rbxassetid://14102464252",
                        Logo = "rbxassetid://14102465358"
                    }
                }
            },
        }
    elseif (string.lower(teamName) == "lfg") then
        return {
            City = "LFG",
            Name = "Esports",
            Abbreviation = "LFG",
            Colors = {
                Normal = {
                    Main = "#eeca69",
                    Light = "#fdd772"
                },
                Alternate = {
                    Main = "#ffffff",
                    Light = "#ffffff"
                },
                Endzone = "#fdd772",
                Jersey = {
                    Home = {
                        NumberInner = "#000000",
                        NumberStroke = "#ffffff",
                        Helmet = "#fdd772",
                        Jersey = "#fdd772",
                        Stripe = "#fdd772",
                        Pants = "#ffffff",
                        HelmetTexture = "rbxassetid://14143428259",
                        Logo = "rbxassetid://14143426558"
                    },
                    Away = {
                        NumberInner = "#fdd772",
                        NumberStroke = "#000000",
                        Helmet = "#fdd772",
                        Jersey = "#ffffff",
                        Stripe = "#ffffff",
                        Pants = "#ffffff",
                        HelmetTexture = "rbxassetid://14143428259",
                        Logo = "rbxassetid://14143426558"
                    }
                }
            },
        }
    elseif (string.lower(teamName) == "nebraska") then
        return {
            City = "Nebraska",
            Name = "Cornhuskers",
            Abbreviation = "NEB",
            Colors = {
                Normal = {
                    Main = "#cb0a2c",
                    Light = "#ffffff"
                },
                Alternate = {
                    Main = "#ffffff",
                    Light = "#cb0a2c"
                },
                Endzone = "#cb0a2c",
                Jersey = {
                    Home = {
                        NumberInner = "#ffffff",
                        NumberStroke = "#ffffff",
                        Helmet = "#ffffff",
                        Jersey = "#cb0a2c",
                        Stripe = "#cb0a2c",
                        Pants = "#ffffff",
                        HelmetTexture = "rbxassetid://14102464252",
                        Logo = "rbxassetid://14244659144"
                    },
                    Away = {
                        NumberInner = "#cb0a2c",
                        NumberStroke = "#cb0a2c",
                        Helmet = "#ffffff",
                        Jersey = "#ffffff",
                        Stripe = "#ffffff",
                        Pants = "#cb0a2c",
                        HelmetTexture = "rbxassetid://14102464252",
                        Logo = "rbxassetid://14244659144"
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
