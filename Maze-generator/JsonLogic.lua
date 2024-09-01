-- ModuleScript
local module = {
	{
		templateName = "Straight1", entrances = {
			{x=0, y=0, z=1, entranceType=0},
			{x=0, y=0, z=-1, entranceType=0},
		},
		rarity=200,
		biome = "HotelHallways"
	},
	{
		templateName = "Straight2", entrances = {
			{x=0, y=0, z=1, entranceType=0},
			{x=0, y=0, z=-1, entranceType=0},
		},
		rarity = 10,
		biome = "HotelHallways"
	},
	{
		templateName = "Up1", entrances = {
			{x=0, y=0, z=1, entranceType=0},
			{x=0, y=1, z=0, entranceType=0},
		},
		biome = "HotelHallways"
	},
	{
		templateName = "Down1", entrances = {
			{x=0, y=0, z=1, entranceType=0},
			{x=0, y=-1, z=0, entranceType=0},
		},
		biome = "HotelHallways"
	},
	{
		templateName = "Stop1", entrances = {
			{x=0, y=0, z=1, entranceType=0},
		},
		rarity = 10,
		biome = "HotelHallways"
	},
	{
		templateName = "Stop2", entrances = {
			{x=0, y=0, z=1, entranceType=0},
		},
		rarity = 1,
		biome = "HotelHallways"
	},
	{
		templateName = "Stop3", entrances = {
			{x=0, y=0, z=1, entranceType=0},
		},
		rarity = 44,
		biome = "HotelHallways"
	},
	{
		templateName = "Stop4", entrances = {
			{x=0, y=0, z=1, entranceType=0},
		},
		rarity = 23,
		biome = "HotelHallways"
	},
	{
		templateName = "Stop5", entrances = {
			{x=0, y=0, z=1, entranceType=0},
		},
		rarity = 18,
		biome = "HotelHallways"
	},
	{
		templateName = "Stop6", entrances = {
			{x=0, y=0, z=1, entranceType=0},
		},
		rarity = 23,
		biome = "HotelHallways"
	},
	{
		templateName = "TSplit1", entrances = {
			{x=0, y=0, z=-1, entranceType=0},
			{x=-1, y=0, z=0, entranceType=0},
			{x=0, y=0, z=1, entranceType=0},
		},
		rarity=200,
		biome = "HotelHallways"
	},
	{
		templateName = "Cross1", entrances = {
			{x=0, y=0, z=-1, entranceType=0},
			{x=-1, y=0, z=0, entranceType=0},
			{x=1, y=0, z=0, entranceType=0},
			{x=0, y=0, z=1, entranceType=0},
		},
		biome = "HotelHallways"
	},
	{
		templateName = "Corner1", entrances = {
			{x=-1, y=0, z=0, entranceType=0},
			{x=0, y=0, z=1, entranceType=0},
		},
		rarity=150,
		biome = "HotelHallways"
	},
	{
		templateName = "VerticalStraight1", entrances = {
			{x=0, y=1, z=0, entranceType=0},
			{x=0, y=-1, z=0, entranceType=0},
		},
		rarity = 150,
		biome = "HotelHallways"
	},
	{
		templateName = "VerticalStraight1", entrances = {
			{x=0, y=1, z=0, entranceType=1},
			{x=0, y=-1, z=0, entranceType=0},
		},
		rarity = 25,
		tileType = "Biome1to2Convertor",
		biome = "Convertor"
	},
	{
		templateName = "VerticalStraight1", entrances = {
			{x=0, y=1, z=0, entranceType=0},
			{x=0, y=-1, z=0, entranceType=1},
		},
		rarity = 35,
		tileType = "Biome1to2Convertor",
		biome = "Convertor"
	},
	{
		templateName = "Open1", entrances = {
			{x=0, y=0, z=-1, entranceType=1},
			{x=-1, y=0, z=0, entranceType=1},
			{x=1, y=0, z=0, entranceType=1},
			{x=0, y=0, z=1, entranceType=1},
		},
		rarity = 100,
		biome = "HotelRooms"
	},
	{
		templateName = "OpenDown1", entrances = {
			{x=0, y=0, z=-1, entranceType=1},
			{x=-1, y=0, z=0, entranceType=1},
			{x=1, y=0, z=0, entranceType=1},
			{x=0, y=0, z=1, entranceType=1},
			{x=0, y=-1, z=0, entranceType=1},
		},
		rarity = 5,
		biome = "HotelRooms"
	},
	{
		templateName = "OpenUp1", entrances = {
			{x=0, y=0, z=-1, entranceType=1},
			{x=-1, y=0, z=0, entranceType=1},
			{x=1, y=0, z=0, entranceType=1},
			{x=0, y=0, z=1, entranceType=1},
			{x=0, y=1, z=0, entranceType=1},
		},
		rarity = 5,
		biome = "HotelRooms"
	},
	{
		templateName = "ToOpenTSplit1", entrances = {
			{x=0, y=0, z=-1, entranceType=1},
			{x=-1, y=0, z=0, entranceType=1},
			{x=0, y=0, z=1, entranceType=0},
		},
		tileType = "Biome1to2Convertor",
		rarity = 15,
		biome = "Convertor"
	},
	{
		templateName = "OpenCorner1", entrances = {
			{x=-1, y=0, z=0, entranceType=1},
			{x=0, y=0, z=1, entranceType=1},
		},
		biome = "HotelRooms"
	},
	{
		templateName = "OpenStraight1", entrances = {
			{x=0, y=0, z=-1, entranceType=1},
			{x=-1, y=0, z=0, entranceType=1},
			{x=0, y=0, z=1, entranceType=1},
		},
		biome = "HotelRooms"
	},
	{
		templateName = "OpenWallEdge1", entrances = {
			{x=0, y=0, z=-1, entranceType=1},
			{x=-1, y=0, z=0, entranceType=1},
			{x=1, y=0, z=0, entranceType=2},
			{x=0, y=0, z=1, entranceType=1},
		},
		rarity = 5,
		biome = "HotelRooms"
	},
	{
		templateName = "OpenWallEdge2", entrances = {
			{x=0, y=0, z=-1, entranceType=2},
			{x=-1, y=0, z=0, entranceType=1},
			{x=1, y=0, z=0, entranceType=1},
			{x=0, y=0, z=1, entranceType=1},
		},
		biome = "HotelRooms"
	},
	{
		templateName = "OpenWall1", entrances = {
			{x=0, y=0, z=-1, entranceType=2},
			{x=-1, y=0, z=0, entranceType=1},
			{x=1, y=0, z=0, entranceType=1},
			{x=0, y=0, z=1, entranceType=2},
		},
		rarity = 50,
		biome = "HotelRooms"
	},
	{
		templateName = "OpenWall2", entrances = {
			{x=0, y=0, z=-1, entranceType=2},
			{x=-1, y=0, z=0, entranceType=1},
			{x=1, y=0, z=0, entranceType=1},
			{x=0, y=0, z=1, entranceType=2},
		},
		biome = "HotelRooms"
	},
	{
		templateName = "OpenWallCorner1", entrances = {
			{x=0, y=0, z=-1, entranceType=1},
			{x=-1, y=0, z=0, entranceType=1},
			{x=1, y=0, z=0, entranceType=2},
			{x=0, y=0, z=1, entranceType=2},
		},
		biome = "HotelRooms"
	},

}

return module
