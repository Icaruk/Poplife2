
/*
por: Icaruk
	["init"] spawn ica_fnc_basura;
*/

_param = _this select 0;

if (_param isEqualTo "init") exitWith {
	// contenedor es el nombre del objeto que ira en el mapa con el numero del uno al 20
	_contenedores = [];
	_palabra = "contenedor";
	
	for "_x" from 1 to 20 do {
		_contenedores pushBack (call compile format ["%1%2", _palabra, _x]);
	};
	
	//hint format ["El array de contenedores es %1", _contenedores];  COMENTAME DESPUES DE TESTEAR
	
	while {true} do {
		{
			if (count (magazineCargo _x) < 30) then {
				_x addItemCargoGlobal ["pop_basura_item", 2 + round (random 8)];// es el classname del objeto que ira dentro del contenedor
			};
		} forEach _contenedores;
		
		sleep (60 * 10);
	};
};
