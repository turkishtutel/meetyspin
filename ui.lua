spinThingy = nil
spinPart = nil
spinAttachment = nil
_G.keybind = _G.keybind or "T"

local plr = game:GetService("Players").LocalPlayer
local plrgui = plr:WaitForChild("PlayerGui")
local UserInputService = game:GetService("UserInputService")

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

local keybind = Instance.new("TextLabel")
keybind.Size = UDim2.fromOffset(200, 40)
keybind.Position = UDim2.fromScale(0.5, 0.80)
keybind.BackgroundTransparency = 1
keybind.Text = "Keybind: " .. _G.keybind
keybind.TextColor3 = Color3.fromRGB(255, 255, 255)
keybind.TextSize = 14
keybind.Font = Enum.Font.GothamBold
keybind.Parent = frame

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

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer


local function getRoot(char)
    return char:WaitForChild("HumanoidRootPart")
end

local function spin(n)
    local spinSpeed = n or 20

    if spinThingy then spinThingy:Destroy() spinThingy = nil end
    if spinPart then spinPart:Destroy() spinPart = nil end

    local root = getRoot(plr.Character)

    spinPart = Instance.new("Part")
    spinPart.Anchored = false
    spinPart.CanCollide = false
    spinPart.Transparency = 1
    spinPart.Size = Vector3.new(1,1,1)
    spinPart.CFrame = root.CFrame
    spinPart.Parent = workspace

    spinThingy = Instance.new("BodyAngularVelocity")
    spinThingy.MaxTorque = Vector3.new(0, math.huge, 0)
    spinThingy.AngularVelocity = Vector3.new(0, spinSpeed, 0)
    spinThingy.Parent = spinPart

    local weld = Instance.new("WeldConstraint")
    weld.Part0 = spinPart
    weld.Part1 = root
    weld.Parent = spinPart
end

local function unspin()
    if spinThingy then spinThingy:Destroy() spinThingy = nil end
    if spinPart then spinPart:Destroy() spinPart = nil end
end

local spinning = false

btn.MouseButton1Click:Connect(function()
    if not spinning then
        local spinSpeed = tonumber(textbox.Text)
        if spinSpeed then
            spin(spinSpeed)
            spinning = true
            btn.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
            btn.Text = "Stop"
        else
            warn("Invalid spin speed!")
        end
    else
        unspin()
        spinning = false
        btn.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
        btn.Text = "Spin"
    end
end)

textbox:GetPropertyChangedSignal("Text"):Connect(function()
    local text = textbox.Text
    local numbersOnly = text:gsub("[^0-9]", "")
    if text ~= numbersOnly then
        textbox.Text = numbersOnly
    end
end)

closeBtn.MouseButton1Click:Connect(function()
    unspin()
    frame:Destroy()
end)

UserInputService.InputBegan:Connect(function(input, processed)
    if processed then return end
    if input.UserInputType == Enum.UserInputType.Keyboard and input.KeyCode == Enum.KeyCode[_G.keybind:upper()] then
        if not spinning then
            local speed = tonumber(textbox.Text)
            if speed then
                spin(speed)
                spinning = true
                btn.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
                btn.Text = "Stop"
            else
                warn("Invalid spin speed!")
            end
        else
            unspin()
            spinning = false
            btn.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
            btn.Text = "Spin"
        end
    end
end)
