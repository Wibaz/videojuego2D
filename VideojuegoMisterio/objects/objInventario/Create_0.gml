depth = -1;
escala = 2; // Propiedades de vista / propiedades de la cámara
mostrarInventario = true;

espacioInventario = 17;
espacioInventarioAncho = 8;
espacioInventarioAlto = 3;

espacioSelecionado = 0;
recogerEspacio = -1;
mEspacioX = 0;
mEspacioY = 0;

xBuffer = 2;
yBuffer = 4;

TamanyoCelda = 32;

guiAncho = display_get_gui_width();
guiAlto = display_get_height();

invUIAncho = 288;
invUIAlto = 192;

sprInvUI = borrarTesteoInventarioUI;
sprInvObjetos = borrarTesteoInventarioItems;

sprInvObjetosColumnas = sprite_get_width(sprInvObjetos)/TamanyoCelda;
sprInvObjetosFilas = sprite_get_width(sprInvObjetos)/TamanyoCelda;

invUIX = (guiAncho * 0.5) - (invUIAncho * 0.5 * escala);
invUIY = (guiAlto * 0.5) - (invUIAlto * 0.5 * escala);

infoX = invUIX + (9 * escala);
infoY = invUIY + (9 * escala);

espacioX = infoX;
espacioY = invUIY + (40 * escala);

descX = infoX;
descY = invUIY + (156 * escala);

//---------Informacion del jugador
//0 = ORO
//1 = PLATA
//2 = BRONZE
//3 = NOMBRE

ds_jugador_informacion = ds_grid_create(2, 4);
ds_jugador_informacion[# 0, 0] = "Oro";
ds_jugador_informacion[# 0, 1] = "Plata";
ds_jugador_informacion[# 0, 2] = "Bronze";
ds_jugador_informacion[# 0, 3] = "Nombre";

ds_jugador_informacion[# 1, 0] = irandom_range(0, 99);
ds_jugador_informacion[# 1, 1] = irandom_range(0, 99);
ds_jugador_informacion[# 1, 2] = irandom_range(0, 99);
ds_jugador_informacion[# 1, 3] = "Fulgencio";

//--------------Inventario
//0 = Objeto
//1 = Numero

ds_inventario = ds_grid_create(2, espacioInventario);

//--------------Objetos
enum objetos {
	none			= 0,
	tomate			= 1,
	papas			= 2,
	zanahoria		= 3,
	alcachofa		= 4,
	chile			= 5,
	calabaza		= 6,
	maiz			= 7,
	madera			= 8,
	piedra			= 9,
	cubo			= 10,
	silla			= 11,
	foto			= 12,
	hacha			= 13,
	pocion			= 14,
	estrellaDeMar	= 15,
	setas			= 16,
	altura			= 17,
}

#region Crear descripción de los objetos
dsObjetosInfo = ds_grid_create(2, objetos.altura);

//---Nombres objetos
var z = 0, i = 0;
dsObjetosInfo[# z, i++] = "Nothing";
dsObjetosInfo[# z, i++] = "Tomate";
dsObjetosInfo[# z, i++] = "Papas";
dsObjetosInfo[# z, i++] = "Zanahoria";
dsObjetosInfo[# z, i++] = "Alcachofa";
dsObjetosInfo[# z, i++] = "Chile";
dsObjetosInfo[# z, i++] = "Calabaza";
dsObjetosInfo[# z, i++] = "Maiz";
dsObjetosInfo[# z, i++] = "Madera";
dsObjetosInfo[# z, i++] = "Piedra";
dsObjetosInfo[# z, i++] = "Cubo";
dsObjetosInfo[# z, i++] = "Silla";
dsObjetosInfo[# z, i++] = "Foto";
dsObjetosInfo[# z, i++] = "Hacha";
dsObjetosInfo[# z, i++] = "Pocion";
dsObjetosInfo[# z, i++] = "Estrella de mar";
dsObjetosInfo[# z, i++] = "Setas";

//---Item Descriptions
var z = 1, i = 0;
dsObjetosInfo[# z, i++] = "Empty.";
dsObjetosInfo[# z, i++] = "To-mah... may-to.";
dsObjetosInfo[# z, i++] = "Pre-chips.";
dsObjetosInfo[# z, i++] = "Keep away from rabbits.";
dsObjetosInfo[# z, i++] = "The heartiest vegetable.";
dsObjetosInfo[# z, i++] = "But oddly hot.";
dsObjetosInfo[# z, i++] = "Or is it an eggplant?";
dsObjetosInfo[# z, i++] = "Better popped.";
dsObjetosInfo[# z, i++] = "Knock on it.";
dsObjetosInfo[# z, i++] = "There's nothing written in it.";
dsObjetosInfo[# z, i++] = "You could fit a bucket-full of water in here!";
dsObjetosInfo[# z, i++] = "This chair is just right.";
dsObjetosInfo[# z, i++] = "Wait, who even is this?";
dsObjetosInfo[# z, i++] = "Chop chop!";
dsObjetosInfo[# z, i++] = "The liquid looks... oozy.";
dsObjetosInfo[# z, i++] = "So called because it looks like a star... but aren't real stars";
dsObjetosInfo[# z, i++] = "A fungus; not mush room for interpretation.";

#endregion
var yy = 0; repeat(espacioInventario){
	ds_inventario[# 0, yy] = irandom_range(1, objetos.altura-1);
	ds_inventario[# 1, yy] = irandom_range(1, 10);
	
	yy += 1;
}