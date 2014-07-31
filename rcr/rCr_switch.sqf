


_nearestPanelorBox = nearestObjects [vehicle player, ["Infostand_2_EP1","MAP_phonebox"], 60];
_nearestOne = _nearestPanelorBox select 0;
_nearestGates = nearestObjects [_nearestOne, ["MAP_Ind_Shed_01_main"], 40];
_panelCode = _nearestOne getVariable ["CharacterID","0"];
_inMotion = _nearestOne getVariable ["inMotion",0];



If ((_panelCode == dayz_combination)) then {

if (_inMotion == 0) then {

_nearestOne setVariable ["inMotion", 1, true];



rcrHideRoof = [player, _nearestGates];
publicVariable "rcrHideRoof";


} else {

_nearestOne setVariable ["inMotion", 0, true];


rcrUnHideRoof = [player, _nearestGates];
publicVariable "rcrUnHideRoof";


};
} else {
cutText [format["You entered the wrong Key"], "PLAIN DOWN"];

};