
/*
por: Icaruk
	["init"] spawn ica_fnc_roboJoyeria;
	["robo"] spawn ica_fnc_roboJoyeria;
	["serverDia"] spawn ica_fnc_roboJoyeria;
	["pregunto"] spawn ica_fnc_roboJoyeria;
*/

_param = _this select 0;

_centro = getPos joyeria;
_cajas = nearestObjects [_centro, ["POP_cajaDiamantes_obj"], 15];

if (_param isEqualTo "init") exitWith {
	_resetJoyeria = {
		{clearItemCargoGlobal _x; _x setVariable ["bloqueado", true, true]} forEach _cajas;

		for "_x" from 1 to (count _cajas) do {
			(_cajas call BIS_fnc_selectRandom) addItemCargoGlobal ["pop_diamante", round (random 3)];
		};
	};
	sleep (60 * 20);
	call _resetJoyeria;

	while {true} do {
		sleep (60 * 90);
		call _resetJoyeria;
	};
};

if (_param isEqualTo "roboDia") exitWith {
	if (side player == WEST) exitWith {
		if ((joyeria animationPhase "frontDoor1") >= 1) then {
			joyeria animate ["frontdoor1", 0];
			joyeria animate ["frontdoor2", 0];
			{_x setVariable ["bloqueado", true, true]} forEach _cajas;
		} else {
			if !({side _x == WEST} count playableUnits >= 8) exitWith {hint "Tienen que estar al menos 8 policias conectados, sinó, no es divertido."};
			joyeria animate ["frontdoor1", 1];
			joyeria animate ["frontdoor2", 1];
		};
	};

	if (((date select 3) >= 20) AND ((date select 3) < 5)) exitWith {hint "Robar la joyería por la noche requiere otros métodos."};

	if ((["pop_c4"] call ica_fnc_tengo) == 0) exitWith {hint "Necesitas una bomba C4-OP."};
	["pop_c4", -1] call ica_fnc_item;
	["- C4-OP"] call ica_fnc_infolog;
	player allowdamage false;

	huellasJoyeria = [name player];
	publicVariableServer "huellasJoyeria";

	[["serverDia"], "ica_fnc_roboJoyeria", false, false, false] call life_fnc_MP;

	_temporizador = 120;
	_temporizador = 10;
	while {true} do {
		if (_temporizador <= 0) exitWith {hint "Boom";};
		_temporizador = _temporizador - 1;
		hint format ["Explosión en %1 segundos.", _temporizador];

		sleep 1;
	};
};
if (_param isEqualTo "roboNoche") exitWith {
	if (((date select 3) >= 5) AND ((date select 3) < 20)) exitWith {hint "Robar la joyería de día requiere otros métodos."};
	["menu", 0.94, "joyeria"] spawn ica_fnc_ganzua;
};

if (_param isEqualTo "serverDia") exitWith {
	0 spawn {sleep (60*30); huellasJoyeria = nil}; // se borran las huellas en 30min

	_itemBomba = "pop_c4_obj" createVehicle (getPos joyeria);
	_itemBomba attachTo [joyeria, [-0.7,9.67,1.5]];
	detach _ItemBomba;
	[_itemBomba, 0, 90] call bis_fnc_setPitchBank;

	_temporizador = 120;
	while {true} do {
		if (_temporizador <= 0) exitWith {};
		_temporizador = _temporizador - 1;
		sleep 1;
	};

	_bomba = "M_Mo_82mm_AT_LG" createVehicle (getPos _itemBomba);
	deleteVehicle _itemBomba;

	hint "Tienes 3 minutos hasta que se cierren las puertas";
	[[10, "Aviso", [1,0,0], 1.5, "Están atracando la joyería", [1,1,1], 1], "ica_fnc_anuncio", WEST, false, false] call life_fnc_MP;

	joyeria animate ["frontdoor1", 1];
	joyeria animate ["frontdoor2", 1];
	{_x setVariable ["bloqueado", nil, true]} forEach _cajas;
	sleep 180;
	joyeria animate ["frontdoor1", 0];
	joyeria animate ["frontdoor2", 0];
};

if (_param isEqualTo "serverNoche") exitWith {
	joyeria animate ["frontdoor1", 1];
	joyeria animate ["frontdoor2", 1];

	_t = 120;
	while {true} do {
		if (_t <= 0) exitWith {
			joyeria animate ["frontdoor1", 0];
			joyeria animate ["frontdoor2", 0];
			{_x setVariable ["bloqueado", nil, true]} forEach _cajas;
			[[10, "Aviso", [1,0,0], 1.5, "Están atracando la joyería", [1,1,1], 1], "ica_fnc_anuncio", WEST, false, false] call life_fnc_MP;
		};

		_ladron = nearestObjects [joyeria, ["Man"], 11];

		_cagada = false;
		if ((count _ladron) > 1) then {_cagada = true};
		if ((stance (_ladron select 0)) != "PRONE") then {_cagada = true};

		if (_cagada) exitWith {
			[[10, "Aviso", [1,0,0], 1.5, "Están atracando la joyería", [1,1,1], 1], "ica_fnc_anuncio", WEST, false, false] call life_fnc_MP;
			_t spawn {
				_t = _this;
				while {true} do {
					if (_t <= 0) exitWith {
						joyeria animate ["frontdoor1", 0];
						joyeria animate ["frontdoor2", 0];
					};
					_t = _t - 1;
					sleep 1;
				};
			};
		};

		_t = _t - 1;
		sleep 1;
	};

	[[10, "Aviso", [1,0,0], 1.5, "Están atracando la joyería", [1,1,1], 1], "ica_fnc_anuncio", CIVILIAN, false, false] call life_fnc_MP;
};

if (_param isEqualTo "pregunto") exitWith {
	if (!isNil {spam}) exitWith {
		spam = spam + 15;
		closeDialog 0;
		hint format ["Tienes que esperar %1 segundos", spam];
		sleep 3;
		hint "";
	};
	0 spawn {
		if (isNil {spam}) then {
			spam = 15;

			while {true} do {
				if (spam <= 0) exitWith {spam = nil };
				spam = spam - 1;
				sleep 1;
			};
		};
	};
	
	if (side player != INDEPENDENT) exitWith {hint "No eres médico"};
	if ((player distance joyeria) > 5) exitWith {hint "Tienes que estar más en el centro del local"};

	[player, ["huellasJoyeria"]] call ica_fnc_varToServer; waitUntil {recibido};

	if (isNil {huellasJoyeria}) then {
		hint "Investigando...";
		sleep 2;
		hint "Parece que no hay huellas";
	} else {
		hint "Investigando...";
		sleep 2;
		hint "Tomando huellas...";
		sleep 3;
		hint "Contrastando con la base de datos...";
		sleep 2;
		hint format ["Hay huellas que parecen ser de %1.", huellasJoyeria];
	};
};

