-- ROBLOX EXPLOIT UI - TRADING TOOL PANEL
-- Works in Synapse X / Krnl / Fluxus / etc.

local Players = game:GetService("Players")
local player = Players.LocalPlayer
local UIS = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")

-- Create main frame
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 320, 0, 600)
mainFrame.Position = UDim2.new(0.5, -160, 0.5, -300)
mainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
mainFrame.BorderSizePixel = 0
mainFrame.Parent = game.CoreGui

-- Title
local title = Instance.new("TextLabel")
title.Text = "@bb_tricks on discord"
title.TextSize = 18
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.BackgroundTransparency = 1
title.Size = UDim2.new(1, 0, 0, 40)
title.Parent = mainFrame

-- Drag functionality
local dragging
local dragInput
local dragStart
local startPos

mainFrame.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		dragging = true
		dragStart = input.Position
		startPos = mainFrame.Position
		input.Changed:Connect(function()
			if input.UserInputState == Enum.UserInputState.End then
				dragging = false
			end
		end)
	end
end)

mainFrame.InputChanged:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseMovement and dragging then
		local delta = input.Position - dragStart
		mainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
	end
end)

-- Input box creator
local function createInput(label, default, y)
	local container = Instance.new("Frame")
	container.Size = UDim2.new(0.9, 0, 0, 30)
	container.Position = UDim2.new(0.05, 0, 0, y)
	container.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	container.Parent = mainFrame

	local lbl = Instance.new("TextLabel")
	lbl.Text = label
	lbl.TextSize = 14
	lbl.TextColor3 = Color3.fromRGB(255, 255, 255)
	lbl.BackgroundTransparency = 1
	lbl.Size = UDim2.new(0.4, 0, 1, 0)
	lbl.Parent = container

	local input = Instance.new("TextBox")
	input.PlaceholderText = default
	input.Text = default
	input.TextSize = 14
	input.TextColor3 = Color3.fromRGB(255, 255, 255)
	input.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
	input.Size = UDim2.new(0.55, 0, 1, 0)
	input.Position = UDim2.new(0.45, 0, 0, 0)
	input.Parent = container

	return input
end

-- Button creator
local function createButton(text, color, y, onClick)
	local btn = Instance.new("TextButton")
	btn.Text = text
	btn.TextSize = 16
	btn.TextColor3 = Color3.fromRGB(255, 255, 255)
	btn.BackgroundColor3 = color
	btn.Size = UDim2.new(0.9, 0, 0, 35)
	btn.Position = UDim2.new(0.05, 0, 0, y)
	btn.Parent = mainFrame
	
	btn.MouseButton1Click:Connect(onClick)
	return btn
end

-- Create inputs
local partnerInput = createInput("Partner Username", "bzzvlp", 50)
local acceptDelay = createInput("Accept Delay (s)", "1", 90)
local confirmDelay = createInput("Confirm Delay (s)", "1", 130)
local specCount = createInput("Spectator Count", "3", 170)
local requestDelay = createInput("Request Delay (s)", "1", 210)

-- Fake pet toggle
local fakePet = "Reg"
local petContainer = Instance.new("Frame")
petContainer.Size = UDim2.new(0.9, 0, 0, 30)
petContainer.Position = UDim2.new(0.05, 0, 0, 250)
petContainer.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
petContainer.Parent = mainFrame

local petLabel = Instance.new("TextLabel")
petLabel.Text = "Fake Player Pet:"
petLabel.TextSize = 14
petLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
petLabel.BackgroundTransparency = 1
petLabel.Size = UDim2.new(0.3, 0, 1, 0)
petLabel.Parent = petContainer

local regBtn = Instance.new("TextButton")
regBtn.Text = "Reg"
regBtn.TextSize = 14
regBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
regBtn.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
regBtn.Size = UDim2.new(0.2, 0, 1, 0)
regBtn.Position = UDim2.new(0.3, 0, 0, 0)
regBtn.Parent = petContainer
regBtn.MouseButton1Click:Connect(function() fakePet = "Reg" end)

local neonBtn = Instance.new("TextButton")
neonBtn.Text = "Neon"
neonBtn.TextSize = 14
neonBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
neonBtn.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
neonBtn.Size = UDim2.new(0.2, 0, 1, 0)
neonBtn.Position = UDim2.new(0.52, 0, 0, 0)
neonBtn.Parent = petContainer
neonBtn.MouseButton1Click:Connect(function() fakePet = "Neon" end)

local megaBtn = Instance.new("TextButton")
megaBtn.Text = "Mega"
megaBtn.TextSize = 14
megaBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
megaBtn.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
megaBtn.Size = UDim2.new(0.2, 0, 1, 0)
megaBtn.Position = UDim2.new(0.74, 0, 0, 0)
megaBtn.Parent = petContainer
megaBtn.MouseButton1Click:Connect(function() fakePet = "Mega" end)

-- Button actions (you fill these in based on exploit capabilities)
local function addRandomItem()
	print("Add Random Item clicked")
	-- Exploit-specific: inject trade item logic
end

local function clearTrade()
	print("Clear Trade clicked")
	-- Exploit-specific: clear trade items
end

local function startTrade()
	print("Start Trade clicked")
	-- Exploit-specific: initiate trade with partnerInput.Text
end

local function blockPlayer()
	print("Block Player clicked")
	-- Exploit-specific: block player by name
end

local function makePartnerAccept()
	print("Make Partner Accept clicked")
	-- Exploit-specific: force accept trade
end

local function makePartnerUnaccept()
	print("Make Partner Unaccept clicked")
	-- Exploit-specific: force unaccept trade
end

local function toggleNoclip()
	print("Toggle Noclip clicked")
	-- Exploit-specific: toggle noclip
end

local function spawnFakePlayer()
	print("Spawn Fake Player clicked")
	-- Exploit-specific: spawn fake player with fakePet
end

local
