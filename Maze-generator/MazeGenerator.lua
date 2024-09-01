-- ServerScript
local admins = {1860710799, 529495773}

local percentageOptionalObjects = 33

local offset ={ x=-205.5, y=45.5, z=101.006 + 11.494}
local sizingMultiplier ={ x=11, y=11, z=11}
local minHeight = -100
local templates = require(game.ServerScriptService.JsonLogic)
--local folderPath = game.Workspace.Structures
local defaultRarity = 100
local defaultMaxLoops = 1000
local maxLoops = 100
local loops = 0
local generationQueue = {}
local tileMap = {}
local mustSpreadLoops = 10
local minimumLoops = 25
local activeSessionId = 0
local biomeMap = {}
local takenLocations = {"0_0_0", "-1_0_0", "1_0_0",
	"0_0_-1", "-1_0_-1", "1_0_-1",
	"0_0_-2", "-1_0_-2", "1_0_-2"}
local generatorLoop = nil
local setup = nil
local typeCap = {
	Biome1to2Convertor = {
		cap = 5
	}
}

local failSafeTile = {
	rotation = 1,
	template = {
		templateName = "Failsafe1", entrances = {

		},
		biome = "Solid"
	}
}

local placedExit = false
local exitTemplates = {
	{
		templateName = "ExitElevator1", entrances = {
			{x=0, y=0, z=1, entranceType=0},
		},
		rarity = defaultRarity * 10,
		isExit = true,
		biome = "Solid"
	},
	{
		templateName = "ExitElevator1", entrances = {
			{x=0, y=0, z=1, entranceType=1},
		},
		rarity = 1,
		isExit = true,
		biome = "Solid"
	}
}


local function getKeys(dict)
	local keys = {}
	for key, _ in pairs(dict) do
		table.insert(keys, key)
	end
	return keys
end

local function rotateCoordinates(x, y, z, turns)
	local rotatedX, rotatedZ = x, z

	if turns == 1 then
		-- Rotate 90 degrees clockwise
		rotatedX = -z
		rotatedZ = x
	elseif turns == 2 then
		-- Rotate 180 degrees
		rotatedX = -x
		rotatedZ = -z
	elseif turns == 3 then
		-- Rotate 270 degrees clockwise (or 90 degrees counterclockwise)
		rotatedX = z
		rotatedZ = -x
	end

	return rotatedX, y, rotatedZ
end

local function splitPosString(pos: string)
	local x, y, z = string.match(pos, "([^_]+)_([^_]+)_([^_]+)")
	x = tonumber(x)
	y = tonumber(y)
	z = tonumber(z)
	return x, y, z
end

local function checkTemplateOnLocation(template, positionString, parentPositionString, entranceType)
	local x, y, z = splitPosString(positionString)
	local px, py, pz = splitPosString(parentPositionString)
	x = px - x
	y = py - y
	z = pz - z
	for i, entrance in template.entrances do
		local fail = false
		if entranceType == nil or entrance.entranceType == entranceType then
			-- Same type of entrance
		else 
			fail = true
		end 
		if entrance.x == x and entrance.y == y and entrance.z == z then
			-- Same Location
		else
			fail = true
		end 
		if not fail then
			return true
		end
	end
	return false
end

local function findAdjacentCoordinates(coordinateString: string)
	local x, y, z = splitPosString(coordinateString)
	local coordinates = {
		{x=x-1, y=y, z=z},
		{x=x+1, y=y, z=z},
		{x=x, y=y, z=z-1},
		{x=x, y=y, z=z+1},
		{x=x, y=y-1, z=z},
		{x=x, y=y+1, z=z},
	}
	local validCoordinates = {}
	for _, coordinate in pairs(coordinates) do
		local allow = true
		local coordinateString = coordinate.x.."_"..coordinate.y.."_"..coordinate.z
		if tileMap[coordinateString] then
			allow = false
		end
		if coordinate.y < minHeight then
			allow = false
		end
		if allow then
			table.insert(validCoordinates, coordinateString)
		end
	end
	return validCoordinates
end

local function addAllUnplacedCoordinates(template, positionString) 
	local x, y, z = splitPosString(positionString)
	for i, entrance in template.entrances do
		local tempX = x + entrance.x
		local tempY = y + entrance.y
		local tempZ = z + entrance.z
		local coordinateString = tempX.."_"..tempY.."_"..tempZ
		if tileMap[coordinateString] == nil then
			generationQueue[coordinateString] = {parentPos=positionString, entranceType=entrance.entranceType}
		end

	end
end

local function checkForEmptyNeighbours(coordinateString: string)
	local coordinateStringsList = findAdjacentCoordinates(coordinateString)
	local emptyCoordinateStringsList = {}
	for i, item in coordinateStringsList do
		if not tileMap[item] then
			table.insert(emptyCoordinateStringsList, item)
		end
	end
	return emptyCoordinateStringsList
