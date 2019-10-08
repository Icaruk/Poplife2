
/*
por: Icaruk
	call ica_fnc_sync;
*/

if (isNil {yaHeSincronizado}) then {
	hint "Sincronizando... deberías esperar 10 segundos.";
	
	switch (typeName life_fnc_MP_packet) do {
		case "ARRAY":	{
			if (count life_fnc_MP_packet == 0) exitWith {_exit = true};
		};
		default {_exit = true};
	};
	if (!isNil "_exit") exitWith {hint localize "STR_Session_SyncCheater"};
	[] call SOCK_fnc_updateRequest;
	// [22] call SOCK_fnc_updatePartial; // exp
	[true] call ica_fnc_guardaCargaMed; // guardar variables medicaruk
	[true] spawn ica_fnc_posicion;
	profilenamespace setvariable ["rutome",0];
	
	0 spawn {
		yaHeSincronizado = true;
		sleep 120;
		yaHesincronizado = nil;
	};
} else {
	hint "Sólo puedes sincronizar cada 2 minutos.";
};
