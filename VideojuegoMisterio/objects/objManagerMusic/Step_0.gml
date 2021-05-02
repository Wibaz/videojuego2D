if(room==Menu && musicaMenu1)
{
    audio_play_sound(snd_sea,1,true);
    musicaMenu1=false;
}
if(room!=Menu && !musicaMenu1)
{
    audio_stop_sound(snd_sea);
    musicaGeneral=true;
}
if(musicaGeneral && NoSuena && !musicaMenu1)
{
    audio_play_sound(sndInvestigacion,1,true);
    NoSuena=false;
}
if(room==puzzle1 &&!musicaPuzzle1 && !musicaPuzzle && musicaGeneral)
{
    audio_stop_sound(sndInvestigacion);
    audio_play_sound(sndPuzzle,1,true);
    musicaPuzzle1=true;
}
else if(room!=puzzle1 && musicaPuzzle1 && !musicaPuzzle && musicaGeneral)
{
    audio_stop_sound(sndPuzzle);
    audio_play_sound(sndInvestigacion,1,true);
    musicaPuzzle1=false;
}
if(room==PuzleOrdenador &&!musicaPuzzle && !musicaPuzzle1 && musicaGeneral)
{
    audio_stop_sound(sndInvestigacion);
    audio_play_sound(sndPuzzle,1,true);
    musicaPuzzle=true;
}
else if(room!=PuzleOrdenador && musicaPuzzle &&!musicaPuzzle1 && musicaGeneral)
{
    audio_stop_sound(sndPuzzle);
    audio_play_sound(sndInvestigacion,1,true);
    musicaPuzzle=false;
}