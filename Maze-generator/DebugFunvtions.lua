-- LocalScript

local UIS = game:GetService("UserInputService")
local UserInputService = game:GetService("UserInputService")

UIS.InputBegan:Connect(function(input)
	if not UIS:GetFocusedTextBox() then
		if input.KeyCode == Enum.KeyCode.R then
			game.ReplicatedStorage.Debug.ReloadMap:FireServer()
		end
	end
end)