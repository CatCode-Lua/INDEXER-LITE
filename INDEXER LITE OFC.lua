-- ============================================
-- Indexer Exploit v3.1 - FIXED EDITION
-- ============================================

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local MarketplaceService = game:GetService("MarketplaceService")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Colores
local BLACK = Color3.fromRGB(0, 0, 0)
local DARK = Color3.fromRGB(15, 15, 15)
local GRAY = Color3.fromRGB(40, 40, 40)
local LIGHT = Color3.fromRGB(150, 150, 150)
local WHITE = Color3.fromRGB(255, 255, 255)

-- Clipboard function
local function copy(text)
    if syn and syn.set_clipboard then
        syn.set_clipboard(text)
    elseif setclipboard then
        setclipboard(text)
    elseif toclipboard then
        toclipboard(text)
    else
        print("Clipboard:", text)
    end
end

-- Crear GUI
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "IndexerExploit"
screenGui.ResetOnSpawn = false
screenGui.Parent = playerGui

-- ============================================
-- PANTALLA DE INTRO
-- ============================================
local intro = Instance.new("Frame")
intro.Name = "Intro"
intro.Size = UDim2.new(1, 0, 1, 0)
intro.BackgroundColor3 = BLACK
intro.BorderSizePixel = 0
intro.ZIndex = 1000
intro.Parent = screenGui

-- Texto INDEXER
local indexer = Instance.new("TextLabel")
indexer.Size = UDim2.new(1, 0, 0, 100)
indexer.Position = UDim2.new(0, 0, 0.35, 0)
indexer.BackgroundTransparency = 1
indexer.Text = "INDEXER"
indexer.TextColor3 = WHITE
indexer.Font = Enum.Font.GothamBlack
indexer.TextSize = 100
indexer.ZIndex = 1001
indexer.Parent = intro

-- Linea
local line = Instance.new("Frame")
line.Size = UDim2.new(0, 0, 0, 3)
line.Position = UDim2.new(0.5, 0, 0.5, 0)
line.AnchorPoint = Vector2.new(0.5, 0.5)
line.BackgroundColor3 = WHITE
line.BorderSizePixel = 0
line.ZIndex = 1001
line.Parent = intro

-- Texto EXPLOIT
local exploit = Instance.new("TextLabel")
exploit.Size = UDim2.new(1, 0, 0, 60)
exploit.Position = UDim2.new(0, 0, 0.52, 0)
exploit.BackgroundTransparency = 1
exploit.Text = "EXPLOIT"
exploit.TextColor3 = LIGHT
exploit.Font = Enum.Font.GothamBold
exploit.TextSize = 50
exploit.ZIndex = 1001
exploit.Parent = intro

-- Version
local version = Instance.new("TextLabel")
version.Size = UDim2.new(1, 0, 0, 20)
version.Position = UDim2.new(0, 0, 0.7, 0)
version.BackgroundTransparency = 1
version.Text = "v3.1 | EXECUTOR EDITION"
version.TextColor3 = GRAY
version.Font = Enum.Font.Gotham
version.TextSize = 14
version.ZIndex = 1001
version.Parent = intro

-- ============================================
-- UI PRINCIPAL (inicialmente oculta)
-- ============================================
local main = Instance.new("Frame")
main.Name = "Main"
main.Size = UDim2.new(0, 400, 0, 300)
main.Position = UDim2.new(0.5, -200, 0.5, -150)
main.BackgroundColor3 = DARK
main.BorderSizePixel = 0
main.Visible = false
main.Parent = screenGui

-- Esquinas
local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 6)
corner.Parent = main

-- Borde
local stroke = Instance.new("UIStroke")
stroke.Color = GRAY
stroke.Thickness = 1
stroke.Parent = main

-- Barra titulo
local titleBar = Instance.new("Frame")
titleBar.Size = UDim2.new(1, 0, 0, 50)
titleBar.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
titleBar.BorderSizePixel = 0
titleBar.Parent = main

local titleCorner = Instance.new("UICorner")
titleCorner.CornerRadius = UDim.new(0, 6)
titleCorner.Parent = titleBar

-- Fix esquinas
local fix = Instance.new("Frame")
fix.Size = UDim2.new(1, 0, 0.5, 0)
fix.Position = UDim2.new(0, 0, 0.5, 0)
fix.BackgroundColor3 = titleBar.BackgroundColor3
fix.BorderSizePixel = 0
fix.Parent = titleBar

