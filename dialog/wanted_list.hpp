class life_wanted_menu {
	idd = 2400;
	name= "life_wanted_menu";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "[] call life_fnc_wantedMenu;";
	
	class controlsBackground {
		class Life_RscTitleBackground:RscPicture {
		text = "\POP_Info\acj\policia.paa";
			x = 0.184931 * safezoneW + safezoneX;
			y = 0.140043 * safezoneH + safezoneY;
			w = 0.618794 * safezoneW;
			h = 0.715073 * safezoneH;
		};
		
		class MainBackground:Life_RscText {
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = 0 * safezoneW + safezoneX;
			y = 0 * safezoneH + safezoneY;
			w = 0 * safezoneW;
			h = 0 * safezoneH;
		};
	};
	
	class controls {

		
		class Title : Life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = -1;
			text = "$STR_Wanted_Title";
			x = 0 * safezoneW + safezoneX;
			y = 0 * safezoneH + safezoneY;
			w = 0 * safezoneW;
			h = 0 * safezoneH;
		};
		
		class WantedConnection : Title {
			idc = 2404;
			style = 1;
			text = "";
		};
		
		class WantedList : Life_RscListBox 
		{
			idc = 2401;
			text = "";
			sizeEx = 0.035;
			onLBSelChanged = "[] call life_fnc_wantedInfo";
			x = 0.346042 * safezoneW + safezoneX;
			y = 0.396667 * safezoneH + safezoneY;
			w = 0.0757812 * safezoneW;
			h = 0.245704 * safezoneH;
		};
		
		class WantedDetails : Life_RscListBox
		{
			idc = 2402;
			text = "";
			sizeEx = 0.035;
			colorBackground[] = {0, 0, 0, 0};
			
			x = 0.500000 * safezoneW + safezoneX;
			y = 0.391593 * safezoneH + safezoneY;
			w = 0.255833 * safezoneW;
			h = 0.283703 * safezoneH;
		};
		
		class BountyPrice : Life_RscText
		{
			idc = 2403;
			text = "";
			x = 0 * safezoneW + safezoneX;
			y = 0 * safezoneH + safezoneY;
			w = 0 * safezoneW;
			h = 0 * safezoneH;
		};
		
		class CloseButtonKey : Life_RscButtonMenu {
			idc = -1;
			text = "$STR_Global_Close";
			onButtonClick = "closeDialog 0;";
			x = 0.244049 * safezoneW + safezoneX;
			y = 0.555006 * safezoneH + safezoneY;
			w = 0.0876625 * safezoneW;
			h = 0.0440045 * safezoneH;
		};
		
		class PardonButtonKey : Life_RscButtonMenu {
			idc = 2405;
			text = "$STR_Wanted_Pardon";
			onButtonClick = "[] call life_fnc_pardon; closeDialog 0;";
			x = 0.244049 * safezoneW + safezoneX;
			y = 0.422992 * safezoneH + safezoneY;
			w = 0.0876625 * safezoneW;
			h = 0.0440045 * safezoneH;
		};
					
	};
};