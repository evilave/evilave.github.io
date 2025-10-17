local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "evscripts"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")

------------------------------------------------------------
-- THEME SYSTEM
------------------------------------------------------------
local currentThemeColor = Color3.fromRGB(255, 0, 0)
local themedObjects = {}

local function applyTheme(color)
	currentThemeColor = color
	for _, obj in ipairs(themedObjects) do
		if obj:IsA("Frame") or obj:IsA("TextButton") or obj:IsA("TextLabel") then
			if obj:FindFirstChild("UseTheme") then
				obj.BorderColor3 = color
			end
		end
	end
end

local function markThemed(obj)
	local flag = Instance.new("BoolValue")
	flag.Name = "UseTheme"
	flag.Parent = obj
	table.insert(themedObjects, obj)
	obj.BorderColor3 = currentThemeColor
end

------------------------------------------------------------
-- MAIN FRAME
------------------------------------------------------------
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 600, 0, 450)
MainFrame.Position = UDim2.new(0.2, 0, 0.2, 0)
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
markThemed(MainFrame)
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

------------------------------------------------------------
-- TITLE BAR
------------------------------------------------------------
local TitleBar = Instance.new("Frame")
TitleBar.Size = UDim2.new(1, 0, 0, 30)
TitleBar.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
markThemed(TitleBar)
TitleBar.Parent = MainFrame

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, -130, 1, 0)
Title.Position = UDim2.new(0, 10, 0, 0)
Title.BackgroundTransparency = 1
Title.Text = "ev scripts"
Title.TextColor3 = Color3.fromRGB(220, 220, 220)
Title.Font = Enum.Font.SourceSansBold
Title.TextSize = 18
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = TitleBar

------------------------------------------------------------
-- CLOSE & MINIMIZE
------------------------------------------------------------
local CloseButton = Instance.new("TextButton")
CloseButton.Size = UDim2.new(0, 30, 0, 30)
CloseButton.Position = UDim2.new(1, -35, 0, 0)
CloseButton.BackgroundColor3 = Color3.fromRGB(40, 0, 0)
markThemed(CloseButton)
CloseButton.Text = "X"
CloseButton.TextColor3 = Color3.fromRGB(255, 0, 0)
CloseButton.Font = Enum.Font.SourceSansBold
CloseButton.TextSize = 18
CloseButton.Parent = TitleBar

local MinimizeButton = Instance.new("TextButton")
MinimizeButton.Size = UDim2.new(0, 30, 0, 30)
MinimizeButton.Position = UDim2.new(1, -70, 0, 0)
MinimizeButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
markThemed(MinimizeButton)
MinimizeButton.Text = "-"
MinimizeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
MinimizeButton.Font = Enum.Font.SourceSansBold
MinimizeButton.TextSize = 22
MinimizeButton.Parent = TitleBar

local RestoreButton = Instance.new("TextButton")
RestoreButton.Size = UDim2.new(0, 50, 0, 50)
RestoreButton.Position = UDim2.new(0.5, -25, 0, 10)
RestoreButton.AnchorPoint = Vector2.new(0, 0)
RestoreButton.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
markThemed(RestoreButton)
RestoreButton.Text = "+"
RestoreButton.TextColor3 = Color3.fromRGB(255, 255, 255)
RestoreButton.Font = Enum.Font.SourceSansBold
RestoreButton.TextSize = 24
RestoreButton.Visible = false
RestoreButton.Parent = ScreenGui

------------------------------------------------------------
-- TABS
------------------------------------------------------------
local Tabs = Instance.new("Frame")
Tabs.Size = UDim2.new(1, 0, 0, 25)
Tabs.Position = UDim2.new(0, 0, 0, 30)
Tabs.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
markThemed(Tabs)
Tabs.Parent = MainFrame

