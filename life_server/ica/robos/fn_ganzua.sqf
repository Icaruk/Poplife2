
/*
Sistema de ganzuado por Icaruk
	["menu", 0.9, "concesionario"] spawn ica_fnc_ganzua
	
	0 = test
	0.9 = fácil
	0.92 = medio
	0.94 = dificil
	0.96 = muy dificil
	0.99 = imposible
	
*/
// onMouseButtonDown = " hint format ['%1 \n %2 \n %3 \n %4 \n %5 \n %6', _this select 0, _this select 1, _this select 2, _this select 3, _this select 4, _this select 5]; "

_param = _this select 0;

if (_param isEqualTo "menu") exitWith {
	if !((["pop_ganzua"] call ica_fnc_tengo) >= 1) exitWith {hint "Necesitas una ganzúa"};
	
	private "_dificultad";
	
	_dificultad = param [1, 0.9];
	if (_dificultad < 0.9) then {_dificultad = 0.9};
	if (_dificultad > 0.99) then {_dificultad = 0.99};
	player playMoveNow "CL3_anim_lockpick";
	
	disableSerialization;
	createDialog "ganzua";
	
	// tipo de robo
	ganzuando = param [2, nil];
	param3 = param [3, nil];
	
	
	pernos = [_dificultad];
	for "_x" from 1 to 6 do {
		pernos pushBack (random 10);
	};
};


// declaro dialogs
disableSerialization;
_ui = uiNamespace getVariable "ganzua";
_barrita = _ui displayCtrl 5082;
_p1 = _ui displayCtrl 5070;
_p2 = _ui displayCtrl 5071;
_p3 = _ui displayCtrl 5072;
_p4 = _ui displayCtrl 5073;
_p5 = _ui displayCtrl 5074;
_p6 = _ui displayCtrl 5075;
_slider1 = _ui displayCtrl 5076;
_slider2 = _ui displayCtrl 5077;
_slider3 = _ui displayCtrl 5078;
_slider4 = _ui displayCtrl 5079;
_slider5 = _ui displayCtrl 5080;
_slider6 = _ui displayCtrl 5081;


