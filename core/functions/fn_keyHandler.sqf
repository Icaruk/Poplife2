#include <Keycodes.h>
#include <macro.h>

/*
	File: fn_keyHandler.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Main key handler for event 'keyDown'
*/
private ["_handled","_shift","_alt","_code","_ctrl","_alt","_ctrlKey","_veh","_locked","_interactionKey","_mapKey","_interruptionKeys","_Automobile","_VitesseX"];
_ctrl = _this select 0;
_code = _this select 1;
_shift = _this select 2;
_ctrlKey = _this select 3;
_alt = _this select 4;
_speed = speed cursorTarget;
_handled = false;
_tiempo = serverTime;

_mapKey = actionKeys "ShowMap" select 0;
//hint str _code;
_interruptionKeys = [17,30,31,32,44,16]; //A,S,W,D,Z,Q

_userKey9 = if(count (actionKeys "User9") != 0) then [{(actionKeys "User9") select 0},{-99}];

// ica
_puedo = true;

if ((_code in (actionKeys "GetOver")) OR (_code in (actionKeys "SwimDown"))) then {
	_puedo = switch (true) do {
		case ((player distance joyeria) < 17): {false};
		case ((player distance banco) < 23): {false};
		case (player distance (getMarkerPos "jail_marker") < 24): {false};
	};
};

if (_code in (actionKeys "Gear")) then {
	_tio = nearestObjects [getPos player, ["Man"], 3.5];
	_veh = nearestObjects [getPos player, ["Car", "Air", "Ship","pop_caja_armariog_box","pop_caja_armariop_box"], 6.1];
	if (((count _tio) <= 1) AND (count _veh < 1)) exitWith {};

	_puedo = false;
};

if (_code in (actionKeys "Diary")) then {
	_puedo = false;
};

if !(_puedo) exitWith {
	true;
};

//Vault handling...
if((_code in (actionKeys "GetOver") || _code in (actionKeys "salute")) && {(player getVariable ["restrained",false])}) exitWith {
	true;
};

if(life_action_inUse) exitWith {
	if(!life_interrupted && _code in _interruptionKeys) then {life_interrupted = true;};
	_handled;
};

//Hotfix for Interaction key not being able to be bound on some operation systems.
if(count (actionKeys "User10") != 0 && {(inputAction "User10" > 0)}) exitWith {
	//Interaction key (default is Left Windows, can be mapped via Controls -> Custom -> User Action 10)
	if(!life_action_inUse) then {
		[] spawn
		{
			private["_handle"];
			_handle = [] spawn life_fnc_actionKeyHandler;
			waitUntil {scriptDone _handle};
			life_action_inUse = false;
		};
	};
	true;
};

