
/*
por: Icaruk
	["quito"] call ica_fnc_puntosCarnet
	["meQuitan", 10] call ica_fnc_puntosCarnet
*/

_param = _this select 0;

if (_param isEqualTo "quito") exitWith {
	if (isNil {life_ticket_unit}) exitWith {hint localize "STR_Cop_TicketNil"};
	if (isNull life_ticket_unit) exitWith {hint localize "STR_Cop_TicketExist"};
	_num = parseNumber (ctrlText 2652);
	if (_num <= 0) exitWith {hint "Has escrito un número menor o igual a 0... ¿qué haces?"};
	
	[[_num, player], "ica_fnc_puntosCarnet", life_ticket_unit, false, true] call life_fnc_MP;
	closeDialog 0;
};

if (_param isEqualTo "mequitan") exitWith {
	_can = _this select 1;

	hint format ["Has perdido %1 puntos del carnet", _can];
	
	_puntos = profileNamespace getVariable "puntosCarnet";
	if ((isNil {_puntos}) OR (_puntos < 0)) then {
		profileNamespace setVariable ["puntosCarnet", 15];
	};
	profileNamespace setVariable ["puntosCarnet", (profileNamespace getVariable "puntosCarnet") - _can];
	
	[format ["A %1 le quedan %2 puntos en el carnet", name player, profileNamespace getVariable "puntosCarnet"], "hint", _this select 2, false, false] call BIS_fnc_MP;
	
	if ((profileNamespace getVariable "puntosCarnet") <= 0) then {
		hint "Como has perdido todos los puntos del carnet, todas tus licencías de vehículos han sido eliminadas.";
		license_civ_driver = false;
		license_civ_transporte = false;
		license_civ_boat = false;
		license_civ_air = false;
	};
	
	
};

//////////////////////
/*
private["_val"];

if(isNil {life_ticket_unit}) exitWith {hint localize "STR_Cop_TicketNil"};
if(isNull life_ticket_unit) exitWith {hint localize "STR_Cop_TicketExist"};
_val = ctrlText 2652;
if(!([_val] call TON_fnc_isnumber)) exitWith {hint localize "STR_Cop_TicketNum"};
if ((parseNumber _val) > 200) exitWith {hint "Sólo puedes restarle 200 de exp en mafia"};

[[0, format ["La policía le ha quitado %1 de exp mafia a %2", _val, name life_ticket_unit]],"life_fnc_broadcast",true,false] call life_fnc_MP;
// [[[life_ticket_unit, _val], "ica\policia\teQuitoExpMafia.sqf"],"BIS_fnc_execVM",true,true] call life_fnc_MP;
[[life_ticket_unit, _val], "ica_fnc_teQuitoExpMafia",true,true] call life_fnc_MP;
closeDialog 0;
