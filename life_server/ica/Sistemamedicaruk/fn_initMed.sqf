
/*
por: Icaruk
	[player] spawn ica_fnc_initMed;		// init
	[player, true] spawn ica_fnc_initMed;	// reset
*/

_victima = _this select 0;
_reset = _this select 1;

if (!isNil {_reset}) exitWith {
	if (_reset) then {
		{_victima setVariable [_x, 0, true] } forEach ["cabeza", "pecho", "brazos", "piernas"];
		_victima setVariable ["sangrando", [0, 0, 0, 0], true];
		_victima setVariable ["toxicidad", 0, true];
		_victima setVariable ["dolor", false];
		_victima setVariable ["culpables", [[], [], [], [], [], [], [], [], [], []], true];
		_victima setVariable ["organos", [true, true, true], true];
		
		_victima addEventHandler ["HandleDamage",{_this call ica_fnc_sistemaMedica}];
		[true] call ica_fnc_guardaCargaMed;
	};
};

if (isNil {profileNamespace getVariable "edmcai"}) then {
	_victima setVariable ["total", 0];
	{_victima setVariable [_x, 0, true] } forEach ["cabeza", "pecho", "brazos", "piernas"];
	_victima setVariable ["sangrando", [0, 0, 0, 0], true];
	_victima setVariable ["toxicidad", 0, true];
	_victima setVariable ["dolor", false];
	_victima setVariable ["culpables", [[], [], [], [], [], [], [], [], [], []], true];
	_victima setVariable ["organos", [true, true, true], true];
	
	[true] call ica_fnc_guardaCargaMed;
} else {
	[false] call ica_fnc_guardaCargaMed;
};

_victima addEventHandler ["HandleDamage",{_this call ica_fnc_sistemaMedica}];
