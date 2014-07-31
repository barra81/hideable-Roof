






waitUntil {!isNil "dayz_animalCheck"};



_nearestGates = nearestObjects [player, ["MAP_Ind_Shed_01_main"], 20000];

{


_openGates = _x getVariable ["GateLowered", false];

If (_openGates) then {

[nil, _x, "per", rHideObject, true] call RE;

};



} foreach _nearestGates;








