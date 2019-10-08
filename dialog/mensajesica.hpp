class mensajesica
{
	idd = -1;
	movingenable = true;
	onLoad = "uiNamespace setVariable ['mensajesica', _this select 0]; ";
	onUnLoad = "uiNamespace setVariable ['mensajesica', nil]; ";

	class controls {
		class lista: RscListbox
		{
			idc = 7080;
			sizeEx = 0.036;

			x = 0.37;
			y = 0.008;
			w = 0.3375;
			h = 0.536;
		};
		class entrada: RscEdit
		{
			idc = 7082;
			style = 16;

			x = 0.37;
			y = 0.592;
			w = 0.3375;
			h = 0.184;
		};
		class desplegable: RscCombo
		{
			idc = 7081;

			x = 0.37;
			y = 0.544;
			w = 0.3375;
			h = 0.044;
		};
		class boton: RscButton
		{
			idc = 7083;

			text = "ENVIAR"; //--- ToDo: Localize;
			x = 0.37;
			y = 0.78;
			w = 0.3375;
			h = 0.044;
		};
	};
};



