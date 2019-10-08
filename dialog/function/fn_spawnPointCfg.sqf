/*
	File: fn_spawnPointCfg.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration for available spawn points depending on the units side.
	
	Return:
	[Spawn Marker,Spawn Name,Image Path]
*/
private["_side","_return"];
_side = [_this,0,civilian,[civilian]] call BIS_fnc_param;

//Spawn Marker, Spawn Name, PathToImage
switch (_side) do
{
	case west:
	{
		_return = [
			["cop_spawn_1","Corazol","\a3\ui_f\data\map\MapControl\fuelstation_ca.paa"],
			["cop_spawn_3","Paraiso","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
			["cop_spawn_2","Bagango","\a3\ui_f\data\map\MapControl\fuelstation_ca.paa"],
			["cop_spawn_4","Ortego","\a3\ui_f\data\map\Markers\NATO\b_air.paa"]
		];
	};
	
	case civilian:
	{
		_return = [
			["civ_spawn_2","Corazol","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
			["civ_spawn_1","Paraiso","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
			["civ_spawn_4","Bagango","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
			["civ_spawn_3","Ortego","\a3\ui_f\data\map\MapControl\watertower_ca.paa"]
		];
		
		if(count life_houses > 0) then {
			{
				_pos = call compile format["%1",_x select 0];
				_house = nearestBuilding _pos;
				_houseName = getText(configFile >> "CfgVehicles" >> (typeOf _house) >> "displayName");
				
				_return pushBack [format["house_%1",_house getVariable "uid"],_houseName,"\a3\ui_f\data\map\MapControl\lighthouse_ca.paa"];
			} foreach life_houses;
		};	
	};
	
	case independent: {
		_return = [
			["medic_spawn_1","Corazol","\a3\ui_f\data\map\MapControl\hospital_ca.paa"],
			["medic_spawn_2","Paraiso","\a3\ui_f\data\map\MapControl\hospital_ca.paa"],
			["medic_spawn_3","Bagango","\a3\ui_f\data\map\MapControl\hospital_ca.paa"],
			["medic_spawn_4","Dolores","\a3\ui_f\data\map\MapControl\hospital_ca.paa"]
		];
	};
	
	case east: {
		_return = [
			["op_spawn2","Corazol","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
			["op_spawn","Paraiso","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
			["op_spawn1","Bagango","\a3\ui_f\data\map\MapControl\watertower_ca.paa"]			
		];
	};
	
};

_return;