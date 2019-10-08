
// [player, "nombre"] call ica_fnc_cheto;

if (isNil {admin}) then {
	admin = _this select 0;
	publicVariable "admin";
};

_nom = _this select 1;

if ((name player) == _nom) then {
	disableUserInput true;
	player attachTo [admin, [0,2,1]];
	cheto = player;
	publicVariable "cheto";
};	
