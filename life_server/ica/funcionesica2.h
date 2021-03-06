

class master_funcionesica2
{
	tag = "ica";

	class raiz
	{
		file = "life_server\ica";
		class initHUD {};
	};

	class funciones
	{
		file = "life_server\ica\funciones";
		class onmap {};
		class editando {};
		class cheto {};
		class item {};
		class classToName {};
		class classToPic {};
		class meteAccion {};
		class negToPos {};
		class numToStr {};
		class strToArr {};
		class inString {};
		class revela {};
		class masCercano {};
		class getPos {};
		class tengo {};
		class mapMarkers {};
		class setVelocity {};
		class setVelocityRas {};
		class playMoveNow {};
		class switchMove {};
		class cargaInv {};
		class addEH {};
		class ocultame {};

		class anuncio {};
		class anuncioSimple {};
		class masUno {};
		class barrita {};

		class borrame {};
		class bloqueoDinero {};
		class creaMatricula {};

		class sync {};
	};

	class clientserver
	{
		file = "life_server\ica\funciones\clientserver";
		class varToServer {};
		class varToClient {};
		class varUpdate {};
	};

	class dialog
	{
		file = "life_server\ica\dialog";
		class menuCompraVenta {};
		class arrayTienda {};
		class infolog {};
		class menuY {};
	};

	class precios
	{
		file = "life_server\ica\funciones\precios";
		class precioCombustible {};
		class precio {};
	};

	class subasta
	{
		file = "life_server\ica\subasta";
		class subasta {};
		class initSubasta {};
		class recogeBeneficios {};
		class subeBajaBeneficios {};
	};

	class experiencia
	{
		file = "life_server\ica\exp";
		class initExp {};
		class expToLevel {};
		class exp {};
		class arrayExp {};
		class limitadorDeArmas {};
		class costeSP {};
		class ganoExp {};
	};

	class farmeo
	{
		file = "life_server\ica\farmeo";
		class pesca {};
		class picando {};
		class llenaBotella {};
		class talando {};
		class initNaufragios {};
		class agricultura {};
		class initMineria {};
		class procesado {};
		class basura {};
	};

	class robos
	{
		file = "life_server\ica\robos";
		class hacker {};
		class ganzua {};
		class initPortatil {};
		class miroDocumentos {};
		class resetDatos {};
		class roboConcesionario {};
		class roboDeDatos {};
		class roboAlcalde {};
		class roboGasolinera {};
		class roboNuclear {};
		class roboJoyeria {};
		class fugacarcel {};
		class roboBanco {};
	};

	class mafia
	{
		file = "life_server\ica\mafia";
		class tiendaMafia {};
		class traficanteDroga {};
		class camello {};
		class initDroga {};
		class blanqueo {};
	};

	class policia
	{
		file = "life_server\ica\policia";
		class sacoDineroPublico {};
		class camaras {};
		class puntosCarnet {};
		class tiendaPolicia {};
		class matriculas3D {};
		class cacheo {};
	};

	class suministros
	{
		file = "life_server\ica\suministros";
		class initVars {};
		class menuTransportes {};
		class menuMineria {};
		class carga {};
		class descarga {};
		class gasolinera {};
		class menuAlmacen {};
		class entregaPaquete {};
	};

	class jugador
	{
		file = "life_server\ica\jugador";
		class wikipedia {};
		class impuestos {};
		class nigromante {};
		class consumo {};
		class comoBebo {};
		class initHabilidades {};
		class crafteo {};

		class daDinero {};
		class daLlaves {};
		class mensajesica {};

		class posicion {};
		class vistaBonita {};
		class autobusMagico {};
		class reporte {};
		class silencer {};
	};

	class tonterias
	{
		file = "life_server\ica\tonterias";
		class loteria {};
	};
	class habilidades
	{
		file = "life_server\ica\jugador\habilidades";
		class hab_golpe {};
		class hab_molotov {};
		class hab_pocionDeInvis {};
		class hab_pocionDeParkour {};
		class hab_reparar {};
	};

	class inventario
	{
		file = "life_server\ica\inventario";
		class EH {};
		class usoItemFis {};
		class pongoItem {};
	};

	class sistemaMedicaruk
	{
		file = "life_server\ica\sistemaMedicaruk";
		class initMed {};
		class sistemaMedICA {};
		class sangrando {};
		class borroso {};
		class dolor {};
		class diagnostico {};
		class tratamiento {};
		class fractura {};
		class toxicidad {};
		class inconsciente {};
		class guardaCargaMed {};
		class enterrador {};
		class organos {};
	};

