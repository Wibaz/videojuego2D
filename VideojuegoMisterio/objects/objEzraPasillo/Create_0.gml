/// @description Inserte aquí la descripción
// Puede escribir su código en este editor

// Inherit the parent event
event_inherited();

//Nuevo
portrait_index = 0;
voice = snd_voice1;
name = "Ezra";
if(!global.Key)
{
	text = ["(Alguien está llorando en el camarote de al lado. Debe ser la mujer de vestido rosa, creo que se llamaba Ibuki.)","¿Esta Ibuki dentro?","Presumiblemente sí, la puerta esta cerrada.", "Aun así, no te preocupes por ella ahora, se le pasará pronto.","Tendrías que preocuparte más por tí mismo, estas demasiado relajado. Parece que estuvieras acostumbrado a esto.","No creas. Si me disculpas tengo que dejar de hablar contigo ahora mismo.","Touché.","(Deberia buscar la llave por los alrededores del barco igual alguien sabe donde esta.)"];
	speakers = [objPlayer,objPlayer,id,id,id,objPlayer,id,objPlayer];
	next_line=[0,0,0,0,0,0,0,-1];
}
else if (global.Key && !global.IbukiParla)
{
	text = ["Ya tienes la llave por lo que veo.","Aun así deberías pasar de Ibuki.", "Creo que prefiero ignorar sus consejos.","(Espero que la policía llegue pronto, no aguanto a esta gente.)"];
	speakers = [id,id,objPlayer,objPlayer];
	next_line=[0,0,0,-1];
}
else if (global.IbukiParla && !global.Puzzle2Completado)
{
	text = ["Ya se ha calmado, ves como se le pasaria.", "(No gracias a usted...)","¿Has dicho algo?","No. Nada absolutamente nada.","Me habia parecido escuchar algo.","Si te aburres puedes intentar arreglar el ordenador de este camarote igual encuentra algo.","(¿A que se referira con eso?, creo que debería investigarlo.)"];
	speakers = [id,objPlayer,id,objPlayer,id,id,objPlayer];
	next_line=[0,0,0,0,0,0,-1];
}