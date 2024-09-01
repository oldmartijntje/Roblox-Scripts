local module = {
	{
		templateName = "Straight1", entrances = {
			{x=0, y=0, z=1, entranceType=0},
			{x=0, y=0, z=-1, entranceType=0},
		},
		rarity=200
	},
	{
		templateName = "Straight2", entrances = {
			{x=0, y=0, z=1, entranceType=0},
			{x=0, y=0, z=-1, entranceType=0},
		},
		rarity = 10
	},
	{
		templateName = "Up1", entrances = {
			{x=0, y=0, z=1, entranceType=0},
			{x=0, y=1, z=0, entranceType=0},
		}
	},
	{
		templateName = "Down1", entrances = {
			{x=0, y=0, z=1, entranceType=0},
			{x=0, y=-1, z=0, entranceType=0},
		}
	},
	{
		templateName = "Stop1", entrances = {
			{x=0, y=0, z=1, entranceType=0},
		},
		rarity = 10
	},
	{
		templateName = "Stop2", entrances = {
			{x=0, y=0, z=1, entranceType=0},
		},
		rarity = 1
	},
	{
		templateName = "Stop3", entrances = {
			{x=0, y=0, z=1, entranceType=0},
		},
		rarity = 44
	},
	{
		templateName = "Stop4", entrances = {
			{x=0, y=0, z=1, entranceType=0},
		},
		rarity = 23
	},
	{
		templateName = "Stop5", entrances = {
			{x=0, y=0, z=1, entranceType=0},
		},
		rarity = 18
	},
	{
		templateName = "Stop6", entrances = {
			{x=0, y=0, z=1, entranceType=0},
		},
		rarity = 23
	},
	{
		templateName = "TSplit1", entrances = {
			{x=0, y=0, z=-1, entranceType=0},
			{x=-1, y=0, z=0, entranceType=0},
			{x=0, y=0, z=1, entranceType=0},
		},
		rarity=200
	},
	{
		templateName = "Cross1", entrances = {
			{x=0, y=0, z=-1, entranceType=0},
			{x=-1, y=0, z=0, entranceType=0},
			{x=1, y=0, z=0, entranceType=0},
			{x=0, y=0, z=1, entranceType=0},
		}
	},
	{
		templateName = "Corner1", entrances = {
			{x=-1, y=0, z=0, entranceType=0},
			{x=0, y=0, z=1, entranceType=0},
		},
		rarity=150
	},
	{
		templateName = "VerticalStraight1", entrances = {
			{x=0, y=1, z=0, entranceType=0},
			{x=0, y=-1, z=0, entranceType=0},
		},
		rarity = 50
	},
	{
		templateName = "Open1", entrances = {
			{x=0, y=0, z=-1, entranceType=1},
			{x=-1, y=0, z=0, entranceType=1},
			{x=1, y=0, z=0, entranceType=1},
			{x=0, y=0, z=1, entranceType=1},
		},
		rarity = 200
	},
	{
		templateName = "ToOpenTSplit1", entrances = {
			{x=0, y=0, z=-1, entranceType=1},
			{x=-1, y=0, z=0, entranceType=1},
			{x=0, y=0, z=1, entranceType=0},
		},
		rarity = 10
	},
	{
		templateName = "OpenCorner1", entrances = {
			{x=-1, y=0, z=0, entranceType=1},
			{x=0, y=0, z=1, entranceType=1},
		}
	},
	{
		templateName = "OpenStraight1", entrances = {
			{x=0, y=0, z=-1, entranceType=1},
			{x=-1, y=0, z=0, entranceType=1},
			{x=0, y=0, z=1, entranceType=1},
		}
	},
	{
		templateName = "OpenWallEdge1", entrances = {
			{x=0, y=0, z=-1, entranceType=1},
			{x=-1, y=0, z=0, entranceType=1},
			{x=1, y=0, z=0, entranceType=2},
			{x=0, y=0, z=1, entranceType=1},
		},
		rarity = 5
	},
	{
		templateName = "OpenWallEdge2", entrances = {
			{x=0, y=0, z=-1, entranceType=1},
			{x=-1, y=0, z=0, entranceType=1},
			{x=1, y=0, z=0, entranceType=2},
			{x=0, y=0, z=1, entranceType=1},
		},
	},
	{
		templateName = "OpenWall1", entrances = {
			{x=0, y=0, z=-1, entranceType=2},
			{x=-1, y=0, z=0, entranceType=1},
			{x=1, y=0, z=0, entranceType=1},
			{x=0, y=0, z=1, entranceType=2},
		},
		rarity = 50
	},
	{
		templateName = "OpenWall2", entrances = {
			{x=0, y=0, z=-1, entranceType=2},
			{x=-1, y=0, z=0, entranceType=1},
			{x=1, y=0, z=0, entranceType=1},
			{x=0, y=0, z=1, entranceType=2},
		},
	},

}

return module
