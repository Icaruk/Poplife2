
playsound "Intro";

titleText ["", "PLAIN"];
sleep 3;
[	
	parseText format
	["<t align='center' size='1.2'><t font='PuristaBold' size='1.6'>%1</t><br/>%2<br/>%3</t>", "PoP Life 2.0", "por Icaruk y PoP", "basado en Tonic"],
	[0.35, 0.2, 0.3, 5],
	[10, 10],
	8,
	1.2,
	0
] spawn BIS_fnc_textTiles;

sleep 46;

[	
	parseText format
	["<t align='center' size='1.2'><t font='PuristaBold' size='1.6'>%1</t><br/>%2</t>", "El resto de la canción la puedes encontrar en youtube", "Icaruk - Pop Life 2.0"],
	[0.35, 0.2, 0.3, 5],
	[10, 10],
	4,
	1.2,
	0
] spawn BIS_fnc_textTiles;