require "/stats/effects/fu_armoreffects/setbonuses_common.lua"

function init()
	setBonusInit("fu_chitinset", {
	    {stat = "sulphuricImmunity", amount = 1},
	    {stat = "physicalResistance", amount = 0.15}
	})
end