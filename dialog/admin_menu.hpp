class life_admin_menu {
    idd = 2900;
    name= "life_admin_menu";
    movingEnable = false;
    enableSimulation = true;
    onLoad = "[] spawn life_fnc_adminMenu;";
    
    class controlsBackground {
        class Life_RscTitleBackground:Life_RscText {
         colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
            idc = -1;
            x = 0.7;
            y = 0.2;
            w = 0.8;
            h = (1 / 25);
        };
        
        class MainBackground:Life_RscText {
            colorBackground[] = {0, 0, 0, 0.7};
            idc = -1;
            x = 0.7;
            y = 0.2 + (11 / 250);
            w = 0.8;
            h = 0.6 - (2 / 250);
        };
    };
    
    class controls {

        
        class Title : Life_RscTitle {
            colorBackground[] = {0, 0, 0, 0};
            idc = 2901;
            text = "$STR_Admin_Title";
            x = 0.7;
            y = 0.2;
            w = 0.6;
            h = (1 / 25);
        };
        
        class PlayerList_Admin : Life_RscListBox
        {
            idc = 2902;
            text = "";
            sizeEx = 0.035;
            //colorBackground[] = {0,0,0,0};
            onLBSelChanged = "[_this] spawn life_fnc_adminQuery";
            
            x = 0.72; y = 0.26;
            w = 0.30; h = 0.4;
        };
        
        class PlayerBInfo : Life_RscStructuredText
        {
            idc = 2903;
            text = "";
            x = 1.02;
            y = 0.25;
            w = 0.35;
            h = 0.6;
        };
        class CloseButtonKey : Life_RscButtonMenu {
            idc = -1;
            text = "$STR_Global_Close";
			colorBackground[] = {0.45,0.05,0,0.9};			
            onButtonClick = "closeDialog 0;";	
            x = 0.38 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
            y = 0.88 - (1 / 25);
            w = (6.25 / 40);
            h = (1 / 25);
        };		
//1
        class admTPtoPlayer : Life_RscButtonMenu {
            idc = 2912;
            text = "Voy a tí";
//			colorBackground[] = {0,0.2235294117647059,0.3725490196078431,1};				
            onButtonClick = "[] call life_fnc_adminTPtoPL;";
            x = 0.54 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
            y = 0.88 - (1 / 25);
            w = (6.25 / 40);
            h = (1 / 25);
        };
//2        
        class admTPtoME : Life_RscButtonMenu {
            idc = 2913;
            text = "Ven a mí";
//			colorBackground[] = {0,0.2235294117647059,0.3725490196078431,1};	
            onButtonClick = "[] call life_fnc_adminTPtoME;";
            x = 0.7 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
            y = 0.88 - (1 / 25);
            w = (6.25 / 40);
            h = (1 / 25);
        };
//3        
        class admFreeze : Life_RscButtonMenu {
            idc = 2904;
            text = "Congelar";
//			colorBackground[] = {0,0.2235294117647059,0.3725490196078431,1};				
            onButtonClick = "[] call life_fnc_adminFreeze;";			
            x = 0.86 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
            y = 0.88 - (1 / 25);
            w = (6.25 / 40);
            h = (1 / 25);
        };
//4		
        class admRez : Life_RscButtonMenu {
            idc = 2905;
			text = "Invis";
//			colorBackground[] = {0,0.2235294117647059,0.3725490196078431,1};	
            onButtonClick = "[player, true, true] call ica_fnc_ocultame;";									
            x = 1.02 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
            y = 0.88 - (1 / 25);
            w = (6.25 / 40);
            h = (1 / 25);
        };
//5		
        class admKill : Life_RscButtonMenu {
            idc = 2906;
            text = "Matar";
			colorBackground[] = {0.45,0.05,0,0.9};
            onButtonClick = "[] call life_fnc_adminKill;";			
            x = 1.18 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
            y = 0.88 - (1 / 25);
            w = (6.25 / 40);
            h = (1 / 25);
        };
//6	
        class admTeleport : Life_RscButtonMenu {
            idc = 2907;
            text = "$STR_Admin_Teleport";
			colorBackground[] = {0.07,0.46,0,1};				
            onButtonClick = "call ica_fnc_onmap";
            x = 0.54 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
            y = 0.885;
            w = (6.25 / 40);
            h = (1 / 25);
        };
//7		
        class admKeys : Life_RscButtonMenu {
            idc = 2908;
            text = "Llaves veh";
//			colorBackground[] = {0,0.2235294117647059,0.3725490196078431,1};			
            onButtonClick = "[] call life_fnc_adminKeys;";
            x = 0.7 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
            y = 0.885;
            w = (6.25 / 40);
            h = (1 / 25);
        };
//8		
        class admSpectate : Life_RscButtonMenu {
            idc = 2909;
            text = "Cam";
//			colorBackground[] = {0,0.2235294117647059,0.3725490196078431,1};	
            onButtonClick = "[] spawn BIS_fnc_camera;";
            x = 0.86 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
            y = 0.885;
            w = (6.25 / 40);
            h = (1 / 25);
        };
//9		
        class admMarkers : Life_RscButtonMenu {
            idc = 2910;
            text = "Nombres";
//			colorBackground[] = {0,0.2235294117647059,0.3725490196078431,1};				
            onButtonClick = "[] spawn life_fnc_adminMarkers;";
            x = 1.02 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
            y = 0.885;
            w = (6.25 / 40);
            h = (1 / 25);
        };
//10		
        class admCompensate : Life_RscButtonMenu {
            idc = 2911;
            text = "Parkour";
//			colorBackground[] = {0,0.2235294117647059,0.3725490196078431,1};				
            onButtonClick = "0 spawn ica_fnc_hab_pociondeparkour";
            x = 1.18 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
            y = 0.885;
            w = (6.25 / 40);
            h = (1 / 25);
        };
//11	
        class admHealRepair : Life_RscButtonMenu {
            idc = 2914;
			text = "Reparar";
			colorBackground[] = {0.07,0.46,0,1};
            onButtonClick = "[] spawn life_fnc_adminHR;";
            x = 0.54 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
            y = 0.889 + (1 / 25);
            w = (6.25 / 40);
            h = (1 / 25);
        };
//12		
        class admATMmenu : Life_RscButtonMenu {
            idc = 2915;
            text = "Cachear";
			// colorBackground[] = {0,0.2235294117647059,0.3725490196078431,1};				
			onButtonClick = "[call compile format ['%1', (lbData [2902, lbCurSel (2902)])]] spawn ica_fnc_cacheo;";
            x = 0.7 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
            y = 0.889 + (1 / 25);
            w = (6.25 / 40);
            h = (1 / 25);
        };
//13		
        class admDelObj : Life_RscButtonMenu {
            idc = 2916;
            text = "Borrar OBJ";
			colorBackground[] = {0.45,0.05,0,0.9};			
            onButtonClick = "[] spawn life_fnc_adminDelObj;";
            x = 0.86 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
            y = 0.889 + (1 / 25);
            w = (6.25 / 40);
            h = (1 / 25);
        };
//14		
        class admGODeye : Life_RscButtonMenu {
            idc = 2917;
            text = "Ojo de Dios";
			colorBackground[] = {0.45,0.05,0,0.9};
            onButtonClick = "[] call life_fnc_adminGDY;";			
            x = 1.02 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
            y = 0.889 + (1 / 25);
            w = (6.25 / 40);
            h = (1 / 25);
        };
//15		
        class admDebug : Life_RscButtonMenu {
            idc = 2918;
            text = "Consola";
			colorBackground[] = {0.45,0.05,0,0.9};			
            onButtonClick = "[] call life_fnc_adminDebug;";
            x = 1.18 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
            y = 0.889 + (1 / 25);
            w = (6.25 / 40);
            h = (1 / 25);
        };		
//16		
        class admUni : Life_RscButtonMenu {
            idc = 2919;
            text = "Molar";
			colorBackground[] = {0, 0.62, 0.62, 1};		
            onButtonClick = "[] call life_fnc_adminUni;";
            x = 0.38 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
            y = 0.885;
            w = (6.25 / 40);
            h = (1 / 25);
        };	

		class Purge : Life_RscButtonMenu {
			idc = 6847;
			text = "La Purga";
             colorBackground[] = { 0.584, 0.086, 0.086, 1.0 };
			onButtonClick = "[] execVM 'core\functions\fn_purge.sqf'";
			x = 0.38 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.889 + (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		
    };
};