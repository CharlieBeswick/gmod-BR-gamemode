player_manager.AddValidModel( "Steve Burnside Cowboy", 				"models/player/ChocolatFurry5/ChocolatFurry5.mdl" )

player_manager.AddValidHands( "Steve Burnside Cowboy", "models/weapons/c_arms_cstrike.mdl", 0, "10000000" )

list.Set( "PlayerOptionsModel",  "Steve Burnside Cowboy", 				"models/player/ChocolatFurry5/ChocolatFurry5.mdl" )

local Category = "RE:DSC NPC" --This is where the npc will show up
 
local NPC = {   Name = "Steve Burnside Cowboy Friendly", 
                Class = "npc_citizen",
                Model = "models/player/ChocolatFurry5/ChocolatFurry5.mdl", 
                Health = "100", 
                KeyValues = { citizentype = 4 }, 
                Weapons = { "weapon_shotgun" }, 
                Category = Category }
                               
list.Set( "NPC", "SteveBurnsideCowboy_F", NPC )

local Category = "RE:DSC NPC" --This is where the npc will show up
 
local NPC = {   Name = "Steve Burnside Cowboy Hostile", 
                Class = "npc_combine",
                Model = "models/player/ChocolatFurry5/ChocolatFurry5.mdl", --Path to your model
                Health = "100", 
                Weapons = { "weapon_shotgun" }, 
                Category = Category }
                               
list.Set( "NPC", "SteveBurnsideCowboy_E", NPC )

if SERVER then
	resource.AddWorkshop("")
end
