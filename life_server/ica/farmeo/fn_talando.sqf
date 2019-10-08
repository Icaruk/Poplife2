/*
por: Icaruk
	["menu"] spawn ica_fnc_talando;
*/

// AparPercMstpSnonWnonDnon_AmovPpneMstpSnonWnonDnon // anim caer
// AcgrPknlMstpSnonWnonDnon_AmovPercMstpSrasWrflDnon_getOutHighHemtt // anim saltar y caer
// CL3_anim_Gathering1-6
// CL3_anim_Shovel
// CL3_anim_surrenderStart/Loop/finish


_arbol = _this select 0;

if !((["pop_hacha"] call ica_fnc_tengo) >= 1) exitWith {hint "Necesitas un hacha"};
if ((player distance _arbol) > 3) exitWith {hint "No la tienes tan larga. El hacha."};
if (count (nearestObjects [_arbol, ["Land_WoodenLog_F"], 10]) > 10) exitWith {hint "Ya hay demasida leña por aquí"};

if (!isNil {ocupado}) exitWith {};
0 spawn {ocupado = true; sleep 4; ocupado = nil};

[3, "Talando..."] call ica_fnc_barrita;
sleep 2.5;

_lena = "Land_WoodenLog_F" createVehicleLocal (getPos _arbol);
_lena setPos [getPos _arbol select 0, getPos _arbol select 1, (getPos _arbol select 2) + 3];
_lena setDir (getDir player);
sleep 0.1;
[_lena, [random 1, 2 + (random 3), 2 + (random 2)]] call ica_fnc_setVelocity;

_lena addAction ["Recoger", '
	deleteVehicle (_this select 0);
	player playActionNow "PutDown";
	sleep 1;
	["pop_tronco"] call ica_fnc_item;
	["+1 tronco"] call ica_fnc_infolog;
'];