/*
	File: fn_medicMarkers.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Marks downed players on the map when it's open.
	_name = name player;
	((!isNil "_name") && ((animationstate player)== "deadstate") && alive player);
*/
private["_markers","_units","_incons"];
_markers = [];
_units = [];
_incons = [];

sleep 0.25;
if(visibleMap) then {
	{
		_name = _x getVariable "name";
		_down = _x getVariable ["Revive",false];
	if(!isNil "_name" && !_down) then {
			_units pushBack _x;
		};
	} foreach allDeadMen;
	{
		_name = name _x;
		if ((!isNil "_name") && ((animationstate _x)== "deadstate") && alive _x) then {
			_incons pushBack _x;
		};
	} foreach allplayers;
	
	//Loop through and create markers.
	{
		_marker = createMarkerLocal [format["%1_dead_marker",_x],visiblePosition _x];
		_marker setMarkerColorLocal "ColorRed";		
		_marker setMarkerTypeLocal "loc_Hospital";
		_marker setMarkerTextLocal format["%1",(_x getVariable["name","Unknown Player"])];
		_marker setMarkerSizeLocal [2, 2];		
		_markers pushBack _marker;
	} foreach _units;
	{
		_marker = createMarkerLocal [format["%1_dead_marker",_x],visiblePosition _x];
		_marker setMarkerColorLocal "ColorYellow";		
		_marker setMarkerTypeLocal "loc_Hospital";
		_marker setMarkerTextLocal format["%1",name _x];
		_marker setMarkerSizeLocal [2, 2];		
		_markers pushBack _marker;
	} foreach _incons;
	
	waitUntil {!visibleMap};
	{deleteMarkerLocal _x;} foreach _markers;
};