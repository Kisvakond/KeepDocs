KeepDocs
========
Version 0.1.

DayZ Epoch mod to keep players' HowTo documents otherwise consumed for crafting/upgrades.

Usage: Do your crafting or vehicle upgrade as usual. The document used will remain in your inventory.

Installation
NOTE: These instructions are for Epoch 1.0.5.1. For future version, please check the github for updates or contact me if something is out of date!

1. Download the ZIP from the Github repo: https://github.com/Kisvakond/KeepDocs

2. Unzip the 'addons' folder into (your Steam folder)\SteamApps\common\Arma 2 Operation Arrowhead\MPMissions\(yourmisson) folder. Or just create the addons\KeepDocs folder and copy the fn_keepDoc.sqf file.

3. If you already have a custom compiles.sqf, go to step 3c.
   If you don't have one, get it by extracting one from your dayz_code.pbo.
   a) Located dayz_code.pbo at (your Steam folder)\SteamApps\common\Arma 2 Operation Arrowhead\(your Dayz folder e.g. @DayZ_Epoch1051)\addons\

   b) Use you favorite PBO tool to open and extract dayz_code\init\compiles.sqf. Copy it to your mission folder, like in Step 2.

   c) With you PBO tool, copy the following files into the addons\KeepDocs folder:
	* dayz_code\actions\player_craftItem.sqf
	* dayz_code\compile\player_upgradeVehicle.sqf.

   d) In your mission folder, open addons\KeepDocs\player_craftItem.sqf and search for the line:
	_inputWeapons = getArray (configFile >> _baseClass >> _item >> "ItemActions" >> _crafting >> "inputweapons");
      After this line, insert:
	/* Keep the HowTo document on demand */

	_selectedRecipeInput = [_selectedRecipeInput, (format ["%1", _item])] call fn_keepDoc;

   e) In your mission folder, open addons\KeepDocs\player_upgradeVehicle.sqf and look for this line:
	_requirementsMagazine = _upgrade select 2;
      Aftert his line, insert:
	/* Keep the HowTo document on demand */

	_requirementsMagazine = [_requirementsMagazine, (format ["%1", _this])] call fn_keepDoc;
   
4. a) In your copy of compiles.sqf in your mission folder, replace the line:
	player_craftItem =			compile preprocessFileLineNumbers "\z\addons\dayz_code\actions\player_craftItem.sqf";
	to 	
	player_craftItem =			compile preprocessFileLineNumbers "actions\player_craftItem.sqf";

   b) Then, replace this:
   player_upgradeVehicle =		compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\player_upgradeVehicle.sqf";
   to
   player_upgradeVehicle =		compile preprocessFileLineNumbers "compile\player_upgradeVehicle.sqf";

   c) before the line you have changed in step 4a, put this line:
	fnc_keepDoc = 					compile preprocessFileLineNumbers "addons\KeepDocs\fn_keepDoc.sqf"; /* Addon for custom craft and upgrade functions */

		
5. a) In your init.sqf, locate the end of the variables. Look for 
	//Load in compiled functions
      Before this line, copy

	/* Set up to keep howto documents after using them. To set back default behaviour (lose documents), set it to false. */
	if(isNil "DZE_KeepHowTos") then {
		DZE_KeepHowTos = true;
	};

   b) In the mission's init.sqf (located in the root of your your MPMisson\yourmisson), locate this line:
   	call compile preprocessFileLineNumbers "\z\addons\dayz_code\init\compiles.sqf"   
      and replace to
	call compile preprocessFileLineNumbers "compiles.sqf"; /* Compile Custom Functions */


That's all.

Hope you like it! :D
