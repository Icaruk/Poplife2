
/*
por: Icaruk
	[veh] spawn ica_fnc_hab_reparar;
*/

if !("ToolKit" in (items player)) exitWith {hint "No tienes ningún kit de reparaciones"; };
if (vehicle player != player) exitWith {};

private ["_veh", "_porcent", "_miNivel"];
_veh = cursorTarget;

_con = "con" call ica_fnc_expToLevel;
_porcent = switch (true) do {
	case (_con >= 4): {70};
	case (_con >= 2): {35};
	case (_con >= 0): {0};
};

if ((round (random 100)) <= _porcent) then {
	hint "No has gastado kit reparación";
} else {
	player removeItem "ToolKit";
};

[25, "Reparando..."] spawn ica_fnc_barrita;
player playMove "CL3_anim_RepairCrouch";
[[player,"CL3_anim_RepairCrouch"],"life_fnc_animSync",nil,false] call life_fnc_MP;
sleep 25;

if (vehicle player != player) exitWith {hint "No puedes reparar desde dentro"};

_veh setDamage ((damage _veh) - 0.9);