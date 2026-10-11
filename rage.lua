-- client.txt
-- Muss vom Zielspieler ausgeführt werden, damit er in der Controller-Liste auftaucht.
-- Markiert den eigenen Charakter mit einem Tag, den der Controller erkennen kann.

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local lp = Players.LocalPlayer

local TAG_NAME = "ModPanelTag_" .. tostring(lp.UserId)

local function tagCharacter(char)
	-- Tag als unsichtbare Instanz an den Charakter hängen
	if not char then return end
	if char:FindFirstChild(TAG_NAME) then return end
	local tag = Instance.new("StringValue")
	tag.Name = TAG_NAME
	tag.Value = tostring(lp.UserId)
	tag.Parent = char
end

if lp.Character then
	tagCharacter(lp.Character)
end

lp.CharacterAdded:Connect(tagCharacter)

print("[ModPanel] Client registriert als " .. lp.Name)