	class clima
	{
		file = "life_server\ica\clima";
		class climaCliente {};
		class climaServidor {};
	};

    class objetos
    {
    	file = "life_server\war";
        class objetos_poner {};
    };

    class tisor
    {
    	file = "life_server\tisor";
    	class centralita {};
    };
};


/* esto es lo del cliente

class master_funcionesica
{
	tag = "ica";

	class raiz
	{
		file = "ica";
		class initHUD {};
	};

	class funciones
	{
		file = "ica\funciones";
		class onmap {};
		class editando {};
		class cheto {};
		class item {};
		class classToName {};
		class classToPic {};
		class meteAccion {};
		class negToPos {};
		class numToStr {};
		class strToArr {};
		class inString {};
		class revela {};
		class masCercano {};
		class getPos {};
		class tengo {};
		class mapMarkers {};
		class setVelocity {};
		class setVelocityRas {};
		class playMoveNow {};
		class switchMove {};
		class cargaInv {};
		class addEH {};

		class anuncio {};
		class anuncioSimple {};
		class masUno {};
		class barrita {};

		class borrame {};
		class bloqueoDinero {};

		class sync {};
	};

	class clientserver
	{
		file = "ica\funciones\clientserver";
		class varToServer {};
		class varToClient {};
		class varUpdate {};
	};

	class dialog
	{
		file = "ica\dialog";
		class menuCompraVenta {};
		class arrayTienda {};
		class infolog {};
		class menuY {};
	};

	class precios
	{
		file = "ica\funciones\precios";
		class precioCombustible {};
		class precio {};
	};

	class subasta
	{
		file = "ica\subasta";
		class subasta {};
		class initSubasta {};
		class recogeBeneficios {};
		class subeBajaBeneficios {};
	};

	class experiencia
	{
		file = "ica\exp";
		class initExp {};
		class expToLevel {};
		class exp {};
		class arrayExp {};
		class limitadorDeArmas {};
		class costeSP {};
		class ganoExp {};
	};

	class farmeo
	{
		file = "ica\farmeo";
		class pesca {};
		class picando {};
		class llenaBotella {};
		class talando {};
		class initNaufragios {};
		class agricultura {};
		class initMineria {};
		class procesado {};
	};

	class robos
	{
		file = "ica\robos";
		class hacker {};
		class ganzua {};
		class initPortatil {};
		class miroDocumentos {};
		class resetDatos {};
		class roboConcesionario {};
		class roboDeDatos {};
		class roboAlcalde {};
		class roboGasolinera {};
		class roboNuclear {};
		class roboJoyeria {};
		class roboBanco {};
	};

	class mafia
	{
		file = "ica\mafia";
		class tiendaMafia {};
		class traficanteDroga {};
		class camello {};
		class initDroga {};
		class blanqueo {};
	};

	class policia
	{
		file = "ica\policia";
		class sacoDineroPublico {};
		class camaras {};
		class puntosCarnet {};
	};

	class suministros
	{
		file = "ica\suministros";
		class initVars {};
		class menuTransportes {};
		class menuMineria {};
		class carga {};
		class descarga {};
		class gasolinera {};
		class menuAlmacen {};
	};

	class jugador
	{
		file = "ica\jugador";
		class wikipedia {};
		class impuestos {};
		class nigromante {};
		class consumo {};
		class comoBebo {};
		class initHabilidades {};
		class crafteo {};

		class daDinero {};
		class daLlaves {};
		class mensajesica {};

		class posicion {};
		class vistaBonita {};
		class autobusMagico {};
	};

	class tonterias
	{
		file = "ica\tonterias";
		class loteria {};
	};
	class habilidades
	{
		file = "ica\jugador\habilidades";
		class hab_golpe {};
		class hab_molotov {};
		class hab_pocionDeInvis {};
		class hab_pocionDeParkour {};
		class hab_reparar {};
	};

	class inventario
	{
		file = "ica\inventario";
		class EH {};
		class usoItemFis {};
	};

	class sistemaMedicaruk
	{
		file = "ica\sistemaMedicaruk";
		class initMed {};
		class sistemaMedICA {};
		class sangrando {};
		class borroso {};
		class dolor {};
		class diagnostico {};
		class tratamiento {};
		class fractura {};
		class toxicidad {};
		class inconsciente {};
		class guardaCargaMed {};
	};

	class clima
	{
		file = "ica\clima";
		class climaCliente {};
		class climaServidor {};
	};

};
*/