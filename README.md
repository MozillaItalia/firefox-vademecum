# Readme
In questo file verrà spiegato cos'è il vademecum e come poter collaborare.
Verranno elencati coloro che hanno collaborato nella realizzazione.

## È ALTAMENTE CONSIGLIATO LEGGERE PRIMA IL FILE CONTRIBUTING.MD
Contiene tutte le informazioni utili per sapere come essere utile e collaborare al progetto e le REGOLE di stile da SEGUIRE per realizzare un progetto ben fatto ed uniforme.

### Mappa file
- Cos'è
- Tipi di versione, release attuale e come scaricare i file da stampare
- Come collaborare & Regole di stile
- Come viene generato il pdf finale
- Vademecum realizzato da
- Licenza

## Cos'è
Vademecum, dal latino _vade mecum_, significato letterario _vieni con me_ e figurativo _ti do una mano_ è un progetto Mozilla Italia e consiste nella realizzazione di un volantino (digitale e stampato) che permetta di capire in un foglio A4 (suddiviso in sezioni) cos'è Mozilla, Firefox e tutti i progetti correlati; l'importanza sta nel fatto che tutti questi concetti vengano espressi in pochissimo spazio e debbano essere soddisfacenti.

## Tipi di versione, release attuale e come scaricare i file da stampare
L'attuale release è la 2.0 per VT e VG e la 1.0 per CV.
Ci sono tre tipi di versioni:
- **generale**, indirizzata a un pubblico con competenze non specificate, quindi non necessariamente tecniche
- **tecnica**, indirizzata a un pubblico con competente prettamente tecniche, in quanto molti concetti vengono sottintesi e vengono approfonditi temi più "tecnici", appunto.
- **common voice**, dedicata interamente al progetto Common Voice di Mozilla, e alcuni cenni a DeepSpeech.
Per brevità, la versione generale può essere indicata come "**VG**", la versione tecnica come "**VT**" e la versione common voice come "**CV**".
Per scaricare i file stampabili, recarsi nella cartella **volantino**, poi **pdf**, quindi scegliere la versione che si desidera. [Fai clic qui](https://github.com/MozillaItalia/firefox-vademecum/tree/master/volantino/pdf) per andare direttamente alla cartella _pdf_.

## Come collaborare & Regole di stile
Per sapere come contribuire/collaborare e per leggere le **regole di stile** si prega di leggere il file [_contributing.md_](https://github.com/MozillaItalia/firefox-vademecum/blob/master/contributing.md).

## Come viene generato il PDF finale
Una volta aggiornato correttamente il file vademecum.md si passa ad aggiornare, manualmente, anche il file HTML.
Terminato anche questo passaggio, viene generato il PDF automaticamente tramite uno script (vedi file nella cartella _scripts_) che, partendo dal file HTML, ne genera il PDF. Dall'HTML, inoltre, vengono generate le due immagini PNG (FRONTE e RETRO).
Per la generazione (conversione) HTML->PDF e HTML->PNG è stata usato il tool da CLI wkhtmltopdf e wkhtmltoimage.
Per informazioni più specifiche riguardo il file HTML o il file CSS contattare @Sav22999 o @Mte90, invece, per informazioni relative al file SH contattare @mone27, @Sav22999 o @Mte90.

## Vademecum realizzato da
Hanno collaborato alla realizzazione del vademecum (ordine A-Z):
- Cantu Niccolo
- De Luca Giovanni
- De Rose Pasquale
- Massaro Simone
- Morelli Saverio
- Pignataro Giuseppe
- Pirrotta Irene
- Pizii Mirko
- Putti Edoardo
- Scasciafratte Daniele
- Viola Edoardo

## Licenza
La licenza utilizzata per Vademecum è la Creative Commons - Attribution (BY), ShareAlike (SA) 2.0 Italia (Attribuzione, Condivisione allo stesso modo)

<img src="images/license.png" style="width:110px;">

Disponibile all'indirizzo https://creativecommons.org/licenses/by-sa/2.0/it/ (o quella completa https://creativecommons.org/licenses/by-sa/2.0/it/legalcode)

## Ulteriori informazioni
Coordinatore del progetto è @Mte90.