-- Logo
local logo = Instance.new("TextLabel")
logo.Size = UDim2.new(0, 35, 0, 35)
logo.Position = UDim2.new(0, 15, 0, 7)
logo.BackgroundColor3 = WHITE
logo.Text = "I"
logo.TextColor3 = BLACK
logo.Font = Enum.Font.GothamBlack
logo.TextSize = 20
logo.Parent = titleBar

local logoCorner = Instance.new("UICorner")
logoCorner.CornerRadius = UDim.new(0, 4)
logoCorner.Parent = logo

-- Titulo
local title = Instance.new("TextLabel")
title.Size = UDim2.new(0, 150, 1, 0)
title.Position = UDim2.new(0, 60, 0, 0)
title.BackgroundTransparency = 1
title.Text = "INDEXER  EXPLOIT"
title.TextColor3 = WHITE
title.Font = Enum.Font.GothamBold
title.TextSize = 20
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = titleBar

-- Boton X
local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0, 35, 0, 35)
closeBtn.Position = UDim2.new(1, -45, 0, 7)
closeBtn.BackgroundColor3 = GRAY
closeBtn.Text = "×"
closeBtn.TextColor3 = WHITE
closeBtn.Font = Enum.Font.GothamBold
closeBtn.TextSize = 24
closeBtn.AutoButtonColor = false
closeBtn.Parent = titleBar

local closeCorner = Instance.new("UICorner")
closeCorner.CornerRadius = UDim.new(0, 6)
closeCorner.Parent = closeBtn

-- Contenido
local content = Instance.new("Frame")
content.Size = UDim2.new(1, -30, 1, -65)
content.Position = UDim2.new(0, 15, 0, 60)
content.BackgroundTransparency = 1
content.Parent = main

-- Info del juego
local success, info = pcall(function()
    return MarketplaceService:GetProductInfo(game.PlaceId)
end)
local gameName = success and info.Name or "Unknown"
local gameId = tostring(game.PlaceId)

-- Funcion crear campo
local function createField(labelText, valueText, yPos)
    local container = Instance.new("Frame")
    container.Size = UDim2.new(1, 0, 0, 70)
    container.Position = UDim2.new(0, 0, 0, yPos)
    container.BackgroundTransparency = 1
    container.Parent = content
    
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, 0, 0, 18)
    label.BackgroundTransparency = 1
    label.Text = labelText
    label.TextColor3 = LIGHT
    label.Font = Enum.Font.GothamMedium
    label.TextSize = 12
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = container
    
    local box = Instance.new("Frame")
    box.Size = UDim2.new(1, 0, 0, 45)
    box.Position = UDim2.new(0, 0, 0, 22)
    box.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    box.BorderSizePixel = 0
    box.Parent = container
    
    local boxCorner = Instance.new("UICorner")
    boxCorner.CornerRadius = UDim.new(0, 4)
    boxCorner.Parent = box
    
    local boxStroke = Instance.new("UIStroke")
    boxStroke.Color = GRAY
    boxStroke.Thickness = 1
    boxStroke.Parent = box
    
    local val = Instance.new("TextLabel")
    val.Size = UDim2.new(1, -50, 1, 0)
    val.Position = UDim2.new(0, 12, 0, 0)
    val.BackgroundTransparency = 1
    val.Text = valueText
    val.TextColor3 = WHITE
    val.Font = Enum.Font.GothamSemibold
    val.TextSize = 14
    val.TextXAlignment = Enum.TextXAlignment.Left
    val.TextTruncate = Enum.TextTruncate.AtEnd
    val.Parent = box
    
    -- Boton copiar
    local copyBtn = Instance.new("TextButton")
    copyBtn.Size = UDim2.new(0, 35, 0, 35)
    copyBtn.Position = UDim2.new(1, -40, 0, 5)
    copyBtn.BackgroundColor3 = GRAY
    copyBtn.Text = "⎘"
    copyBtn.TextColor3 = WHITE
    copyBtn.Font = Enum.Font.GothamBold
    copyBtn.TextSize = 16
    copyBtn.AutoButtonColor = false
    copyBtn.Parent = box
    
    local copyCorner = Instance.new("UICorner")
    copyCorner.CornerRadius = UDim.new(0, 4)
    copyCorner.Parent = copyBtn
    
    copyBtn.MouseEnter:Connect(function()
        copyBtn.BackgroundColor3 = WHITE
        copyBtn.TextColor3 = BLACK
    end)
    
    copyBtn.MouseLeave:Connect(function()
        copyBtn.BackgroundColor3 = GRAY
        copyBtn.TextColor3 = WHITE
    end)
    
    copyBtn.MouseButton1Click:Connect(function()
        copy(valueText)
        val.TextColor3 = LIGHT
        wait(0.2)
        val.TextColor3 = WHITE
    end)
