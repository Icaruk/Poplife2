
class medico
{
	idd = -1;
	movingenable = true;
	onLoad = "uiNamespace setVariable ['medico', _this select 0];";
	onUnLoad = "uiNamespace setVariable ['medico', nil]; ";
	
	class controls {
		class cabeza: RscPicture	{
			idc = 7021;
			text = "\pop_iconos\icons\medica\cab.paa";
			x = 0.055;
			y = 0.2;
			w = 0.4275;
			h = 0.6;
		};
		class pecho: RscPicture	{
			idc = 7022;
			text = "\pop_iconos\icons\medica\pec.paa";
			x = 0.055;
			y = 0.2;
			w = 0.4275;
			h = 0.6;
		};
		class brazos: RscPicture	{
			idc = 7023;
			text = "\pop_iconos\icons\medica\bra.paa";
			x = 0.055;
			y = 0.2;
			w = 0.4275;
			h = 0.6;
		};
		class piernas: RscPicture	{
			idc = 7024;
			text = "\pop_iconos\icons\medica\pie.paa";
			x = 0.055;
			y = 0.2;
			w = 0.4275;
			h = 0.6;
		};
 
		// heridas
		class cabSan: RscPicture	{
			idc = 7025;
			text = "";
			x = 0.055;
			y = 0.2;
			w = 0.4275;
			h = 0.6;
		};
		class pecSan: RscPicture	{
			idc = 7026;
			text = "";
			x = 0.055;
			y = 0.2;
			w = 0.4275;
			h = 0.6;
		};
		class braSan: RscPicture	{
			idc = 7027;
			text = "";
			x = 0.055;
			y = 0.2;
			w = 0.4275;
			h = 0.6;
		};
		class pieSan: RscPicture {
			idc = 7028;
			text = "";
			x = 0.055;
			y = 0.2;
			w = 0.4275;
			h = 0.6;
		};
		
		class lista: RscListbox {
			idc = 7018;
			sizeEx = 0.035;
			x = 0.55;
			y = 0.2;
			w = 0.315;
			h = 0.6;
			colorBackground[] = {0,0,0,0.7};
			rowHeight = 0.07;
		};
		class botonTratar: RscButton {
			idc = 7020;

			text = "Tratar"; //--- ToDo: Localize;
			x = 0.55;
			y = 0.8;
			w = 0.3125;
			h = 0.04;
		};
		class botonDiag: RscButton	{
			idc = 7019;

			text = "Diagnosticar"; //--- ToDo: Localize;
			x = 0.0550001;
			y = 0.8;
			w = 0.425;
			h = 0.04;
		};
		class RscStructuredText_1100: RscStructuredText {
			idc = 7017;

			text = "No hay paciente"; //--- ToDo: Localize;
			x = 0.06;
			y = 0.14;
			w = 0.415;
			h = 0.056;
			colorBackground[] = {0,0,0,0};
		};
		
		class selCab: RscButton {
			idc = 7029;

			x = 0.2225;
			y = 0.212;
			w = 0.1;
			h = 0.088;
			colorBackground[] = {0,0,0,0};
		};
		class selpec: RscButton {
			idc = 7030;

			x = 0.24;
			y = 0.3;
			w = 0.0650001;
			h = 0.184;
			colorBackground[] = {0,0,0,0};
		};
		class selbra: RscButton {
			idc = 7031;

			x = 0.185;
			y = 0.3;
			w = 0.0525;
			h = 0.22;
			colorBackground[] = {0,0,0,0};
		};
		class selbra2: RscButton {
			idc = 7032;

			x = 0.305;
			y = 0.3;
			w = 0.0525;
			h = 0.22;
			colorBackground[] = {0,0,0,0};
		};

		class selpie: RscButton {
			idc = 7033;

			x = 0.2225;
			y = 0.484;
			w = 0.1;
			h = 0.3;
			colorBackground[] = {0,0,0,0};
		};
		class sangre: RscText {
			idc = 7034;

			text = "Sangre: ?"; //--- ToDo: Localize;
			x = 0.325;
			y = 0.736;
			w = 0.1475;
			h = 0.06;
			colorText[] = {1,1,1,1};
		};

		class icaruk: RscText
		{
			idc = -1;
			text = "Icaruk"; //--- ToDo: Localize;
			x = 0.964445 * safezoneW + safezoneX;
			y = -0.0166667 * safezoneH + safezoneY;
			w = 0.0412603 * safezoneW;
			h = 0.055 * safezoneH;
			colorBackground[] = {0,0,0,0};
		};
	};
};



