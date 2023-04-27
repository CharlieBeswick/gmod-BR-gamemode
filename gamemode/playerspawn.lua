function GM:PlayerSpawn(ply)
  ply:Spectate(OBS_MODE_ROAMING)
  ply:SetMoveType(MOVETYPE_NONE)
  ply:SetNoDraw(true)
  ply:StripWeapons()
  ply:StripAmmo()
end

function GM:Initialize()
  -- Wait for players to connect
  timer.Simple(30, function()
     -- Assign players to teams
     AssignTeams()
  end)
end

function AssignTeams()
  local players = player.GetAll()
  local num_players = #players
  local num_indians = team.NumPlayers(TEAM_INDIANS)
  local num_cowboys = team.NumPlayers(TEAM_COWBOYS)
  
  -- Calculate number of players to assign to each team
  local num_new_cowboys = math.ceil(num_players / 2) - num_cowboys
  local num_new_indians = num_players - num_new_cowboys - num_cowboys
  
  -- Assign players to teams
  for _, ply in pairs(players) do
     if ply:Team() == TEAM_SPECTATOR then
        local team = nil
        if num_new_cowboys > 0 then
           team = TEAM_COWBOYS
           num_new_cowboys = num_new_cowboys - 1
        else
           team = TEAM_INDIANS
           num_new_indians = num_new_indians - 1
        end
        ply:SetTeam(team)
        ply:Spawn()
     end
  end
end

