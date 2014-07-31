	










	
						
_object = nearestObject [player, "Infostand_2_EP1"];
_newCombo = dayz_combination;
_object setVariable ["CharacterID",_newCombo,true];
_actual = _object getVariable ["CharacterID", "0"];
_inMotion = _object getVariable ["inMotion",0];



cutText [format["Your new ComboKey:  %1", _actual], "PLAIN DOWN"];

   _classname = "MAP_phonebox";

  
	        _location	= _object getVariable["OEMPos",(getposATL _object)];
			_dir = getDir _object;

				
			// Create new object 
			_newobject = createVehicle [_classname, [0,0,0], [], 0, "FORM"];  //, "CAN_COLLIDE"

			// Set direction
			_newobject setDir _dir;

			// Set location
			_newobject setPosATL _location;
			_newobject setVariable ["inMotion", _inMotion, true];

			PVDZE_obj_Swap = [_newCombo,_newobject,[_dir,_location],_classname,_object,player];
			publicVariableServer "PVDZE_obj_Swap";

			player reveal _newobject;
			
							
						