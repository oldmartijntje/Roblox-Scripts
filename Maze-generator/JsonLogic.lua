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
		tileType = "HallwaysToRoomsConvertor",
		biome = "Convertor"
	},
	{
		templateName = "VerticalStraight1", entrances = {
			{x=0, y=1, z=0, entranceType=0},
			{x=0, y=-1, z=0, entranceType=1},
		},
		rarity = 35,
		tileType = "HallwaysToRoomsConvertor",
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
		tileType = "HallwaysToRoomsConvertor",
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
	{
		templateName = "ToCave1", entrances = {
			{x=0, y=0, z=-1, entranceType=1},
			{x=-1, y=0, z=0, entranceType=1},
			{x=1, y=0, z=0, entranceType=3},
			{x=0, y=0, z=1, entranceType=1},
		},
		tileType = "RoomsToCaveConvertor",
		rarity = 15,
		biome = "Convertor"
	},
    {
		templateName = "StraightCave1", entrances = {
			{x=-1, y=0, z=0, entranceType=3},
			{x=1, y=0, z=0, entranceType=3},
		},
		rarity = 125,
		biome = "Cave"
	},
    {
		templateName = "StopCave1", entrances = {
			{x=0, y=0, z=-1, entranceType=3},
		},
		rarity = 30,
		biome = "Cave"
	},
    {
		templateName = "OpenCave1", entrances = {
			{x=0, y=0, z=-1, entranceType=3},
			{x=0, y=0, z=1, entranceType=3},
			{x=1, y=0, z=0, entranceType=3},
			{x=-1, y=0, z=0, entranceType=3},
		},
		rarity = 69,
		biome = "Cave"
	},
    {
		templateName = "TSplitCave1", entrances = {
			{x=0, y=0, z=-1, entranceType=3},
			{x=0, y=0, z=1, entranceType=3},
			{x=-1, y=0, z=0, entranceType=3},
		},
		rarity = 175,
		biome = "Cave"
	},
    {
		templateName = "CornerCave1", entrances = {
			{x=0, y=0, z=1, entranceType=3},
			{x=-1, y=0, z=0, entranceType=3},
		},
		rarity = 225,
		biome = "Cave"
	},

}

return module
