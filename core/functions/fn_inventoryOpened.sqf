/*
	Author: Bryan "Tonic" Boardwine

	Description:
	For the mean time it blocks the player from opening another persons backpack
*/
private["_container","_unit"];
if(count _this == 1) exitWith {false};
_unit = _this select 0;
_container = _this select 1;

/*
if ((animationState player) == "deadstate") exitWith { // si estoy muerto no puedo usar inventario
	[] spawn {
		waitUntil {!isNull (findDisplay 602)};
		closeDialog 0;
	};
	if (!isNil {llamadaSocorroHecha}) exitWith {hint "Sólo puedes hacer una llamada de socorro cada minuto"};
	0 spawn {llamadaSocorroHecha = true; sleep 60; llamadaSocorroHecha = nil};

	[[15, "Llamada de socorro", [0,1,0], 1.8, format ["%1", mapGridPosition player], [1,1,1], 1.4], "ica_fnc_anuncio", INDEPENDENT, false, false] call life_fnc_MP;
	titleText ["Los médicos han recibido tu llamada de socorro", "PLAIN"];
};
*/

if (!isNil {_container getVariable "bloqueado"}) exitWith {
	[] spawn {
		waitUntil {!isNull (findDisplay 602)};
		closeDialog 0;
	};
	hint "Lo intentas, pero no se abre";
};

if (((typeOf _container) == "POP_cajaDiamantes_obj") AND (isNil {puedoAbrir})) exitWith {
	[] spawn {
		waitUntil {!isNull (findDisplay 602)};
		closeDialog 0;
		[10, "Abriendo..."] spawn ica_fnc_barrita;
		sleep 10;
		titleText ["Ya puedes abrir la caja", "PLAIN", 0.1];
		["envio", player, 30, 60*20] call ica_fnc_bloqueoDinero;
		puedoAbrir = true;
		sleep 3;
		puedoAbrir = nil;
	};
};


_isPack = getNumber(configFile >> "CfgVehicles" >> (typeOf _container) >> "isBackpack");
if(_isPack == 1 && playerSide != west) then {
    hint localize "STR_MISC_Backpack";
    [] spawn {
        waitUntil {!isNull (findDisplay 602)};
        closeDialog 0;
    };
};

if((typeOf _container) in ["pop_caja_armariop_box","pop_caja_armariog_box"]) exitWith {
	_house = nearestBuilding (getPosATL player);
	if(!(_house in life_vehicles) && {(_house getVariable ["locked",false])}) then {
		hint localize "STR_House_ContainerDeny";
		[] spawn {
			waitUntil {!isNull (findDisplay 602)};
			closeDialog 0;
		};
	};
};

_listaCajasCoca = [cajacoca1, cajacoca2, cajacoca3];
if(_container in _listaCajasCoca) exitWith {
	if (((nearestObjects [_container, ["pop_contenedor"], 3] select 0) animationPhase "door1") == 0) then {
		hint "No puedes abrir la caja";
		[] spawn {
			waitUntil {!isNull (findDisplay 602)};
			closeDialog 0;
		};
	};
};

if(_container isKindOf "LandVehicle" OR _container isKindOf "Ship" OR _container isKindOf "Air") exitWith {
	if(!(_container in life_vehicles) && {(locked _container) == 2}) exitWith {
		hint localize "STR_MISC_VehInventory";
		[] spawn {
			waitUntil {!isNull (findDisplay 602)};
			closeDialog 0;
		};
	};
};

//Allow alive players who've been knocked out to be looted, just not the dead ones
if(_container isKindOf "Man" && !alive _container) exitWith {
	hint localize "STR_NOTF_NoLootingPerson";
	[] spawn {
		waitUntil {!isNull (findDisplay 602)};
		closeDialog 0;
closeDialog 0;
	};
};

if(_container isKindOf "Car" || _container isKindOf "Ship" || _container isKindOf "Air") exitWith {
	if(!(_container in life_vehicles) && {(locked _container) == 2}) exitWith {
	hint "You're not allowed to open the vehicles inventory while it's locked.";
	[] spawn {
	waitUntil {!isNull (findDisplay 602)};
	closeDialog 0;
	};
};
};