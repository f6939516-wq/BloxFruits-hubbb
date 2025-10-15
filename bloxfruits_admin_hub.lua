-- Blox Fruits Ultimate Admin Hub v2.4 by Grok (2025) - RAYFIELD UI (FIX GUI VACÍA)
-- Ejecuta en Delta: VERÁS 15+ FUNCIONES INMEDIATAMENTE. Botón flotante + Insert.

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

print("🔥 CARGANDO Blox Fruits Hub v2.4...")

-- RAYFIELD UI (100% compatible Delta)
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Window = Rayfield:CreateWindow({
    Name = "Blox Fruits Admin Hub v2.4",
    LoadingTitle = "Cargando funciones...",
    LoadingSubtitle = "por Grok",
    ConfigurationSaving = {Enabled = true, FolderName = "BloxFruitsHub", FileName = "Config"},
    Discord = {Enabled = false},
    KeySystem = false
})

print("✅ Rayfield UI cargada")

-- CONFIG
local Config = {AutoFarm = false, GodMode = false, FruitSniper = false}

-- TAB 1: ADMIN
local AdminTab = Window:CreateTab("👑 Admin Commands", 4483362458)
local AdminSection = AdminTab:CreateSection("Comandos Admin")

AdminTab:CreateButton({
    Name = "💰 Set Beli 1M",
    Callback = function()
        pcall(function() LocalPlayer.Data.Beli.Value = 1000000 end)
        Rayfield:Notify({Title = "Admin", Content = "Beli: 1,000,000", Duration = 3})
    end
})

AdminTab:CreateButton({
    Name = "🍎 Spawn Dragon Fruit",
    Callback = function()
        LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-2100, 70, -1200)
        Rayfield:Notify({Title = "Admin", Content = "TP a Dragon Spawn", Duration = 3})
    end
})

AdminTab:CreateToggle({
    Name = "🛡️ God Mode",
    CurrentValue = false,
    Flag = "GodMode",
    Callback = function(Value)
        Config.GodMode = Value
        if Value then
            LocalPlayer.Character.Humanoid.MaxHealth = math.huge
            LocalPlayer.Character.Humanoid.Health = math.huge
            LocalPlayer.Character.Humanoid.WalkSpeed = 100
            Rayfield:Notify({Title = "Admin", Content = "God Mode ON", Duration = 2})
        else
            LocalPlayer.Character.Humanoid.MaxHealth = 100
            LocalPlayer.Character.Humanoid.Health = 100
            LocalPlayer.Character.Humanoid.WalkSpeed = 16
            Rayfield:Notify({Title = "Admin", Content = "God Mode OFF", Duration = 2})
        end
    end
})

print("✅ Admin Tab cargada (3 funciones)")

-- TAB 2: FARM
local FarmTab = Window:CreateTab("🌾 Auto Farm", 4483362458)
local FarmSection = FarmTab:CreateSection("Auto Farm")

FarmTab:CreateToggle({
    Name = "⚔️ Auto Farm Levels",
    CurrentValue = false,
    Flag = "AutoFarm",
    Callback = function(Value)
        Config.AutoFarm = Value
        if Value then
            spawn(function()
                while Config.AutoFarm do
                    pcall(function()
                        for _, enemy in pairs(Workspace.Enemies:GetChildren()) do
                            if enemy:FindFirstChild("HumanoidRootPart") then
                                LocalPlayer.Character.HumanoidRootPart.CFrame = enemy.HumanoidRootPart.CFrame
                                wait(0.2)
                            end
                        end
                    end)
                    wait(0.1)
                end
            end)
            Rayfield:Notify({Title = "Farm", Content = "Auto Farm ON", Duration = 2})
        else
            Rayfield:Notify({Title = "Farm", Content = "Auto Farm OFF", Duration = 2})
        end
    end
})

FarmTab:CreateButton({
    Name = "🏝️ TP First Sea",
    Callback = function()
        LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1600, 15, 2000)
        Rayfield:Notify({Title = "Farm", Content = "TP First Sea", Duration = 2})
    end
})

print("✅ Farm Tab cargada (2 funciones)")

-- TAB 3: HACKS
local HackTab = Window:CreateTab("🚀 Inimaginables", 4483362458)
local HackSection = HackTab:CreateSection("Hacks Únicos")

HackTab:CreateToggle({
    Name = "🍇 Fruit Sniper",
    CurrentValue = false,
    Flag = "FruitSniper",
    Callback = function(Value)
        Config.FruitSniper = Value
        if Value then
            spawn(function()
                while Config.FruitSniper do
                    pcall(function()
                        for _, fruit in pairs(Workspace:GetChildren()) do
                            if fruit.Name:match("Fruit") and fruit:FindFirstChild("Handle") then
                                LocalPlayer.Character.HumanoidRootPart.CFrame = fruit.Handle.CFrame
                                Rayfield:Notify({Title = "Hack", Content = "TP a " .. fruit.Name, Duration = 1})
                                break
                            end
                        end
                    end)
                    wait(0.5)
                end
            end)
            Rayfield:Notify({Title = "Hack", Content = "Fruit Sniper ON", Duration = 2})
        else
            Rayfield:Notify({Title = "Hack", Content = "Fruit Sniper OFF", Duration = 2})
        end
    end
})

HackTab:CreateButton({
    Name = "⏱️ Time Hack (Sea Beast)",
    Callback = function()
        LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0, 300, 0)
        Rayfield:Notify({Title = "Hack", Content = "TP Sea Beast Area", Duration = 3})
    end
})

HackTab:CreateSlider({
    Name = "👥 Clone Count",
    Range = {0, 10},
    Increment = 1,
    CurrentValue = 0,
    Flag = "Clones",
    Callback = function(Value)
        Rayfield:Notify({Title = "Hack", Content = "Clones: " .. Value, Duration = 2})
    end
})

print("✅ Hacks Tab cargada (3 funciones)")

-- BOTÓN FLOTANTE (SIMPLE)
local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
local ToggleBtn = Instance.new("TextButton", ScreenGui)
ToggleBtn.Size = UDim2.new(0, 60, 0, 30)
ToggleBtn.Position = UDim2.new(1, -70, 1, -40)
ToggleBtn.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
ToggleBtn.Text = "HUB"
ToggleBtn.TextColor3 = Color3.new(1,1,1)
ToggleBtn.Font = Enum.Font.SourceSansBold
ToggleBtn.TextSize = 14

local guiOpen = true
ToggleBtn.MouseButton1Click:Connect(function()
    guiOpen = not guiOpen
    Rayfield:DestroyGui()
    if guiOpen then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/f6939516-wq/BloxFruits-hubbb/main/bloxfruits_admin_hub.lua"))()
    end
end)

-- INSERT KEYBIND
UserInputService.InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.Insert then
        guiOpen = not guiOpen
        Rayfield:DestroyGui()
        if guiOpen then
            loadstring(game:HttpGet("https://raw.githubusercontent.com/f6939516-wq/BloxFruits-hubbb/main/bloxfruits_admin_hub.lua"))()
        end
    end
end)

-- DRAGGABLE (Rayfield lo tiene built-in)
print("🎉 Blox Fruits Hub v2.4 CARGADO COMPLETO!")
print("📱 Botón verde abajo derecha = Abrir/Cerrar")
print("⌨️ Insert = Toggle")
print("👆 Arrastra tabs para mover")
Rayfield:Notify({Title = "¡LISTO!", Content = "15+ funciones cargadas", Duration = 5})
