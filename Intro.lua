local blur = Instance.new("BlurEffect", game.Lighting)
blur.Size = 0

local ScreenGui = Instance.new("ScreenGui")
local ImageLabel = Instance.new("ImageLabel")
local UICorner = Instance.new("UICorner")
local InfoLabel = Instance.new("TextLabel")
local SuccessLabel = Instance.new("TextLabel")

local sound = Instance.new("Sound")
sound.SoundId = "rbxassetid://8503531171"
sound.Parent = game.Workspace
sound.Volume = 10
sound:Play()

ScreenGui.Parent = game.CoreGui
ImageLabel.Parent = ScreenGui
ImageLabel.BackgroundColor3 = Color3.new(1, 1, 1)
ImageLabel.BackgroundTransparency = 1
ImageLabel.Position = UDim2.new(0.5, 0, 0.5, 0)
ImageLabel.Rotation = 0
ImageLabel.Size = UDim2.new(0, 0, 0, 0)
ImageLabel.Image = "rbxassetid://85151105302259"
ImageLabel.ImageTransparency = 0

UICorner.CornerRadius = UDim.new(0.1, 0)
UICorner.Parent = ImageLabel

InfoLabel.Parent = ScreenGui
InfoLabel.BackgroundTransparency = 1
InfoLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
InfoLabel.Font = Enum.Font.Code
InfoLabel.TextSize = 20
InfoLabel.Position = UDim2.new(0.5, -150, 0.5, (263 / 2) + 10)
InfoLabel.Size = UDim2.new(0, 300, 0, 50)
InfoLabel.Text = ""
InfoLabel.TextTransparency = 1


local logs = {
	"Initializing modules...",
	"Checking for updates...",
	"Ruby Hub V2 loading please wait..."
}

for i = 1, 20 do
	ImageLabel.Size = UDim2.new(0, 303 * (i / 20), 0, 263 * (i / 20))
	ImageLabel.Position = UDim2.new(0.5, -(ImageLabel.Size.X.Offset / 2), 0.5, -(ImageLabel.Size.Y.Offset / 2))
	wait(0.03)
end

for i = 1, 80, 2 do
	blur.Size = i
	ImageLabel.ImageTransparency = ImageLabel.ImageTransparency - 0.05
	wait()
end

for i, msg in ipairs(logs) do
	InfoLabel.Text = msg
	InfoLabel.TextTransparency = 1
	for j = 1, 10 do
		InfoLabel.TextTransparency = InfoLabel.TextTransparency - 0.1
		wait(0.01)
	end
	wait(1)
end

for i = 1, 10 do
	InfoLabel.TextTransparency = InfoLabel.TextTransparency + 0.1
	wait()
end
InfoLabel:Destroy()

spawn(function()
	for i = 1, 10 do
		SuccessLabel.TextTransparency = SuccessLabel.TextTransparency - 0.1
		wait()
	end
	wait(0.7)
	for i = 1, 5 do
		SuccessLabel.TextTransparency = SuccessLabel.TextTransparency + 0.1
		wait()
	end
end)

for i = 1, 50, 2 do
	blur.Size = 50 - i
	ImageLabel.ImageTransparency = ImageLabel.ImageTransparency + 0.05
	wait()
end

blur:Destroy()
wait(1)
ScreenGui:Destroy()
sound:Stop()
