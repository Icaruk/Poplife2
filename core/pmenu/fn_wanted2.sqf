private["_unit","_amount"];

ctrlShow[2001,false];
if((lbCurSel 9902) == -1) exitWith {hint "No one was chosen!";ctrlShow[2001,true];};
_unit = lbData [9902,lbCurSel 9902];
_unit = call compile format["%1",_unit];
_amount = lbData [9991,lbCurSel 9991];
if(isNil "_unit") exitWith {ctrlShow[2001,true];};
//if(_unit == player) exitWith {ctrlShow[2001,true];};
if(isNull _unit) exitWith {ctrlShow[2001,true];};

[[1,format["%1 was added to the wanted list.",name _unit,_amount,getPlayerUID _unit]],"life_fnc_broadcast",west,false] call life_fnc_MP;

[[getPlayerUID _unit,name _unit,_amount],"life_fnc_wantedAdd",false,false] call life_fnc_MP;