/* KeepDoc mod: Keep the howto document instead of consuming it, if needed.			*/
/* By Kisvakond, contact: dayzdisinfection@gmail.com								*/
/*																					*/
/* Usage: _newItemsList = [_origItemList] call fnc_keepDoc;				*/
/*																					*/
/* Inputs:	_origItemList -> items passed for craft/upgrade including the howto		*/
/*			_docToKeep 	  -> name of the howto to keep.								*/
/* Returns: _newItemsList -> items excluding the									*/
private [_origItemList, _docToKeep, _item, _tmp, _docsToKeep];
/* The following items are the howtos that should be kept */
_docsToKeep = [	"ItemPlotDeed", 
				"ItemDocumentRamp", 
				"ItemORP",
				"ItemAVE",
				"ItemLRK",
				"ItemTNK" ];
/* Fetch items list passed */
_origItemList = _this select 0;
/* Function only active when demanded */
if (DZE_KeepHowTos) then {
	/* Search for input item matching the crafting name */			
	for "_x" from 0 to ((count _origItemList) - 1) do {		
		/* Keep the howto unless it's an unexamined Document */
		if ( format["%1", ((_origItemList select _x) select 0)] in _docsToKeep)  exitWith {
			/* Workaround: nested arrays can't be subtracted. Replace the located element and delete it. */
			_origItemList set [_x, -1];
			_origItemList = _origItemList - [-1];
		};
	};	
};
/* Return value */
_origItemList
