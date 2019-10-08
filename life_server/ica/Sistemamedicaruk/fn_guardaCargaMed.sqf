
/*
por: Icaruk
	[true] call ica_fnc_guardaCargaMed; // guarda
	[false] call ica_fnc_guardaCargaMed; // carga
*/

_param = _this select 0;
if ((typeName _param) != "BOOL") exitWith {};

_victima = player;

if (_param) then {
	_cab = _victima getVariable "cabeza";
	_pec = _victima getVariable "pecho";
	_bra = _victima getVariable "brazos";
	_pie = _victima getVariable "piernas";
	_sang = _victima getVariable "sangrando";
	_dol = _victima getVariable "dolor";
	_tox = _victima getVariable "toxicidad";
	_inc = if ((animationState _victima) == "deadstate") then {true} else {false};
	_org = _victima getVariable "organos";

	_array = [_cab, _pec, _bra, _pie, _sang, _dol, _tox, _inc];
	for "_idx" from 0 to 7 do { // pongo todo menos organos
		if (isNil {_array select _idx}) then {
			_array set [_idx, 0];
		};
	};
	_array set [8, _org]; // pongo organos
	
	profileNamespace setVariable ["edmcai", _array];

} else {
	_array = profileNamespace getVariable "edmcai";

	if ((count (_array select 4)) < 4) then {_array set [4, [0,0,0,0]]};

	_victima setVariable ["cabeza", _array select 0, true];
	_victima setVariable ["pecho", _array select 1, true];
	_victima setVariable ["brazos", _array select 2, true];
	_victima setVariable ["piernas", _array select 3, true];
	_victima setVariable ["sangrando", _array select 4, true];
	_victima setVariable ["dolor", _array select 5];
	_victima setVariable ["toxicidad", _array select 6, true];
	_inconsciente = _array select 7;

	if (isNil {_array select 8}) then {_array set [8, [true, true, true]]};
	if ((typeName (_array select 8)) != "ARRAY") then {_array set [8, [true, true, true]]};
	_victima setVariable ["organos", _array select 8, true];

	_dolor = ((_victima getVariable "cabeza") + (_victima getVariable "pecho") + (_victima getVariable "brazos") + (_victima getVariable "piernas")) / 4;
	if (_dolor < 20) then {
		[_victima] spawn ica_fnc_dolor; // empiezo el loop del dolor
	};
	[player] spawn ica_fnc_toxicidad;
	[player, "piernas"] spawn ica_fnc_fractura;
	[player, "loop"] spawn ica_fnc_sangrando;
	// if (_inconsciente) then {[player, true] spawn ica_fnc_inconsciente};
	["init"] spawn ica_fnc_organos;
};



