/*
	File: fn_robReceive.sqf
	Author: Bryan "Tonic" Boardwine
*/
private["_cash"];

_cash = [_this,0,0,[0]] call BIS_fnc_param;
if (side player == civilian) then {
	if(_cash == 0) exitWith {titleText[localize "STR_Civ_RobFail","PLAIN"]};

	pop_din = pop_din + _cash;
	titleText[format[localize "STR_Civ_Robbed",[_cash] call life_fnc_numberText],"PLAIN"];
} else {
	hint format ["Has incautado %1 €", _cash];
};