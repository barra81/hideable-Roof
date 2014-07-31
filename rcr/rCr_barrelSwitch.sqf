_nearestBarrels = nearestObjects [vehicle player, ["Land_Fire_Barrel"], 50];
_nearestTowers = nearestObjects [vehicle player, ["Land_Ind_IlluminantTower"], 50];
_doLight = _this select 3 select 1;


if (_doLight) then {


{
_x inflame true;

} forEach _nearestBarrels;


{
_x setVariable ["bbTowerLight", "true", true];

} forEach _nearestTowers;


} else {


{
_x inflame false;

} forEach _nearestBarrels;


{
_x setVariable ["bbTowerLight", "false", true];

} forEach _nearestTowers;

};

