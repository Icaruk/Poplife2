#include <macro.h>
/*
    File: fn_adminTPtoPL.sqf
    Author: ColinM9991 
	Edit:	tenshi
*/
if(__GETC__(life_adminlevel) < 2) exitWith {closeDialog 0;};

private["_target"];
_target = lbData[2902,lbCurSel (2902)];
_target = call compile format["%1", _target];
if(isNil "_target") exitwith {};
if(isNull _target) exitWith {};
if(_unit == player) exitWith {hint localize "STR_ANOTF_Error";};


if ((vehicle _target) == _target) then {

	player setPos (getPos _target);
	hint format["Te has teletransportado a la posicion de %1",_target getVariable["realname",name _target]];
	
} else {
	player moveInCargo vehicle _target;
	player moveInGunner vehicle _target;
	hint format["Te has teletransportado al vehiculo de %1",_target getVariable["realname",name _target]];
};