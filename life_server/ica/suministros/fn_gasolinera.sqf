/*
Gasolinera por Icaruk
	["menu"] spawn ica_fnc_gasolinera;
*/

_param = _this select 0;

disableSerialization;
if (_param == "menu") exitWith {
	if (!isNil {ocupado}) exitWith {hint "No spamees tanto"};
	[] spawn {
		ocupado = true;
		sleep 2;
		ocupado = nil;
	};

	_veh = ((nearestObjects [player, ["Car"], 15]) select 0);
	if (isNil {_veh}) then {_veh = ((nearestObjects [player, ["Air"], 15]) select 0)};
	if (isNil {_veh}) exitWith {hint "No hay ningún vehículo cerca"; closeDialog 0};
	
	[player, ["alm1Com", "alm2Com"]] call ica_fnc_varToServer; waitUntil {recibido};
	
	createDialog "gasolinera";
	_ui = uiNamespace getVariable "gasolinera";
	_entada = (_ui displayCtrl 5014);
	_tengo = (_ui displayCtrl 5015);
	// _entrada ctrlSetEventHandler ["Char", "['actualiza'] call ica_fnc_gasolinera; "]; // bug ultimo char
	
	_tengo ctrlSetText format ["Combustible actual: %1%2", round ((fuel _veh) * 100), "%"];
	
	0 spawn {
		while {!isNil {uiNamespace getVariable "gasolinera"}} do {
			["actualiza"] call ica_fnc_gasolinera;
			sleep 0.5;
		};
	};
};


if (_param == "actualiza") exitWith {
	_ui = uiNamespace getVariable "gasolinera";
	_boton = (_ui displayCtrl 5012);
	_txtprecio = (_ui displayCtrl 5013);

	entrada = parseNumber ctrlText 5014;
	
	_precio = round ((call ica_fnc_precioCombustible) * entrada);
	_txtprecio ctrlSetText format ["Precio: %1€", _precio];
	
	_boton buttonSetAction '
		["llena", entrada] spawn ica_fnc_gasolinera;
	';
};

if (_param == "llena") exitWith {
	_com = _this select 1;
	if (_com < 0) exitWith {hint "Escribe un numero mayor que 0"};
	if (_com > 100) exitWith {hint "Escribe un número menor que 100"; };
	if (_com == 0) exitWith {hint "De acuerdo, quieres 0 de combustible. Ahí lo tienes, buen viaje"; };
	
	_veh = ((nearestObjects [player, ["Car"], 15]) select 0);
	if (isNil {_veh}) then {_veh = ((nearestObjects [player, ["Air"], 15]) select 0)};
	if (isNil {_veh}) exitWith {hint "No hay ningún vehículo cerca"; closeDialog 0};
	_pos = getPos _veh;
	
	_precio = round ((call ica_fnc_precioCombustible) * entrada);
	if !(pop_din >= _precio) exitWith {hint "No tienes suficiente dinero"; closeDialog 0; };
	["comercios", _precio] spawn ica_fnc_subeBajaBeneficios;
	pop_din = pop_din - _precio;
	[format ["-%1 €", _precio]] call ica_fnc_infolog;
	
	closeDialog 0;
	
	_can = round (entrada / 2);
	_cerca = ["mrkalmacen1", "mrkalmacen2"] call ica_fnc_masCercano;
	_var = if (_cerca == "mrkAlmacen1") then {"alm1Com"} else {"alm2Com"};
	
	missionNamespace setVariable [_var, (missionNamespace getVariable _var) + _can];
	if ((missionNamespace getVariable _var) > 1000) then {missionNamespace setVariable [_var, 1000]};
	publicVariableServer _var;
	
	hint "Repostando...";
	_t = round (_com / 8);
	[_t, "Repostando..."] spawn ica_fnc_barrita;
	sleep _t;
	
	if ((_veh distance _pos) > 10) exitWith {hint format ["Te has ido mientras repostabas y se ha derramado todo... \nNo se aceptan devoluciones."]; closeDialog 0; };
	_veh setFuel ((fuel _veh) + (_com / 100));
	hint "Todo listo, buen viaje :D";
	closeDialog 0;
};