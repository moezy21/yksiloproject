Järjestelmän Rakenne

<img width="1048" alt="Screenshot 2025-03-16 at 14 42 50" src="https://github.com/user-attachments/assets/284164ed-d4d1-4218-9d5f-616cda6e4d64" />

<img width="1048" alt="Screenshot 2025-03-16 at 14 43 00" src="https://github.com/user-attachments/assets/8ee76481-243e-424b-97c6-281a5bb1e9bd" />
<img width="1048" alt="Screenshot 2025-03-16 at 14 43 16" src="https://github.com/user-attachments/assets/51559ca4-7eb9-4c4f-8e0b-b2774224adc3" />


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



