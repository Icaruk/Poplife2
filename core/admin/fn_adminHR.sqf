#include <macro.h>
/*
    File: fn_adminHR.sqf
    Author: tenshi
*/
private["_unit","_name"];

if(__GETC__(life_adminlevel) < 1) exitWith {closeDialog 0;};

_unit = lbData[2902,lbCurSel (2902)];
_unit = call compile format["%1", _unit];
if(isNil "_unit") exitwith {};
if(isNull _unit) exitWith {};

_name = name _unit;

	_unit setDamage 0;
	vehicle _unit setDamage 0;
	life_hunger = 100;
	life_thirst = 100;
	cutText[format["%1 Curado/Reparado !",_name],"PLAIN"];