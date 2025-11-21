--loadstring(game:HttpGet('https://raw.githubusercontent.com/evilave/evilave.github.io/refs/heads/main/scripts/new-gui.lua'))()
local e = Instance.new("ScreenGui")
local m = Instance.new("Frame")
local tb = Instance.new("Frame")
local tt = Instance.new("TextLabel")
local xt = Instance.new("TextButton")
local mn = Instance.new("TextButton")
local d = Instance.new("Frame")
local s = Instance.new("ScrollingFrame")
local ln = Instance.new("TextLabel")
local hl = Instance.new("TextLabel")
local t = Instance.new("TextBox")
local caret = Instance.new("Frame")
local selLayer = Instance.new("Frame")
local bf = Instance.new("Frame")
local gl = Instance.new("UIGridLayout")
local ex = Instance.new("TextButton")
local cl = Instance.new("TextButton")
local cp = Instance.new("TextButton")
local sb = Instance.new("TextLabel")
local function S(n) return game:GetService(n) end
local uis, gsv, txtsvc = S("UserInputService"), S("GuiService"), S("TextService")
e.Name = "Exec"
e.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
e.ResetOnSpawn = false
e.IgnoreGuiInset = true

--m
m.Name = "Main"
m.Parent = e
m.Active = true
m.BackgroundColor3 = Color3.fromRGB(30,30,30)
m.BorderSizePixel = 1
m.Position = UDim2.new(0.5,-260,0.5,-200)
m.Size = UDim2.new(0,550,0,350)

--tb
tb.Name = "TopBar"
tb.Parent = m
tb.BackgroundColor3 = Color3.fromRGB(40,40,40)
tb.BorderSizePixel = 1
tb.Size = UDim2.new(1,0,0,32)
tt.Name = "Title"
tt.Parent = tb
tt.BackgroundTransparency = 1
tt.Position = UDim2.new(0,8,0,0)
tt.Size = UDim2.new(1,-100,1,0)
tt.Font = Enum.Font.SourceSansBold
tt.Text = "EvEditor"
tt.TextColor3 = Color3.new(1,1,1)
tt.TextSize = 18
tt.TextXAlignment = Enum.TextXAlignment.Left
xt.Name = "Exit"
xt.Parent = tb
xt.Position = UDim2.new(1,-40,0,0)
xt.Size = UDim2.new(0,40,1,0)
xt.Text = "X"
xt.Font = Enum.Font.SourceSansBold
xt.TextSize = 18
xt.TextColor3 = Color3.fromRGB(255,120,120)
xt.BackgroundColor3 = Color3.fromRGB(40,40,40)
xt.BorderSizePixel = 
mn.Name = "Min"
mn.Parent = tb
mn.Position = UDim2.new(1,-80,0,0)
mn.Size = UDim2.new(0,40,1,0)
mn.Text = "-"
mn.Font = Enum.Font.SourceSansBold
mn.TextSize = 18
mn.TextColor3 = Color3.new(1,1,1)
mn.BackgroundColor3 = Color3.fromRGB(40,40,40)
mn.BorderSizePixel = 0
d.Name = "Sep"
d.Parent = m
d.BackgroundColor3 = Color3.fromRGB(60,60,60)
d.BorderSizePixel = 0
d.Position = UDim2.new(0,0,0,32)
d.Size = UDim2.new(1,0,0,2)

--why ts not work
s.Name = "Scroll"
s.Parent = m
s.Active = true
s.Position = UDim2.new(0,8,0,40)
s.Size = UDim2.new(1,-16,1,-120)
s.CanvasSize = UDim2.new(0,0,0,0)
s.ScrollBarThickness = 6
s.BackgroundColor3 = Color3.fromRGB(20,20,20)
s.BorderSizePixel = 1

--num
ln.Name = "LineNum"
ln.Parent = s
ln.Position = UDim2.new(0,0,0,0)
ln.Size = UDim2.new(0,40,1,0)
ln.BackgroundColor3 = Color3.fromRGB(25,25,25)
ln.BorderSizePixel = 1
ln.Font = Enum.Font.Code
ln.Text = "1"
ln.TextSize = 16
ln.TextColor3 = Color3.fromRGB(180,180,180)
ln.TextXAlignment = Enum.TextXAlignment.Right
ln.TextYAlignment = Enum.TextYAlignment.Top

