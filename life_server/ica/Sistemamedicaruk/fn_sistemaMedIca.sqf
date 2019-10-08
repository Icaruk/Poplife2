
/*
por: Icaruk
	esto se llama desde un EH "HandleDamage" con call
*/

/*
INIT TEST:

	_victima = asd;
	{_victima setVariable [_x, 0, true] } forEach ["total", "cabeza", "pecho", "brazos", "piernas"];
	_victima setVariable ["sangrando", [0, 0, 0, 0], true];
	_victima setVariable ["toxicidad", 0, true];
	_victima setVariable ["dolor", false];
	_victima setVariable ["culpables", [[], [], [], [], [], [], [], [], [], []], true];

	_victima addEventHandler ["HandleDamage",{_this call ica_fnc_sistemaMedica}];

*/

_victima = _this select 0; 		// OBJ
_parte = _this select 1; 		// STRING
_dmg = _this select 2; 		// SCALAR
_source = _this select 3;		// OBJ
_proj = _this select 4;		// STRING


if !(alive _victima) exitWith {};

if (isNil {_source}) exitWith {
	_dmg = damage _victima;
	_dmg
};
if (isNull _source) exitWith {
	_dmg = damage _victima;
	_dmg
};

if ((vehicle _source isKindOf "LandVehicle") OR (vehicle _source isKindOf "Ship")) exitWith {
	_dmg = damage _victima;
	_dmg
};


_parte = switch (_parte) do {
	case "": {"total"};
	case "head": {"cabeza"};
	case "body": {"pecho"};
	case "hands": {"brazos"};
	case "legs": {"piernas"};
	default {"total"}; 
};

_arrCulpables = _victima getVariable "culpables";
_arrNombres = [];
for "_idx" from 0 to (count _arrCulpables)-1 do {
	_arrNombres pushBack (_arrCulpables select _idx select 0);
};

_nameSource = _source getVariable "realname";

if !(_nameSource in _arrNombres) then {
	reverse _arrCulpables;
	_arrCulpables pushBack [_nameSource, _proj];
	reverse _arrCulpables;
	_arrCulpables resize 10;
	
	_victima setVariable ["culpables", _arrCulpables, true];
	culpables = _victima getVariable "culpables";
};

if (_parte isEqualTo "total") then {
	_parte = ["brazos", "piernas"] call BIS_fnc_selectRandom;
}; // has recibido daño en general y lo redirijo a brazos o piernas


_fortaleza = "for" call ica_fnc_expToLevel;
if (_source == _victima) exitWith { // daño de caída
	_dmg = if (_fortaleza >= 2) then {_dmg / 2} else {_dmg};
	_dmg	
};
if ((_fortaleza >= 4) AND ((round random 100) < 10)) exitWith { // 10% de ignorar daño
	_dmg = damage _victima;
	_dmg
};

_dmg = (round (_dmg * 100)) / 10; // redondeo
_dano = _victima getVariable _parte;

if (_dano < 100) then {
	_victima setVariable [_parte, _dano + _dmg, true];
} else {
	_victima setVariable [_parte, 100, true]
};

if ((_victima getVariable "cabeza") >= 35) then {
	[_victima, true, _source] spawn ica_fnc_inconsciente;
};
if ((_victima getVariable "pecho") >= 45) then {
	[_victima, true, _source] spawn ica_fnc_inconsciente;
};

if (_parte == "cabeza") then {
	if ((animationstate _victima) == "deadstate") then {
		if (_dmg >= 20) then {
			[format ["%1 ha ejecutado a %2", _nameSource, _victima getVariable "realname"], "systemChat", true, false, false] call BIS_fnc_MP;
			[[getPlayerUID _source, _source getVariable ["realname", _nameSource], "187"], "life_fnc_wantedAdd", false, false] call life_fnc_MP;
			_victima setDamage 1;
		};
	};
	_porc = (_victima getVariable "cabeza");
	if ((random 100) < _porc) then {
		[_victima, "cabeza"] spawn ica_fnc_sangrando;
	};
};
if (_parte == "pecho") then {
	_porc = (_victima getVariable "pecho");
	if ((random 100) < _porc) then {
		[_victima, "pecho"] spawn ica_fnc_sangrando;
	};
};
if (_parte == "brazos") then {
	_porc = (_victima getVariable "brazos");
	if ((random 100) < _porc) then {
		[_victima, "brazos"] spawn ica_fnc_sangrando;
	};
};
if (_parte == "piernas") then {
	_porc = (_victima getVariable "piernas");
	if ((random 100) < _porc) then {
		[_victima, "piernas"] spawn ica_fnc_sangrando;
	};
	if ((_victima getVariable "piernas") >= 50) then {
		[_victima, "piernas"] spawn ica_fnc_fractura;
	};
};

if !(_victima getVariable "dolor") then { // si no tengo dolor
	_dolor = ((_victima getVariable "cabeza") + (_victima getVariable "pecho") + (_victima getVariable "brazos") + (_victima getVariable "piernas")) / 4;
	if (_dolor < 20) then {
		[_victima] spawn ica_fnc_dolor; // empiezo el loop del dolor
	};
};


_dmg = damage _victima;
_dmg
