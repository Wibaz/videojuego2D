event_inherited();
//Nuevo
portrait_index = 4;
voice = snd_voice3;
name = "Laria";
if(!global.FinAnimacion)
{
	text = ["(Parece estar ocupada con la tarta. Mejor no la molesto.)"];
	speakers = [objPlayer];
	next_line=[-1]
}
else
{
	text=["(No creo que le haya sentado bien lo ocurrido igual necesita tiempo mejor la dejo a solas.)"]
	speakers=[objPlayer]
	next_line=[-1]
}