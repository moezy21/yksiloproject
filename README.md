Järjestelmän Rakenne
<img width="1048" alt="Screenshot 2025-03-16 at 14 06 40" src="https://github.com/user-attachments/assets/ab98a628-26df-400e-b3f8-48eb01634d2a" />

<img width=<img width="1048" alt="Screenshot 2025-03-16 at 14 07 06" src="https://github.com/user-attachments/assets/2d1b0916-d79b-4b7f-9e45-60e95e929881" />



Sovellus toimii digitaalisen hyvinvointipäiväkirjana, jossa käyttäjät voivat seurata terveyteensä liittyviä tietoja, kuten mielialaa, unta ja painoa. Lisäksi ylläpitäjä hallitsee käyttäjätilejä ja ylläpitää järjestelmän toimivuutta.

1. Käyttäjätiedot (Users-taulu)

Tähän tietokantatauluun tallennetaan käyttäjien perustiedot ja kirjautumistunnukset.

user_id – Uniikki tunniste jokaiselle käyttäjälle (Primary Key, AUTO_INCREMENT)
username – Käyttäjätunnus (Uniikki, pakollinen)
password – Salasanan suojattu hash-arvo
email – Käyttäjän sähköpostiosoite (Uniikki, pakollinen)
created_at – Tilin luontipäivämäärä (Oletuksena nykyhetki)
user_role – Käyttäjän rooli (Oletuksena "regular")
2. Päiväkirjamerkinnät (DiaryEntries-taulu)

Tämä taulu säilöö käyttäjien syöttämät hyvinvointiin liittyvät tiedot.

entry_id – Yksilöllinen tunniste jokaiselle merkinnälle (Primary Key, AUTO_INCREMENT)
user_id – Viittaus käyttäjään (Foreign Key → Users)
entry_date – Merkinnän päivämäärä
mood – Käyttäjän mieliala merkintäpäivänä
weight – Paino (desimaalimuodossa)
sleep_hours – Nukuttujen tuntien määrä
notes – Vapaamuotoiset lisähuomiot
created_at – Merkinnän tallennusaika
Sovelluksen Toiminnallisuus
Käyttäjille

Rekisteröityminen ja sisäänkirjautuminen
Hyvinvointitietojen kirjaaminen ja tarkastelu
Merkintöjen hallinta (lisäys, muokkaus, poistaminen ja lajittelu)
Ylläpitäjille (Admin)

Käyttäjätilien hallinta (käyttäjien listaus, lisäys ja poisto)
Pääsy kaikkiin päiväkirjamerkintöihin tarvittaessa
Tekniset Ratkaisut
JWT-autentikaatio varmistaa turvallisen kirjautumisen sekä käyttäjille että ylläpitäjille
RESTful API huolehtii tiedonhallinnasta ja päivittämisestä palvelimella
Käyttöoikeudet: Ylläpitäjä voi hallita käyttäjiä, mutta tavalliset käyttäjät voivat muokata vain omia tietojaan
Dynaaminen käyttöliittymä mukautuu käyttäjäroolin perusteella
Kehitysympäristö



Lähteet ovat valmiina oleva backend.



