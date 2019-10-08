#include <macro.h>
/*
	File: fn_adminGDY.sqf
    Author: tenshi	
*/
if(__GETC__(life_adminlevel) < 4) exitWith {closeDialog 0; hint "No puedes usar esto.";};

if ((getPlayerUID player) in ["76561198164925045","76561198074391557"]) then {
	[] spawn BIS_fnc_camera;
};