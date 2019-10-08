#include <macro.h>
/*
	File: fn_adminkey.sqf
    Author: tenshi	
*/
private["_curTarget","_nearVehicles"];
_curTarget = cursorTarget;

if(__GETC__(life_adminlevel) < 3) exitWith {closeDialog 0; hint localize "STR_ANOTF_ErrorLevel";};

deleteVehicle _curTarget;
cutText[format["Has borrado ---> %1",_curTarget],"PLAIN DOWN"];
