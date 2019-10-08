/*
	File: initServer.sqf

	Description:
	Starts the initialization of the server.
*/
if(!(_this select 0)) exitWith {}; //Not server
	[] call compile PreprocessFileLineNumbers "\life_server\init.sqf";
	[] call compile PreprocessFileLineNumbers "\life_server\A3L_Functions\initA3L.sqf";

	//  Daufk?  master_group attachTo[bank_obj,[0,0,0]];
	onMapSingleClick "if(_alt) then {vehicle player setPos _pos};";
	[8,true,true,12] execFSM "core\fsm\timeModule.fsm";

//Solo dedicado
if (isDedicated) then {
	[] call compile PreprocessFileLineNumbers "\life_server\ica\initServer.sqf";
};


