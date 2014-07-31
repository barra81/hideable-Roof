
_panel = _this select 3 select 0;
_sfx = "repair";
_objectID = 0;
_objectUID = 0;


if (!isNull _panel) then {
	_objectID = _panel getVariable["ObjectID","0"];
	_objectUID = _panel getVariable["ObjectUID","0"];
};


				[1,1] call dayz_HungerThirst;
				player playActionNow "Medic";

				[player,_sfx,0,false] call dayz_zombieSpeak;
				[player,50,true,(getPosATL player)] spawn player_alertZombies;

				r_interrupt = false;
				_animState = animationState player;
				r_doLoop = true;				
				_deleteOK = false;
				_started = false;
				
					 while {r_doLoop} do {
					_animState = animationState player;
					_isMedic = ["medic",_animState] call fnc_inString;
					if (_isMedic) then {
						_started = true;
					};
					if (_started && !_isMedic) then {
						r_doLoop = false;				
						_deleteOK = true;
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
				
			
				

       if (_deleteOK) then {
	   
        PVDZE_obj_Delete = [_objectID,_objectUID];
	    publicVariableServer "PVDZE_obj_Delete";
	
	    deletevehicle _panel; 
		
		player addMagazine "30m_plot_kit";
		cutText [format["Panel added to your inventory !"], "PLAIN DOWN"];
		
		
		} else {
		
		 cutText [format["Cancelled packing of Panel !"], "PLAIN DOWN"];
		 };