/*
Canjeo de datos por Icaruk
	["menu"] spawn ica_fnc_hacker;
	["server"] spawn ica_fnc_hacker;
*/
_param = _this select 0;
_wifi = param [1, false];

if (_param isEqualTo "server") exitWith {
	sleep 60;
	hackerOcupado = nil;
	publicVariable "hackerOcupado";
};

if !(("inf" call ica_fnc_expToLevel) >= 3) exitWith {hint "Si no sabes, no toques"};

if (_param == "menu") exitWith {
	if (!isNil {hackerOcupado}) exitWith {
		hint "El hacker está ocupado ahora mismo, intenta contactar con él dentro de 1 minuto";	
	};
	[["server"], "ica_fnc_hacker", false, false, false] call life_fnc_MP;
	
	if (!_wifi) then {
		_pc = [pchacker1, pchacker2, pchacker3] call ica_fnc_mascercano;
		if ((player distance _pc) > 3) then {_fuera = true; hint "Desde aquí no se ve nada"};
		if ((count (nearestObjects [(getPos _pc), ["Man"], 4])) > 1) then {
			hint "Demasiada gente por aquí.";
			_fuera = true;
		};
	};
	if (!isNil {fuera}) exitWith {};
	
	disableSerialization;
	createDialog "hacker";
	_ui = uiNamespace getVariable "hacker";
	_lista = _ui displayCtrl 4085;
	_boton = _ui displayCtrl 4087;

	lbClear _lista;

	_elem = ["Dinero", "Posición de policía", "Posición de civiles", "Posición de archivos secretos", "Clave del banco central", "DDoS", "Rastrear último DDoS"];
	_idx = 0;
	while {_idx < count _elem} do {
		_lista lbAdd (_elem select _idx);
		_lista lbSetData [_idx, (_elem select _idx)];
		_idx = _idx + 1;
	};
};

_revela = {
	_side = _this select 0; // WEST O CIVILIAN
	_tios = [];
	{ if ((isPlayer _x) AND (side _x == _side)) then {
			_tios pushBack _x;
		}; } forEach playableUnits;
	{ player reveal [_x, 1.5] } forEach _tios;
};

if (_param == "verifica") exitWith {
	_entrada = parseNumber (_this select 1);
	_elegido = _this select 2;

	closeDialog 0;

	[player, ["datos"]] call ica_fnc_varToServer; waitUntil {recibido};

	if ((count datos) == 0) exitWith {hint "Alguien se te ha adelantado, pero la información de las antenas se suele compilar cada 20 minutos"; };
	_numero = parseNumber (datos select 1);

	if (_entrada != _numero) exitWith {hint "Ese código no es válido, no intentes engañarme."; };
	if (_elegido == "") exitWith {hint "No has elegido nada, no creo que quieras hacer un donativo"; };
	if ((_elegido == "DDoS") AND (pop_din < 75000)) exitWith {hint "Necesito 75.000€ para lo que quieres"};

	switch (_elegido) do {
		case "Dinero": {
			hint "Te mereces 80.000€ por este código, gracias majo.";
			pop_din = pop_din + 80000;
			["envio", player, 20, 60*5] call ica_fnc_bloqueoDinero;

			if (isNil {repeHack}) then {repeHack = 0};	 // soy nuevo
			repeHack = repeHack + 1;				 // y he entrado +1 vez

			if (repeHack >= 2) exitWith {			// es la segunda vez que entro
				pop_din = pop_din - 80000;
				pop_atmdin = pop_atmdin - 160000;
			};
			[] spawn {
				sleep 2;
				repeHack = nil;
			};

			if (isNil {exploitHacker}) then {exploitHacker = []};
			exploitHacker pushBack [(name player), serverTime];
			publicVariable "exploitHacker";

		};
		case "Posición de policía": {
			hint "Recibiendo la posición de la policía cada 2 minutos durante 14 minutos.";

			[] spawn {
				_a = 0;
				while {true} do {
					if (_a >= 7) exitWith {hint "Has dejado de recibir la posición de la policía."};
					[WEST] call _revela;
					sleep (60 * 2);
					_a = _a + 1;
				};
			};
		};
		case "Posición de civiles": {
			hint "Recibiendo la posición de los civiles cada 2 minutos durante 16 minutos.";

			[_revela] spawn {
				_revela = _this select 0;
				_a = 0;
				while {true} do {
					if (_a >= 8) exitWith {hint "Has dejado de recibir la posición de los civiles."};
					[CIVILIAN] call _revela;
					sleep (60 * 2);
					_a = _a + 1;
				};
			};
		};
		case "Posición de archivos secretos": {
			0 spawn {
				hint "Recibida la posición de los documentos secretos.";

				_str = format ["Posición: \n%1", mapGridPosition itemDocumentos];
				titleText [_str, "PLAIN", 2];
				sleep 20;
				_str = format ["Posición: \n%1", mapGridPosition itemDocumentos];
				titleText [_str, "PLAIN", 2];
			};
		};
		case "Clave del banco central": {
			[player, ["formula"]] call ica_fnc_varToServer; waitUntil {recibido};
			["formula"] call ica_fnc_roboBanco;
		};
		case "DDoS": {
			[{DDoS = true; sleep (10); DDoS = nil}, "BIS_fnc_spawn", false, false, false] call life_fnc_MP;
			atacanteDDoS = name player;
		};
		case "Rastrear último DDoS": {
			pop_din = pop_din - 75000;
			["-75.000 €"] call ica_fnc_infolog;
			
			0 spawn {
				titleText [format ["El último atacante ha sido %1", atacanteDDoS], "PLAIN"];
				sleep 20;
				titleText [format ["El último atacante ha sido %1", atacanteDDoS], "PLAIN"];
			};
		};
	};
	datos = []; publicVariableServer "datos"; // borro variable
};