end

local function rotateTemplateEntrances(template, angle) 
	local newTemplate = {
		templateName = template.templateName, 
		rarity= template.rarity, 
		isExit = template.isExit, 
		entrances = {},
		biome = template.biome,
		tileType = template.tileType
	}
	for i, entrance in template.entrances do
		local x, y, z = entrance.x, entrance.y, entrance.z
		local newX, newY, newZ = rotateCoordinates(x, y, z, angle)
		local location = {
			x= newX,
			y= newY,
			z= newZ,
			entranceType= entrance.entranceType
		}
		table.insert(newTemplate.entrances,location )
	end
	return newTemplate

end

local function checkStructureRotations(generationData, template, pos)
	local rotations = {}
	local xp, yp, zp = splitPosString(generationData.parentPos)
	local x, y, z = splitPosString(pos)
	if yp ~= yp then
		for i = 1, 4 do
			local rotatedTemplate = rotateTemplateEntrances(template, i)
			table.insert(rotations, {rotation=i, template=rotatedTemplate})
		end
	end
	for i = 1, 4 do
		local rotatedTemplate = rotateTemplateEntrances(template, i)
		local allow = checkTemplateOnLocation(rotatedTemplate, pos, generationData.parentPos, generationData.entranceType)
		if allow then
			table.insert(rotations, {rotation=i, template=rotatedTemplate})
		end
	end
	return rotations

end

-- Function to select a random item based on rarity
local function selectItemByRarity(list)
	if list == nil then
		return nil
	else if #list == 0 then
			return nil
		end
	end
	-- Calculate the total weight (sum of all rarities)
	local totalWeight = 0
	for _, listItem in ipairs(list) do
		-- Use listItem.template.rarity if it exists, otherwise use defaultRarity
		local rarity = listItem.template.rarity or defaultRarity
		totalWeight = totalWeight + rarity
	end

	-- Generate a random number between 1 and the total weight
	local randomWeight = math.random(1, totalWeight)

	-- Loop through the list and select an item based on the random weight
	for _, listItem in ipairs(list) do
		-- Use listItem.template.rarity if it exists, otherwise use defaultRarity
		local rarity = listItem.template.rarity or defaultRarity
		randomWeight = randomWeight - rarity
		if randomWeight <= 0 then
			return listItem
		end
	end
end



