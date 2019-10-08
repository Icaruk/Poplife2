/*
	File: fn_insertPlayerInfo.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Read the file name... Explains it.
*/
if(life_session_completed) exitWith {}; //Why did this get executed when the client already initialized? Fucking arma...
titleText [localize "STR_Session_QueryFail","PLAIN"];
// 0 cutFadeOut 9999999;

[[getPlayerUID player,profileName,pop_din,pop_atmdin,player],"DB_fnc_insertRequest",false,false] call life_fnc_MP;