local function CreateTabButton(name, order)
	local Button = Instance.new("TextButton")
	Button.Size = UDim2.new(0, 90, 1, 0)
	Button.Position = UDim2.new(0, (order - 1) * 95, 0, 0)
	Button.Text = name
	Button.TextColor3 = Color3.fromRGB(200, 200, 200)
	Button.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
	markThemed(Button)
	Button.Font = Enum.Font.SourceSans
	Button.TextSize = 16
	Button.Parent = Tabs
	return Button
end

local MainButton = CreateTabButton("Main", 1)
local LogButton = CreateTabButton("Log", 2)
local SettingsButton = CreateTabButton("Settings", 3)

------------------------------------------------------------
-- SCROLLABLE CONTENT FRAME
------------------------------------------------------------
local ContentFrame = Instance.new("Frame")
ContentFrame.Size = UDim2.new(1, -10, 1, -65)
ContentFrame.Position = UDim2.new(0, 5, 0, 60)
ContentFrame.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
markThemed(ContentFrame)
ContentFrame.Parent = MainFrame

local function createScrollPage(parent)
	local scroll = Instance.new("ScrollingFrame")
	scroll.Size = UDim2.new(1, 0, 1, 0)
	scroll.CanvasSize = UDim2.new(0, 0, 0, 600)
	scroll.ScrollBarThickness = 6
	scroll.ScrollBarImageColor3 = Color3.fromRGB(120, 120, 120)
	scroll.BackgroundTransparency = 1
	scroll.Visible = false
	scroll.Parent = parent
	return scroll
end

local MainPage = createScrollPage(ContentFrame)
local LogPage = createScrollPage(ContentFrame)
local SettingsPage = createScrollPage(ContentFrame)
MainPage.Visible = true

------------------------------------------------------------
-- POPULAR SCRIPTS
------------------------------------------------------------
local Popular = Instance.new("Frame")
Popular.Size = UDim2.new(0, 250, 1, -20)
Popular.Position = UDim2.new(0, 10, 0, 10)
Popular.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
markThemed(Popular)
Popular.Parent = MainPage

local PopularTitle = Instance.new("TextLabel")
PopularTitle.Size = UDim2.new(1, 0, 0, 25)
PopularTitle.BackgroundTransparency = 1
PopularTitle.Text = "Popular Scripts"
PopularTitle.TextColor3 = Color3.fromRGB(200, 200, 200)
PopularTitle.Font = Enum.Font.SourceSansBold
PopularTitle.TextSize = 16
PopularTitle.Parent = Popular

local ScriptOrder = {"Inf Yield", "User Sniper", "EzHub", "99 Nights", "MM2", "Slap Battles", "Fling", "BladeBall"}
local Scripts = {
	["Inf Yield"] = function() loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source', true))() end,
	["99 Nights"] = function() loadstring(game:HttpGet('https://nazuro.xyz/99nights', true))() end,
	["Slap Battles"] = function()
		local plr = game.Players.LocalPlayer
		function supaSiza(v)
			if v:IsA("Tool") and v:FindFirstChild("Glove") then
				v.Glove.Transparency = 0.75
				v.Glove.Size = Vector3.new(10,30,15)
			end
		end
		if plr.Character then for _,v in ipairs(plr.Character:GetChildren()) do supaSiza(v) end end
		plr.Character.ChildAdded:Connect(supaSiza)
		plr.CharacterAdded:Connect(function(char) char.ChildAdded:Connect(supaSiza) end)
	end,
	["MM2"] = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/DiosDi/VexonHub/refs/heads/main/VexonHub", true))() end,
	["User Sniper"] = function()
		local Loader = [[
function _INIT(requisite)
	local Main
	local Call = loadstring
	if not getgenv().Game then
		getgenv().Game = game
		wait(0.1)
		Main = getgenv().Game
	else
		Main = getgenv().Game
	end
	wait(0.1)
	Call(Main:HttpGet(requisite))()
end
_INIT("https://raw.githubusercontent.com/EnterpriseExperience/MicUpSource/refs/heads/main/SynX_Working_Stream_Sniper.lua")
]]
		loadstring(Loader)()
	end,
	["EzHub"] = function() loadstring(game:HttpGet('https://raw.githubusercontent.com/debug420/Ez-Industries-Launcher-Data/master/Launcher.lua', true))() end,
	["Fling"] = function() loadstring(game:HttpGet(('https://raw.githubusercontent.com/0Ben1/fe/main/obf_rf6iQURzu1fqrytcnLBAvW34C9N55kS9g9G3CKz086rC47M6632sEd4ZZYB0AYgV.lua.txt'),true))() end,
	["BladeBall"] = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/Akash1al/Blade-Ball-Updated-Script/refs/heads/main/Blade-Ball-Script"))() end,
}

