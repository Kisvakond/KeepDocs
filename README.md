KeepDocs Mod v0.1
=================
Author: Kisvakond at epochmod.com/forum/
Contact: dayzdisinfection@gmail.com

A DayZ Epoch mod to keep players' HowTo documents otherwise consumed for crafting/upgrades.
Use the DZE_KeepHowTos variable to control whether you like to lose your documents or not.
DZE_KeepHowTos = true -> keep it
DZE_KeepHowTos = false -> lose it (default Dayz Epoch feeling)

Usage: Do your crafting or vehicle upgrade as usual. The document used will remain in your inventory.

Installation
NOTE: Use at you own risk! These instructions are for Epoch 1.0.5.1. For future version, please check the github for updates or contact me if something is out of date!

__Step 1__ Download the ZIP from the [Github repo](https://github.com/Kisvakond/KeepDocs)

__Step 2__ Form the ZIP, extract the 'addons' folder into ```(your Dayz Epoch Server folder)\Arma 2 Operation Arrowhead\MPMissions\(yourmisson) folder. Or just create the addons\KeepDocs``` folder and copy the fn_keepDoc.sqf file.

__Step 3__ If you already have a custom ```compiles.sqf```, go to step 3c.
   If you don't have one, get it by extracting one from your dayz_code.pbo.
   a) Locate dayz_code.pbo at ```(your Steam folder)\SteamApps\common\Arma 2 Operation Arrowhead\(your Dayz folder e.g. @DayZ_Epoch1051)\addons\```

   b) Use you favourite PBO tool to open and extract ```dayz_code\init\compiles.sqf```. Copy it to your mission folder, mentioned in Step 2.

   c) With you PBO tool, copy the following files into the ```addons\KeepDocs folder``` in your mission folder:
```
* dayz_code\actions\player_craftItem.sqf
* dayz_code\compile\player_upgradeVehicle.sqf.
```

   d) In your mission folder, open ```addons\KeepDocs\player_craftItem.sqf``` and search for the line:

```sqf
_inputWeapons = getArray (configFile >> _baseClass >> _item >> "ItemActions" >> _crafting >> "inputweapons");
```

 After this line, insert:

```sqf
/* Keep the HowTo document on demand */
_selectedRecipeInput = [_selectedRecipeInput, (format ["%1", _item])] call fnc_keepDoc;
```

   e) In your mission folder, open ```addons\KeepDocs\player_upgradeVehicle.sqf``` and look for this line:
```sqf
_requirementsMagazine = _upgrade select 2;
```

 After this line, insert:

```sqf
/* Keep the HowTo document on demand */
_requirementsMagazine = [_requirementsMagazine, (format ["%1", _this])] call fnc_keepDoc;
```

__Step 4__ a) In your copy of ```compiles.sqf``` in your mission folder, replace the line:

```sqf
player_craftItem =			compile preprocessFileLineNumbers "\z\addons\dayz_code\actions\player_craftItem.sqf";
```

 to 

```sqf	
player_craftItem =			compile preprocessFileLineNumbers "addons\KeepDocs\player_craftItem.sqf";
```		

   b) Then, replace this:

```sqf
player_upgradeVehicle =		compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\player_upgradeVehicle.sqf";
```

to

```sqf   
player_upgradeVehicle =		compile preprocessFileLineNumbers "addons\KeepDocs\player_upgradeVehicle.sqf";
```

   c) before the line you have changed in step 4a, put this line:

```sqf   
fnc_keepDoc = 					compile preprocessFileLineNumbers "addons\KeepDocs\fn_keepDoc.sqf"; /* Addon for custom craft and upgrade functions */
```

__Step 5__ a) In your ```init.sqf```, locate the end of the variables. Look for 

```sqf
//Load in compiled functions
```	

 Before this line, copy

```sqf
/* Set up to keep howto documents after using them. To set back default behaviour (lose documents), set it to false. */
if(isNil "DZE_KeepHowTos") then {
	DZE_KeepHowTos = true;
};
```

   b) Skip this if you already have a working custom compiles.sqf based on the original one. In the mission's ```init.sqf``` (located in the root of your your MPMisson\yourmisson), locate this line:

```sqf   
call compile preprocessFileLineNumbers "\z\addons\dayz_code\init\compiles.sqf"   
```	

and replace to

```sqf	  
call compile preprocessFileLineNumbers "compiles.sqf"; /* Compile Custom Functions */
```

That's all.

Hope you like it! :D
