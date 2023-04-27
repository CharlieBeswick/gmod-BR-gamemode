GM.Name = "Last Man Standing"
GM.Author = "Your Name"
GM.Email = "your@email.com"
GM.Website = "http://yourwebsite.com"

-- Define the game mode rules
function GM:Initialize()
    
    weapons.Register({
        ClassName = "weapon_lordi_sledgehammer",
        PrintName = "Sledgehammer",
        Spawnable = true,
        SpawnFlags = bit.bor(SF_WEAPON_NO_PLAYER_PICKUP, SF_WEAPON_START_CONSTRAINED),
        Category = "Your Category Here",
    })
    self:SetRoundTime(300) -- Set the round time to 5 minutes
    self:SetTeamBalanceEnabled(false) -- Disable team balancing
    self:SetGameDescription("Be the last player standing to win!") -- Set the game description
end

-- Define the weapons for the game mode
function GM:PlayerLoadout(ply)
    ply:Give("weapon_lordi_sledgehammer") -- Give the player a pistol
    --ply:Give("weapon_crowbar") -- Give the player a crowbar
    --ply:GiveAmmo(60, "Pistol", true) -- Give the player 60 rounds of pistol ammo
end

-- Define the gameplay elements
function GM:PlayerDeath(ply, inflictor, attacker)
    ply:CreateRagdoll() -- Create a ragdoll for the player
    ply:AddDeaths(1) -- Increment the player's death count
    if ( ply:IsValid() ) then
		ply:DropWeapon()
	end
    if ply:Team() == TEAM_ALIVE then
        ply:SetTeam(TEAM_DEAD) -- Change the player's team to dead
        if team.NumPlayers(TEAM_ALIVE) <= 1 then
            GAMEMODE:EndRound(TEAM_ALIVE) -- End the round if there's only one player left alive
        end
    end
end

-- Set up networking
util.AddNetworkString("LMSPlayerWon")
function GM:EndRound(winningTeam)
    net.Start("LMSPlayerWon")
    net.WriteString(team.GetName(winningTeam))
    net.Broadcast()
    self:RestartRound()
end

include("gamemode/playerspawn.lua")