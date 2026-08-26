
/// @desc GML is goofy so I need to basically make a new struct of every time. This is temporary for now
function All_Amulets(BaseStats = obj_player.BaseStats) constructor {
	#region Bronze Amulets
	bronze = {
		test_amu1 : new Amulet("Amulet of Testing", 
		[
			BaseStats.spd, 
			BaseStats.dash_dis, 
			BaseStats.jump_amount
		],
		[
			new Modifier(5, math_ops.MULTIPLY, 10),
			new Modifier(50, math_ops.ADD, 60),
			new Modifier(2, math_ops.ADD,),
		]),
	
		test_amu2 : new Amulet("Amulet of Testing II", 
		[
			BaseStats.grav, 
			BaseStats.damage, 
			BaseStats.hp
		],
		[
			new Modifier(0.5, math_ops.MULTIPLY, 10),
			new Modifier(10, math_ops.ADD),
			new Modifier(0.25, math_ops.MULTIPLY),
		])
	}
	#endregion
	
	#region Gold Amulets
	gold = {
		test_gold_1 : new GoldAmulet("John Kittyana's Amulet",
		[BaseStats.hp, BaseStats.damage], 
		[new Modifier(999, math_ops.FLAT), new Modifier(100, math_ops.FLAT)]) 
	} // They will be added later since those require unique code.
	#endregion
}