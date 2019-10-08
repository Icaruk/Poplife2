#include <macro.h>

// Run Some Client Stuff
execVM"A3L_Functions\a3lint.sqf";
[] execVM "A3L_Stuff\jailsystem.sqf";

life_firstSpawn = true;
life_session_completed = false;
private["_handle","_timeStamp"];

waitUntil {!isNull player && player == player};

_t0 = diag_tickTime;
diag_log "--------------------------------------------------------------";
diag_log "-------- Cargando funciones Icaruk... ----------";
diag_log "--------------------------------------------------------------";

waitUntil {!isNil {arr}};
[player, arr] call ica_fnc_varToServer;
waitUntil {recibido};

diag_log "--------------------------------------------------------------";
diag_log format ["-------- Funciones Icaruk cargadas en %1s. --------", diag_tickTime - _t0];
diag_log "--------------------------------------------------------------";

titleText ["Inicializando cliente, espera por favor...", "PLAIN"];

_timeStamp = diag_tickTime;
diag_log "------------------------------------------------------------------------------------------------------";
diag_log "--------------------------------- Starting ArmA 3 Life Client Init ----------------------------------";
diag_log "------------------------------------------------------------------------------------------------------";

//Setup initial client core functions
diag_log "::Life Client:: Initialization Variables";
[] call compile PreprocessFileLineNumbers "core\configuration.sqf";
diag_log "::Life Client:: Variables initialized";
diag_log "::Life Client:: Setting up Eventhandlers";
[] call life_fnc_setupEVH;
diag_log "::Life Client:: Eventhandlers completed";
diag_log "::Life Client:: Setting up user actions";
[] call life_fnc_setupActions;
diag_log "::Life Client:: User actions completed";
diag_log "::Life Client:: Waiting for server functions to transfer..";
waitUntil {(!isNil {TON_fnc_clientGangLeader})};
diag_log "::Life Client:: Received server functions.";
diag_log "::Life Client:: Executed custom client functions";

titleText ["Espera a que el servidor haga sus cosas...", "PLAIN"];
diag_log "::Life Client:: Waiting for the server to be ready..";
waitUntil{!isNil "life_server_isReady"};
waitUntil{(life_server_isReady OR !isNil "life_server_extDB_notLoaded")};
if(!isNil "life_server_extDB_notLoaded") exitWith {
	diag_log "::Life Client:: Server did not load extDB";
	999999 cutText ["The server-side extension extDB was not loaded into the engine, report this to the server admin.","BLACK FADED"];
	999999 cutFadeOut 99999999;
};
[] call SOCK_fnc_dataQuery;
waitUntil {life_session_completed};

titleText ["Cargando datos...", "PLAIN"];

//diag_log "::Life Client:: Group Base Execution";
if (count playableUnits > 0) then {
	[] spawn life_fnc_escInterupt;
};

if ((profilenamespace getVariable "rutome") > 0 ) then {0 spawn ica_fnc_nigromante; noSpawn = true}; // estoy muerto
if (!isNil {profileNamespace getVariable "noiposci"}) then {[false] spawn ica_fnc_posicion; noSpawn = true}; // estoy vivo y voy a mi posicion



_handle = [] spawn life_fnc_inicio;
waitUntil {scriptDone _handle};

//Para la vision y carga de los jugadores
setViewDistance 2000;
setTerrainGrid 50;

//Radio y sonidos de radio ambientales
player setVariable ["BIS_noCoreConversations", true];
enableSentences false;
enableRadio false;
0 fadeRadio 0;
enableEnvironment true;


player setVariable["restrained",false,true];
player setVariable["Escorting",false,true];
player setVariable["transporting",false,true];
player setVariable["surrender",false,true]; //Set surrender to false
player setVariable["lockpicking",false,true];
//activar medical advaned system

diag_log "Past Settings Init";
[] execFSM "core\fsm\client.fsm";
diag_log "Executing client.fsm";
waitUntil {!(isNull (findDisplay 46))};
diag_log "Display 46 Found";
(findDisplay 46) displayAddEventHandler ["KeyDown", "_this call life_fnc_keyHandler"];
player addRating 99999999;
diag_log "------------------------------------------------------------------------------------------------------";
diag_log format["                End of Altis Life Client Init :: Total Execution Time %1 seconds ",(diag_tickTime) - _timeStamp];
diag_log "------------------------------------------------------------------------------------------------------";
life_sidechat = true;
[[player,life_sidechat,playerSide],"TON_fnc_managesc",false,false] call life_fnc_MP;
0 cutText ["","BLACK IN"];

// [] call life_fnc_hudSetup; // esto es de A3L, ahora se usa lo de ica
//LIFE_ID_PlayerTags = ["LIFE_PlayerTags","onEachFrame","life_fnc_playerTags"] call BIS_fnc_addStackedEventHandler;
//LIFE_ID_RevealObjects = ["LIFE_RevealObjects","onEachFrame","life_fnc_revealObjects"] call BIS_fnc_addStackedEventHandler;
//[] call life_fnc_settingsInit;

player setVariable["steam64ID",getPlayerUID player];
player setVariable["realname",profileName,true];
life_fnc_moveIn = compileFinal
"
	player moveInCargo (_this select 0);
";

life_fnc_garageRefund = compileFinal
"
	_price = _this select 0;
	_unit = _this select 1;
	if(_unit != player) exitWith {};
	pop_atmdin = pop_atmdin + _price;
";

[] call life_fnc_initRacing;
[] execVM "ica\initica.sqf";
//Añadir LLaves
[] execVM "acj\fn_addKey.sqf";


Desc = 1;


//Announce system
call compile preprocessFileLineNumbers "core\functions\fn_announce.sqf";

__CONST__(life_paycheck,life_paycheck); //Make the paycheck static.

[] spawn life_fnc_asyncInit;
/*
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
*/