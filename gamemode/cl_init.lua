include("shared.lua")

-- Define the user interface
function GM:HUDPaint()
    local ply = LocalPlayer()

    draw.RoundedBox(4, 10, 10, 200, 30, Color(0, 0, 0, 150)) -- Draw a black box for the health bar
    draw.RoundedBox(4, 10, 50, 200, 30, Color(0, 0, 0, 150)) -- Draw a black box for the ammo counter

    local health = math.Clamp(ply:Health(), 0, 100) -- Get the player's health
    draw.RoundedBox(4, 12, 12, 196 * health / 100, 26, Color(255, 0, 0, 150)) -- Draw a red health bar

    local weapon = ply:GetActiveWeapon() -- Get the player's active weapon
    if IsValid(weapon) then
        local ammo = weapon:Clip1() -- Get the ammo in the player's current weapon
        draw.SimpleText(ammo, "Default", 110, 55, Color(255, 255, 255, 255)) -- Draw the ammo counter
    end
end

-- Define the end of round screen
net.Receive("LMSPlayerWon", function()
    local winner = net.ReadString()
    surface.CreateFont("LMSBigFont", {
        font = "Arial",
        size = 64,
        weight = 1000,
        antialias = true,
    })
    hook.Add("HUDPaint", "LMSPlayerWon", function()
        draw.SimpleText("Game over - " .. winner .. " wins!", "LMSBigFont", ScrW() / 2, ScrH() / 2, Color(255, 0, 0, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
    end)
end)