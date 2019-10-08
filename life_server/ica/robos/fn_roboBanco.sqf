
/*
por: Icaruk
	["init"] spawn ica_fnc_roboBanco;
	["init", true] call ica_fnc_roboBanco; // sólo reset
	["encripta", "1234"] call ica_fnc_roboBanco;
	["abrepuerta"] spawn ica_fnc_roboBanco;
	["abrecaja"] spawn ica_fnc_roboBanco;
	["cogedinero"] call ica_fnc_roboBanco;
	
*/

_param = _this select 0;

if (_param isEqualTo "init") exitWith { //sólo server
	_fnc = {
		codigoBanco = [(1000000000000000000000 + (random 8999999999999999999999)), 99] call ica_fnc_numToStr;
		formula = [0, 0, 1, 1];
		formula set [0, 1 + (round random 6)];
		formula set [1, round random 6];
		formula set [2, 1 + (round random 4)];
		formula set [3, 1 + (round random 4)];
	};
	if (!isNil {_this select 1}) exitWith {call _fnc}; // sólo quiero reset

	while {true} do {
		call _fnc;
		sleep (60 * 40);
	};
};

if (_param isEqualTo "formula") exitWith {
	[player, ["formula"]] call ica_fnc_varToServer; waitUntil {recibido};

	_str = format ["La fórmula es ((((x * %1) / %2) + %3) - %4)", formula select 3, formula select 2, formula select 1, formula select 0];
	titleText [_str, "PLAIN"];
	sleep 20;
	titleText [_str, "PLAIN"];
};

if (_param isEqualTo "abrepuerta") exitWith {
	if !({side _x == WEST} count playableUnits > 7) exitWith {hint "Tienen que estar al menos 8 policias conectados, sinó, no es divertido."};

	/*
	banco animate ["frontDoor1", 1];
	banco animate ["frontDoor2", 1];
	*/
	banco animate ["door3", 1];

	0 spawn {
		sleep (60 * 2);
		[[10, "Aviso", [1,0,0], 1.5, "Alguien ha irrumpido en el sistema informático del banco central.", [1,1,1], 1], "ica_fnc_anuncio", WEST, false, false] call life_fnc_MP;
	};

	[10, "Obteniendo clave..."] spawn ica_fnc_barrita;
	sleep 10;

	[player, ["codigoBanco", "formula"]] call ica_fnc_varToServer; waitUntil {recibido};
	_str = format ["El código encriptado es %1", codigoBanco];
	// _str = format ["El código encriptado es %1", ["encripta", codigoBanco] call ica_fnc_roboBanco];
	titleText [_str, "PLAIN"];
	hint "Para desencriptar el código, tienes que ir metiendo los dígitos uno a uno en la fórmula, por ejemplo si la fórmula es ((((x * 1) / 2) + 3) - 2), sustituye en X el último digito del código encriptado y tendras el último dígito del codigo desencriptado";
	sleep 20;
	hint "Para desencriptar el código, tienes que ir metiendo los dígitos uno a uno en la fórmula, por ejemplo si la fórmula es ((((x * 1) / 2) + 3) - 2), sustituye en X el último digito del código encriptado y tendras el último dígito del codigo desencriptado";
	titleText [_str, "PLAIN"];
};

if (_param isEqualTo "abrecaja") exitWith {
	if !(dialog) then {
		disableSerialization;
		createDialog "cajafuerte";
		buttonSetAction [4096, '
			["abrecaja", ctrlText 4097] spawn ica_fnc_roboBanco;
		'];
	} else {
		[player, ["codigoBanco"]] spawn ica_fnc_varToServer; waitUntil {recibido};
		sleep 1;
		if ((_this select 1) != (["encripta", codigoBanco] call ica_fnc_roboBanco)) exitWith {hint "Acceso denegado"};
		if (!dialog) exitWith {};
		closeDialog 0;
		hint "Acceso permitido";
		// banco animate ["portecoffre", 1]; // antiguo
		banco animate ["vaulthandle", 1];
		banco animate ["latch_1", 1];
		banco animate ["latch_2", 1];
		banco animate ["latch_3", 1];
		banco animate ["latch_4", 1];
		banco animate ["vaultdoor", 1];
		cajaBanco setVariable ["bloqueado", nil, true];
	};
};

if (_param isEqualTo "cogedinero") exitWith {
	if ((player distance cajaBanco) > 3) exitWith {hint "No llegas."};
	if ((count (nearestObjects [(getPos cajaBanco), ["Man"], 4])) > 1) exitWith {
		hint "Hay demasiada gente aquí cerca, no puedes abrir la caja.";
	};
	if (!isNil {cajaBanco getVariable "bloqueado"}) exitWith {hint "Lo intentas, pero no se abre"};

	["envio", cajaBanco, 60, 60*20] call ica_fnc_bloqueoDinero;
	_din = 1500000 + round random 500000;
	pop_din = pop_din + _din;
	[format ["+ %1€", _din]] call ica_fnc_infolog;
	cajaBanco setVariable ["bloqueado", true, true];

	["envio", player, 50, 60*20] call ica_fnc_bloqueoDinero;
	["init", true] call ica_fnc_roboBanco;
};

if (_param isEqualTo "encripta") exitWith {
	_n = _this select 1;
	_res = formula select 0;
	_sum = formula select 1;
	_div = formula select 2;
	_mul = formula select 3;

	_idx = 0;
	_arrFin = [];
	_strFin = "";
	_count = count _n;
	while {_idx < _count} do {
		_v = parseNumber (_n select [_idx, 1]);

		_v = (((_v * _mul) / _div) + _sum) - _res;
		_v = if (_v > 9) then {9} else {_v};
		_v = if (_v < 0) then {0} else {_v};
		_v = round _v;

		_arrFin pushBack _v;
		_strFin = _strFin + str _v;

		_idx = _idx + 1;
	};
	_strFin
};




