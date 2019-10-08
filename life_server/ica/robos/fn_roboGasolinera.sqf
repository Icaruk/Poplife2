
/*
Robo de gasolinera por Icaruk
	se invoca con:
		["init"] spawn ica_fnc_roboGasolinera // para robar
		["pregunto"] spawn ica_fnc_roboGasolinera // para preguntar
*/

_param = _this select 0;

if (_param isEqualTo "init") exitWith {

	private ["_t", "_cagada"];

	if (side player == WEST) exitWith {hint "Puto policía corrupto, ¡se lo voy a decir a todo el mundo!"}; // eres poli
	if ((primaryWeapon player == "") AND (handgunWeapon player == "")) exitWith {hint "¿Qué quieres tú? ¡Parguela!"}; // eres tonto
	if (!isNil {manolo getVariable "jodido"}) exitWith {hint "A Manolo ya le han jodido hace poco"}; // existe la var, te esperas
	if (({side _x == WEST} count playableUnits < 3) AND !(call ica_fnc_editando)) exitWith {hint "Tienen que estar al menos 2 policias conectados, sino, no es divertido."};

	if (isNil {manolo getVariable "jodido"}) then { // no existe la var, la pongo
		manolo setVariable ["jodido", true, true];
	};

	titleText ["No dejes de apuntar a Manolo para que no avise a la policía", "PLAIN", 0.5];
	player reveal manolo;
	sleep 3;

	_t = 60;
	while {true} do {
		if (cursortarget != Manolo) exitWith {_cagada = true};
		if ((player distance Manolo) > 4) exitWith {_cagada = true};
		if ((primaryWeapon player == "") AND (handgunWeapon player == "")) exitWith {_cagada = true};
		if (_t <= 0) exitWith {};

		sleep 1;
		_t = _t - 1;
		hintSilent format ["Manolo necesita %1 segundos más para abrir la caja", _t];
	};

	if (!isNil {_cagada}) then {
		hint format ["¡La has cagado! \nLa policía está en camino."];
		[[10, "Aviso", [1,0,0], 1.5, "Estan atracando la gasolinera de Manolo", [1,1,1], 1], "ica_fnc_anuncio", WEST, false, false] call life_fnc_MP;

		[] spawn {
			sleep 60;
			manolo setVariable ["jodido", nil, true];
		};
	} else {
		_din = 20000 + (floor (random 20000));
		pop_din = pop_din + _din;
		["envio", player, 50, 60*20] call ica_fnc_bloqueoDinero;

		hint format ["Has robado %1€, puto amo", _din];
		[[10, "Aviso", [1,0,0], 1.5, "Estan atracando la gasolinera de Manolo", [1,1,1], 1], "ica_fnc_anuncio", WEST, false, false] call life_fnc_MP;

		manolo setVariable ["jodido", name player, true];

		[] spawn {
			sleep (60 * 15);
			manolo setVariable ["jodido", nil, true];
		};
	};
};

if (_param isEqualTo "pregunto") exitWith {
	_asd = manolo getVariable "jodido";

	if (side player == CIVILIAN) exitWith {hint "Sólo un miembro oficial puede analizar la zona"};
	hint "Analizando la zona...";
	sleep 4;

	if (isNil {_asd}) exitWith {hint "No hay rastro de nada"};
	if (typeName _asd == "BOOL") exitWith {hint "No hay rastro de nada"};

	hint format ["Los análisis han dado positivo: \n\nSe han encontrado fibras, sangre o fluídos de un tal %1.", manolo getVariable "jodido"];
};



