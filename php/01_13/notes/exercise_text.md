La società sportiva `Tutti in Forma` intende gestire i dati dei propri soci attraverso una
piattaforma web, nella quale i nuovi iscritti possono compilare il `form di iscrizione` e i soci
già iscritti possono `vedere i propri dati`, `i corsi a cui iscriversi`, gli orari ecc..
Implementare il database degli iscritti e dei corsi, e la piattaforma in PHP ( frontend) che
consenta le iscrizioni alla società, ai corsi e la gestione dei propri dati personali
`Prevedere l’inserimento` di altri dati su squadre allenatori o responsabili di corsi con
inserimenti diretti con `query in mysql`
I soci che si iscrivono alla società sportiva sono caratterizzati da: il numero della tessera
di iscrizione, il nome, il cognome, l’indirizzo, la data di nascita e la professione. I soci si
suddividono in atleti, frequentatori ed onorari. Per gli atleti è importante tener traccia
della data dell’ultima visita medica e della data della tessera federativa. Per i
frequentatori è necessario tener traccia del numero di corsi frequentati negli ultimi
cinque anni. I soci onorari sono caratterizzati dal ruolo che svolgono all’interno della
società. Gli atleti ed i soci frequentanti possono frequentare i corsi (al massimo tre per i
frequentanti, due per gli atleti). E’ importante mantenere l’informazione relativa al
pagamento relativa o di ogni corso frequentato. I corsi sono caratterizzati dal codice
corso, una breve descrizione, il costo, i giorni della settimana in cui sono programmati,
gli impianti che li ospitano e le relative ore di inizio e di fine in cui sono tenuti. Gli impianti
a disposizione della società sono rappresentati da: codice, descrizione, indirizzo,
telefono e nome dell’ente che li ha in gestione. Ciascun corso (svolto in un determinato
impianto) ha un responsabile esterno. Per quest’ultimo si conosce il codice fiscale, il
nome, il cognome, il telefono, l’indirizzo e la paga oraria. Gli atleti possono svolgere uno
sport individuale o essere inseriti in una o più squadre, ricordando per ciascuna l’anno
di ingresso. In entrambi i casi devono essere iscritti ai relativi corsi. Ogni squadra è
caratterizzata da un nome, categoria, numero di atleti titolari, allenatore. Per gli
allenatori sono noti la data della tessera federativa, il relativo codice, il nome e il
cognome.