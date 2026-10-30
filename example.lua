local myPart2 = Instance.new("Part", workspace)
myPart2.Shape = Enum.PartType.Ball
myPart2.Color = Color3.new(1, 1, 1)
myPart2.Size = Vector3.new(200,200,200)
myPart2.Anchored = true
myPart2.Position = Vector3.new(0,400,0)
myPart2.CanCollide = false
myPart2.CanTouch = true

local decal = Instance.new("Decal")
decal.Texture = "rbxassetid://84798487558616"
decal.Face = Enum.NormalId.Bottom
decal.Parent = myPart2

myPart2.Touched:Connect(function(hit)
	if hit.Name == "HumanoidRootPart" then
		hit.Parent.Humanoid.Health = 0
	end
end)

local Players = game:GetService("Players")

local direction = Vector3.new(0, -1, 0)
local speed = .2
local targetY = 20
local startY = 600

while true do

	while myPart2.Position.Y > targetY do
		local dt = task.wait()
		local step = math.min(speed * dt, myPart2.Position.Y - targetY)
		myPart2.Position = myPart2.Position + direction * step
	end

	task.wait(3)

	for _, player in ipairs(Players:GetPlayers()) do
		player:LoadCharacter()
	end

	myPart2.Position = Vector3.new(0, startY, 0)
end