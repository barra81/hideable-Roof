hideable-Roof
=============
Copy the whole folder "rCr" into your missionfile.pbo



_______________________________________________________________________________________________________________________________________
in your description.ext


add


#include "rcr\rCr_RoofUI.hpp"
#include "rcr\rCr_roofCodeUI.hpp"
#include "rcr\rCr_unlockUI.hpp"

at the very bottom


____________________________________________________________________________________________________________________________________________________
in your init.sqf


add

	//HideableRoofs
	
if (isDedicated) then {

	"rcrHideRoof" addPublicVariableEventHandler {
		
	_packet = _this select 1;
	_nearestGates = _packet select 1;
	
	{
     _x setVariable ["GateLowered", true, true];
	[nil, _x, "per", rHideObject, true] call RE;
	
	
	} foreach _nearestGates;
	
	
	
	};
	
	
	"rcrUnHideRoof" addPublicVariableEventHandler {
	
	_packet = _this select 1;
	_nearestGates = _packet select 1;
	
	{
	_x setVariable ["GateLowered", false, true];
	[nil, _x, "per", rHideObject, false] call RE;
	
	
	} foreach _nearestGates;
	
	};
	
};


	[] execVM "rcr\jipHide.sqf";
	#include "rcr\REsec.sqf"

	
	
ABOVE

//Start Dynamic Weather



-------------------------------------------------------------------------------------------------------------------------------------
again in your init.sqf


add

_null = [] execVM "rCr\doTowerLights.sqf";		// Run tower lighting script



BELOW

if (!isDedicated) then {

--------------------------------------------------------------------------------------------------------------------------------------
and again in your init.sqf

add

dayz_RoofCombination = "";


BELOW

dayz_combination = "";

________________________________________________________________________________________________________________________________________
in your compiles.sqf


add


	rCr_UnlockPanel =           compile preprocessFileLineNumbers "rcr\rCr_UnlockPanel.sqf";
	rCr_setCode =               compile preprocessFileLineNumbers "rcr\rCr_setCode.sqf";
	rCr_switch =                compile preprocessFileLineNumbers "rcr\rCr_switch.sqf";

below


player_unlockDoor      =        compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\player_unlockDoor.sqf";



_________________________________________________________________________________________________________________________________________
in your variables.sqf

add

"MAP_phonebox","Infostand_2_EP1","MAP_Ind_Shed_01_main"                     

to your

dayz_allowedObjects =

and 

DZE_maintainClasses =




___________________________________________________________________________________________________________________________________________
in your fn_selfActions.sqf


add 


///// RadioControledRoof  Start

_codePanels = ["Infostand_2_EP1"];


if (typeOf(cursortarget) in _codePanels) then {
		
		if (s_player_roofToggle < 0) then {
			if (typeOf(cursortarget) == "Infostand_2_EP1") then {
				
					s_player_roofToggle = player addAction ["Switch Roof", "rcr\rCr_panelSwitch.sqf", _lever, 6, false, true, "", ""];				
			};
		};
	} else {
		player removeAction s_player_roofToggle;
		s_player_roofToggle = -1;
	};
	

	
	if (typeOf(cursortarget) in _codePanels) then {

		if (s_player_roofToggle2 < 0) then {
			if (typeOf(cursortarget) == "Infostand_2_EP1") then {
		
					s_player_roofToggle2 = player addAction ["Set new Code", "rcr\rCr_openCodeUI.sqf","",0,false,true,"", ""];
					};
	};
	} else {
		player removeAction s_player_roofToggle2;
		s_player_roofToggle2 = -1;
	};
	
		if (typeOf(cursortarget) in _codePanels) then {

		if (s_player_roofToggle3 < 0) then {
			if (typeOf(cursortarget) == "Infostand_2_EP1") then {
		
					s_player_roofToggle3 = player addAction ["Lock Panel", "rcr\rCr_lock.sqf","",0,false,true,"", ""];
					};
	};
	} else {
		player removeAction s_player_roofToggle3;
		s_player_roofToggle3 = -1;
	};
	
	_codePanelsLocked = ["MAP_phonebox"];
	
		if (typeOf(cursortarget) in _codePanelsLocked) then {

		if (s_player_roofToggle4 < 0) then {
			if (typeOf(cursortarget) == "MAP_phonebox") then {
		
					s_player_roofToggle4 = player addAction ["UnLock Panel", "rcr\rCr_openUnlockUI.sqf","",0,false,true,"", ""];
					};
	};
	} else {
		player removeAction s_player_roofToggle4;
		s_player_roofToggle4 = -1;
	};





	if (typeOf(cursortarget) in _codePanels) then {
		
		if (s_player_roofToggle5 < 0) then {
			if (typeOf(cursortarget) == "Infostand_2_EP1") then {
				
					s_player_roofToggle5 = player addAction [format["Switch Lights ON"], "rcr\rCr_BarrelSwitch.sqf", [_mouseOver,true], 6, false, true, "", ""];				
			};
		};
	} else {
		player removeAction s_player_roofToggle5;
		s_player_roofToggle5 = -1;
	};
	
	
		if (typeOf(cursortarget) in _codePanels) then {
		
		if (s_player_roofToggle6 < 0) then {
			if (typeOf(cursortarget) == "Infostand_2_EP1") then {
				
					s_player_roofToggle6 = player addAction [format["Switch Lights OFF"], "rcr\rCr_BarrelSwitch.sqf", [_mouseOver,false], 6, false, true, "", ""];				
			};
		};
	} else {
		player removeAction s_player_roofToggle6;
		s_player_roofToggle6 = -1;
	};

////////////// RCR end


ABOVE



          //Player Deaths




----------------------------------------------------------------------------------------------------------------------------------------------
again in your fn_selfActions.sqf


add


  	 player removeAction s_player_roofToggle;
		s_player_roofToggle = -1;
		player removeAction s_player_roofToggle2;
		s_player_roofToggle2 = -1;
		player removeAction s_player_roofToggle3;
		s_player_roofToggle3 = -1;
		player removeAction s_player_roofToggle4;
		s_player_roofToggle4 = -1;
		player removeAction s_player_roofToggle5;
		s_player_roofToggle5 = -1;
		player removeAction s_player_roofToggle6;
		s_player_roofToggle6 = -1;


below



	player removeAction s_player_upgrade_build;
	s_player_upgrade_build = -1;
	player removeAction s_player_maint_build;
	s_player_maint_build = -1;
	player removeAction s_player_downgrade_build;
	s_player_downgrade_build = -1;


	
	
_______________________________________________________________________________________________________________________________________________________
in your BattleEye folder in your SERVER-Mission 

replace the original filter files with the new files
