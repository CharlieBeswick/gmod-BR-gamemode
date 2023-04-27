DEFINE_BASECLASS("player_default")

local PLAYER = {}

PLAYER.DisplayName = "Default"
PLAYER.WalkSpeed = 200
PLAYER.RunSpeed = 300
PLAYER.JumpPower = 200
PLAYER.MaxHealth = 100
PLAYER.StartHealth = 100
PLAYER.StartArmor = 0

function PLAYER:Loadout()
    self.Player:Give("weapon_lordi_sledgehammer")
end

function PLAYER:SetModel()
    self.Player:SetModel("models/player/chocolatfurry5/chocolatfurry5.mdl")
end

player_manager.RegisterClass("Default", PLAYER, "player_default")