local Players = game:GetService("Players")
local player = Players.LocalPlayer
local mouse = player:GetMouse()

-- Lista dei pesci disponibili
local pesciDisponibili = {
    "Ember Snapper",
    "Volcanic Geode",
    "Obsidian Salmon",
    "Obsidian Swordfish",
    "Herring",
    "Arctic Char",
    "Glacier Pike",
    "Pond Emperor",
    "Glacierfish",
    "Swamp Bass",
    "Bowfin",
    "Marsh Gar",
    "Alligator",
    "Haddock",
    "Mackerel",
    "Sea Bass",
    "Smallmouth Bass",
    "White Bass",
    "Golden Smallmouth Bass",
    "Gazerfish",
    "Globe Jellyfish",
    "Eyefestation",
    "Skate Tuna",
    "Phantom Ray",
    "Cockatoo Squid",
    "Shortfin Mako Shark",
    "Galleon Goliath",
    "Shipwreck Barracuda",
    "Captain’s Goldfish",
    "Deep-Sea Hatchetfish",
    "Deep-Sea Dragonfish",
    "Candy Fish",
    "Skelefish",
    "Lego Fish",
    "Phantom Megalodon",
    "Megalodon",
    "Ancient Megalodon"
}

local pescaSelezionata = nil
local autoPescaAttivata = false

-- Creazione della GUI
local gui = Instance.new("ScreenGui")
gui.Name = "PescaGUI"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 300, 0, 450)
frame.Position = UDim2.new(0.5, -150, 0.5, -225)
frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
frame.Visible = true
frame.Parent = gui

-- Bottone per selezionare il pesce
local menuPesci = Instance.new("TextButton")
menuPesci.Size = UDim2.new(0, 280, 0, 50)
menuPesci.Position = UDim2.new(0.5, -140, 0, 20)
menuPesci.Text = "Seleziona Pesce"
menuPesci.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
menuPesci.TextColor3 = Color3.fromRGB(255, 255, 255)
menuPesci.Parent = frame

-- Frame scrollabile per la lista dei pesci
local dropdown = Instance.new("ScrollingFrame")
dropdown.Size = UDim2.new(0, 280, 0, 200)
dropdown.Position = UDim2.new(0.5, -140, 0, 80)
dropdown.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
dropdown.Visible = false
dropdown.CanvasSize = UDim2.new(0, 0, 0, #pesciDisponibili * 40)
dropdown.ScrollBarThickness = 8
dropdown.Parent = frame

-- Aggiunta dei bottoni per ogni pesce
for i, pesce in ipairs(pesciDisponibili) do
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(1, 0, 0, 40)
    button.Position = UDim2.new(0, 0, 0, (i - 1) * 40)
    button.Text = pesce
    button.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
    button.TextColor3 = Color3.fromRGB(0, 0, 0)
    button.Parent = dropdown

    button.MouseButton1Click:Connect(function()
        pescaSelezionata = pesce
        menuPesci.Text = "Pesce Selezionato: " .. pescaSelezionata
        dropdown.Visible = false
    end)
end

menuPesci.MouseButton1Click:Connect(function()
    dropdown.Visible = not dropdown.Visible
end)

-- Bottone per avviare la pesca
local pescaButton = Instance.new("TextButton")
pescaButton.Size = UDim2.new(0, 280, 0, 50)
pescaButton.Position = UDim2.new(0.5, -140, 0, 300)
pescaButton.Text = "Pesca!"
pescaButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
pescaButton.TextColor3 = Color3.fromRGB(255, 255, 255)
pescaButton.Parent = frame

-- Funzione per avviare la pesca
local function iniziaPesca()
    if pescaSelezionata then
        print("Pesca in corso... Pescando il pesce: " .. pescaSelezionata)
        -- Inserisci qui il codice per attivare l'animazione di pesca o il processo di pesca in gioco
    else
        print("Seleziona un pesce prima di pescare.")
    end
end

pescaButton.MouseButton1Click:Connect(function()
    iniziaPesca()
end)

-- Funzione per attivare/disattivare l'auto-pesca
local function toggleAutoPesca()
    autoPescaAttivata = not autoPescaAttivata
    if autoPescaAttivata then
        print("Auto-pesca attivata")
    else
        print("Auto-pesca disattivata")
    end
end

-- Tasto "F" per mostrare/nascondere la GUI
mouse.KeyDown:Connect(function(key)
    if key:lower() == "f" then
        frame.Visible = not frame.Visible
    end
end)

-- Loop per l'auto-pesca
spawn(function()
    while true do
        wait(5)
        if autoPescaAttivata and pescaSelezionata then
            print("Auto-pesca in corso... Pescando il pesce: " .. pescaSelezionata)
            -- Inserisci qui il codice per attivare l'animazione di pesca automatica
        end
    end
end)
