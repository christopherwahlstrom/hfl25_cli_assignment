Parkeringsapp - Uppgift 1: Grundläggande
Datamodeller och CLI
Introduktion
I denna första uppgift ska ni börja utveckla grunden för en parkeringsapplikation. Ni ska skapa de
grundläggande datamodellerna och ett enkelt CLI (program som körs från terminalen) för att hantera dessa
modeller.
Mål
Skapa grundläggande datamodeller för parkeringsapplikationen
Implementera ett enkelt CLI för att hantera dessa modeller
Börja tänka på hur olika delar av applikationen interagerar med varandra
Resurser
Börja här!
Fippla lite här!
Kom igång här!
Börja koda ditt CLI med dart:io!
Uppmaning
Gör inte allt på en och samma gång! Välj en sak i taget och försök ta kortaste möjliga steget till att lösa
det problemet. Kursen förväntar sig mycket självstudier av er så gör en plan och försök följa den. Ni
förväntas läsa en hel del dokumentation för att styra era beslut. Ta ett beslut, försök, testa, misslyckas,
utvärdera, gör om, lyckas, gå vidare!
Krav
1. Datamodeller
Skapa följande klasser i Dart:
1. Person
Attribut: namn, personnummer
2. Vehicle
Attribut: registreringsnummer, typ (bil, motorcykel, etc.), ägare (en Person)
3. ParkingSpace
Attribut: id, adress, pris per timme
4. Parking
Attribut: fordon, parkeringsplats, starttid, sluttid (kan förslagsvis vara null om pågående)
a_1.md 2025-01-24
2 / 5
2. Datahanteringsklasser
För att hantera samlingar av våra huvudklasser, skapa följande klasser:
1. PersonRepository
Ansvarar för att lagra och hantera en samling av Person-objekt
2. VehicleRepository
Ansvarar för att lagra och hantera en samling av Vehicle-objekt
3. ParkingSpaceRepository
Ansvarar för att lagra och hantera en samling av ParkingSpace-objekt
4. ParkingRepository
Ansvarar för att lagra och hantera en samling av Parking-objekt
Varje repository-klass bör innehålla metoder för att lägga till, ta bort, uppdatera och hämta objekt. Exempel
på metodnamn kan vara:
add(item)
getAll()
getById(id)
update(item)
delete(id)
3. CLI (Command Line Interface)
Skapa ett enkelt CLI som låter användaren:
1. Välja vilken datamodell de vill arbeta med (Person, Fordon, Parkeringsplats, Parkering)
2. För varje datamodell, erbjud följande operationer:
Skapa ny (Create)
Visa alla (Read)
Uppdatera befintlig (Update)
Ta bort (Delete)


Utmaningar (förslag för ökad kvalité för att uppnå VG)
Implementera enkel felhantering, t.ex. för ogiltiga inputs.
Lägg till en funktion för att beräkna kostnaden för en parkering baserat på tid och pris per timme.
Implementera en enkel sökfunktion för att hitta specifika objekt baserat på vissa kriterier (t.ex. hitta
alla fordon för en specifik ägare).
Designmönster: Implementera Singleton-mönstret för dina repository-klasser för att säkerställa att
endast en instans av varje repository existerar i programmet.
a_1.md 2025-01-24
5 / 5
Utmaningar för framtida övningar (förslag för ökad kvalité för att uppnå VG)
Serialisering och Deserialisering: Implementera toJson() och fromJson() metoder för varje klass.
Detta kommer att vara användbart när ni senare ska arbeta med HTTP-servrar och databaser.
Datavalidering: Skapa en metod isValid() för varje klass som kontrollerar om alla nödvändiga fält är
korrekt ifyllda. Till exempel, att ett personnummer har rätt format eller att ett registreringsnummer är
giltigt.
Databasförberedelse: Lägg till ett unikt id-fält till varje klass. Detta kommer att vara användbart när ni
senare ska lagra data i en databas.
Asynkron programmering: Modifiera några av era metoder att returnera sitt svar i en Future. Detta
kommer att förbereda er för asynkron programmering som är vanlig i HTTP-anrop och
databasoperationer.
Dessa utmaningar kommer att ge er en försmak av koncept som ni kommer att möta i kommande sprintar
och förbereda er kodbas för framtida utökningar. Lycka till!
Gör minst 4/8 av dessa förslag för att få VG på uppgiften.
