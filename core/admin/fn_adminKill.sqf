#include <macro.h>
/*
    File: fn_adminKill.sqf
    Author: tenshi
*/
if(__GETC__(life_adminlevel) < 2) exitWith {closeDialog 0;};

private["_target"];
_target = lbData[2902,lbCurSel (2902)];
_target = call compile format["%1", _target];
if(isNil "_target") exitwith {};
if(isNull _target) exitWith {};
if(_unit == player) exitWith {hint localize "STR_ANOTF_Error";};

_target setDamage 1;
hint format["%1 está muerto. Descanse en paz.",_target getVariable["realname",name _target]];