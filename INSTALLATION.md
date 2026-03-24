# Robot Framework - Asennusdokumentaatio

## Yleiskatsaus

Tämä dokumentti kuvailee Robot Framework -työkalun ja siihen liittyvien kirjastojen asennusprosessin opiskelijoiden näkökulmasta.

## Asennetut työkalut

Seuraavat työkalut asennettiin projektiin:

1. **Robot Framework** - Automaatiotestauksen päätyökalu
2. **Browser Library** - Selaimenpohjaisten testien tekemiseen
3. **Requests Library** - HTTP-pyyntöjen testaukseen
4. **CryptoLibrary** - Salaukseen ja salasanojen hallintaan
5. **Robotidy** - Robot Framework -koodin muotoiluun

## Asennusvaatimukset

- Python 3.12.1 tai uudempi
- pip (Python paketinhallinta)
- Virtuaaliympäristö (venv)

## Asennusprosessi

### 1. Virtuaaliympäristön luominen

Ensin luotiin virtuaaliympäristö projektiin:

```bash
python3 -m venv .venv
```

### 2. Virtuaaliympäristön aktivoiminen

Aktivoidaan luotu virtuaaliympäristö:

```bash
source .venv/bin/activate
```

Kun virtuaaliympäristö on aktivoitu, terminaalin eteen ilmestyy `(.venv)` merkintä.

### 3. Pakettien asennus

Seuraavat paketit asennettiin pip-komennolla:

```bash
pip install robotframework
pip install robotframework-browser
pip install robotframework-requests
pip install robotframework-crypto
pip install robotframework-tidy
```

## Asennuksen varmistaminen

Asennuksen onnistumisen voi tarkistaa seuraavalla komennolla:

```bash
robot --version
```

Komennon pitäisi tulostaa Robot Framework -versio (esim. Robot Framework 7.4.2).

Kaikkien asennettujen pakettien näkeminen onnistuu komennolla:

```bash
pip list | grep robot
```

## Asennettujen pakettien versiot

Projektin asennettujen pakettien versiot:

- Robot Framework 7.4.2
- Robot Framework Browser Library
- Robot Framework Requests Library
- Robot Framework CryptoLibrary
- Robotidy

## Virtuaaliympäristön käyttö

Joka kerta kun avaat uuden terminaalin, muista aktivoida virtuaaliympäristö:

```bash
source .venv/bin/activate
```

Virtuaaliympäristöstä pääsee ulos komennolla:

```bash
deactivate
```

## Yhteenveto

Robot Framework ja kaikki tarvittavat kirjastot on nyt asennettu projektiin. Voit nyt alkaa kirjoittamaan automaatiotesteja käyttämällä näitä työkaluja.
