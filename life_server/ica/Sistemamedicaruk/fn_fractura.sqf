
/*
por: Icaruk
	[player, "piernas"] spawn ica_fnc_fractura;
*/

_victima = _this select 0;
_parte = _this select 1;

if (!isNil {piernasRotas}) exitWith {};
piernasRotas = true;

if (_parte isEqualTo "piernas") exitWith {
	while {true} do {
		if ((_victima getVariable "piernas") <= 50) exitWith {hint "fin piernas rotas"; piernasRotas = nil};
		
		if (stance player == "STAND") then {
			player playAction "PlayerStand";
			sleep 1;
		};
		
		if (stance player == "CROUCH") then {
			player playAction "PlayerCrouch";
			sleep 1;
		};
		
		if (stance player != "PRONE") then {
			sleep 2;
			player playAction "PlayerProne";
		};

		sleep 1;
	};
};