if ((typeName _param) == "SCALAR") exitWith {
	_dificultad = _this select 1;
	
	// if !(ctrlShown _barrita) then {_barrita ctrlShow true};
	_barrita ctrlShow true;
	
	// recibo num de sliders
	_s1 = _this select 0;
	_s2 = _this select 1;
	_s3 = _this select 2;
	_s4 = _this select 3;
	_s5 = _this select 4;
	_s6 = _this select 5;
	
	// coloco pernos
	_p1 progressSetPosition (_s1 / 10);
	_p2 progressSetPosition (_s2 / 10);
	_p3 progressSetPosition (_s3 / 10);
	_p4 progressSetPosition (_s4 / 10);
	_p5 progressSetPosition (_s5 / 10);
	_p6 progressSetPosition (_s6 / 10);
	
	_acierto = 0;
	_acierto = _acierto + ([((pernos select 1) - _s1)] call ica_fnc_negToPos);
	_acierto = _acierto + ([((pernos select 2) - _s2)] call ica_fnc_negToPos);
	_acierto = _acierto + ([((pernos select 3) - _s3)] call ica_fnc_negToPos);
	_acierto = _acierto + ([((pernos select 4) - _s4)] call ica_fnc_negToPos);
	_acierto = _acierto + ([((pernos select 5) - _s5)] call ica_fnc_negToPos);
	_acierto = _acierto + ([((pernos select 6) - _s6)] call ica_fnc_negToPos);

	_acierto = 1 - (_acierto / 60);
	

	[] spawn {
		if (!dialog) exitWith {};
		
		// declaro dialogs
		disableSerialization;
		_ui = uiNamespace getVariable "ganzua";
		_barrita = _ui displayCtrl 5082;
		_p1 = _ui displayCtrl 5070;
		_p2 = _ui displayCtrl 5071;
		_p3 = _ui displayCtrl 5072;
		_p4 = _ui displayCtrl 5073;
		_p5 = _ui displayCtrl 5074;
		_p6 = _ui displayCtrl 5075;
		_slider1 = _ui displayCtrl 5076;
		_slider2 = _ui displayCtrl 5077;
		_slider3 = _ui displayCtrl 5078;
		_slider4 = _ui displayCtrl 5079;
		_slider5 = _ui displayCtrl 5080;
		_slider6 = _ui displayCtrl 5081;	
	
		
		if ((pernos select 0) >= 0.9) then {
			
			if (isNil {loop}) then {
				loop = true;
				
				while {true} do {
					if (isNil {pernos}) exitWith {};
					if (((pernos select 0) >= 0.92) AND ((pernos select 0) < 0.99)) then { // fácil hasta imposible
						{_x progressSetPosition ((progressPosition _x) - 0.01)	} forEach [_p1, _p2, _p3, _p4, _p5, _p6];
						{sliderSetRange [_x, 0, 10]	} forEach [5076, 5077, 5078, 5079, 5080, 5081];
						{sliderSetPosition [_x, ((sliderPosition _x) - 0.1)]	} forEach [5076, 5077, 5078, 5079, 5080, 5081];
					};
					
					sleep 8;
				};
			};
		};
	};
	
	if (((pernos select 0) >= 0.94) AND ((pernos select 0) < 0.96)) then { // dificil
		[_barrita] spawn {
			disableSerialization;
			_barrita = _this select 0;
			sleep 2;
			if (ctrlShown _barrita) then {_barrita ctrlShow false};
		};
	};
	
	if (((pernos select 0) >= 0.96) AND ((pernos select 0) < 0.99)) then { // muy dificil
		[_barrita] spawn {
			disableSerialization;
			_barrita = _this select 0;
			sleep 1;
			if (ctrlShown _barrita) then {_barrita ctrlShow false};
		};
	};
	if ((pernos select 0) >= 0.99) then { // imposible
		[_barrita] spawn {
			disableSerialization;
			_barrita = _this select 0;
			sleep 0.5;
			if (ctrlShown _barrita) then {_barrita ctrlShow false};
		};		
		
		{_x progressSetPosition ((progressPosition _x) - 0.01)	} forEach [_p1, _p2, _p3, _p4, _p5, _p6];
		{sliderSetRange [_x, 0, 10]	} forEach [5076, 5077, 5078, 5079, 5080, 5081];
		{sliderSetPosition [_x, 0]	} forEach [5076, 5077, 5078, 5079, 5080, 5081];		
	};	
	
	_barrita progressSetPosition _acierto;
	_objetivo = if ((pernos select 0) > 0.94) then {0.90} else {pernos select 0}; // si no, es muy jodido
	if (_acierto >= _objetivo) then {
		closeDialog 0;
		titleText ["Has abierto la cerradura", "PLAIN", 0.4];
		
		switch (ganzuando) do {
			case "veh": {
				_veh = param3;
				life_vehicles pushBack _veh;
				[[getPlayerUID player,profileName,"487"],"life_fnc_wantedAdd",false,false] call life_fnc_MP;
			};
			case "cas": {
				_veh = param3;
				life_vehicles pushBack _veh;
				[[getPlayerUID player,profileName,"459"],"life_fnc_wantedAdd",false,false] call life_fnc_MP;
				_uidpropietario = (_veh getVariable "house_owner") select 0;
				_nombrepropietario = (_veh getVariable "house_owner") select 1;
				sleep 15;
				[[10, "Securitas Direct Informa", [1,0,0], 1.5, "Su casa esta siendo robada", [1,1,1], 1], "ica_fnc_anuncio", _uidpropietario, false, false] call life_fnc_MP;
				[[10, "Securitas Direct Informa", [1,0,0], 1.5, format["La casa de %1 esta siendo robada",_nombrepropietario], [1,1,1], 1], "ica_fnc_anuncio", WEST, false, false] call life_fnc_MP;
			};
			case "concesionario": {
				ganzuando = nil;
				_veh = (nearestObjects [player, ["pop_ferrari_enzo_rojo"], 4]) select 0;
				_veh lock 0;
				_veh setVariable ["robable", 1, true]; // indicador de que es vendible
			};
			case contenedores1: {
				contenedores1 animate ["door1", 1];
			};
			case contenedores2: {
				contenedores2 animate ["door1", 1];
			};
			case contenedores3: {
				contenedores3 animate ["door1", 1];
			};
			case "joyeria": {
				hint "Tienes 2 minutos hasta que se cierren las puertas";
				[["serverNoche"], "ica_fnc_roboJoyeria", false, false, false] call life_fnc_MP;
			};
			case carcel: {
				carcel animate ["animateaircon1", 1];
			};
			case "banco": {
				["abrepuerta"] spawn ica_fnc_roboBanco;
			};
		};
		
	};
	
	_rnd = round random 100; // 3% de cerrar el menú
	if (_rnd <= 3) exitWith {
		closeDialog 0;
		titleText ["Se ha roto la ganzúa", "PLAIN", 0.4];
		["pop_ganzua", -1] call ica_fnc_item;
	};
	
	/*
	// hint format ["%1 y %2", _acierto, pernos select 0];
	hint format ['
		%1 \n
		%2 \n
		%3 \n
		%4 \n
		%5 \n
		%6 \n
		%7\n\n\n
		%8',
	_s1, _s2, _s3, _s4, _s5, _s6, _acierto, pernos];
	*/
};