local yOffset = 35
for _, name in ipairs(ScriptOrder) do
	local func = Scripts[name]
	local b = Instance.new("TextButton")
	b.Size = UDim2.new(0, 220, 0, 30)
	b.Position = UDim2.new(0, 10, 0, yOffset)
	b.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	markThemed(b)
	b.Text = name
	b.TextColor3 = Color3.fromRGB(200, 200, 200)
	b.Font = Enum.Font.SourceSans
	b.TextSize = 14
	b.Parent = Popular
	b.MouseButton1Click:Connect(func)
	yOffset = yOffset + 40
end

------------------------------------------------------------
-- FROM CREATOR
------------------------------------------------------------
local FromCreator = Instance.new("Frame")
FromCreator.Size = UDim2.new(0, 250, 0, 200)
FromCreator.Position = UDim2.new(0, 280, 0, 10)
FromCreator.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
markThemed(FromCreator)
FromCreator.Parent = MainPage

local FromTitle = Instance.new("TextLabel")
FromTitle.Size = UDim2.new(1, 0, 0, 25)
FromTitle.BackgroundTransparency = 1
FromTitle.Text = "News"
FromTitle.TextColor3 = Color3.fromRGB(200, 200, 200)
FromTitle.Font = Enum.Font.SourceSansBold
FromTitle.TextSize = 16
FromTitle.Parent = FromCreator

local FromBody = Instance.new("TextLabel")
FromBody.Size = UDim2.new(1, -20, 1, -35)
FromBody.Position = UDim2.new(0, 10, 0, 35)
FromBody.BackgroundTransparency = 1
FromBody.Text = "support or suggestions -> .gg/arA7TyReHP"
FromBody.TextColor3 = Color3.fromRGB(200, 200, 200)
FromBody.Font = Enum.Font.SourceSans
FromBody.TextSize = 14
FromBody.TextWrapped = true
FromBody.TextYAlignment = Enum.TextYAlignment.Top
FromBody.Parent = FromCreator

------------------------------------------------------------
-- LOG TAB
------------------------------------------------------------
local StatusLog = Instance.new("Frame")
StatusLog.Size = UDim2.new(1, -40, 1, -40)
StatusLog.Position = UDim2.new(0, 20, 0, 20)
StatusLog.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
markThemed(StatusLog)
StatusLog.Parent = LogPage

local LogTitle = Instance.new("TextLabel")
LogTitle.Size = UDim2.new(1, 0, 0, 25)
LogTitle.BackgroundTransparency = 1
LogTitle.Text = "Status Log"
LogTitle.TextColor3 = Color3.fromRGB(200, 200, 200)
LogTitle.Font = Enum.Font.SourceSansBold
LogTitle.TextSize = 16
LogTitle.Parent = StatusLog

local LogBody = Instance.new("TextLabel")
LogBody.Size = UDim2.new(1, -20, 1, -35)
LogBody.Position = UDim2.new(0, 10, 0, 35)
LogBody.BackgroundTransparency = 1
LogBody.Text = [[
15/10/25
Created new theme: red
Created GUI menu
Added tabs on the top
Added buttons with the most used scripts
Added scrollable tabs and theme colors
]]
LogBody.TextColor3 = Color3.fromRGB(200, 200, 200)
LogBody.Font = Enum.Font.SourceSans
LogBody.TextSize = 14
LogBody.TextWrapped = true
LogBody.TextYAlignment = Enum.TextYAlignment.Top
LogBody.Parent = StatusLog

