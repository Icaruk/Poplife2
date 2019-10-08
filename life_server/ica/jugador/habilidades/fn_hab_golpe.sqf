
// ["pego"] call ica_fnc_hab_Golpe;
_param = _this select 0;

if (_param isEqualTo "pego") exitWith {
	if (!isNil {golpeDado}) exitWith {hint "Tienes que descansar 6 segundos, dar puñetazos así de molones cansa mucho." };
	[] spawn {
		golpeDado = true;
		sleep 6;
		golpeDado = nil;
	};

	[cursorTarget] spawn {
		_victima = _this select 0;

		if (isNull cursorTarget) exitWith { // le pegas al vacío
			_animPegar = ["CL3_anim_Punch1", "CL3_anim_Punch2", "CL3_anim_Punch3", "CL3_anim_Punch4"] call BIS_fnc_selectRandom;
			player playActionNow _animPegar;
			[[player,_animPegar],"life_fnc_animSync",nil,false] call life_fnc_MP;
		};

		if ((player distance _victima) > 4.5) exitWith {};
		_animPegar = ["CL3_anim_Punch1", "CL3_anim_Punch2", "CL3_anim_Punch3", "CL3_anim_Punch4"] call BIS_fnc_selectRandom;
		player playActionNow _animPegar;
		[[player,_animPegar],"life_fnc_animSync",nil,false] call life_fnc_MP;
		sleep 0.75;

		if ( !(_victima getVariable "restrained") AND ((animationState _victima) != "Incapacitated") AND (_victima isKindOf "Man") ) then {
			[["recibo", _victima], "ica_fnc_hab_Golpe", true, false] call life_fnc_MP;
		};
	};
};

if (_param isEqualTo "recibo") exitWith {

	[_this select 1] spawn {
		_victima = _this select 0;
		if (player != _victima) exitWith {};
		_victima setVariable ["cabeza", (_victima getVariable "cabeza") + 12];
		_animRecibir = ["CL3_anim_Receive1a", "CL3_anim_Receive2b", "CL3_anim_Receive3b"] call BIS_fnc_selectRandom;
		player playActionNow _animRecibir;
		[[player,_animRecibir],"life_fnc_animSync",nil,false] call life_fnc_MP;
		sleep 3;
	};
};

