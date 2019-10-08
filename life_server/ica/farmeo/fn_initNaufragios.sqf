/*
// La "caja" es Land_PlasticCase_01_small_F en la pestaña "Objects (Containers)"
// Los naufragios está en la Pestaña "Wreck (submerged)"
	// Land_Wreck_Traw_F
	caja attachTo [a, [4,-9,-4.1]]; 		// en cabina parte de atrás
	caja attachTo [a, [5.7,-9,-3.6]]; 		// cabina derecha parte de atrás
	caja attachTo [a, [1.4,2.7,4.7]];      //agujero superior
	caja attachTo [a, [-4,-0.5,2.9]];     // Antena 
	caja attachTo [a, [-1,-4,-3]]  		// parte de abajo pasillo
	// Land_Wreck_Traw2_F
	caja attachTo [b, [1.2,-5,-3.9]];  // Parte de Atras Abajo
	caja attachTo [b, [3,-5,2]]; 	// parte de atras arriba
	caja attachTo [b, [-4,-1.5,-2.6]]; // Escalera Abajo
	caja attachTo [b, [0.3,5,-4.2]]; // Atras izquierda 
	caja attachTo [b, [6,6.5,-4.2]]; // atras 

	// Land_UWreck_MV22_F
	caja attachTo [c, [1.2,0.7,-2.9]]; // Puerta trasera
	caja attachTo [c, [2.5,-6.5,-3.3]]; // Puerta laterar
	caja attachTo [c, [2.9,-7.7,-2.2]]; // Cabina
	caja attachTo [c, [4,-1.7,-4.1]]; //Rueda trasera derecha
	caja attachTo [c, [-8,-6,-4.1]]; // hélice izquierda
*/

/*
Naufragios por Icaruk
	[1] execVM "ica\farmeo\naufragios.sqf";
*/

_esconder = {
	private ["_escondite", "_barco"];
	_barco = typeOf _this;

	if (_barco isEqualTo "Land_Wreck_Traw_F") then {
		_escondite = [[4,-9,-4.1], [5.7,-9,-3.6], [1.4,2.7,4.7], [-4,-0.5,2.9], [-1,-4,-3]] call BIS_fnc_selectRandom;
	};
	if (_barco isEqualTo "Land_Wreck_Traw2_F") then {
		_escondite = [[1.2,-5,-3.9], [3,-5,2], [-4,-1.5,-2.6], [0.3,5,-4.2], [6,6.5,-4.2]] call BIS_fnc_selectRandom;
	};	
	if (_barco isEqualTo "Land_UWreck_MV22_F") then {
		_escondite = [[1.2,0.7,-2.9], [2.5,-6.5,-3.3], [2.9,-7.7,-2.2], [4,-1.7,-4.1], [-8,-6,-4.1]] call BIS_fnc_selectRandom;
	};
	_escondite
};

_class = "pop_oro_r";
_n = 20;
while {true} do {
	
	sleep (60 * 10);
	_barco = [barco1, barco2, barco3, barco4, barco5, barco6] call BIS_fnc_selectRandom;
	cofre1 attachTo [_barco, _barco call _esconder];
	cofre1 addItemCargoGlobal [_class, _n];
	
	sleep (60 * 10);
	_barco = [barco1, barco2, barco3, barco4, barco5, barco6] call BIS_fnc_selectRandom;
	cofre2 attachTo [_barco, _barco call _esconder];
	cofre2 addItemCargoGlobal [_class, _n];
	
	sleep (60 * 10);
	_barco = [barco1, barco2, barco3, barco4, barco5, barco6] call BIS_fnc_selectRandom;
	cofre3 attachTo [_barco, _barco call _esconder];
	cofre3 addItemCargoGlobal [_class, _n];
};



