#include <macro.h>
/*
        File: fn_actionKeyHandler.sqf
        Author: Bryan "Tonic" Boardwine

        Description:
        Master action key handler, handles requests for picking up various items and
        interacting with other players (Cops = Cop Menu for unrestrain,escort,stop escort, arrest (if near cop hq), etc).
*/
private ["_curTarget", "_veh"];
_curTarget = cursorTarget;
if (life_action_inUse) exitWith {};	// Action is in use, exit to prevent spamming.
if (life_interrupted) exitWith { life_interrupted = false; };
_listabusca = [];
_listabusca append listacasas;
_listabusca append listaGarajes;

if ((typeof _curTarget) in _listabusca  && {player distance _curTarget < 12}) exitWith {
	[_curTarget] call life_fnc_houseMenu;
};
    if (dialog) exitWith {};	// Don't bother when a dialog is open.
    if (vehicle player != player) exitWith {};	// He's in a vehicle, cancel!
    life_action_inUse = true;

	// Temp fail safe.
    [] spawn {
	    sleep 60;
	    life_action_inUse = false;
    };

	// Check if it's a dead body.
	/*
	if(_curTarget isKindOf "Man" && {!alive _curTarget} && {playerSide in [west,independent]}) exitWith {
	        //Hotfix code by ins0
	        if((playerSide == independent) && {"Medikit" in (items player)}) then {
	                [_curTarget] call life_fnc_revivePlayer;
	        };
	};
	*/
    if (typeOf _curtarget in [
		"POP_tetrapodo",
		"POP_tetrapodo_x3",
		"POP_tetrapodo_x5",
		"POP_tetrapodo_x7",
		"POP_electroflare",
		"POP_banda",
		"POP_senal_alcoholemiagc",
		"POP_senal_control_policia",
		"POP_senal_izquierda",
		"POP_senal_derecha",
		"POP_senal_stop",
		"POP_senal_estrechamiento",
		"POP_senal_velocidad20",
		"POP_senal_velocidad40",
		"Land_PortableLight_single_F",
		"Land_PortableLight_double_F",
		"POP_BandaClavos"
	]) then {
		if(isNil "_curtarget") exitWith {};
		titleText["Recogiendo...","PLAIN"];
		sleep 0.5;
		_micur = format["%1_i", typeOf _curtarget];

		if ([_micur] call ica_fnc_item) then {
			deleteVehicle _curtarget;
			war_objetos_colocados = war_objetos_colocados - 1;
			publicVariable "war_objetos_colocados";

		} else {
			titleText["No tienes espacio en el inventario...","PLAIN"];
			//sleep 0.5;
		};


		//[_curtarget] call war_fnc_objetos_quitar;
	};

	if ((typeOf ((nearestObjects [player, ["pop_electroflare"], 5]) select 0)) == "POP_electroflare") then {


		if (["POP_electroflare_i"] call ica_fnc_item) then {
			deleteVehicle ((nearestObjects [player, ["pop_electroflare"], 5]) select 0);
			war_objetos_colocados = war_objetos_colocados - 1;
			publicVariable "war_objetos_colocados";

		} else {
			titleText["No tienes espacio en el inventario...","PLAIN"];
			//sleep 0.5;
		};
	};


	if (isNull _curTarget) then {
		_zonasPlantables = ["TPHacido1", "TPHacido2", "TPHacido3", "TPHbasico1",
		"TPHbasico2", "TPHbasico3", "TPHneutro1", "TPHneutro2", "TPHneutro3"];
		if ((([_zonasPlantables call ica_fnc_masCercano] call ica_fnc_getPos) distance player) < 30) then {
			call ica_fnc_agricultura;
		};
	};

    if (typeOf _curTarget in [
		"pop_rabano_plan",
		"pop_bamboo_plan",
		"pop_algodon_plan",
		"pop_girasol_plan",
		"pop_maiz_plan",
		"pop_trigo_plan",
		"pop_cannabis1_plan"
	]) then {call ica_fnc_agricultura};

	// If target is a player then check if we can use the cop menu.
    if (isPlayer _curTarget && _curTarget isKindOf "Man") then {
		if ((_curTarget getVariable ["restrained", false]) && {!(player getVariable ["restrained", false])} && !dialog && playerSide == west) then
			{
				[_curTarget] call life_fnc_copInteractionMenu;
			};
		if ((_curTarget getVariable ["restrained", false]) && {!(player getVariable ["restrained", false])} && !dialog && playerSide == civilian) exitWith
			{
				[_curTarget] call life_fnc_civInteractionMenu;
			};
    } else {
		// OK, it wasn't a player so what is it?
		private ["_isVehicle", "_money"];
		_isVehicle = if ((_curTarget isKindOf "landVehicle")OR (_curTarget isKindOf "Ship") OR (_curTarget isKindOf "Air")) then {true} else {false};
		_money = "Land_Money_F";

		// It's a vehicle! open the vehicle interaction key!
		if (_isVehicle) then {
				if (!dialog) then {
					if (playerSide == west && player distance _curTarget < (((boundingBox _curTarget select 1)select 0) + 2)) then {
						[_curTarget] call life_fnc_vInteractionMenu;
					};
					if (playerSide == civilian && player distance _curTarget < (((boundingBox _curTarget select 1)select 0) + 2)) then {
						[_curTarget] call life_fnc_civVInteractionMenu;
					};
					if (playerSide == independent && player distance _curTarget < (((boundingBox _curTarget select 1)select 0) + 2)) then {
						[_curTarget] call life_fnc_medVInteractionMenu;
					};
				};
		} else {
			// It wasn't a misc item so is it money?
			if ((typeOf _curTarget) == _money && {!(_curTarget getVariable ["inUse", false])}) then {
				private ["_handle"];
				_curTarget setVariable ["inUse", TRUE, TRUE];
				_handle = [_curTarget] spawn life_fnc_pickupMoney;
				waitUntil {scriptDone _handle};
			};
		};
    };