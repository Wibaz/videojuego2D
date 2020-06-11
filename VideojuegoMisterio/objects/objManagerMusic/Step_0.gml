/// @description Inserte aquí la descripción
// Puede escribir su código en este editor


if((room==puzzle1 ||room==PuzleOrdenador|| room==Computer)&& !musicaPuzzle)
{
	audio_stop_sound(sndInvestigacion);
	audio_play_sound(sndPuzzle,1,true);
	musicaPuzzle=true;
}
else if((room!=puzzle1 || room!=PuzleOrdenador || room!=Computer)&& musicaPuzzle)
{
	audio_stop_sound(sndPuzzle);
	audio_play_sound(sndInvestigacion,1,true);
	musicaPuzzle=false;
}