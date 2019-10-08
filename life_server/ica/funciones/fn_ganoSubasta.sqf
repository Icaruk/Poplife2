
private ["_quien", "_cuanto"];
_quien = _this select 0;
_cuanto = _this select 1;

if (name player == _quien) then {
	pop_atmdin = pop_atmdin - _cuanto;
	iniciaSubasta = nil;
	publicVariable "iniciaSubasta";

	hint format ["Has ganado la subasta, te pertenece toda la actividad económica de ese sector durante 1h. \n\nSe te han descontado de tu cuenta los %1€ de tu puja.", _cuanto];
	[[0, format ["%1 ha ganado una subasta.", name player]],"life_fnc_broadcast",true,false] call life_fnc_MP;
	paq = [player, "anuncio",
		[8, format ["%1", name player], [1,0,0], 1.5, "ha ganado una subasta", [1,1,1], 1]
	]; publicVariableServer "paq"; paq = nil;
};
