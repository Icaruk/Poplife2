
/*
Sacar dinero público para que lo use la policía por Icaruk
	["consultar"] spawn ica_fnc_sacoDineroPublico;
	[20000] spawn ica_fnc_sacoDineroPublico;
*/

_param = _this select 0;



if (_param == "consultar") exitWith {
	if (side player != WEST) exitWith {hint "No eres policía"};
	// añadir comprobacion de rango

	[player, ["fondosPublicos"]] call ica_fnc_varToServer; waitUntil {recibido};

	disableSerialization;
	createDialog "sacoDineroPublico";
	_ui = uiNameSpace getVariable "sacoDineroPublico";
	_txt = _ui displayCtrl 5053;
	_txt ctrlSetText format ["Fondos públicos: %1€", fondosPublicos];
};

if (_param != "consultar") exitWith {
	[player, ["fondosPublicos"]] call ica_fnc_varToServer; waitUntil {recibido};

	_entrada = parseNumber (_this select 0);
	if ((_entrada <= 0) OR (isNil {_entrada})) exitWith {hint "Si no quieres sacar nada, ¿para qué abres este menú?" };
	if (_entrada >= 999999) exitWith {hint "No puedes sacar más de 999.999€ a la vez" };
	if (_entrada > fondosPublicos) exitWith {"No hay tanto dinero" };

	closeDialog 0;
	fondosPublicos = fondosPublicos - _entrada;
	publicVariableServer "fondosPublicos";
	pop_din = pop_din + _entrada;

	hint format ["Has sacado %1€ de los fondos públicos", _entrada];

	[[0, format ["La policía ha sacado %1€ de los fondos públicos", _entrada]],"life_fnc_broadcast",true,false] call life_fnc_MP;
	diag_log format ["La policía ha sacado %1€ de los fondos públicos", _entrada];
};