--FIX THIS
hl.Name = "HL"
hl.Parent = s
hl.Position = UDim2.new(0,46,0,0)
hl.Size = UDim2.new(1,-46,1,0)
hl.BackgroundTransparency = 1
hl.Font = Enum.Font.Code
hl.TextSize = 16
hl.TextColor3 = Color3.new(1,1,1)
hl.TextXAlignment = Enum.TextXAlignment.Left
hl.TextYAlignment = Enum.TextYAlignment.Top
hl.RichText = true

--t
t.Name = "Text"
t.Parent = s
t.Position = UDim2.new(0,46,0,0)
t.Size = UDim2.new(1,-46,1,0)
t.BackgroundTransparency = 1
t.Font = Enum.Font.Code
t.TextSize = 16
t.TextColor3 = Color3.new(1,1,1)
t.TextXAlignment = Enum.TextXAlignment.Left
t.TextYAlignment = Enum.TextYAlignment.Top
t.MultiLine = true
t.ClearTextOnFocus = false
t.TextWrapped = false
caret.Name = "Caret"
caret.Parent = s
caret.BackgroundColor3 = Color3.new(1,1,1)
caret.Size = UDim2.fromOffset(2,16)
caret.Visible = false
selLayer.Name = "SelLayer"
selLayer.Parent = s
selLayer.BackgroundTransparency = 1

--bf
bf.Name = "Buttons"
bf.Parent = m
bf.Position = UDim2.new(0,8,1,-76)
bf.Size = UDim2.new(1,-16,0,40)
bf.BackgroundTransparency = 1
gl.Parent = bf
gl.FillDirectionMaxCells = 3
gl.CellPadding = UDim2.new(0,6,0,0)
gl.CellSize = UDim2.new(0.333, -25, 0.7, 0)

local function simpleBtn(btn, txt)
	btn.Text = txt
	btn.Font = Enum.Font.SourceSansBold
	btn.TextSize = 16
	btn.TextColor3 = Color3.new(1,1,1)
	btn.BackgroundColor3 = Color3.fromRGB(50,50,50)
	btn.BorderSizePixel = 1
	btn.Parent = bf
end

simpleBtn(ex, "Execute")
simpleBtn(cl, "Clear")
simpleBtn(cp, "Copy")

--sb
sb.Name = "Status"
sb.Parent = m
sb.Position = UDim2.new(0,8,1,-30)
sb.Size = UDim2.new(1,-8,0,10)
sb.BackgroundTransparency = 1
sb.Font = Enum.Font.SourceSans
sb.TextSize = 14
sb.Text = "Ready"
sb.TextColor3 = Color3.fromRGB(110,245,140)
sb.TextXAlignment = Enum.TextXAlignment.Left

--drag
local dragging = false
local dragStart
local startPos
tb.InputBegan:Connect(function(i)
	if i.UserInputType == Enum.UserInputType.MouseButton1 then
		dragging = true
		dragStart = i.Position
		startPos = m.Position
		i.Changed:Connect(function()
			if i.UserInputState == Enum.UserInputState.End then dragging = false end
		end)
	end
end)
uis.InputChanged:Connect(function(i)
	if dragging and i.UserInputType == Enum.UserInputType.MouseMovement then
		local delta = i.Position - dragStart
		m.Position = UDim2.new(
			startPos.X.Scale, startPos.X.Offset + delta.X,
			startPos.Y.Scale, startPos.Y.Offset + delta.Y
		)
	end
end)

--bugged also
local function esc(s) return s:gsub("&","&amp;"):gsub("<","&lt;"):gsub(">","&gt;") end
local keywords = {"and","break","do","else","elseif","end","false","for","function","if","in","local","nil","not","or","repeat","return","then","true","until","while"}

local function colorize(txt)
	txt = esc(txt)
	for _, w in ipairs(keywords) do
		txt = txt:gsub("%f[%w_]"..w.."%f[^%w_]", '<font color="#ff8080">'..w..'</font>')
	end
	return txt
end

--line and hl
local function updateLines()
	local text = t.Text
	local count = 1
	for _ in text:gmatch("\n") do count += 1 end
	local buf = {}
	for i=1,count do buf[i] = i end
	ln.Text = table.concat(buf, "\n")
	hl.Text = colorize(text or "")

	local ts = txtsvc:GetTextSize(text, t.TextSize, t.Font, Vector2.new(9999,9999))
	s.CanvasSize = UDim2.new(0, ts.X + 60, 0, ts.Y + 20)
