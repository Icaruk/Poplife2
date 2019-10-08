
/*
por: Icaruk
	[obj, 60] call ica_fnc_borrame; // cliente
	[obj, 60] spawn ica_fnc_borrame; // servidor
*/

private ["_obj", "_t"];
_obj = _this select 0;
_t = _this select 1;

if (!isServer) then {
	[[_obj, _t], "ica_fnc_borrame", false, false, false] call life_fnc_MP;
} else {
	sleep _t;
	if (!isNull _obj) then {
		deleteVehicle _obj;
	};
};