end

-- Crear campos
createField("GAME NAME", gameName, 0)
createField("PLACE ID", gameId, 80)

-- Boton copiar todo
local copyAll = Instance.new("TextButton")
copyAll.Size = UDim2.new(1, 0, 0, 50)
copyAll.Position = UDim2.new(0, 0, 0, 170)
copyAll.BackgroundColor3 = WHITE
copyAll.Text = "COPY ALL DATA"
copyAll.TextColor3 = BLACK
copyAll.Font = Enum.Font.GothamBlack
copyAll.TextSize = 16
copyAll.AutoButtonColor = false
copyAll.Parent = content

local allCorner = Instance.new("UICorner")
allCorner.CornerRadius = UDim.new(0, 6)
allCorner.Parent = copyAll

-- Hover copyAll
copyAll.MouseEnter:Connect(function()
    copyAll.BackgroundColor3 = LIGHT
end)

copyAll.MouseLeave:Connect(function()
    copyAll.BackgroundColor3 = WHITE
end)

copyAll.MouseButton1Click:Connect(function()
    local data = string.format("Indexer Exploit v3.1\n\nGame: %s\nPlace ID: %s\nURL: roblox.com/games/%s", 
        gameName, gameId, gameId)
    copy(data)
    copyAll.Text = "COPIED!"
    copyAll.BackgroundColor3 = LIGHT
    wait(1.5)
    copyAll.Text = "COPY ALL DATA"
    copyAll.BackgroundColor3 = WHITE
end)

-- Arrastrar
local dragging = false
local dragStart, startPos

titleBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = main.Position
    end
end)

titleBar.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = false
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        local delta = input.Position - dragStart
        main.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

-- Cerrar
closeBtn.MouseEnter:Connect(function()
    closeBtn.BackgroundColor3 = WHITE
    closeBtn.TextColor3 = BLACK
end)

closeBtn.MouseLeave:Connect(function()
    closeBtn.BackgroundColor3 = GRAY
    closeBtn.TextColor3 = WHITE
end)

closeBtn.MouseButton1Click:Connect(function()
    screenGui:Destroy()
end)

-- ============================================
-- ANIMACIONES
-- ============================================

-- Animacion de entrada de la intro
local function playIntro()
    -- Fade in INDEXER
    indexer.TextTransparency = 1
    for i = 1, 10 do
        indexer.TextTransparency = 1 - (i/10)
        wait(0.03)
    end
    
    -- Glitch effect
    for i = 1, 6 do
        indexer.Position = UDim2.new(0, math.random(-5, 5), 0.35, 0)
        indexer.TextColor3 = i % 2 == 0 and WHITE or LIGHT
        wait(0.05)
    end
    indexer.Position = UDim2.new(0, 0, 0.35, 0)
    indexer.TextColor3 = WHITE
    
    -- Expandir linea
    TweenService:Create(line, TweenInfo.new(0.5), {Size = UDim2.new(0.3, 0, 0, 3)}):Play()
    wait(0.3)
    
    -- Mostrar EXPLOIT
    exploit.TextTransparency = 1
    TweenService:Create(exploit, TweenInfo.new(0.4), {TextTransparency = 0}):Play()
    
    wait(0.2)
    TweenService:Create(version, TweenInfo.new(0.3), {TextTransparency = 0}):Play()
    
    -- Esperar 5 segundos totales
    wait(5)
    
    -- Fade out intro
    TweenService:Create(intro, TweenInfo.new(0.6), {BackgroundTransparency = 1}):Play()
    for _, child in ipairs(intro:GetDescendants()) do
        if child:IsA("TextLabel") or child:IsA("Frame") then
            TweenService:Create(child, TweenInfo.new(0.4), 
                child:IsA("TextLabel") and {TextTransparency = 1} or {BackgroundTransparency = 1}):Play()
        end
    end
    
    wait(0.6)
    intro:Destroy()
    
    -- Mostrar UI principal
    main.Visible = true
    main.Size = UDim2.new(0, 0, 0, 0)
    main.Position = UDim2.new(0.5, 0, 0.5, 0)
    
    TweenService:Create(main, TweenInfo.new(0.6, Enum.EasingStyle.Back), 
        {Size = UDim2.new(0, 400, 0, 300), Position = UDim2.new(0.5, -200, 0.5, -150)}):Play()
end

-- Iniciar
playIntro()

-- Saltar intro con clic
intro.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        intro:Destroy()
        main.Visible = true
    end
end)

print("Indexer Exploit v3.1 Loaded!")