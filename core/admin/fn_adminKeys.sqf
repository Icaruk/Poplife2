#include <macro.h>
/*
	File: fn_adminKeys.sqf
    Author: tenshi
*/
private["_curTarget","_vehicle","_nearVehicles"];
_curTarget = cursorTarget;
_vehicle = cursorTarget;

if(__GETC__(life_adminlevel) < 2) exitWith {closeDialog 0; hint localize "STR_ANOTF_ErrorLevel";};

if(!isNull _curTarget) then {

	[[_curTarget,0],"life_fnc_lockVehicle",_curTarget,false] call life_fnc_MP;
	if(!(_vehicle in life_vehicles)) then
	{
		life_vehicles set[count life_vehicles,_vehicle];
	};


} else {

	_nearVehicles = nearestObjects[getPos player,["Car","Air","Ship","Truck"],10];
	if(count _nearVehicles > 0) then
	{
		{
			if(!isNil "_vehicle") exitWith {}; //Kill the loop.

				[[_x,0],"life_fnc_lockVehicle",_x,false] call life_fnc_MP;
				if(!(_x in life_vehicles)) then
					{
					life_vehicles set[count life_vehicles,_x];
					};

		} foreach _nearVehicles;
	};


};
