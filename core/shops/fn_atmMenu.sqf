#include <macro.h>
/*
	File: fn_atmMenu.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Opens and manages the bank menu.
*/

if ((isNil {pop_din}) OR (isNil {pop_atmdin})) exitWith {["errorica", FALSE, TRUE] call BIS_fnc_endMission;};

private["_display","_text","_units","_type","_isBank","_isGov","_rnd"];

if (!isNil {DDoS}) exitWith {hint "Parece que no funciona..."};
if(!life_use_atm) exitWith {
	hint localize "STR_Shop_ATMRobbed";
};
if (!isNil {profileNamespace getVariable "dineroBloqueado"}) exitWith {
	hint "Hace poco que has cometido un crimen, sería algo sospechoso utilizar tu cuenta bancaria tan pronto. También puedes blanquear el dinero.";
};

if(!dialog) then {
	if(!(createDialog "Life_atm_management")) exitWith {};
};

disableSerialization;

_display = findDisplay 2700;
_text = _display displayCtrl 2701;
_units = _display displayCtrl 2703;

lbClear _units;
_text ctrlSetStructuredText parseText format["<img size='1.7' image='\pop_iconos\icons\bank.paa'/>  %1 €<br/><img size='1.6' image='\pop_iconos\icons\money.paa'/>  %2 €",[pop_atmdin] call life_fnc_numberText,[pop_din] call life_fnc_numberText];

{
	if(alive _x) then	{
		switch (side _x) do {
			case west: {_type = "Cop"};
			case civilian: {_type = "Civ"};
			case independent: {_type = "EMS"};
			case east: {_type = "OP"};
		};
		_units lbAdd format["%1 (%2)",_x getVariable["realname",name _x],_type];
		_units lbSetData [(lbSize _units)-1,str(_x)];
	};
} foreach playableUnits;

lbSetCurSel [2703,0];

if(isNil {(grpPlayer getVariable "gang_bank")}) then {
	(getControl(2700,2705)) ctrlEnable false;
};