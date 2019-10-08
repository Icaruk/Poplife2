/*
	File: fn_queryRequest.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Handles the incoming request and sends an asynchronous query
	request to the database.

	Return:
	ARRAY - If array has 0 elements it should be handled as an error in client-side files.
	STRING - The request had invalid handles or an unknown error and is logged to the RPT.
*/
private["_uid","_side","_query","_return","_queryResult","_qResult","_handler","_thread","_tickTime","_loops","_returnCount"];
_uid = [_this,0,"",[""]] call BIS_fnc_param;
_side = [_this,1,sideUnknown,[civilian]] call BIS_fnc_param;
_ownerID = [_this,2,ObjNull,[ObjNull]] call BIS_fnc_param;

if(isNull _ownerID) exitWith {};
_ownerID = owner _ownerID;

/*
	_returnCount is the count of entries we are expecting back from the async call.
	The other part is well the SQL statement.
*/
_query = switch(_side) do {
	case west: {_returnCount = 10; format["GetWestPlayer:%1",_uid];};
	case civilian: {_returnCount = 14; format["GetCivilianPlayer:%1",_uid];};
	case independent: {_returnCount = 10; format["GetIndependentPlayer:%1",_uid];};
	case east: {_returnCount = 10; format["GetEastPlayer:%1",_uid];};
};

waitUntil{sleep (random 0.3); !DB_Async_Active};
_tickTime = diag_tickTime;
_queryResult = [_query,2] call DB_fnc_asyncCall;

if(typeName _queryResult == "STRING") exitWith {
	[[],"SOCK_fnc_insertPlayerInfo",_ownerID,false,true] call life_fnc_MP;
};

if(count _queryResult == 0) exitWith {
	[[],"SOCK_fnc_insertPlayerInfo",_ownerID,false,true] call life_fnc_MP;
};

//Blah conversion thing from a2net->extdb
private["_tmp"];
_tmp = _queryResult select 2;
_queryResult set[2,[_tmp] call DB_fnc_numberSafe];
_tmp = _queryResult select 3;
_queryResult set[3,[_tmp] call DB_fnc_numberSafe];

//Parse licenses (Always index 6)
_new = [(_queryResult select 6)] call DB_fnc_mresToArray;
if(typeName _new == "STRING") then {_new = call compile format["%1", _new];};
_queryResult set[6,_new];

//Convert tinyint to boolean
_old = _queryResult select 6;
for "_i" from 0 to (count _old)-1 do
{
	_data = _old select _i;
	_old set[_i,[_data select 0, ([_data select 1,1] call DB_fnc_bool)]];
};

_queryResult set[6,_old];

//Gear
_new = [(_queryResult select 8)] call DB_fnc_mresToArray;
if(typeName _new == "STRING") then {_new = call compile format["%1", _new];};
_queryResult set[8,_new];
diag_log format ["Array Gear %1",_new];

//experiencia
_new = [(_queryResult select 9)] call DB_fnc_mresToArray;
if(typeName _new == "ARRAY") then {_new = call compile format["%1", _new];};
_queryResult set[9,_new];



//Parse data for specific side.
switch (_side) do {
	case east: {
		_new = [(_queryResult select 8)] call DB_fnc_mresToArray;
		if(typeName _new == "STRING") then {_new = call compile format["%1", _new];};
		_queryResult set[8,_new];
	};

	case civilian: {
		//Arrested
		_queryResult set[7,([_queryResult select 7,1] call DB_fnc_bool)];
		//Jailtime
		_tmp = _queryResult select 10;
		_queryResult set[10,[_tmp] call DB_fnc_numberSafe];
		/*
		 *  Arrest_reason position 13
		 */
		 //House data
		_houseData = _uid spawn TON_fnc_fetchPlayerHouses;
		waitUntil {scriptDone _houseData};
		_queryResult set[15, (missionNamespace getVariable[format["houses_%1",_uid],[]])];
		//Gang data
		_gangData = _uid spawn TON_fnc_queryPlayerGang;
		waitUntil{scriptDone _gangData};
		_queryResult set[16, (missionNamespace getVariable[format["gang_%1",_uid],[]])];
	};
};

//Vehicles keys
_keyArr = missionNamespace getVariable [format["%1_KEYS_%2",_uid,_side],[]];
_queryResult set[17, _keyArr];

[_queryResult,"SOCK_fnc_requestReceived",_ownerID,false] call life_fnc_MP;