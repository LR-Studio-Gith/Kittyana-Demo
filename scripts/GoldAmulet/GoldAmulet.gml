/**
 *  The Gold variant of the amulets. Which is really several amulets in the trenchcoat.
 * @param {array<Struct.Amulet>} [_amulets] An array of amulets to choose from.
*/
function GoldAmulet(_amulets) constructor {
	amulets = _amulets
	static ChooseAmulet = function(amulet_num) {return amulets[amulet_num]}
}