end

t:GetPropertyChangedSignal("Text"):Connect(updateLines)

--exec
ex.MouseButton1Click:Connect(function()
	sb.Text = "Running..."
	local f, err = loadstring(t.Text)
	if not f then
		sb.TextColor3 = Color3.fromRGB(255,120,120)
		sb.Text = err
		return
	end
	local ok, out = pcall(f)
	if not ok then
		sb.TextColor3 = Color3.fromRGB(255,120,120)
		sb.Text = out
	else
		sb.TextColor3 = Color3.fromRGB(110,245,140)
		sb.Text = "Executed"
	end
end)

--clear
cl.MouseButton1Click:Connect(function()
	t.Text = ""
	sb.Text = "Ready"
end)

--copy
cp.MouseButton1Click:Connect(function()
	local ok = pcall(function() setclipboard(t.Text) end)
	if ok then sb.Text = "Copied" else sb.Text = "Copy failed" end
end)

--xt
xt.MouseButton1Click:Connect(function()
	e:Destroy()
end)

--min
local minimized = false
local oldSize = m.Size
local oldPos = m.Position
local savedVisibility = {}

mn.MouseButton1Click:Connect(function()
    minimized = not minimized

    if minimized then
        -- Save current size/position
        oldSize = m.Size
        oldPos = m.Position

        -- Save visibility of all GuiObjects under the main frame except the topbar and its children,
        -- then hide them. This ensures all buttons (and any other controls) are hidden.
        savedVisibility = {}
        for _, obj in ipairs(m:GetDescendants()) do
            if obj:IsA("GuiObject") then
                -- keep topbar and its children visible (so Exit/Min remain)
                if not (obj == tb or obj:IsDescendantOf(tb)) then
                    -- store previous Visible state
                    savedVisibility[obj] = obj.Visible
                    -- hide it
                    pcall(function() obj.Visible = false end)
                end
            end
        end

        -- Shrink window to only the top bar height (32)
        m.Size = UDim2.new(oldSize.X.Scale, oldSize.X.Offset, 0, 32)

        -- Optionally adjust position so it visually collapses upward (keeps topbar in place)
        -- This keeps the top edge where it was and moves the bottom up.
        m.Position = UDim2.new(oldPos.X.Scale, oldPos.X.Offset, oldPos.Y.Scale, oldPos.Y.Offset + (oldSize.Y.Offset - 32))

    else
        -- Restore size/position
        m.Size = oldSize
        m.Position = oldPos

        -- Restore visibility of everything we saved
        for obj, vis in pairs(savedVisibility) do
            if obj and obj.Parent then
                pcall(function() obj.Visible = vis end)
            end
        end

        -- clear saved table
        savedVisibility = {}
    end
end)


local tabsFrame = Instance.new("Frame")
tabsFrame.Name = "Tabs"
tabsFrame.Parent = m
tabsFrame.BackgroundColor3 = Color3.fromRGB(40,40,40)
tabsFrame.BorderSizePixel = 1
tabsFrame.Position = UDim2.new(1,-40,0,34)
tabsFrame.Size = UDim2.new(0,40,1,-34)
local tabLayout = Instance.new("UIListLayout")
tabLayout.Parent = tabsFrame
tabLayout.SortOrder = Enum.SortOrder.LayoutOrder
tabLayout.Padding = UDim.new(0,6)
local function makeTabButton(letter)
    local b = Instance.new("TextButton")
    b.Text = letter
    b.Font = Enum.Font.SourceSansBold
    b.TextSize = 18
    b.BackgroundColor3 = Color3.fromRGB(60,60,60)
    b.TextColor3 = Color3.fromRGB(255,255,255)
    b.Size = UDim2.new(1,0,0,40)
    b.BorderSizePixel = 1
    b.Parent = tabsFrame
    return b
end
local editorTabBtn = makeTabButton("E")
local scriptTabBtn = makeTabButton("S")

--page thingy
local scriptsPage = Instance.new("Frame")
scriptsPage.Name = "ScriptsPage"
scriptsPage.Parent = m
scriptsPage.BackgroundColor3 = Color3.fromRGB(25,25,25)
scriptsPage.BorderSizePixel = 1
scriptsPage.Position = UDim2.new(0,0,0,34)
scriptsPage.Size = UDim2.new(1,-40,1,-34)
scriptsPage.Visible = false

