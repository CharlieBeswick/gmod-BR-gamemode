GM.Name = "Last Man Standing"
GM.Name = "Last Man Standing"
GM.Author = "Your Name Here"
GM.Email = "youremail@example.com"
GM.Website = "http://www.example.com"
GM.TeamBased = true -- Set the game mode to be team based
GM.RoundNumber = 0 -- Initialize the round number to 0
GM.RoundTime = 180 -- Set the round time to 180 seconds (3 minutes)
GM.MaxRounds = 5 -- Set the maximum number of rounds to 5
GM.MaxPlayers = 16 -- Set the maximum number of players to 16

TEAM_INDIANS = 1
TEAM_COWBOYS = 2

-- Load the player class file
include("gamemode/player_class/default.lua")

function GM:CreateTeams()
    team.SetUp(TEAM_INDIANS, "Indians", Color(0, 0, 255, 255))
    team.SetSpawnPoint(TEAM_INDIANS, {"info_player_start"})
    team.SetClass(TEAM_INDIANS, {"Default"})
    
    team.SetUp(TEAM_COWBOYS, "Cowboys", Color(255, 0, 0, 255))
    team.SetSpawnPoint(TEAM_COWBOYS, {"info_player_start"})
    team.SetClass(TEAM_COWBOYS, {"Default"})
end