switch (_code) do {

	//Map Key
	case _mapKey: {
		switch (playerSide) do {
			// case west: {if(!visibleMap) then {[] spawn life_fnc_copMarkers;}};
			case independent: {if(!visibleMap) then {[] spawn life_fnc_medicMarkers;}};
			// case civilian: {if (!visibleMap) then {[] spawn life_fnc_civMarkers;}};
		};
	};

	//H Holster / recall weapon.
	case DIK_H: {
		if(_shift && !_ctrlKey && currentWeapon player != "") then {
			life_curWep_h = currentWeapon player;
			player action ["SwitchWeapon", player, player, 100];
			player switchcamera cameraView;
		};

		if(!_shift && _ctrlKey && !isNil "life_curWep_h" && {(life_curWep_h != "")}) then {
			if(life_curWep_h in [primaryWeapon player,secondaryWeapon player,handgunWeapon player]) then {
				player selectWeapon life_curWep_h;
			};
		};
	};

	//Interaction key (default is Left Windows, can be mapped via Controls -> Custom -> User Action 10)
	case DIK_LWIN:	{
		_veh = vehicle player;
		if (_veh != player) then {
			if (("con" call ica_fnc_expToLevel) >= 5) then {
				if ((driver _veh) == player) then {
					if ((speed _veh) > 30) then {
						if (!isNil {CDturbo}) exitWith {hint format ["Tiempo de reutilización restante %1s", CDturbo]};
						0 spawn {
							CDturbo = 60;
							while {true} do {
								if (CDturbo <= 0) exitWith {CDturbo = nil};
								CDturbo = CDturbo - 1;
								sleep 1;
							};
						};

						[_veh, [0, 30, 1]] call ica_fnc_setVelocityRas;
					};

				};
			};
		} else {
			if (!life_action_inUse) then {
				[] spawn {
					private["_handle"];
					_handle = [] spawn life_fnc_actionKeyHandler;
					waitUntil {scriptDone _handle};
					life_action_inUse = false;
				};
			};
		};
	};

	case DIK_RWIN: {
		if(!life_action_inUse) then {
			[] spawn {
				private["_handle"];
				_handle = [] spawn life_fnc_actionKeyHandler;
				waitUntil {scriptDone _handle};
				life_action_inUse = false;
			};
		};
	};
	//F5 Surrender
	case 63: {
		if (vehicle player == player && !(player getVariable ["restrained", false]) && !life_istazed) then	{
				if (player getVariable ["surrender", false]) then {
					player setVariable ["surrender", false, true];
				} else {
					[] spawn life_fnc_surrender;
				};
			};

	};

	//Restraining (Shift + R)
	case DIK_R: {
    if (_shift) then {_handled = true;};
		switch (playerSide) do {
			case west:	{
			if(_shift && !(player getVariable["restrained",false]) && !isNull cursorTarget && cursorTarget isKindOf "Man" && (isPlayer cursorTarget) && (side cursorTarget in [civilian,independent]) && alive cursorTarget && cursorTarget distance player < 3.5 && !(cursorTarget getVariable "Escorting") && !(cursorTarget getVariable "restrained") && !life_knockout && speed cursorTarget < 1) then
				{
					[] call life_fnc_restrainAction;
				};
			};

			case civilian: {
			if(_shift && !(player getVariable["restrained",false]) && !isNull cursorTarget && cursorTarget isKindOf "Man" && (isPlayer cursorTarget) && (side cursorTarget in [west,civilian,independent]) && alive cursorTarget && cursorTarget distance player < 3.5 && !(cursorTarget getVariable "Escorting") && !(cursorTarget getVariable "restrained") && !life_knockout && speed cursorTarget < 1) then
				{
					[] call life_fnc_civRestrainAction;
				};
			};
		};
	};

	//Knock out, this is experimental and yeah...
	case DIK_G: {
    if (_shift) then {_handled = true;};

	if (
		(_shift) AND (currentWeapon player == "") AND !(life_knockout) AND
		!(player getVariable["restrained",false]) AND (!life_istazed)
	) then {
		if (("for" call ica_fnc_expToLevel) >= 5) then {
			["pego"] call ica_fnc_hab_Golpe;
		};
	};

	if (
		_shift && !isNull cursorTarget && cursorTarget isKindOf "Man" && (isPlayer cursorTarget) && alive cursorTarget &&
		cursorTarget distance player < 4 && speed cursorTarget < 1 && !(cursorTarget getVariable "restrained")
	) then {
		if (
			(animationState cursorTarget) != "Incapacitated" &&
			(currentWeapon player == primaryWeapon player || currentWeapon player == handgunWeapon player) &&
			currentWeapon player != "" && !life_knockout && !(player getVariable["restrained",false]) && !life_istazed
		) then {
			[cursorTarget] spawn life_fnc_knockoutAction;
		};
	};
};

	// O, police gate opener
	case DIK_O: {
		if (!_shift && !_alt && !_ctrlKey && (playerSide == west) && (vehicle player != player)) then {
			[] call life_fnc_copOpener;
		};
 		if (!_shift && !_alt && _ctrlKey) then {
			call ica_fnc_reporte;
		};
	};


    case DIK_SUBTRACT: {
	    if (_ctrlKey) then {
				if (!isNil {Distanciazo}) exitWith {hint "Sólo puedes hacer esto cada 5 segundos"};
				0 spawn {Distanciazo = true; sleep 5; Distanciazo = nil};

				if (isNil {Vision_distancia}) then {Vision_distancia = 2000};
				switch (Vision_distancia) do
				{
					case (500):
					{
					    hint "Tu vision ya es la minima!";
						setViewDistance 500;
					};
					case (1000):
					{
					    hint "Ahora tu vision es de 500m";
						setViewDistance 500;
						Vision_distancia = 500;
					};
					case (1500):
					{
					    hint "Ahora tu vision es de 1000m";
						setViewDistance 1000;
						Vision_distancia = 1000;
					};
					case (2000):
					{
					    hint "Ahora tu vision es de 1500m";
						setViewDistance 1500;
						Vision_distancia = 1500;
					};
				};
		};
 	};
    case DIK_ADD: {
	    if (_ctrlKey) then {
				if (!isNil {Distanciazo}) exitWith {hint "Sólo puedes hacer esto cada 5 segundos"};
				0 spawn {Distanciazo = true; sleep 5; Distanciazo = nil};

				if (isNil {Vision_distancia}) then {Vision_distancia = 2000};
				switch (Vision_distancia) do
				{
					case (500):
					{
					    hint "Ahora tu vision es de 1000m";
						setViewDistance 1000;
						Vision_distancia = 1000;
					};
					case (1000):
					{
					    hint "Ahora tu vision es de 1500m";
						setViewDistance 1500;
						Vision_distancia = 1500;
					};
					case (1500):
					{
					    hint "Ahora tu vision es de 2000m";
						setViewDistance 2000;
						Vision_distancia = 2000;
					};
					case (2000):
					{
					    hint "Tu vision ya es la maxima!";
						setViewDistance 2000;
					};
				};
		};
 	};


	//T Key (Trunk)
	// ica revelar todo a 5m
	case DIK_T: {
		if (!_alt && !_ctrlKey) then {
			if (vehicle player != player && alive vehicle player) then {
				if ((vehicle player) in life_vehicles) then {
					[vehicle player] call life_fnc_openInventory;
				};
			} else {
				if ((cursorTarget isKindOf "Car" OR cursorTarget isKindOf "Air" OR cursorTarget isKindOf "Ship" OR ((typeof cursorTarget) in listaCasas)) && player distance cursorTarget < 7 && vehicle player == player && alive cursorTarget) then {
					if(cursorTarget in life_vehicles OR {!(cursorTarget getVariable ["locked",true])}) then {
						[cursorTarget] call life_fnc_openInventory;
					};
				} else {
					call ica_fnc_revela;
				};
			};
		};
	};

	//L Key?

	case DIK_L: {
		if(!_alt && !_ctrlKey) then { [] call life_fnc_radar; };
	};
	//Y Player Menu
	case DIK_Y:
	{
		if (dialog) exitWith {closeDialog 0};
		if(!_alt && _ctrlKey && !dialog) then {
			// [] call fnc_opentablet;
			if (!isNil {hierbeado}) exitWith {hint "Sólo puedes hacer esto cada 20 segundos"};
			0 spawn {hierbeado = true; sleep 20; hierbeado = nil};

			if (isNil {hierba}) then {hierba = true};
			if (hierba) then {
				hint "Ahora ves hierba";
				setTerrainGrid 25;
			} else {
				hint "Ahora no ves hierba";
				setTerrainGrid 50;
			};
			hierba = !hierba;
		};
        if(_alt && !_ctrlKey && !dialog) then {
            if (!isNil {ambientazo}) exitWith {hint "Sólo puedes hacer esto cada 20 segundos"};
			0 spawn {ambientazo = true; sleep 20; ambientazo = nil};

			if (isNil {ambiente}) then {ambiente = true};
			if (ambiente) then {
				hint "Ahora escuchas el sonido ambiente";
				enableEnvironment true;
			} else {
				hint "Ahora no escuchas el sonido ambiente";
				enableEnvironment false;
			};
			ambiente = !ambiente;
		};
		if(!_alt && !_ctrlKey && !dialog) then {
			["menu"] spawn ica_fnc_menuY;
		};
	};
	//Shift+P = Menu Trol
	case DIK_P: {
		if(_shift) then {
			createdialog "Menutrol_dialog";
			_handled = true;
		};
	};
	//U Key
	case DIK_U: {
		if(!_alt && !_ctrlKey) then {
			if(vehicle player == player) then {
				_veh = cursorTarget;
			} else {
				_veh = vehicle player;
			};

			_listaventa = listaCasas + listaGarajes;
			if(((typeof _veh) in _listaventa) && playerSide == civilian) then {
				if(_veh in life_vehicles && player distance _veh < 8) then {
					_door = [_veh] call life_fnc_nearestDoor;
					// if(_door == 0) exitWith {hint localize "STR_House_Door_NotNear"};
					_locked = _veh getVariable [format["bis_disabled_Door_%1",_door],0];
					if(_locked == 0) then {
						// _veh animate [format["door%1",_door],0];
						{
							_veh setVariable[format["bis_disabled_Door_%1",_x],1,true];
						} forEach [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20];

						systemChat localize "STR_House_Door_Lock";
					} else {
						// _veh animate [format["door%1",_door],1];
						{
							_veh setVariable[format["bis_disabled_Door_%1",_x],0,true];
						} forEach [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20];

						systemChat localize "STR_House_Door_Unlock";
					};
				};
			} else {
				_locked = locked _veh;
				if(_veh in life_vehicles && player distance _veh < 8) then {
					if(_locked == 2) then {
						if(local _veh) then {
							_veh lock 0;
						} else {
							[[_veh,0],"life_fnc_lockVehicle",_veh,false] call life_fnc_MP;
						};

						hint composeText [ image "\pop_iconos\icons\unlock.paa", "Vehículo abierto" ];
						[[player,"abrecoche"],"life_fnc_say3D"] call life_fnc_MP;

					} else {
						if(local _veh) then {
							_veh lock 2;
						} else {
							[[_veh,2],"life_fnc_lockVehicle",_veh,false] call life_fnc_MP;
						};
						hint composeText [ image "\pop_iconos\icons\lock.paa", "Vehículo cerrado" ];
						[[player,"cierracoche"],"life_fnc_say3D"] call life_fnc_MP;
					};
				};
			};
		};
	};

	// F1 - TAPONES
	case DIK_F1: {
		[] call life_fnc_fadeSound;
	};

 //ANTI ALT + F4
	case DIK_F4:
	{
	/*	if (playerSide == west) then {
		["menu"] spawn ica_fnc_centralita;
		};
    */
		if(_alt && !_shift && !_ctrlKey) then {
			pop_atmdin = pop_atmdin * 0.85;
			_player setDamage 1;
			[[3,format["AVISO DE ALTF4: %1 ha usado ALT+F4 para desconectarse.",player getVariable["realname",name player]]],"life_fnc_broadcast",nil,false] call life_fnc_MP;
			[[1,format["AVISO DEL SERVIDOR: %1 ha usado ALT+F4 para desconectarse. Reportalo a un administrador.",player getVariable["realname",name player]]],"life_fnc_broadcast",nil,false] call life_fnc_MP;
			[[0,format["AVISO DEL SERVIDOR: %1 ha usado ALT+F4 para desconectarse. Reportalo a un administrador.",player getVariable["realname",name player]]],"life_fnc_broadcast",nil,false] call life_fnc_MP;
		};
	};

	// ANTI CTRL + ALT + DEL
	case DIK_DELETE: {
		if(_ctrlKey && _alt)  then {
			pop_atmdin = pop_atmdin - (pop_atmdin * 0.15);
			[[3,format["AVISO DE CTRLALTSUPR: %1 ha usado CTRL+ALT+SUPR para desconectarse.",player getVariable["realname",name player]]],"life_fnc_broadcast",nil,false] call life_fnc_MP;
			[[1,format["AVISO DEL SERVIDOR: %1 ha usado CTRL+ALT+SUPR para desconectarse. Reportalo a un administrador.",player getVariable["realname",name player]]],"life_fnc_broadcast",nil,false] call life_fnc_MP;
			[[0,format["AVISO DEL SERVIDOR: %1 ha usado CTRL+ALT+SUPR para desconectarse. Reportalo a un administrador.",player getVariable["realname",name player]]],"life_fnc_broadcast",nil,false] call life_fnc_MP;
		};
	};

	// ANTI CTRL + ESC
	case DIK_ESCAPE: {
		if( _ctrlKey )  then {
			pop_atmdin = pop_atmdin - (pop_atmdin * 0.15);
			[[3,format["AVISO DE ALTF4: %1 ha usado ALT+F4 para desconectarse.",player getVariable["realname",name player]]],"life_fnc_broadcast",nil,false] call life_fnc_MP;
			[[1,format["AVISO DEL SERVIDOR: %1 ha usado ALT+F4 para desconectarse. Reportalo a un administrador.",player getVariable["realname",name player]]],"life_fnc_broadcast",nil,false] call life_fnc_MP;
			[[0,format["AVISO DEL SERVIDOR: %1 ha usado ALT+F4 para desconectarse. Reportalo a un administrador.",player getVariable["realname",name player]]],"life_fnc_broadcast",nil,false] call life_fnc_MP;
		};
	};
	// Tabulando
	case DIK_TAB: {
		if (!_alt && !_ctrlKey) then {
			["menu"] call ica_fnc_diagnostico;
		};
		if(_alt) then {
			diag_log format ["SERVIDOR POPLIFE: %1 usando ALT+TABULADOR SOSPECHOSO....",(_tiempo),player getVariable["realname",name player]];
		};
	};

	//F2 DEBUG Admin
	case DIK_F2: {
		if(__GETC__(life_adminlevel) > 3) then {
			[] call life_fnc_adminDebug;
		};
	};
	// F3
	case DIK_F3: {
		if (__GETC__(life_adminlevel) > 0) then {
			createDialog "life_admin_menu";
		};
	};

	case DIK_F8: {
		if (isnil {dayz_mod}) then {
			PP_colorC = ppEffectCreate ["ColorCorrections",1500];
			PP_colorC ppEffectEnable true;
			PP_colorC ppEffectAdjust [1,1.35,-0.1,[0.4,0.2,-0.3,0.1],[0,0,0,1],[20,20,20,1],[0,0,0,0,0,0,0.59]];
			PP_colorC ppEffectCommit 0;
			PP_dynamic = ppEffectCreate ["DynamicBlur",500];
			PP_dynamic ppEffectEnable true;
			PP_dynamic ppEffectAdjust [0.1];
			PP_dynamic ppEffectCommit 0;
			PP_film = ppEffectCreate ["FilmGrain",2000];
			PP_film ppEffectEnable true;
			PP_film ppEffectAdjust [0.18,20,1,0.5,0.5,true];
			PP_film ppEffectCommit 0;
			dayz_mod = true;
		} else {
			ppEffectDestroy PP_colorC;
			ppEffectDestroy PP_dynamic;
			ppEffectDestroy PP_film;
			dayz_mod = nil;
		};
	};
    case DIK_1 : {
			if (__GETC__(life_cop_level) > 0) then {
                [] call life_fnc_showBadge;
			};
		};
	case 41 : {
		switch (side player) do
		{
			case west: {
				[] call life_fnc_showBadge;
			};

			case civilian: {
				[] call life_fnc_showDNI;

			};
			case independent: {
				[] call life_fnc_showDNI;
			};
		};

		_handled = true;
	};
};

_handled;