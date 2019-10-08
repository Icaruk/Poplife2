
/*
Robo al concesionario por Icaruk
	["init"] spawn ica_fnc_roboConcesionario
	["entrego"] spawn ica_fnc_roboConcesionario
*/

_param = _this select 0;
_class = "pop_ferrari_enzo_rojo";

if (_param isEqualTo "init") exitWith { // sólo servidor
	
	fnc_concesionario = { // fnc para crear veh
		
		private "_veh";
		_pos = [[8649.51,6557.92,21.0025], [8649.51,6557.92,21.0025]] call BIS_fnc_selectRandom;
		_veh = _class createVehicle _pos;
		vehConcesionario = _veh; // futura referencia
		publicVariable "vehConcesionario";
		
		_veh setDir 273;
		_veh setVariable ["robable", true, true];
		_veh lock true;
		_veh setFuel 0.33;
	};

	sleep 60;
	call fnc_concesionario;
	
	while {true} do {
		if (isNil {vehConcesionario}) then {
			call fnc_concesionario;
		};
		
		sleep (60 * 30);
	};
};

if (_param isEqualTo "robo") exitWith {
	
	if ({side _x == WEST} count playableUnits < 4) exitWith {hint "Tienen que estar al menos 3 policias conectados, sinó, no es divertido."};
	
	private "_veh";
	_veh = (nearestObjects [player, [_class], 4]) select 0;
	if (isNil {_veh}) exitWith {hint "Estás demasiado lejos"};
	if (isNil {_veh getVariable "robable"}) exitWith {};
	
	["menu", 0.92, "concesionario"] call ica_fnc_ganzua;
};

if (_param isEqualTo "entrego") exitWith {
	
	private "_veh";
	if ((player distance carshop1_1_1_2) > 3) exitWith {hint "¡Psssst, acércate + loko!"; };
	if ((count (nearestObjects [getPos carshop1_1_1_2, ["Man"], 4])) > 1) exitWith {
		hint "Ye loko aquí no kiero mobidas, tieneh ke estar tú sólo para negociá conmigo.";
	};	
	
	_veh = (nearestObjects [player, [_class], 4]) select 0;
	if (isNil {_veh}) exitWith {hint "Estás demasiado lejos o no hay  ningún vehículo"};
	
	if ((_veh getVariable "robable") == 1) then {
		deleteVehicle _veh;
		
		_din = 80001;
		hint format ["K wapo loko, ls alerones tan to wapos con esto me boy a barraka en cerocoma. \n\nAkí tiens tu parte: %1€", _din];
		pop_din = pop_din + _din;
		["envio", player, 50, 60*20] call ica_fnc_bloqueoDinero;
		vehConcesionario = nil;
		publicVariable "vehConcesionario";
	} else {
		hint "Balla mierda de koxe loko";
	};
	
};



