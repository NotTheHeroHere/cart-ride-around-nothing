local Char = game.Players.LocalPlayer.Character
local HRP = Char.HumanoidRootPart
local TS = game:GetService("TweenService")
local Players = game:GetService("Players")
local localName = game.Players.LocalPlayer.Character.Name
local isAnchored = false
local isTweeningModel = false
function getCart()
	for i, v in pairs(workspace.Carts:GetDescendants()) do
		if v:FindFirstChildWhichIsA("VehicleSeat") then
			if v:FindFirstChildWhichIsA("VehicleSeat").Occupant ~= nil then
				if v.VehicleSeat.Occupant.Parent.Name == localName then
					return v
				end
			end
		end

	end
end


local inst = getCart()

function anchorCart(currentanInst)
	for i, v in pairs(currentanInst:GetDescendants()) do
		task.spawn(function()
			local success, error = pcall(function()
				v.Anchored = true
			end)
			if not success then

			end
		end)
	end
	print("Anchored")
	isAnchored = true
end

function unanchorCart(currentunInst)
	for i, v in pairs(currentunInst:GetDescendants()) do
		task.spawn(function()
			local success, error = pcall(function()
				v.Anchored = false
			end)
			if not success then
			end
		end)
	end
	isAnchored = false
	print("Unanchored")
end

local function tweenModel(model, CF, tweeninfo)
	local CFrameValue = Instance.new("CFrameValue")
	CFrameValue.Value = model:GetPivot()
	local goal = {Value = CF}
	CFrameValue:GetPropertyChangedSignal("Value"):connect(function()
		model:SetPrimaryPartCFrame(CFrameValue.Value)
	end)

	local tween = TS:Create(CFrameValue, tweeninfo, goal)
	tween:Play()

	tween.Completed:connect(function()
		CFrameValue:Destroy()
		isTweeningModel = false
	end)
end
local function speedTween(tweenInfo, startspeedvalueX, startspeedvalueZ, instt)
	local NumberValue = Instance.new("NumberValue")

	local Tween = TS:Create(NumberValue, tweenInfo, {Value = 2})
	Tween:Play()

	NumberValue:GetPropertyChangedSignal("Value"):Connect(function()
		instt.AssemblyLinearVelocity.X = startspeedvalueX*NumberValue
		instt.AssemblyLinearVelocity.Z = startspeedvalueZ*NumberValue
	end)
	Tween.Completed:Connect(function()
		NumberValue:Destroy()
	end)
end
local tweenInfo = TweenInfo.new(0.2, Enum.EasingStyle.Cubic, Enum.EasingDirection.InOut)
local linearTweenInfo = TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut)
--local targetCFrame = CFrame.new(pos1) * CFrame.Angles(math.rad(rotation1.X),math.rad(rotation1.Y),math.rad(rotation1.Z)) 
--tweenModel(inst, targetCFrame, tweenInfo)

local Lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Lib.CreateLib("NotTheHeroHeres cart ride script", "Midnight")
local MainTab = Window:NewTab("Main")
local inst = getCart()
local MainSection = MainTab:NewSection("Teleport")
MainSection:NewButton("Start", "Teleports to the start using TweenService", function()
	local pos = Vector3.new(19.05, 1.6, -6.95)
	local rot = Vector3.new(0, 180, 0)
	local targetCFrame = CFrame.new(pos) * CFrame.Angles(math.rad(rot.X),math.rad(rot.Y),math.rad(rot.Z))
	inst = getCart()
	anchorCart(inst)
	repeat wait() until isAnchored == true
	isTweeningModel = true
	tweenModel(inst, targetCFrame, tweenInfo)
	repeat wait() until isTweeningModel == false
	unanchorCart(inst)
end)
MainSection:NewButton("Inside checkpoint", "Teleports to the first checkpoint using TweenService", function()
	local pos = Vector3.new(-431.0, 161.61, 136.20)
	local rot = Vector3.new(0, 90, 0)
	local targetCFrame = CFrame.new(pos) * CFrame.Angles(math.rad(rot.X),math.rad(rot.Y),math.rad(rot.Z))
	inst = getCart()
	anchorCart(inst)
	repeat wait() until isAnchored == true
	isTweeningModel = true
	tweenModel(inst, targetCFrame, tweenInfo)
	repeat wait() until isTweeningModel == false
	unanchorCart(inst)
end)MainSection:NewButton("Checkpoint", "Teleports to the first checkpoint using TweenService", function()
	local pos = Vector3.new(-431.0, 161.61, 100.20)
	local rot = Vector3.new(0, 90, 0)
	local targetCFrame = CFrame.new(pos) * CFrame.Angles(math.rad(rot.X),math.rad(rot.Y),math.rad(rot.Z))
	inst = getCart()
	anchorCart(inst)
	repeat wait() until isAnchored == true
	isTweeningModel = true
	tweenModel(inst, targetCFrame, tweenInfo)
	repeat wait() until isTweeningModel == false
	unanchorCart(inst)
end)

