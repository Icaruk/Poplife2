
/*
por: Icaruk
	[player, true] spawn ica_fnc_inconsciente;
	[player, true, culpable] spawn ica_fnc_inconsciente;
	[player, false] call ica_fnc_inconsciente;
*/

_victima = _this select 0;
_estado = _this select 1;
_culpable = _this select 2;

if (_estado) then {
	if (isNil {_culpable}) then {_culpable = player};
	// diag_log format ["ERRORICA sistema médico, player caído inconsciente y el culpable es %1", _culpable];
	if ((vehicle player != player) && ((assignedVehicleRole player) select 0)!= "driver") exitwith {};
	// if ((animationState _victima) == "passenger_injured_medevac_truck01") exitwith {};
	// if ((animationState _victima) == "passenger_injured_medevac_truck02") exitwith {};
	if ((animationState _victima) != "deadstate") then {
		// if ((vehicle player) != player) then {player action ["eject", vehicle player]};
		_victima setvariable ["inconsciente",true,true];
		[[_victima, "DeadState"], "ica_fnc_playMoveNow", true, true, true] call life_fnc_MP;
		if (isNil {atameAlSuelo}) then {
			atameAlSuelo = "land_cluttercutter_small_f" createVehicle (getPosATL player);
			atameAlSuelo setPosATL (getPosATL player);
			atameAlSuelo setVectorUp (surfaceNormal (getPos player));
			player attachTo [atameAlSuelo, [0,0,0]];
			[atameAlSuelo, 60 * 16] call ica_fnc_borrame;
		};

		if (isNil {chatEnviado}) then {
			chatEnviado = true;

			switch (true) do {
				case ((isNull _culpable) OR (_culpable isEqualTo "Error: No unit") OR (_culpable == player) OR !(isPlayer _culpable)): {
					[format ["%1 ha caído inconsciente por causas desconocidas.", name _victima], "systemChat", true, false, false] call BIS_fnc_MP;
				};
				default {
					[format ["%1 ha dejado inconsciente a %2", name _culpable, name _victima], "systemChat", true, false, false] call BIS_fnc_MP;
				};
			};

			_victima spawn {
				waitUntil {animationState _this == "deadstate"};
				sleep 20;
				chatEnviado = nil;
			};
		};
	};
	profileNamespace setVariable ["rutome", 60 * 5];
} else {
	[[_victima, "AmovPpneMstpSnonWnonDnon_healed"], "ica_fnc_switchMove", true, true, true] call life_fnc_MP;
	 profileNamespace setVariable ["rutome", 0];

	detach player;
	if (!isNil {atameAlSuelo}) then {deleteVehicle atameAlSuelo};
	atameAlSuelo = nil;
	_victima setvariable ["inconsciente",false,true];
};
