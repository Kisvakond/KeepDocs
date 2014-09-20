/* KeepDoc mod: Keep the howto document instead of consuming it, if needed.			*/
/* By Kisvakond, contact: dayzdisinfection@gmail.com								*/
/*																					*/
/* Usage: _newItemsList = [_origItemList, _docToKeep] call fnc_keepDoc;				*/
/*																					*/
/* Inputs:	_origItemList -> items passed for craft/upgrade including the howto		*/
/*			_docToKeep 	  -> name of the howto to keep.								*/
/* Returns: _newItemsList -> items excluding the									*/
private [_origItemList, _docToKeep, _item, _tmp];
/* Fetch items list passed */
_origItemList = _this select 0;
/* Function only active when demanded */
if (DZE_KeepHowTos) then {
	/* Get document name */
	_docToKeep = _this select 1;	
	/* Search for input item matching the crafting name */			
	for "_x" from 0 to ((count _origItemList) - 1) do {
		_item = format["%1", ((_origItemList select _x) select 0)];
		/* Keep the howto unless it's an unexamined Document */
		if (    (_item == _docToKeep) && {(_item != "ItemDocument")} ) exitWith {
			/* Workaround: nested arrays can't be subtracted. Replace the located element and delete it. */
			_origItemList set [_x, -1];
			_origItemList = _origItemList - [-1];
		};
	};	
};
/* Return value */
_origItemList
