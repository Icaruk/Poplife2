/*
	File: fn_pulloutAction.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Pulls civilians out of a car if it's stopped.
*/
private["_crew"];
_crew = crew cursorTarget;

if ((cursorTarget distance player) > 7) exitWith { // ica
	hint "No eres mago, por lo tanto no puedes sacar a gente de un vehículo que está fuera de tu alcance. Lo siento, no hay Hogwarts para ti";
};

{
	if(side _x != west) then
	{
		_x setVariable ["transporting",false,true]; _x setVariable ["Escorting",false,true];
		[[_x],"life_fnc_pulloutVeh",_x,false] call life_fnc_MP;
	};
} foreach _crew;