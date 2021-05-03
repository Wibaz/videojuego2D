/// @description Inserte aquí la descripción
// Puede escribir su código en este editor

// Inherit the parent event
event_inherited();
instance_create_depth(x,y,1,objInvisibleWall);

//Nuevo
portrait_index = 2;
voice = snd_voice3;
name = "Nathan";
if(!global.Key)
{
	text = ["No se preocupe por el cadáver, yo me encargo.", "¿Usted es...?","Nathan, si buscas un nombre toma ese. Sé como son los de su tipo. Qué coincidencia que se encuentre aquí, ¿no le parece?","Ehhh...","Busque a la mujer que salió corriendo.","Entiendo.", "Debería estar en uno de los camarotes. Váyase.","(¿Este hombre sabe quién soy yo?)"];
	speakers = [id,objPlayer,id,objPlayer,id,objPlayer,id,objPlayer];
	next_line=[0,0,0,0,0,0,0,-1];
}
else if (global.Key && !global.Puzzle2Completado)
{
	text = ["¿Ya ha hablado con con la mujer?",["Sí, parece que ya se encuentra mejor.","No, la verdad."], "Ya veo, espero que haya esclarecido algo, o sino será un patán en su propio oficio.","Pues debería, ahora mismo es la principal sospechosa ¿no?"];
	speakers = [id,objPlayer,id,id];
	next_line=[0,[2,3],-1,-1];
}
else if(global.Puzzle2Completado)
{
	text = ["¿Algún problema, agente?","Ninguno nuevo.", "Espero que sepa manejar lo que tiene entre manos o estaremos todos condenados.","(Este tío tiene que leerme la mente o algo)","Eso esperemos..."];
	speakers = [id,objPlayer,id,objPlayer,objPlayer];
	next_line=[0,0,0,0,-1];
}