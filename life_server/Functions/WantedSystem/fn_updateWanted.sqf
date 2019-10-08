/*
	Creado por Rosen
*/

private["_lista","_query","_queryResult","_listaFormat"];

_lista = param [0];
_listaFormat = [_lista] call DB_fnc_mresArray;
_query = format["GuardarDelitos:%1",_listaFormat];
_queryResult = [_query,1] call DB_fnc_asyncCall;
diag_log format["Wanted List = %1", _queryResult];