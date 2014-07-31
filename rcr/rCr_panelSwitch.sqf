
waitUntil{!(isNil "BIS_MPF_InitDone")};



_nearestPanelorBox = nearestObjects [vehicle player, ["Infostand_2_EP1","MAP_phonebox"], 40];
_nearestOne = _nearestPanelorBox select 0;
_nearestGates = nearestObjects [_nearestOne, ["MAP_Ind_Shed_01_main"], 40];
/*
_hide = format["{  nearestGates hideObject true ;} forEach playableUnits;"];
*/
_inMotion = _nearestOne getVariable ["inMotion",0];



if (_inMotion == 0) then {

_nearestOne setVariable ["inMotion", 1, true];


/*
sleep 0.1;
player setVehicleInit _hide;
sleep 0.1;
processInitCommands;
sleep 0.1;
clearVehicleInit player;
*/

rcrHideRoof = [player, _nearestGates];
publicVariable "rcrHideRoof";


} else {

_nearestOne setVariable ["inMotion", 0, true];



rcrUnHideRoof = [player, _nearestGates];
publicVariable "rcrUnHideRoof";


};