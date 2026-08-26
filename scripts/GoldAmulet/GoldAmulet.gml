/**
 * @desc The Gold variant of the amulets
 * @param {String} _name Name of the amulet to be displayed
 * @param {Array<Statistic>} _stats An array of player stats to modify. Use BaseStats to see the list of available stats.
 * @param {Array<Modifier>} _modifiers An array of modifiers to apply to each stat. Use "new Modifier" to create a modifier.
 */
function GoldAmulet(_name, _stats, _modifiers) : Amulet(_name, _stats, _modifiers) constructor {
	/// @desc
	static ChooseModifier = function(index, _s = stats, _m = mods) {
		if array_length(_m) != array_length(_s) {
			array_resize(_m, array_length(_s))
		}
		
		for (var i = 0; i < array_length(_s); ++i) {
			if i != index {
				_s[i].RemoveModifierById(_m[i])
			}
		}
		
		_stats[index].AddModifier(_modifiers[index])
	}
}