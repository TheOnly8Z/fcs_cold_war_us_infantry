local function qv( scale )
	return Vector( scale, scale, scale )
end
local v = Vector
local a = Angle

local USGI_CAMO = {
	[0] = "Woodland Camo",
	[1] = "6 Color Desert Camo",
	[2] = "3 Color Desert Camo",
	[3] = "T-Pattern Camo",
	[4] = "Tan",
	[5] = "Olive",
	[6] = "Black",
	[7] = "Navy Blue",
}
local HELMETFIX = {
	["female"] = {
		["helmet"] = {
			translate = v( 0, -0.5, 0 ),
			scale = qv(0.95),
		},
		["helmetstraps"] = {
			translate = v( 0, 1, 0 ),
			scale = qv(0.95),
		},
	},
	["male_01"] = {
		["helmet"] = {
			translate = v( 0, -0.2, 1 ),
		},
		["helmetstraps"] = {
			translate = v( 1, 0.2, 0 ),
		},
	},
	["male_02"] = {
		["helmet"] = {
			translate = v( 0, -0.2, 0.5 ),
		},
		["helmetstraps"] = {
			translate = v( 0.5, 0.2, 0 ),
		},
	},
	["male_03"] = {
		["helmet"] = {
			translate = v( 0, 0.2, 0.7 ),
		},
		["helmetstraps"] = {
			translate = v( 0.9, -0.2, 0 ),
		},
	},
	["male_04"] = {
		["helmet"] = {
			translate = v( 0, 0.2, 0.5 ),
		},
		["helmetstraps"] = {
			translate = v( 0.5, -0.2, 0 ),
		},
	},
	["male_05"] = {
		["helmet"] = {
			translate = v( 0, 0, 0.2 ),
		},
		["helmetstraps"] = {
			translate = v( 0.2, 0, 0 ),
		},
	},
	["male_06"] = {
		["helmet"] = {
			translate = v( 0, 0, 0.75 ),
			scale = qv(1.1),
		},
		["helmetstraps"] = {
			translate = v( 0.750, 0, 0 ),
			scale = qv(1.1),
		},
	},
	["male_07"] = {
		["helmet"] = {
			translate = v( 0, -0.3, 0 ),
		},
		["helmetstraps"] = {
			translate = v( 0, 0.3, 0 ),
		},
	},
	["male_08"] = {
		["helmet"] = {
			translate = v( 0, -0.4, 0 ),
		},
		["helmetstraps"] = {
			translate = v( 0, 0.4, 0 ),
		},
	},
	["male_09"] = {
		["helmet"] = {
			translate = v( 0, -0.2, 0.75 ),
		},
		["helmetstraps"] = {
			translate = v( 0.75, 0.2, 0 ),
		},
	},
}
local CAPFIX = {
	["female"] = {
		["ValveBiped.Bip01_Head1"] = {
			translate = v( 0, -0, 0 ),
			scale = qv(1),
		},
	},
	["male_01"] = {
		["ValveBiped.Bip01_Head1"] = {
			translate = v( 0.5, -0.5, 0 ),
			scale = qv(1.05),
		},
	},
	["male_02"] = {
		["ValveBiped.Bip01_Head1"] = {
			translate = v( 0.1, -0.2, 0 ),
			scale = qv(1.025),
		},
	},
	["male_03"] = {
		["ValveBiped.Bip01_Head1"] = {
			translate = v( 0, -0.55, 0 ),
		},
	},
	["male_04"] = {
		["ValveBiped.Bip01_Head1"] = {
			translate = v( 0.6, -0.2, 0 ),
		},
	},
	["male_06"] = {
		["ValveBiped.Bip01_Head1"] = {
			translate = v( 0.5, -0.5, 0 ),
			scale = v( 1, 1.1, 1.1 ),
		},
	},
	["male_07"] = {
		["ValveBiped.Bip01_Head1"] = {
			scale = v( 1, 1.05, 1 ),
		},
	},
	["male_08"] = {
		["ValveBiped.Bip01_Head1"] = {
			translate = v( 0.2, 0.3, 0 ),
			scale = v( 1, 1.05, 1.05 ),
		},
	},
	["male_09"] = {
		["ValveBiped.Bip01_Head1"] = {
			translate = v( 0.3, 0, 0 ),
			scale = v( 1, 1.05, 1.075 ),
		},
	},
}
local GOGGLESFIX = {
	["female"] = {
		["ValveBiped.Bip01_Head1"] = {
			translate = v( -0.5, -0.6, 0 ),
			scale = qv( 0.975 ),
		},
	},
	["male_01"] = {
		["ValveBiped.Bip01_Head1"] = {
			translate = v( 0.5, -0.3, 0 ),
			scale = v(1, 1.075, 1.05),
		},
	},
	["male_02"] = {
		["ValveBiped.Bip01_Head1"] = {
			translate = v( 0, -0.5, -0.2 ),
		},
	},
	["male_03"] = {
		["ValveBiped.Bip01_Head1"] = {
			translate = v( 0.5, -0.5, -0.2 ),
		},
	},
	["male_04"] = {
		["ValveBiped.Bip01_Head1"] = {
			translate = v( 0.6, -0.2, 0 ),
		},
	},
	["male_06"] = {
		["ValveBiped.Bip01_Head1"] = {
			translate = v( 0.5, -0.5, 0 ),
			scale = qv(1.05),
		},
	},
	["male_07"] = {
		["ValveBiped.Bip01_Head1"] = {
			scale = v( 1, 1.05, 1 ),
		},
	},
	["male_09"] = {
		["ValveBiped.Bip01_Head1"] = {
			translate = v( 0.3, 0, 0 ),
			scale = v(1, 1.05, 1.05),
		},
	},
}
FCS.DefineItem("cwus_patrol", {
	PrintName = "Patrol Cap",
	Category = "US Military",
	Type = FCS_HAT,
	Model = "models/taggart_kali/characters/cold war us infantry/attachments/headgear.mdl",
	BoneMods = CAPFIX,
})
FCS.DefineItem("cwus_8point", {
	PrintName = "8-Point Cap",
	Category = "US Military",
	Type = FCS_HAT,
	Model = "models/taggart_kali/characters/cold war us infantry/attachments/headgear.mdl",
	Bodygroups = {[1] = 1},
	BoneMods = CAPFIX,
	Options = { Skins = USGI_CAMO },
})
FCS.DefineItem("cwus_boonie", {
	PrintName = "Boonie Hat",
	Category = "US Military",
	Type = FCS_HAT,
	Model = "models/taggart_kali/characters/cold war us infantry/attachments/headgear.mdl",
	Bodygroups = {[1] = 2},
	BoneMods = CAPFIX,
	Options = { Skins = USGI_CAMO },
})