------------------------------------------------------------
-- SETTINGS TAB (COLOR SELECTOR SMALL BOXES)
------------------------------------------------------------
local SettingsBox = Instance.new("Frame")
SettingsBox.Size = UDim2.new(0, 350, 0, 120)
SettingsBox.Position = UDim2.new(0, 120, 0, 60)
SettingsBox.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
markThemed(SettingsBox)
SettingsBox.Parent = SettingsPage

local SettingsTitle = Instance.new("TextLabel")
SettingsTitle.Size = UDim2.new(1, 0, 0, 25)
SettingsTitle.BackgroundTransparency = 1
SettingsTitle.Text = "Theme Colour"
SettingsTitle.TextColor3 = Color3.fromRGB(200, 200, 200)
SettingsTitle.Font = Enum.Font.SourceSansBold
SettingsTitle.TextSize = 16
SettingsTitle.Parent = SettingsBox

local SettingsDesc = Instance.new("TextLabel")
SettingsDesc.Size = UDim2.new(1, -20, 0, 30)
SettingsDesc.Position = UDim2.new(0, 10, 0, 30)
SettingsDesc.BackgroundTransparency = 1
SettingsDesc.Text = "Pick a colour of your theme:"
SettingsDesc.TextColor3 = Color3.fromRGB(200, 200, 200)
SettingsDesc.Font = Enum.Font.SourceSans
SettingsDesc.TextSize = 14
SettingsDesc.TextWrapped = true
SettingsDesc.Parent = SettingsBox

local themeColors = {
	Red = Color3.fromRGB(255, 0, 0),
	Blue = Color3.fromRGB(0, 120, 255),
	Green = Color3.fromRGB(0, 255, 0),
	Purple = Color3.fromRGB(180, 0, 255),
	Orange = Color3.fromRGB(255, 140, 0),
	White = Color3.fromRGB(255, 255, 255)
}

local xOffset = 20
for name, color in pairs(themeColors) do
	local btn = Instance.new("TextButton")
	btn.Size = UDim2.new(0, 20, 0, 20)
	btn.Position = UDim2.new(0, xOffset, 0, 70)
	btn.BackgroundColor3 = color
	btn.BorderColor3 = Color3.fromRGB(200, 200, 200)
	btn.Text = ""
	btn.Parent = SettingsBox
	btn.MouseButton1Click:Connect(function() applyTheme(color) end)
	xOffset = xOffset + 35
end

------------------------------------------------------------
-- TAB SWITCHING
------------------------------------------------------------
local TabsList = {MainButton, LogButton, SettingsButton}
local function switchTab(tabName)
	for _, btn in ipairs(TabsList) do btn.BackgroundColor3 = Color3.fromRGB(25,25,25) end
	MainPage.Visible = false
	LogPage.Visible = false
	SettingsPage.Visible = false
	if tabName == "Main" then
		MainPage.Visible = true
		MainButton.BackgroundColor3 = Color3.fromRGB(60,60,60)
	elseif tabName == "Log" then
		LogPage.Visible = true
		LogButton.BackgroundColor3 = Color3.fromRGB(60,60,60)
	elseif tabName == "Settings" then
		SettingsPage.Visible = true
		SettingsButton.BackgroundColor3 = Color3.fromRGB(60,60,60)
	end
end
MainButton.MouseButton1Click:Connect(function() switchTab("Main") end)
LogButton.MouseButton1Click:Connect(function() switchTab("Log") end)
SettingsButton.MouseButton1Click:Connect(function() switchTab("Settings") end)
switchTab("Main")

------------------------------------------------------------
-- CLOSE & MINIMIZE
------------------------------------------------------------
CloseButton.MouseButton1Click:Connect(function() ScreenGui:Destroy() end)
MinimizeButton.MouseButton1Click:Connect(function() MainFrame.Visible = false RestoreButton.Visible = true end)
RestoreButton.MouseButton1Click:Connect(function() MainFrame.Visible = true RestoreButton.Visible = false end)
