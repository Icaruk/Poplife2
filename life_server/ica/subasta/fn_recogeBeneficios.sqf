
/*
por: Icaruk
	["almacen1"] spawn ica_fnc_recogeBeneficios;
*/

_que = _this select 0;
_soy = name player;

if (!isNil {ocupado}) exitWith {hint "Espera 4s"};
[] spawn {
	ocupado = true;
	sleep 4;
	ocupado = nil;
};

_strSubasta = str _que;
_strBeneficiosQue = format ["ben%1", _que];
[player, ["subastaActual", _que, _strBeneficiosQue]] call ica_fnc_varToServer;

if (subastaActual == _que) exitWith {hint "Ahora mismo hay una subasta con este sector"};

_var = missionNamespace getVariable _que;

if (isNil {_var}) exitWith {hint "Este sector no te pertenece"};
if ((_soy != (_var select 0)) OR ((_var select 0) == "")) exitWith {hint "Este sector no te pertenece."};

_din = missionNamespace getVariable _strBeneficiosQue;
if (_din == 0) exitWith {hint "No hay beneficios, de momento."};
missionNamespace setVariable [_strBeneficiosQue, 0];
publicVariableServer _strBeneficiosQue;

if (!isNil {_din}) then {
	_multi = switch (_que) do {
		case "almacen1": {0.17};
		case "almacen2": {0.13};
		case "comercios": {0.1};
		case "transportes": {0.1};
		case "mineria": {0.13};
	};
	
	_din = round (_din  * _multi);
	pop_din = pop_din + _din;
	hint format ["Esta subasta te ha otorgado %1€ en beneficios.", _din];	
};