FCS.DefineItem("cwus_goggles", {
	PrintName = "USGI Goggles",
	Category = "US Military",
	Type = FCS_EYES,
	Model = "models/taggart_kali/characters/cold war us infantry/attachments/goggles.mdl",
	BoneMods = GOGGLESFIX,
	Options = { Skins = {
		[0] = "Clear (Olive)",
		[1] = "Clear (Tan)",
		[2] = "Clear (Black)",
		[3] = "Tinted (Olive)",
		[4] = "Tinted (Tan)",
		[5] = "Tinted (Black)",
		[6] = "Opaque (Olive)",
		[7] = "Opaque (Tan)",
		[8] = "Opaque (Black)",
		[9] = "Green (Olive)",
		[10] = "Green (Tan)",
		[11] = "Green (Black)",
	}},
})

FCS.DefineItem("cwus_glasses", {
	PrintName = "USGI Glasses",
	Category = "US Military",
	Type = FCS_EYES,
	Model = "models/taggart_kali/characters/cold war us infantry/attachments/gi glasses.mdl",
	BoneMods = GOGGLESFIX,
})

FCS.DefineItem("cwus_helmet", {
	PrintName = "PASGT Helmet",
	Category = "US Military",
	Type = FCS_HAT + FCS_EARS,
	Model = "models/taggart_kali/characters/cold war us infantry/attachments/pasgt helmet.mdl",
	BoneMods = HELMETFIX,
	Options = { Skins = USGI_CAMO },
	Armor = {
		Strength = 1,
		Durability = 50,
		Region = {[HITGROUP_HEAD] = FCS_DMGDIR_TOP + FCS_DMGDIR_SIDE + FCS_DMGDIR_BACK},
	},
})

local VESTFIX = {
	[true] = {
		["ValveBiped.Bip01_Spine"] = {
			translate = v( 0, -1.5, 0 ),
		},
		["ValveBiped.Bip01_Spine1"] = {
			translate = v( 0, -1.25, 0 ),
			scale = qv(1.025),
		},
		["ValveBiped.Bip01_Spine2"] = {
			translate = v( 0.25, -0.5, 0 ),
			scale = v(1, 1.05, 1),
		},
		["ValveBiped.Bip01_Spine4"] = {
			translate = v( 0, -0.5, 0 ),
			scale = v(1, 1.2, 1),
		},
	},
}

FCS.DefineItem("cwus_vest", {
	PrintName = "PASGT Vest",
	Category = "US Military",
	Type = FCS_EXO,
	Model = "models/taggart_kali/characters/cold war us infantry/attachments/pasgt vest.mdl",
	BoneMods = VESTFIX,
	Options = { Skins = USGI_CAMO },
	Armor = {
		Strength = 0.75,
		Durability = 150,
		Region = {[HITGROUP_CHEST] = true, [HITGROUP_STOMACH] = false},
	},
})

FCS.DefineItem("cwus_alice", {
	PrintName = "ALICE Webbing",
	Category = "US Military",
	Type = FCS_BELT,
	Model = "models/taggart_kali/characters/cold war us infantry/attachments/alice webbing pasgt vest.mdl",
	BoneMods = VESTFIX,
	Options = {
		Skins = {
			[0] = "Olive",
			[1] = "Tan",
			[2] = "Black",
		}
	}
})