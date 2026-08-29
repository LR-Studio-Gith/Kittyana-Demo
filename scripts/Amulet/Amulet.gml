/* Amulet Template:

	Please do remember to create amulets inside of the All_Amulets script, and look up what Structs are
	ordered if you don't know how a GML Struct works.
	
	And if you wanna know what stats are in the player just reference it quickly to see, or look through
	it's list of stats which are at the top, sorry I couldn't make them show when typing, GML's IDE
	is buns.

	amulet_namehere : new Amulet("Amulet of ______", 
		[
			BaseStat._____,
			...,
		],
		[
			new Modifier(___, math_ops.____, ____),
			...,
		]),
		
*/


/**
 * @desc Creates an amulet with a set of stats it can affect and an matching array of modifiers that affect those stats.
 * @param {String} _name Name of the amulet to be displayed
 * @param {Array<Statistic>} _stats An array of player stats to modify. Use BaseStats to see the list of available stats.
 * @param {Array<Modifier>} _modifiers An array of modifiers to apply to each stat. Use "new Modifier" to create a modifier.
 */

function Amulet(_name, _stats, _modifiers) constructor{
	name = _name;
	stats = _stats;
	mods = _modifiers;
	
	/// @desc Applies every modifier to every stat in the array one by one. So the first stat will have the first modifier applied. Second stat, second modifier, etc.
	static ApplyModifiers = function(_s = stats, _m = mods) {
		if array_length(mods) != array_length(stats) {
			array_resize(_s, array_length(_m))
		}
		
		for (var i = 0; i < array_length(_m); ++i) {
			_s[i].AddModifier(_m[i])
		}
	}
	
	/// @desc Removes every modifier the amulet is applying.
	static RemoveModifiers = function(_s = stats, _m = mods) {
		if array_length(_m) != array_length(_s) {
			array_resize(_m, array_length(_s))
		}
		
		for (var i = 0; i < array_length(_s); ++i) {
			_s[i].RemoveModifierById(_m[i])
		}
	}
	
}