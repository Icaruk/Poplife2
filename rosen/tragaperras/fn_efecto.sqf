/*
	Creado por Rosen
*/

bucle1 = {
	disableSerialization;
	_display = findDisplay 8750;
	_img1 = _display displayCtrl 8752;
	_img2 = _display displayCtrl 8753;
	_img3 = _display displayCtrl 8754;
	while {a>0} do {
	
		_img1 ctrlSetText "\tragaperras\imagenes\slot_zero.jpg";
		sleep 0.05;
		_img1 ctrlSetText "\tragaperras\imagenes\slot_one.jpg";
		sleep 0.05;
		_img1 ctrlSetText "\tragaperras\imagenes\slot_two.jpg";
		sleep 0.05;
		_img1 ctrlSetText "\tragaperras\imagenes\slot_three.jpg";
		sleep 0.05;
		_img1 ctrlSetText "\tragaperras\imagenes\slot_four.jpg";
		sleep 0.05;
		_img1 ctrlSetText "\tragaperras\imagenes\slot_five.jpg";
		sleep 0.05;
		_img1 ctrlSetText "\tragaperras\imagenes\slot_six.jpg";
		sleep 0.05;
		_img1 ctrlSetText "\tragaperras\imagenes\slot_seven.jpg";
	};
	_img1 ctrlSetText "\tragaperras\imagenes\0.jpg";
};

bucle2 = {
	disableSerialization;
	_display = findDisplay 8750;
	_img1 = _display displayCtrl 8752;
	_img2 = _display displayCtrl 8753;
	_img3 = _display displayCtrl 8754;
	while {b>0} do {
		_img2 ctrlSetText "\tragaperras\imagenes\slot_zero.jpg";
		sleep 0.05;
		_img2 ctrlSetText "\tragaperras\imagenes\slot_one.jpg";
		sleep 0.05;
		_img2 ctrlSetText "\tragaperras\imagenes\slot_two.jpg";
		sleep 0.05;
		_img2 ctrlSetText "\tragaperras\imagenes\slot_three.jpg";
		sleep 0.05;
		_img2 ctrlSetText "\tragaperras\imagenes\slot_four.jpg";
		sleep 0.05;
		_img2 ctrlSetText "\tragaperras\imagenes\slot_five.jpg";
		sleep 0.05;
		_img2 ctrlSetText "\tragaperras\imagenes\slot_six.jpg";
		sleep 0.05;
		_img2 ctrlSetText "\tragaperras\imagenes\slot_seven.jpg";
	};
	_img2 ctrlSetText "\tragaperras\imagenes\0.jpg";
};

bucle3 = {	
	disableSerialization;
	_display = findDisplay 8750;
	_img1 = _display displayCtrl 8752;
	_img2 = _display displayCtrl 8753;
	_img3 = _display displayCtrl 8754;
	while {c>0} do {
		_img3 ctrlSetText "\tragaperras\imagenes\slot_zero.jpg";
		sleep 0.05;
		_img3 ctrlSetText "\tragaperras\imagenes\slot_one.jpg";
		sleep 0.05;
		_img3 ctrlSetText "\tragaperras\imagenes\slot_two.jpg";
		sleep 0.05;
		_img3 ctrlSetText "\tragaperras\imagenes\slot_three.jpg";
		sleep 0.05;
		_img3 ctrlSetText "\tragaperras\imagenes\slot_four.jpg";
		sleep 0.05;
		_img3 ctrlSetText "\tragaperras\imagenes\slot_five.jpg";
		sleep 0.05;
		_img3 ctrlSetText "\tragaperras\imagenes\slot_six.jpg";
		sleep 0.05;
		_img3 ctrlSetText "\tragaperras\imagenes\slot_seven.jpg";
	};
	_img3 ctrlSetText "\tragaperras\imagenes\0.jpg";
};

[] spawn bucle1;
[] spawn bucle2;
[] spawn bucle3;	