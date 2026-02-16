-- ADOPT ME TRADE EXPLOIT v3.0
-- @bb_tricks on discord
-- Works in Synapse X / Krnl / Fluxus
-- Full UI + Fake Players + Spectators + Trade Manipulation + Noclip + Fake Messages

local Players = game:GetService("Players")
local player = Players.LocalPlayer
local Workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local HttpService = game:GetService("HttpService")
local RunService = game:GetService("RunService")

-- Create GUI
local gui = Instance.new("ScreenGui")
gui.Name = "AdoptMeTradeTool"
gui.Parent = player:WaitForChild("PlayerGui")

local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 320, 0, 600)
mainFrame.Position = UDim2.new(0.5, -160, 0.5, -300)
mainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
mainFrame.BorderSizePixel = 0
mainFrame.Parent = gui

-- Title
local title = Instance.new("TextLabel")
title.Text = "@bb_tricks on discord"
title.TextSize = 18
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.BackgroundTransparency = 1
title.Size = UDim2.new(1, 0, 0, 40)
title.Parent = mainFrame

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

-- Fake player storage
local fakePlayers = {}

-- Spawn fake player
local function spawnFakePlayer()
	local petModel = nil
	if fakePet == "Reg" then
		petModel = game:GetService("ReplicatedStorage"):FindFirstChild("PetModelReg") or game:GetService("ReplicatedStorage"):FindFirstChild("Pet") or nil
	elseif fakePet == "Neon" then
		petModel = game:GetService("ReplicatedStorage"):FindFirstChild("PetModelNeon") or game:GetService("ReplicatedStorage"):FindFirstChild("PetNeon") or nil
	elseif fakePet == "Mega" then
		petModel = game:GetService("ReplicatedStorage"):FindFirstChild("PetModelMega") or game
