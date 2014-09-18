KeepDocs
========

DayZ Epoch mod to keep players' HowTo documents otherwise consumed for crafting/upgrades.

Usage: Do your crafting or vehicle upgrade as usual. The document used will remain in your inventory.

Installation (some very common stuff if you ever installed a server mod):
1. Download the ZIP from the Github repo: https://github.com/Kisvakond/KeepDocs

2. Unzip the 'compile' and 'actions' folder into <your Steam folder>\SteamApps\common\Arma 2 Operation Arrowhead\MPMissions\<yourmisson> folder.

3. If you already have a custom compiles.sqf, go to step 4.
   If you don't have one, get it by extracting one from your dayz_code.pbo.
   a) Located dayz_code.pbo at <your Steam folder>\SteamApps\common\Arma 2 Operation Arrowhead\<your Dayz folder e.g. @DayZ_Epoch1051>\addons\
   b) Use you favorite PBO tool to open and extract dayz_code\init\compiles.sqf. Copy it to your mission folder, like in Step 2.
   c) Locate the line   
   call compile preprocessFileLineNumbers "\z\addons\dayz_code\init\compiles.sqf"   
      and replace to
   call compile preprocessFileLineNumbers "compiles.sqf"; /* Compile Custom Functions */
   Change the filename to your folder if you put compiles.sqf elsewhere (e.g. you put it to <missionfolder>\custom\, change "compiles.sqf" to "custom\compiles.sqf" )
   
4. a) Replace
	player_craftItem =			compile preprocessFileLineNumbers "\z\addons\dayz_code\actions\player_craftItem.sqf";
	to 	
	player_craftItem =			compile preprocessFileLineNumbers "actions\player_craftItem.sqf";
   b) Replace
   player_upgradeVehicle =		compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\player_upgradeVehicle.sqf";
   to
   player_upgradeVehicle =		compile preprocessFileLineNumbers "compile\player_upgradeVehicle.sqf";
		
5. In your init.sqf, locate the end of the variables. Look for 

//Load in compiled functions

Before this line, copy

/* Set up to keep howto documents after using them. To set back default behaviour (lose documents), set it to false. */
if(isNil "DZE_KeepHowTos") then {
	DZE_KeepHowTos = true;
}

