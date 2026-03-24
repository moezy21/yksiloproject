# Robot Framework - Automaatiotestit (Tehtävä 2)

## Yleiskatsaus

Tämä dokumentti kuvailee terveyspäiväkirja-sovellukselle luotuja Robot Framework -automaatiotestejä. Testit on jaettu kahteen pääkategoriaan: API-testit ja selaintestit.

## Testien rakenne

Testit sijaitsevat `tests/` -hakemistossa:

```
tests/
├── api_tests.robot          # API-rajapintojen testit
├── browser_tests.robot      # Selainpohjaiset käyttöliittymätestit
└── test_suite.robot         # Testisarjan yhdistely
```

## Testien suorittaminen

### Edellytykset

Ennen testien suorittamista varmista että:

1. Backend-palvelin on käynnissä: `http://127.0.0.1:3000`
2. Frontend-palvelin on käynnissä: `http://127.0.0.1:8080`
3. Virtuaaliympäristö on aktivoitu: `source .venv/bin/activate`

### Testien ajaminen

**Kaikki testit:**
```bash
robot tests/
```

**Vain API-testit:**
```bash
robot tests/api_tests.robot
```

**Vain selaintestit:**
```bash
robot tests/browser_tests.robot
```

**Raporttien generointi:**
```bash
robot --outputdir results tests/
```

**Helppo testien suoritus (suositeltu):**
```bash
./run_tests.sh
```

`run_tests.sh` -skripti tarkistaa automaattisesti että kaikki edellytykset ovat kunnossa ennen testien suorittamista.

## Testien kuvaus

### API-testit (api_tests.robot)

1. **Test API Health Check**
   - Tarkistaa että API vastaa pyyntöihin
   - Testaa `/api/users` -endpointin saatavuus

2. **Test User Registration**
   - Testaa uuden käyttäjän rekisteröinti
   - Lähettää POST-pyynnön `/api/auth/register` -endpointiin

3. **Test User Login**
   - Testaa käyttäjän kirjautuminen
   - Tarkistaa että JWT-token palautetaan onnistuneesti

4. **Test Get User Profile**
   - Testaa käyttäjäprofiilin hakeminen
   - Käyttää autentikoitua pyyntöä

### Selaintestit (browser_tests.robot)

1. **Test Frontend Page Load**
   - Tarkistaa että etusivu latautuu oikein
   - Varmistaa oikean otsikon

2. **Test Login Form Elements**
   - Tarkistaa kirjautumislomakkeen elementtien olemassaolo
   - Varmistaa että kaikki tarvittavat kentät ovat näkyvissä

3. **Test Login Form Submission**
   - Testaa kirjautumislomakkeen lähetys
   - Huom: Tarvitsee toimivan backendin toimiakseen täysin

4. **Test Info Box Content**
   - Tarkistaa info-boxin sisällön oikeellisuuden
   - Varmistaa että sovelluksen kuvaus on näkyvissä

## Testitulokset

Testien suorittamisen jälkeen generoituvat seuraavat tiedostot `results/` -hakemistoon:

- `output.xml` - Testitulokset XML-muodossa
- `log.html` - Yksityiskohtainen loki HTML-muodossa
- `report.html` - Yhteenveto raportti HTML-muodossa

### Nykyinen testien tila

**API-testit (4 testit):**
- ✅ Test API Health Check - **PASS**
- ❌ Test User Registration - FAIL (vaatii toimivan tietokantayhteyden)
- ❌ Test User Login - FAIL (riippuu rekisteröinnistä)
- ❌ Test Get User Profile - FAIL (riippuu kirjautumisesta)

**Selaintestit (4 testit):**
- ✅ Test Frontend Page Load - **PASS**
- ✅ Test Login Form Elements - **PASS**
- ✅ Test Login Form Submission - **PASS**
- ✅ Test Info Box Content - **PASS**

**Web Form -testit (9 testit, Tehtävä 3):**
- ✅ Test Dropdown Select - **PASS**
- ✅ Test Dropdown Datalist - **PASS**
- ✅ Test File Input - **PASS**
- ✅ Test Checkboxes - **PASS**
- ✅ Test Radio Buttons - **PASS**
- ✅ Test Text Input - **PASS**
- ✅ Test Textarea - **PASS**
- ✅ Test Form Reset - **PASS**
- ✅ Test Form Submission - **PASS**

**Testisviite (1 testi):**
- ✅ Suite Setup Test - **PASS**

**Yhteensä: 18 testistä 14 onnistuu, 4 epäonnistuu**

### Huomioita testeistä

- **API-testit** vaativat toimivan MySQL-tietokantayhteyden
- **Selaintestit** toimivat ilman backend-yhteyttä
- Testit käyttävät dynaamisesti generoituja käyttäjätunnuksia välttääkseen duplikaatteja

## Testien laajentaminen

Testejä voidaan laajentaa lisäämällä uusia testitapauksia:

- Päiväkirjamerkintöjen hallinta (lisäys, muokkaus, poisto)
- Käyttäjien hallinta (admin-toiminnot)
- Virhetilanteiden testaus
- Suorituskykytestaus

## Teknologiat

- **Robot Framework 7.4.2** - Testauskehys
- **RequestsLibrary** - HTTP API -testaukseen
- **Browser Library** - Selainautomaatioon
- **Collections** - Datan käsittelyyn

## Huomioita

- Selaintestit vaativat Chromium-selaimen
- API-testit tarvitsevat toimivan backend-palvelimen
- Testit käyttävät testikäyttäjää (testuser/testpass123)
- Browser Library saattaa vaatia Playwrightin asennuksen