local function takeRandomItem(list)
	if not placedExit and #getKeys(generationQueue) <= 1 then
		print("exit protocol", placedExit, #generationQueue, #getKeys(generationQueue) <= 1)
		local templates = {}
		for _, item in ipairs(list) do
			if item.template.isExit ~= nil or #item.template.entrances > 1 then
				item.template.rarity = defaultRarity * 10
				table.insert(templates, item)
			end
		end
		return selectItemByRarity(templates)
	end
	if loops > maxLoops then
		print("Closing sequence...")
		local lowest = 100
		local lowestTemplates = {}
		for _, item in ipairs(list) do
			if lowest > #item.template.entrances then
				lowest = #item.template.entrances
				lowestTemplates = {item}
			else if lowest == #item.template.entrances then
					table.insert(lowestTemplates, item)
				end
			end
		end
		-- Return the item at the random index
		return selectItemByRarity(lowestTemplates)
	else if mustSpreadLoops > loops and #list > 1 then
			local lowest = 100
			local notLowestTemplate = {}
			for _, item in ipairs(list) do
				if lowest >= #item.template.entrances then
					lowest = #item.template.entrances
				else 
					table.insert(notLowestTemplate, item)
				end
			end
			return selectItemByRarity(notLowestTemplate)

		end
	end
	-- Get a random index from 1 to the length of the list
	return selectItemByRarity(list)
end

local function checkForStructureVariations(item, generationData, pos, coordinatesList)
	local variations = {}
	if generationData.entranceType then
		local foundEntranceType = false
		for i, entrance in item.entrances do
			if entrance.entranceType == generationData.entranceType then
				foundEntranceType = true
			end
		end
		if not foundEntranceType then
			return variations
		end
	end
	if #coordinatesList + 1 < #item.entrances then
		return variations
	end
	local rotations = checkStructureRotations(generationData, item, pos, generationData.entranceType)
	for i, rotationTemplate in rotations do
		table.insert(variations, rotationTemplate)
	end
	return variations
end

local function hasReachedCap(template)
	if template.tileType ~= nil and typeCap[template.tileType] ~= nil then
		if typeCap[template.tileType].spawned == nil then
			typeCap[template.tileType].spawned = 0
		elseif typeCap[template.tileType].cap ~= nil and typeCap[template.tileType].cap <= typeCap[template.tileType].spawned then
			print(typeCap[template.tileType])
			return true
		end
	end
	return false
end


local function findCorrectSctructures(pos, generationData)
	local coordinatesList = checkForEmptyNeighbours(pos)
	local possibleTemplatesAndRotations = {}
	if loops > maxLoops and not placedExit then
		for i, item in exitTemplates do
			local rotationTemplates = checkForStructureVariations(item, generationData, pos, coordinatesList)
			if #rotationTemplates > 0 then
				for i, variation in rotationTemplates do
					table.insert(possibleTemplatesAndRotations, variation)
				end
			end
		end
	end
	for i, item in templates do
		if hasReachedCap(item) then
			continue
		end
		local rotationTemplates = checkForStructureVariations(item, generationData, pos, coordinatesList)
		if #rotationTemplates > 0 then
			for i, variation in rotationTemplates do
				table.insert(possibleTemplatesAndRotations, variation)
			end
		end
		--table.insert(, item)
	end
	return possibleTemplatesAndRotations


end

local function placeSctructure(template, positionString)
	local x, y, z = splitPosString(positionString)
	local templateTemplate = {
		rotation = 2,
		template = {
			templateName = "value3", entrances = {
				{x=-1, y=0, z=0, entranceType=0},
				{x=1, y=0, z=0, entranceType=0},
				{x=1, y=0, z=1, entranceType=0},
			}
		}
	}
	if template.template.isExit ~= nil and template.template.isExit == true then
		placedExit = true
	end
	local clonedStructure = game.Workspace.Structures:FindFirstChild(template.template["templateName"]):Clone()
	clonedStructure.Parent = game.Workspace.Level
	clonedStructure:PivotTo(CFrame.new(x * sizingMultiplier.x + offset.x, y * sizingMultiplier.y+ offset.y, z * sizingMultiplier.z+ offset.z))

	--local rotation = CFrame.Angles(0, math.rad(360 / (template.rotation + 1)), 0)
	local rotation = CFrame.Angles(0, math.rad(90 * (template.rotation)), 0):Inverse()
	local modelCFrame = clonedStructure:GetPivot()
	clonedStructure:PivotTo(modelCFrame * rotation)

	if clonedStructure:FindFirstChild("Optional") then
		local randomNum = math.random(1, 100)  -- Generates a number between 1 and 100

		if randomNum <= percentageOptionalObjects then
			clonedStructure:FindFirstChild("Optional"):Destroy()
		end
	end
end

generatorLoop = function(sessionId)
	wait()
	if sessionId ~= activeSessionId then
		print('new loop started, exiting...')
		return
	end
	if #getKeys(generationQueue) == 0 then
		if loops < minimumLoops then
			print("too little, restarting...")
			setup(maxLoops)
			return
		else 
			print('complete, exiting...')
			return
		end
	end
	local keys = getKeys(generationQueue)
	local randomIndex = math.random(1, #keys)  -- Generate a random index between 1 and the number of keys
	local key = keys[randomIndex]  -- Select the key at the random index
	tileMap[key] = true
	local nextGeneration = generationQueue[key]
	local options = findCorrectSctructures(key, nextGeneration)
	local chosenOption = failSafeTile
	generationQueue[key] = nil
	if #options == 0 then
		-- use the default failsafe tile
	else 
		local chosen = takeRandomItem(options)
		if chosen ~= nil then
			chosenOption = chosen
		end
	end
	if biomeMap[chosenOption.template.biome] == nil then
		biomeMap[chosenOption.template.biome] = {}
	end
	if chosenOption.template.tileType ~= nil and typeCap[chosenOption.template.tileType] ~= nil then
		if typeCap[chosenOption.template.tileType].spawned == nil then
			typeCap[chosenOption.template.tileType].spawned = 0
		end
		typeCap[chosenOption.template.tileType].spawned += 1
	end
	table.insert(biomeMap[chosenOption.template.biome], key)
	addAllUnplacedCoordinates(chosenOption.template, key)
	print(#getKeys(generationQueue), key, generationQueue)
	placeSctructure(chosenOption, key)
	loops += 1
	if loops > maxLoops * 10 then
		print("forceStop protocol, exiting...")
	else
	end
	generatorLoop(sessionId)
end

setup = function(maxLoopOverride)
	maxLoopOverride = maxLoopOverride or defaultMaxLoops
	maxLoops = maxLoopOverride
	game.Workspace.Level:ClearAllChildren()
	placedExit = false
	activeSessionId += 1
	loops = 0
	generationQueue = {}
	tileMap = {}
	biomeMap = {}
	for i = 1, #takenLocations do
		tileMap[takenLocations[i]] = true
	end

	generationQueue["0_0_1"] = {parentPos="0_0_0", entranceType=0}
	generatorLoop(activeSessionId)
	print(tileMap, biomeMap)
	game.ReplicatedStorage.DeployRopes:Fire()
end

game.ReplicatedStorage.Debug.ReloadMap.OnServerEvent:Connect(function(plr)
	if table.find(admins, plr.UserId) then
		setup()
	end
end)
setup()

