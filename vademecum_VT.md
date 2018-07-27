**_Si consiglia di leggere prima il file README.md_**

# Scopri Mozilla e i suoi progetti!  |VT|

##### Una breve presentazione tecnica dei progetti Mozilla

Capitoli:
* Presentazione
* Firefox
    * Add-ons
    * WebVR
    * Rust
    * Stylo
* Internet Health Report
* Test Pilot
    * Send
    * Notes
* Altri esperimenti
    * Common Voice
    * Servo
    * MDN
* Strumenti utilizzati
    * Pontoon
    * GitHub
    * Forum
* Unisciti a noi. Diventa un volontario di Mozilla Italia ora!
* Collaboratori

### Presentazione
**Mozilla Foundation** è un'organizzazione no-profit, presente ovunque nel mondo. La comunità italiana si chiama **Mozilla Italia** (**mozillaitalia.org**).
Questa è la versione tecnica, indirizzata perlopiù a un pubblico con conoscenze più specifiche e specializzanti.

### Firefox |QRcode|
Il browser web sviluppato per offrire un'esperienza di navigazione **unica** e **personalizzata**.
Dispone di numerosi tipi di versione: Stabile, Beta, Nightly, Developer ed ESR.

#### Add-ons |QRcode|
Firefox dispone di migliaia di componenti aggiuntivi, tra estensioni, temi, plugin e altro, con supporto alle WebExtensions.
Le più apprezzate sono uBlock Origin, Facebook Container, Ghostery, Video DownloadHelper.
Trova quella che fa più al caso tuo!
Sono suddivise per genere, per consigliate, per più votate o per tendenza.

#### Stylo
Dalla versione Quantum, Firefox integra il nuovo sistema _Stylo_ che velocizza il caricamento delle pagine web grazie all'ottimizzazione del foglio di stile (_Quantum CSS_) e al fatto che utilizza tutte le potenzialità dei sistemi multicore.
Questa tecnologia è parte del nuovo Firefox Quantum desktop ed è presente anche su dispositivi Android.

#### WebVR |QRcode|
Firefox supporta lo standard _WebVR_ che permette di avere la realtà virtuale **direttamente sul browser** in tutte su tutte le piattaforme supportate.
In aggiunta, Mozilla ha sviluppato il framework open-source _A-Frame_ che, utizzando i _WebComponent_ e _three.js_, permette di scrivere codice per ambiente 3D direttamente in HTML.
In questo modo chiunque può creare un ambiente 3D, mettere un video 3D, in maniera molto più veloce e, soprattutto, più semplicemente.
Inoltre, A-Frame, ha diversi sottoprogetti come _A-Terrain_, per visualizzare dati geografici, _A-Blast_, per creare giochi con WebVR, _A-Painter_, per disegnare in ambiente 3D.

#### Rust |QRcode|
Rust è un linguaggio compilato con performance simili a quelle del C ed è sviluppato da una comunità open source supportata da Mozilla; è, inoltre, un componente fondamentale in Firefox Quantum.
Rust utilizza il concetto di zero-cost abstraction, ovvero le astrazione vengono fatte in compile-time anziché in run-time, ottenendo così le massime prestazioni possibili senza sacrificare la produttività.
Un altro concetto fondamentale di Rust è quello riguardante l'affidabilità, infatti garantisce che non si verifichi alcun errore di memoria, come i _buffer overflow_, _double free_, _null pointer_, _access_, _segfault_ e _data concurrency_.
Grazie a efficienti C Bindings, inoltre, è possibile facilmente integrare progetti in altri linguaggi, come NodeJS e Python.

### Internet Health Report |QRcode|
IHR, _Internet Health Report_, è un report sullo stato di salute di Internet. Ogni anno viene aggiornato con tecnologie innovative, progetti degni di riconosciementi, eventi importanti, quindi per rendere pubblica la salute di Internet.
Grazie a questo report è possibile verificare lo stato di salute di Internet in pochi e semplici clic. Inoltre sono presenti le tecnologie che più hanno caratterizzato l'anno in corso, oppure eventi importanti nonché particolari.
Tutto ciò in differenti lingue, incluso l'Italiano, e gratuitamente.
La documentazione messa a disposizione è vasta: da alcune diapositive (slides), fino a documenti di testo. Per essere al passo coi tempi è disponibile anche un sito web con contenuti costantemente aggiornati.
Questo poiché Internet è di tutti, ed è bene che tutti se ne prendano cura.

