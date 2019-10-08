
/*
por: Icaruk
	["menu"] call ica_fnc_daDinero;
	["doy", quien, can] call ica_fnc_daDinero;
	["recibo", quien, can, de] call ica_fnc_daDinero;
*/

_param = _this select 0;

if (_param isEqualTo "menu") exitWith {
	disableSerialization;
	createDialog "daDinero";

	_ui = uiNamespace getVariable "daDinero";
	_entrada = _ui displayCtrl 7070;
	_desplegable = _ui displayCtrl 7071;
	_boton = _ui displayCtrl 7072;

	_entrada ctrlSetEventHandler ["Char", "
		_ui = uiNamespace getVariable ""daDinero"";
		_boton = _ui displayCtrl 7072;
		_boton buttonSetAction ""
			['doy', lbData [7071, (lbCurSel 7071)], ctrlText 7070] call ica_fnc_daDinero;
		"";
	"];
	_desplegable ctrlSetEventHandler ["LBSelChanged", "
		_ui = uiNamespace getVariable ""daDinero"";
		_boton = _ui displayCtrl 7072;
		_boton buttonSetAction ""
			['doy', lbData [7071, (lbCurSel 7071)], ctrlText 7070] call ica_fnc_daDinero;
		"";
	"];

	_cercanos = [];
	{ if(player distance _x < 2) then {_cercanos pushBack _x};} foreach playableUnits;
	{
		if (!isNull _x AND alive _x AND player distance _x < 2 AND _x != player) then {
			_desplegable lbAdd format ["%1 - %2", _x getVariable ["realname", name _x], side _x];
			_desplegable lbSetData [(lbSize _desplegable) -1, str (_x)];
		};
	} foreach _cercanos;
};

if (_param isEqualTo "doy") exitWith {
	if (isNil {pop_din}) exitWith {};
	if (!isNil {profileNamespace getVariable "dineroBloqueado"}) exitWith {
		hint "Hace poco que has cometido un crimen, no es plan de dejar huellas de varias personas en los billetes. Puedes esperar a que se calmen las cosas, o bien, blanquear el dinero.";
	};

	private ["_quien", "_can"];
	_quien = if ((typeName (_this select 1)) == "STRING") then {call compile format ["%1", _this select 1]} else {_this select 1};
	if ((lbCurSel 7071) == -1) exitWith {hint "No has seleccionado a nadie"};
	if ((isNil {_quien}) OR (isNull _quien)) exitWith {hint "No has seleccionado a nadie"};
	if (_quien == player) exitWith {hint "Has intentado darte dinero a tí mismo, y se te ha metido un billete en el ojo. Del culo."; player setDamage 0.9};

	_can = parseNumber (_this select 2);

	if ((typeName _can) != "SCALAR") exitWith {hint "Eso no es un número"};
	if (_can < 0) exitWith {};
	if (_can == 0) exitWith {hint "Pretendes dar 0€, pareces inteligente."};
	if (_can > 999999) exitWith {hint "Lo máximo que puedes enviar son 999.999€"};
	if (_can > pop_din) exitWith {hint "No tienes tanto dinero"};

	[format ["DADINERO ----- %1 (%2) le ha dado %3 a %4", name player, getPlayerUID player, name _quien, _can], "diag_log", false, false, false] call BIS_fnc_MP;
	
	pop_din = pop_din - _can;
	[0] call SOCK_fnc_updatePartial;
	[["recibo", _can, player], "ica_fnc_daDinero", _quien, false, false] call life_fnc_MP;
	call ica_fnc_actualizaHUD;
	hint format ["Le has dado %1€ a %2", _can, _quien getVariable ["realname", name _quien]];
};

if (_param isEqualTo "recibo") exitWith {
	_can = _this select 1;
	_de = _this select 2;

	hint format ["Has recibido %1€ de %2", _can, _de getVariable ["realname", name _de]];
	pop_din = pop_din + _can;
};