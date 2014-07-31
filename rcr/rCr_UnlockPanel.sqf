                _sfx = "repair";
				[1,1] call dayz_HungerThirst;
				player playActionNow "Medic";

				[player,_sfx,0,false] call dayz_zombieSpeak;
				[player,50,true,(getPosATL player)] spawn player_alertZombies;

				r_interrupt = false;
				_animState = animationState player;
				r_doLoop = true;				
				_setOK = false;
				_started = false;
				
					 while {r_doLoop} do {
					_animState = animationState player;
					_isMedic = ["medic",_animState] call fnc_inString;
					if (_isMedic) then {
						_started = true;
					};
					if (_started && !_isMedic) then {
						r_doLoop = false;				
						_setOK = true;
					};
					if (r_interrupt) then {
						r_doLoop = false;
						if (vehicle player == player) then {
						[objNull, player, rSwitchMove,""] call RE;
						player playActionNow "stop";
					    };						
					};
					sleep 0.1;
				    };
				    r_doLoop = false;

if (_setOK) then {


_object = nearestObject [player, "MAP_phonebox"];
_keycode = dayz_combination;
_actual = _object getVariable ["CharacterID", "0"];
_inMotion = _object getVariable ["inMotion",0];


_classname = "Infostand_2_EP1";

 If ((_actual == dayz_combination)) then {
	        _location	= _object getVariable["OEMPos",(getposATL _object)];
			_dir = getDir _object;

				
			// Create new object 
			_newobject = createVehicle [_classname, [0,0,0], [], 0, "FORM"];  //, "CAN_COLLIDE"

			// Set direction
			_newobject setDir _dir;

			// Set location
			_newobject setPosATL _location;
			_newobject setVariable ["inMotion", _inMotion, true];

			PVDZE_obj_Swap = [_actual,_newobject,[_dir,_location],_classname,_object,player];
			publicVariableServer "PVDZE_obj_Swap";

			player reveal _newobject;
			
	} else {

cutText [format["You entered the wrong Key"], "PLAIN DOWN"];

};

} else {

cutText [format["Cancelled unlocking!"], "PLAIN DOWN"];

};