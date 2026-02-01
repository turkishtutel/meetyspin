local plr = game:GetService("Players").LocalPlayer
local plrgui = plr:WaitForChild("PlayerGui")

local screen = Instance.new("ScreenGui")
screen.Name = "UI"
screen.Parent = plrgui

local frame = Instance.new("Frame")
frame.Size = UDim2.fromOffset(300, 200)
frame.Position = UDim2.fromScale(0.5, 0.5)
frame.AnchorPoint = Vector2.new(0.5, 0.5)
frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
frame.BorderSizePixel = 0
frame.Parent = screen
frame.Active = true
frame.Draggable = true

local frameCorner = Instance.new("UICorner")
frameCorner.CornerRadius = UDim.new(0, 10)
frameCorner.Parent = frame

local title = Instance.new("TextLabel")
title.Size = UDim2.fromOffset(140, 24)
title.Position = UDim2.fromOffset(10, 8)
title.BackgroundTransparency = 1
title.Text = "Meety Spin hub"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextSize = 14
title.Font = Enum.Font.GothamBold
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = frame

local textbox = Instance.new("TextBox")
textbox.Size = UDim2.fromOffset(200, 40)
textbox.Position = UDim2.fromScale(0.5, 0.40)
textbox.AnchorPoint = Vector2.new(0.5, 0.5)
textbox.BackgroundColor3 = Color3.fromRGB(46, 46, 46)
textbox.TextColor3 = Color3.fromRGB(255, 255, 255)
textbox.TextSize = 14
textbox.PlaceholderText = "Spin speed"
textbox.Text = ""
textbox.Font = Enum.Font.Gotham
textbox.ClearTextOnFocus = false
textbox.Parent = frame

local btn = Instance.new("TextButton")
btn.Size = UDim2.fromOffset(200, 40)
btn.Position = UDim2.fromScale(0.5, 0.65)
btn.AnchorPoint = Vector2.new(0.5, 0.5)
btn.BackgroundTransparency = 0
btn.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
btn.Text = "Spin"
btn.TextColor3 = Color3.fromRGB(255, 255, 255)
btn.TextSize = 14
btn.Font = Enum.Font.GothamBold
btn.TextXAlignment = Enum.TextXAlignment.Center
btn.Parent = frame

local stroke = Instance.new("UIStroke")
stroke.Color = Color3.fromRGB(0, 0, 0)
stroke.Thickness = 2
stroke.Parent = btn

local btnCorner = Instance.new("UICorner")
btnCorner.CornerRadius = UDim.new(0, 10)
btnCorner.Parent = btn

local textboxCorner = Instance.new("UICorner")
textboxCorner.CornerRadius = UDim.new(0, 10)
textboxCorner.Parent = textbox

local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.fromOffset(20, 20)
closeBtn.Position = UDim2.fromScale(1, 0)
closeBtn.AnchorPoint = Vector2.new(1, 0)
closeBtn.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
closeBtn.Text = "X"
closeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
closeBtn.TextSize = 14
closeBtn.Font = Enum.Font.GothamBold
closeBtn.Parent = frame

local closeCorner = Instance.new("UICorner")
closeCorner.CornerRadius = UDim.new(0, 5)
closeCorner.Parent = closeBtn
