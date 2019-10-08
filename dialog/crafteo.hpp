
class crafteo {
	idd = 5040;
	movingEnable = 0;
	onLoad = "uiNamespace setVariable ['crafteo', _this select 0];";
	onUnLoad = "uiNamespace setVariable ['crafteo', nil]; ";

	class controls {
		class IGUIBack_2200: IGUIBack
		{
			idc = -1;
			x = 0.291688 * safezoneW + safezoneX;
			y = 0.3064 * safezoneH + safezoneY;
			w = 0.415594 * safezoneW;
			h = 0.2618 * safezoneH;
			colorBackground[] = {0,0,0,0.9};
		};
		class fondoBarrita: RscPicture
		{
			idc = -1;
			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 0.372126 * safezoneW + safezoneX;
			y = 0.577 * safezoneH + safezoneY;
			w = 0.335156 * safezoneW;
			h = 0.0484 * safezoneH;
			colorText[] = {0,0,0,1};
		};	
		class barrita: RscProgressSinFrame
		{
			idc = 5038;
			text = "";
			x = 0.372126 * safezoneW + safezoneX;
			y = 0.577 * safezoneH + safezoneY;
			w = 0.335156 * safezoneW;
			h = 0.0484 * safezoneH;
			colorBar[] = {1,1,1,1};
		};		
		class separador: RscPicture
		{
			idc = -1;
			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 0.291688 * safezoneW + safezoneX;
			y = 0.5682 * safezoneH + safezoneY;
			w = 0.415579 * safezoneW;
			h = 0.0088 * safezoneH;
			colorText[] = {1,1,1,1};
		};
		class RscText_1000: RscText
		{
			idc = -1;
			text = "Categoria"; //--- ToDo: Localize;
			x = 0.313341 * safezoneW + safezoneX;
			y = 0.3108 * safezoneH + safezoneY;
			w = 0.053625 * safezoneW;
			h = 0.033 * safezoneH;
			colorText[] = {1,0.65,0,1};
			colorBackground[] = {1,1,1,0};
		};
		class RscText_1001: RscText
		{
			idc = -1;
			text = "Recetas"; //--- ToDo: Localize;
			x = 0.45153 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.053625 * safezoneW;
			h = 0.033 * safezoneH;
			colorText[] = {1,0.65,0,1};
			colorBackground[] = {1,1,1,0};
		};
		class RscText_1002: RscText
		{
			idc = -1;
			text = "Ingredientes"; //--- ToDo: Localize;
			x = 0.604161 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.0670312 * safezoneW;
			h = 0.033 * safezoneH;
			colorText[] = {1,0.65,0,1};
			colorBackground[] = {1,1,1,0};
		};	
		class RscText_1003: RscText
		{
			idc = -1;
			text = ">>"; //--- ToDo: Localize;
			x = 0.385531 * safezoneW + safezoneX;
			y = 0.4208 * safezoneH + safezoneY;
			w = 0.0123751 * safezoneW;
			h = 0.055 * safezoneH;
			colorText[] = {0,1,0,1};
			colorBackground[] = {1,1,1,0};
		};
		class RscText_1004: RscText
		{
			idc = -1;
			text = ">>"; //--- ToDo: Localize;
			x = 0.552553 * safezoneW + safezoneX;
			y = 0.4208 * safezoneH + safezoneY;
			w = 0.0123751 * safezoneW;
			h = 0.055 * safezoneH;
			colorText[] = {0,1,0,1};
			colorBackground[] = {1,1,1,0};
		};		
		
		class lista1: RscListbox
		{
			idc = 5035;
			x = 0.305091 * safezoneW + safezoneX;
			y = 0.3416 * safezoneH + safezoneY;
			w = 0.078375 * safezoneW;
			h = 0.2112 * safezoneH;
			sizeEx = 0.035;
			onLBSelChanged = "['actualiza2'] call ica_fnc_crafteo";
		};
		class lista2: RscListbox
		{
			idc = 5036;
			x = 0.401 * safezoneW + safezoneX;
			y = 0.3416 * safezoneH + safezoneY;
			w = 0.149531 * safezoneW;
			h = 0.2112 * safezoneH;
			sizeEx = 0.035;
			onLBSelChanged = "['actualiza3'] call ica_fnc_crafteo";
		};
		class lista3: RscListbox
		{
			idc = 5037;
			x = 0.569095 * safezoneW + safezoneX;
			y = 0.3416 * safezoneH + safezoneY;
			w = 0.128906 * safezoneW;
			h = 0.2112 * safezoneH;
			sizeEx = 0.035;
		};
		class boton: RscButton
		{
			idc = 5039;
			text = "CRAFT"; //--- ToDo: Localize;
			x = 0.291689 * safezoneW + safezoneX;
			y = 0.577 * safezoneH + safezoneY;
			w = 0.0804373 * safezoneW;
			h = 0.0484 * safezoneH;
			colorBackground[] = {0,0,0,1};
			colorDisabled[] = {1,1,1,1};
			
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