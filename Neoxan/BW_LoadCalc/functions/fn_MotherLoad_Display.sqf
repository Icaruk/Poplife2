		disableSerialization;
		
		private ["_uniform","_uniformp","_uniformcont","_uniformmax","_uniformcargo","_vest","_vestp","_vestcont","_vestmax","_vestcargo","_backpack","_backpackp","_backpackmax","_backpackcargo","_cargo","_maxcargo","_veh","_vehcargo","_WeightText"];

		
		_uniform = uniform player;
		_uniformp = loaduniform player;
		_uniformcont = gettext (configFile >> "CfgWeapons" >> _uniform >> "iteminfo" >> "containerclass");
		_uniformmax = getnumber (configFile >> "CfgVehicles" >> _uniformcont >> "maximumload");
		_uniformcargo = _uniformp*_uniformmax;
		_vest = vest player;
		_vestp = loadvest player;
		_vestcont = gettext (configFile >> "CfgWeapons" >> _vest >> "iteminfo" >> "containerclass");
		_vestmax = getnumber (configFile >> "CfgVehicles" >> _vestcont >> "maximumload");
		_vestcargo = _vestp*_vestmax;
		_backpack = backpack player;
		_backpackp = loadbackpack player;
		_backpackmax = getnumber (configFile >> "CfgVehicles" >> _backpack >> "maximumload");
		_backpackcargo = _backpackp*_backpackmax;
		_cargo = _uniformcargo + _vestcargo + _backpackcargo;
		_maxcargo = _uniformmax + _vestmax + _backpackmax;
		
		_TEXT1 = (FindDisplay 602) displayCtrl 111;
		if (vehicle player == player) then {
		_WeightText = formatText ["Inventario: %1/%2",_cargo, _maxcargo];
		}
		else {
		_veh = typeof vehicle player;
		_vehcargo = getNumber (configFile >> "Cfgvehicles" >> _veh >> "maximumload");
		_WeightText = formatText ["Inventario: %1/%2; Maletero: %3",_cargo, _maxcargo, _vehcargo];
		};
		_TEXT1 ctrlsettext str _WeightText;
		
		if (_cargo < 200) then {_TEXT1 ctrlSetTextColor [1, 1, 1, 1];}; // WHITE
		if (_cargo > 200) then {_TEXT1 ctrlSetTextColor [0, 1, 0, 1];}; // GREEN 
		if (_cargo > 400) then {_TEXT1 ctrlSetTextColor [0, 0, 1, 1];}; // BLUE
		if (_cargo > 600) then {_TEXT1 ctrlSetTextColor [1, 0, 0, 1];}; // RED
		
		/*
		20kg 650m
		25kg 650m
		30kG 500m
		35kg 450m
		40kg 400m
		45kg 245m