MainSection:NewButton("Checkpoint spawn", "Teleports to the first checkpoint using TweenService", function()
	local pos = Vector3.new(-431.0, 161.61, 187.057)
	local rot = Vector3.new(0, 90, 0)
	local targetCFrame = CFrame.new(pos) * CFrame.Angles(math.rad(rot.X),math.rad(rot.Y),math.rad(rot.Z))
	inst = getCart()
	anchorCart(inst)
	repeat wait() until isAnchored == true
	isTweeningModel = true
	tweenModel(inst, targetCFrame, tweenInfo)
	repeat wait() until isTweeningModel == false
	unanchorCart(inst)
end)
MainSection:NewButton("Checkpoint troll", "Teleports to the first checkpoint using TweenService", function()
	local pos = Vector3.new(-208.6, 1.6, 187.6)
	local rot = Vector3.new(0, 180, 0)
	local targetCFrame = CFrame.new(pos) * CFrame.Angles(math.rad(rot.X),math.rad(rot.Y),math.rad(rot.Z))
	inst = getCart()
	anchorCart(inst)
	repeat wait() until isAnchored == true
	isTweeningModel = true
	tweenModel(inst, targetCFrame, tweenInfo)
	repeat wait() until isTweeningModel == false
	unanchorCart(inst)
end)
MainSection:NewButton("Finish", "Teleports to the finish using TweenService", function()
	local pos = Vector3.new(-316.1, 119.4, -179.1)
	local rot = Vector3.new(0, 0, 180)
	local targetCFrame = CFrame.new(pos) * CFrame.Angles(math.rad(rot.X),math.rad(rot.Y),math.rad(rot.Z))
	inst = getCart()
	anchorCart(inst)
	repeat wait() until isAnchored == true
	isTweeningModel = true
	tweenModel(inst, targetCFrame, tweenInfo)
	repeat wait() until isTweeningModel == false
	unanchorCart(inst)
end)
local Misc = MainTab:NewSection("Misc")
Misc:NewButton("Anchor Cart", "Cancels all velocity and anchors the current cart", function()
	inst = getCart()
	anchorCart(inst)
end)
Misc:NewButton("Accelerate Cart", "Resumes velocity and unanchors the current cart", function()
	inst = getCart().VehicleSeat
	local s, e = pcall(function()
		instcar2 = getCart().Car2.PassengerSeat
	end)

	local mult = 1.5
	local repeattimes = 3
	--speedTween(linearTweenInfo, inst.AssemblyLinearVelocity.X, inst.AssemblyLinearVelocity.Z)
	task.spawn(function()
		local ii = 0

		while ii < repeattimes do
			inst.AssemblyLinearVelocity = Vector3.new(inst.AssemblyLinearVelocity.X*mult, inst.AssemblyLinearVelocity.Y, inst.AssemblyLinearVelocity.Z*mult)
			instcar2.AssemblyLinearVelocity = inst.AssemblyLinearVelocity
			wait(0.1)
			ii = ii+1
		end
	end)

end)
Misc:NewButton("Deccelerate Cart", "Resumes velocity and unanchors the current cart", function()
	inst = getCart().VehicleSeat
	instcar2 = getCart().Car2.PassengerSeat

	local mult = 0.5
	local repeattimes = 3

	--speedTween(linearTweenInfo, inst.AssemblyLinearVelocity.X, inst.AssemblyLinearVelocity.Z)
	task.spawn(function()
		local ii = 0

		while ii < repeattimes do
			inst.AssemblyLinearVelocity = Vector3.new(inst.AssemblyLinearVelocity.X*mult, inst.AssemblyLinearVelocity.Y, inst.AssemblyLinearVelocity.Z*mult)
			instcar2.AssemblyLinearVelocity = inst.AssemblyLinearVelocity
			wait(0.1)
			ii = ii+1
		end
	end)

end)
Misc:NewButton("Unanchor Cart", "Resumes velocity and unanchors the current cart", function()
	inst = getCart()
	unanchorCart(inst)
end)

