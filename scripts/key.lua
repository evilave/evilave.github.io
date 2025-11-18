--raw
--// GUI Creation
local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local BorderFrame = Instance.new("Frame")
local TextBox = Instance.new("TextBox")
local CheckButton = Instance.new("TextButton")
local GetKeyButton = Instance.new("TextButton")
local Title = Instance.new("TextLabel")

ScreenGui.Name = "KeySystem"
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

--// Main Frame
Frame.Name = "MainFrame"
Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
Frame.BorderSizePixel = 0
Frame.Position = UDim2.new(0.35, 0, 0.35, 0)
Frame.Size = UDim2.new(0, 300, 0, 200)
Frame.Active = true
Frame.Draggable = true

-- Red Border 
BorderFrame.Name = "Border"
BorderFrame.Parent = Frame
BorderFrame.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
BorderFrame.BorderSizePixel = 0
BorderFrame.Position = UDim2.new(0, -1, 0, -1)
BorderFrame.Size = UDim2.new(1, 2, 1, 2)
BorderFrame.ZIndex = 0

-- Title
Title.Parent = Frame
Title.BackgroundTransparency = 1
Title.Size = UDim2.new(1, 0, 0, 40)
Title.Position = UDim2.new(0, 0, 0, 0)
Title.Text = "ev scripts key"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 20

-- TextBox
TextBox.Parent = Frame
TextBox.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
TextBox.BorderSizePixel = 1
TextBox.BorderColor3 = Color3.fromRGB(200, 0, 0)
TextBox.Position = UDim2.new(0.1, 0, 0.35, 0)
TextBox.Size = UDim2.new(0.8, 0, 0, 30)
TextBox.PlaceholderText = "key = test"
TextBox.Text = ""
TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
TextBox.Font = Enum.Font.Gotham
TextBox.TextSize = 16

-- Check Key Button
CheckButton.Parent = Frame
CheckButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
CheckButton.BorderSizePixel = 1
CheckButton.BorderColor3 = Color3.fromRGB(200, 0, 0)
CheckButton.Position = UDim2.new(0.1, 0, 0.55, 0)
CheckButton.Size = UDim2.new(0.35, 0, 0, 30)
CheckButton.Text = "Check Key"
CheckButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CheckButton.Font = Enum.Font.GothamBold
CheckButton.TextSize = 14

-- Get Key Button
GetKeyButton.Parent = Frame
GetKeyButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
GetKeyButton.BorderSizePixel = 1
GetKeyButton.BorderColor3 = Color3.fromRGB(200, 0, 0)
GetKeyButton.Position = UDim2.new(0.55, 0, 0.55, 0)
GetKeyButton.Size = UDim2.new(0.35, 0, 0, 30)
GetKeyButton.Text = "Get Key"
GetKeyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
GetKeyButton.Font = Enum.Font.GothamBold
GetKeyButton.TextSize = 14
GetKeyButton.MouseButton1Click:Connect(function()
	local ok = pcall(function() setclipboard("https://discord.gg/arA7TyReHP") end)
end)

--// Logic
local correctKey = "test"

CheckButton.MouseButton1Click:Connect(function()
	local inputKey = TextBox.Text
	if inputKey == correctKey then
		print("Your key was correct.")
		
		-- Optional: Fade out GUI before removing
		for i = 1, 10 do
			Frame.BackgroundTransparency = i * 0.1
			TextBox.BackgroundTransparency = i * 0.1
			CheckButton.BackgroundTransparency = i * 0.1
			GetKeyButton.BackgroundTransparency = i * 0.1
			Title.TextTransparency = i * 0.1
			task.wait(0.05)
		end
		
		Frame:Destroy()
		
		-- destination
		loadstring(game:HttpGet('https://raw.githubusercontent.com/evilave/evilave.github.io/refs/heads/main/scripts/new-gui.lua'))()
	else
		print("Incorrect Key.")
		TextBox.Text = ""
		TextBox.PlaceholderText = "Wrong key, try again."
	end
end)

GetKeyButton.MouseButton1Click:Connect(function()
	print("Join the server for key")
end)