### Strumenti utilizzati

#### GitHub |QRcode|
Questo strumento viene usato un po' da tutti i team della community per progetti vari. Il team l10n (localisation) lo utilizza per organizzare le stringhe settimanali e per tenere traccia di chi le traduce, il team developer per gestire i progetti. Questo stesso _Vademecum_ è frutto di collaborazione su GitHub!ù

#### Pontoon |QRcode|
Lo strumento utilizzato maggiormente dal team di localizzazione (l10n) è Pontoon, realizzato da Mozilla e permette di tradurre facilmente e rapidamente delle stringhe, avendo a disposizione anche dei suggerimenti, una cronologia e le traduzioni eventualmente in altre lingue.
Per una corretta traduzione è bene seguire il **Manuale di traduzione**.

#### Forum |QRcode|
Questo strumento è ancora molto utilizzato, sia per prestare supporto agli utenti che ne hanno bisogno sia per dare comunicazioni ufficiali sia per discutere di questioni varie.
Con questo strumento è anche possibile tenersi in continuo aggiornamento su tutto ciò che riguarda la community.

### Test Pilot |QRcode|
Mozilla sviluppa numerosi progetti online, uno di essi è Test Pilot, il quale permette di utilizzare funzionalità uniche di Firefox ancora in fase di testing.

#### Send |QRcode|
Condividi file di massimo 1GB che automaticamente vengono distrutti dopo il download, puoi impostare tu quanti download permettere e se richiedere una password, comunque dopo 24 ore il file viene eliminato automaticamente.
Il tutto gratuitamente, senza registrazione e con pochi semplici clic. È sufficiente, infatti, disporre del link diretto al file.
Questo esperimento è ancora in fase di test, suggerimenti sono ben graditi!

#### Notes |QRcode|
A chi non è mai capitato di pensare qualcosa ma non avere il tempo di scriverla perché già la si è dimenticata?
Con _Notes_ non si avrà più questo problema! Mentre navighi in Firefox basta premere l'icona del blocco note per poter prendere immediatamente un appunto e, questo, verrà sincronizzato con tutti i tuoi dispositivi a cui hai effettuato l'accesso a Firefox Accounts.

### Altri esperimenti

#### Common Voice |QRcode|
Finalmente anche in italiano. _Leggi e registra_ frasi o _revisiona_ quelle registrate da altri utenti. Questo progetto punta a realizzare un sistema in grado di comprendere la voce di chiunque e di comprenderne tutte le parole, a prescindere da come esse vangano pronunciate o dall'accento. Parla come lo fai nella vita reale!
Non ci saranno più problemi di riconoscimento per chi è affetto da _Sigmatismo_ o _Rotacismo_.

#### Servo |QRcode|
Servo è un browser engine sperimentale, scritto interamente in Rust.
Attualmente vengono utilizzati dei suoi compomenti in Gecko e, infatti, quando Servo sarà stabile e completo, sostituirà l'ormai "anziano" Gecko. In termini di velocità, infatti, risulta essere molto più lento rispetto a Servo che, dietro questo unico nome, implementa tante nuove tecnologie che migliorano sensibilmente la sicurezza e le performance.

#### MDN |QRcode|
MDN, _Mozilla Developer Network_, è il servizio dedicato alla programmazione realizzato da Mozilla! Con esso è possibile imparare nuovi linguaggi di programmazione (lato Web), approfondire quelli che già si conoscono, utilizzare script contenuti in esso per vostri progetti o scoprire nuove tecnologie Web, come _HTTP_, _WebExtensions_, e altro ancora.
Tutto questo a costo zero!

### Unisciti a noi. Diventa un volotario di Mozilla Italia ora! |QRcode|
Nella nostra community abbiamo bisogno di qualunque figura professionale, ma anche di "semplici" appassionati e che, quindi, dedicano poco tempo alla causa.
Gestiamo anche dei gruppi su Telegram, raggiungibili dal canale **@mozItaHUB**.

### Collaboratori

Cantu Niccolo, De Rose Pasquale, Massaro Simone, Morelli Saverio, Pignataro Giuseppe, Pirrotta Irene, Pizii Mirko, Putti Edoardo, Scasciafratte Daniele, Viola Edoardo