Misc:NewButton("Fix Cart", "Fix for errors", function()
	inst = getCart()
end)


local freezeY = false
local yCoords = 0
Misc:NewButton("Freeze Y", "Fix for errors", function()
	inst = getCart()
	local yCoords = inst:GetPivot().Position.Y

	print(inst:GetPivot().Y)
	freezeY = true
	task.spawn(function()
		while freezeY == true do
			local pivot = inst:GetPivot()
			local pos = Vector3.new(pivot.Position.X, yCoords, pivot.Position.Z)
			print(inst:GetPivot():ToOrientation())
			local rotX, rotY, rotZ = 0, 0, 0
			inst:PivotTo(CFrame.new(pos) * CFrame.Angles(math.rad(rotX),math.rad(rotY),math.rad(rotZ)))
			wait(0.1)
		end
	end)
end)
Misc:NewButton("Unfreeze Y", "Fix for errors", function()
	freezeY = false
end)
Misc:NewButton("Freeze Suspension", "Fix for errors", function()
	local cart = getCart()
	for i,v in cart:GetDescendants() do
		task.spawn(function()
			if (v:IsA("SpringConstraint")) then
				v.MaxLength = 0.8
				v.MinLength = 0.8
				v.LimitsEnabled = true
			end
		end)
	end
end)
Misc:NewButton("Unfreeze Suspension", "Fix for errors", function()
	local cart = getCart()
	for i,v in cart:GetDescendants() do
		task.spawn(function()
			if (v:IsA("SpringConstraint")) then
				v.LimitsEnabled = false
			end
		end)
	end
end)
Misc:NewButton("Bomb Cart", "Fix for errors", function()
	inst = getCart()
	wait(0.6)
	for i,v in game.Workspace.Carts:GetChildren("AcceleratingCart") do
		--local s, e = pcall(function()
		inst:PivotTo(v:GetPivot())
	end
end)
local torque
local acc

Misc:NewButton("Disable collision", "Fix for errors", function()
	local inst = getCart()
	for i,v in inst:GetDescendants() do
		task.spawn(function()
			if (--[[(v:IsA("Part") or v:IsA("WedgePart") or v:IsA("VehicleSeat")) and --]](v.Parent.Name ~= "WheelAssembly")) then
				local s,e = pcall(function()
					v.CanCollide = false
					print(v.Name)
				end)
				if not s then print(e) end
			end
		end)
	end
	for i,v in game.workspace[localName]:GetDescendants() do
		local s,e = pcall(function()
			v.CanCollide = false
		end)
		if not s then warn(e) end
	end
	for i,v in game.workspace:GetDescendants() do
		if v:IsA("Humanoid") then
			v.EvaluateStateMachine = false
		end
	end
end)
Misc:NewButton("Enable collision ", "Fix for errors", function()
	game.Workspace[localName].Humanoid.EvaluateStateMachine = true
end)
--[[Misc:NewSlider("Suspension Length", "SliderInfo", 500, 0, function(s) -- 500 (MaxValue) | 0 (MinValue)
local cart = getCart()
	for i,v in cart:GetDescendants() do
		task.spawn(function()
			if (v:IsA("SpringConstraint")) then
                v.FreeLength = (s/100)
				v.MaxLength = (s/100)
                v.MinLength = (s/100)
                v.LimitsEnabled = true
			end
		end)
	end
end)--]]
Misc:NewSlider("Suspension Length", "SliderInfo", 700, -700, function(s) -- 500 (MaxValue) | 0 (MinValue)
	local cart = getCart()
	for i,v in cart:GetDescendants() do
		task.spawn(function()
			if (v:IsA("CylindricalConstraint")) then
				v.LowerLimit = (s/100)
				v.UpperLimit = (s/100)+0.1
			end
		end)
	end
end)
Misc:NewSlider("Suspension flex", "SliderInfo", 60, 0, function(s) -- 500 (MaxValue) | 0 (MinValue)
	local cart = getCart()
	for i,v in cart:GetDescendants() do
		task.spawn(function()
			if (v:IsA("CylindricalConstraint")) then
				v.LowerAngle = -s
				v.UpperAngle = s
			end
		end)
	end
end)
Misc:NewSlider("Suspension 0-100", "SliderInfo", 100, 0, function(s) -- 500 (MaxValue) | 0 (MinValue)
	local cart = getCart()
	for i,v in cart:GetDescendants() do
		task.spawn(function()
			if (v:IsA("SpringConstraint")) then
				v.Stiffness = s*1000
			end
		end)
	end
end)
Misc:NewSlider("Suspension 0-1000", "SliderInfo", 100, 0, function(s) -- 500 (MaxValue) | 0 (MinValue)
	local cart = getCart()
	for i,v in cart:GetDescendants() do
		task.spawn(function()
			if (v:IsA("SpringConstraint")) then
				v.Stiffness = s*10000
			end
		end)
	end
end)
local function disableCollide(v)
	for i,vv in v:GetDescendants() do
		task.spawn(function()
			local s,e = pcall(function()
				vv.CanCollide = false
				vv.CanTouch = false
			end)
			if (s == false) then print("pcall error: " .. e) end
		end)
	end
end

Misc:NewButton("Disable Collision with carts", "Fix for errors", function()
	local cart = getCart()
	for i,v in game.workspace.Carts:GetChildren() do
		if (v:FindFirstChild("VehicleSeat") == nil) then
			warn(v.Name)
			disableCollide(v)
		else if (v:FindFirstChild("VehicleSeat") ~= nil and v:FindFirstChild("VehicleSeat").Occupant == nil) then
				warn(v.Name)
				disableCollide(v)
			else if (v:FindFirstChild("VehicleSeat") ~= nil and v:FindFirstChild("VehicleSeat").Occupant ~= nil) then
					if (not v:FindFirstChild("VehicleSeat").Occupant.Parent == localName) then
						warn(v.Name)
						warn(v.VehicleSeat.Occupant.Parent)
						warn(localName)
						disableCollide(v)
					end
				end
			end
		end
	end
end)


Misc:NewKeybind("Accelerate", "Accelerate cart", Enum.KeyCode.E, function()
	inst = getCart().VehicleSeat
	instcar2 = getCart().Car2.PassengerSeat

	local mult = 2
	local repeattimes = 1

	--speedTween(linearTweenInfo, inst.AssemblyLinearVelocity.X, inst.AssemblyLinearVelocity.Z)
	task.spawn(function()
		local ii = 0

		while ii < repeattimes do
			inst.AssemblyLinearVelocity = Vector3.new(inst.AssemblyLinearVelocity.X*mult, inst.AssemblyLinearVelocity.Y, inst.AssemblyLinearVelocity.Z*mult)
			instcar2.AssemblyLinearVelocity = inst.AssemblyLinearVelocity
			wait(0.1)
			ii = ii+1
		end
	end)
end)
Misc:NewKeybind("Deccelerate", "Deccelerate cart", Enum.KeyCode.Q, function()
	inst = getCart().VehicleSeat
	instcar2 = getCart().Car2.PassengerSeat

	local mult = 0.5
	local repeattimes = 1

	--speedTween(linearTweenInfo, inst.AssemblyLinearVelocity.X, inst.AssemblyLinearVelocity.Z)
	task.spawn(function()
		local ii = 0

		while ii < repeattimes do
			inst.AssemblyLinearVelocity = Vector3.new(inst.AssemblyLinearVelocity.X*mult, inst.AssemblyLinearVelocity.Y, inst.AssemblyLinearVelocity.Z*mult)
			instcar2.AssemblyLinearVelocity = inst.AssemblyLinearVelocity
			wait(0.1)
			ii = ii+1
		end
	end)
end)
Misc:NewKeybind("Anchor Cart", "Cancels all velocity and anchors the current cart", Enum.KeyCode.R, function()
	inst = getCart()
	anchorCart(inst)
end)
Misc:NewKeybind("Unanchor Cart", "Resumes velocity and unanchors the current cart", Enum.KeyCode.F, function()
	inst = getCart()
	unanchorCart(inst)
end)
