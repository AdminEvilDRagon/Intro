local blur = Instance.new("BlurEffect", game.Lighting)
blur.Size = 0
local ScreenGui = Instance.new("ScreenGui")
local ImageLabel = Instance.new("ImageLabel")
local UICorner = Instance.new("UICorner")
local TextLabel = Instance.new("TextLabel")
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
ImageLabel.Position = UDim2.new(0.5, -(303 / 2), 0.5, -(263 / 2))
ImageLabel.Rotation = 0
ImageLabel.Size = UDim2.new(0, 303, 0, 263)
ImageLabel.Image = "rbxassetid://85151105302259"
ImageLabel.ImageTransparency = 1

UICorner.CornerRadius = UDim.new(0.1, 0)
UICorner.Parent = ImageLabel

TextLabel.Parent = ScreenGui
TextLabel.BackgroundTransparency = 1
TextLabel.TextColor3 = Color3.new(1, 1, 1)
TextLabel.Font = Enum.Font.FredokaOne
TextLabel.TextSize = 22
TextLabel.Position = UDim2.new(0.5, -(303 / 2), 0.5, (263 / 2) + 10)
TextLabel.Size = UDim2.new(0, 303, 0, 50)
TextLabel.Text = "Loading."
TextLabel.TextTransparency = 1

SuccessLabel.Parent = ScreenGui
SuccessLabel.BackgroundTransparency = 1
SuccessLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
SuccessLabel.Font = Enum.Font.FredokaOne
SuccessLabel.TextSize = 22
SuccessLabel.Position = TextLabel.Position
SuccessLabel.Size = TextLabel.Size
SuccessLabel.Text = "Loaded successfully"
SuccessLabel.TextTransparency = 1

local loadingAnim = true

spawn(function()
	while loadingAnim and TextLabel and TextLabel.Parent do
		for i = 1, 3 do
			TextLabel.Text = "Loading" .. string.rep(".", i)
			wait(0.3)
		end
	end
end)

for i = 1, 80, 2 do
	blur.Size = i
	ImageLabel.ImageTransparency = ImageLabel.ImageTransparency - 0.1
	TextLabel.TextTransparency = TextLabel.TextTransparency - 0.1
	wait()
end
wait(0.1)


loadingAnim = false
for i = 1, 10 do
	TextLabel.TextTransparency = TextLabel.TextTransparency + 0.1
	wait()
end
TextLabel:Destroy()


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
	ImageLabel.ImageTransparency = ImageLabel.ImageTransparency + 0.1
	wait()
end

blur:Destroy()
wait(1)
ScreenGui:Destroy()


sound:Stop()