local testBtn = Instance.new("TextButton")
testBtn.Parent = scriptsPage
testBtn.Text = "Inf_yield"
testBtn.Font = Enum.Font.SourceSansBold
testBtn.TextSize = 18
testBtn.TextColor3 = Color3.new(1,1,1)
testBtn.BackgroundColor3 = Color3.fromRGB(60,60,60)
testBtn.Size = UDim2.new(0,150,0,40)
testBtn.Position = UDim2.new(0,20,0,20)
testBtn.MouseButton1Click:Connect(function()
	local ok = pcall(function() setclipboard("loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()") end)
end)

--script buttons
local testBtn2 = Instance.new("TextButton")
testBtn2.Parent = scriptsPage
testBtn2.Text = "99_nights"
testBtn2.Font = Enum.Font.SourceSansBold
testBtn2.TextSize = 18
testBtn2.TextColor3 = Color3.new(1,1,1)
testBtn2.BackgroundColor3 = Color3.fromRGB(60,60,60)
testBtn2.Size = UDim2.new(0,150,0,40)
testBtn2.Position = UDim2.new(0,20,0,70)
testBtn2.MouseButton1Click:Connect(function()
	local ok = pcall(function() setclipboard("loadstring(game:HttpGet('https://nazuro.xyz/99nights'))()") end)
end)

local testBtn3 = Instance.new("TextButton")
testBtn3.Parent = scriptsPage
testBtn3.Text = "Fling"
testBtn3.Font = Enum.Font.SourceSansBold
testBtn3.TextSize = 18
testBtn3.TextColor3 = Color3.new(1,1,1)
testBtn3.BackgroundColor3 = Color3.fromRGB(60,60,60)
testBtn3.Size = UDim2.new(0,150,0,40)
testBtn3.Position = UDim2.new(0,20,0,120)
testBtn3.MouseButton1Click:Connect(function()
	local ok = pcall(function() setclipboard("https://raw.githubusercontent.com/0Ben1/fe/main/obf_rf6iQURzu1fqrytcnLBAvW34C9N55kS9g9G3CKz086rC47M6632sEd4ZZYB0AYgV.lua.txt") end)
end)

local testBtn4 = Instance.new("TextButton")
testBtn4.Parent = scriptsPage
testBtn4.Text = "Super_rings"
testBtn4.Font = Enum.Font.SourceSansBold
testBtn4.TextSize = 18
testBtn4.TextColor3 = Color3.new(1,1,1)
testBtn4.BackgroundColor3 = Color3.fromRGB(60,60,60)
testBtn4.Size = UDim2.new(0,150,0,40)
testBtn4.Position = UDim2.new(0,20,0,170)
testBtn4.MouseButton1Click:Connect(function()
	local ok = pcall(function() setclipboard("loadstring(game:HttpGet('https://raw.githubusercontent.com/Thuan6565/Script/refs/heads/main/SuperRingPartV2'))()") end)
end)

local testBtn5 = Instance.new("TextButton")
testBtn5.Parent = scriptsPage
testBtn5.Text = "Mobile_fly"
testBtn5.Font = Enum.Font.SourceSansBold
testBtn5.TextSize = 18
testBtn5.TextColor3 = Color3.new(1,1,1)
testBtn5.BackgroundColor3 = Color3.fromRGB(60,60,60)
testBtn5.Size = UDim2.new(0,150,0,40)
testBtn5.Position = UDim2.new(0,20,0,220)
testBtn5.MouseButton1Click:Connect(function()
	local ok = pcall(function() setclipboard("loadstring(game:HttpGet('https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.txt'))()") end)
end)

--swich
local function showEditor()
    scriptsPage.Visible = false
    s.Visible = true
    ln.Visible = true
    hl.Visible = true
    t.Visible = true
    caret.Visible = false
    selLayer.Visible = true
    bf.Visible = true
    sb.Visible = true
end

local function showScripts()
    s.Visible = false
    ln.Visible = false
    hl.Visible = false
    t.Visible = false
    selLayer.Visible = false
    bf.Visible = false
    sb.Visible = false
    scriptsPage.Visible = true
end

editorTabBtn.MouseButton1Click:Connect(showEditor)
scriptTabBtn.MouseButton1Click:Connect(showScripts)


updateLines()
