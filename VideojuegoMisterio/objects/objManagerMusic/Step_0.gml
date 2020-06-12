if(room!=Menu )
{
    audio_stop_sound(snd_sea);
    musicaGeneral=true;
}
if(musicaGeneral && NoSuena)
{
    audio_play_sound(sndInvestigacion,1,true);
    NoSuena=false;
}
if(room==puzzle1 &&!musicaPuzzle1 && !musicaPuzzle)
{
    audio_stop_sound(sndInvestigacion);
    audio_play_sound(sndPuzzle,1,true);
    musicaPuzzle1=true;
}
else if(room!=puzzle1 && musicaPuzzle1 && !musicaPuzzle)
{
    audio_stop_sound(sndPuzzle);
    audio_play_sound(sndInvestigacion,1,true);
    musicaPuzzle1=false;
}
if(room==PuzleOrdenador &&!musicaPuzzle && !musicaPuzzle1)
{
    audio_stop_sound(sndInvestigacion);
    audio_play_sound(sndPuzzle,1,true);
    musicaPuzzle=true;
}
else if(room!=PuzleOrdenador && musicaPuzzle &&!musicaPuzzle1)
{
    audio_stop_sound(sndPuzzle);
    audio_play_sound(sndInvestigacion,1,true);
    musicaPuzzle=false;
}