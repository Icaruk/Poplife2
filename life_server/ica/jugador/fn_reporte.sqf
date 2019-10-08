
/*
por: Icaruk
	call ica_fnc_reporte;
*/

if (call life_adminlevel < 2) then {
	if (!isNil {reporteUsado}) exitWith {hint "Sólo puedes usar esta función cada 20 minutos"};
	0 spawn {
		reporteUsado = true;
		sleep (60 * 20);
		reporteUsado = nil;
	};

	_din = round (pop_atmdin * 0.10);
	pop_atmdin = pop_atmdin - _din;
	[0] call SOCK_fnc_updatePartial;
	[format ["REPORTE ----- %1 (%2) ha usado la función reporte (- %3€)", name player, getPlayerUID player, _din], "diag_log", false, false, false] call BIS_fnc_MP;
	[format ["%1 ha usado la función reporte.", name player], "hint", true, false, false] call BIS_fnc_MP;
};

0 spawn {
	0 spawn {
		_t = diag_tickTime + 30;
		waitUntil {diag_tickTime >= _t};
		removeMissionEventHandler ["Draw3D", EHreporte];
	};
	EHreporte = addMissionEventHandler ["Draw3D",{

		_arr = nearestObjects [player, ["Man", "Car"], 60];
		if ((count _arr) > 1) then {
			{
				_dist = player distance _x;
				_dist = if (_dist < 1.5) then {1.5} else {_dist};

				drawIcon3D [
					"\a3\ui_f\data\map\Markers\System\dummy_ca.paa", 
					[1,0.2,0.2, (60 - _dist) / 50], 
					[((getPos _x) select 0), ((getPos _x) select 1), 2+(1.8/(60/_dist))],
					1,
					1,
					0,
					_x getVariable "realname",
					1.8,
					0.036,
					"TahomaB"
				];
			} forEach _arr;
		};
	}];
};