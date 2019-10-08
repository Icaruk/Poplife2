
/*
por: Icaruk

*/

while {true} do {
	sleep (60 * 10);
	_i = floor (pop_atmdin * 0.0005);
	pop_atmdin = pop_atmdin - _i;
	
	systemChat format ["Se te han deducido %1€ de impuestos, hacienda somos todos.", _i];
};
