# Robot Framework - Web Form -testit (Tehtävä 3)

## Yleiskatsaus

Tämä dokumentti kuvailee Browser Libraryn laajennettua käyttöä Web Form -testauksessa. Tehtävässä tutkitaan erilaisia HTML-form-elementtejä ja niiden testaamista Robot Frameworkilla.

## Testattavat elementit

Tehtävässä testataan seuraavia Web Form -elementtejä:

1. **Dropdown (Select)** - Perinteinen alasvetovalikko
2. **Dropdown (Datalist)** - Moderni datalist-elementti
3. **File Input** - Tiedoston lataus
4. **Checkboxes** - Valintaruudut (useita valintoja)
5. **Radio Buttons** - Radiopainikkeet (yksi valinta)
6. **Text Input** - Tekstikenttä
7. **Textarea** - Monirivinen tekstikenttä
8. **Form Reset** - Lomakkeen tyhjennys
9. **Form Submission** - Lomakkeen lähetys

## Testisivu

Testit kohdistuvat `frontend/web-form-test.html` -sivulle, joka sisältää kaikki testattavat form-elementit.

## Testien suorittaminen

### Yksittäiset Web Form -testit:

```bash
robot tests/web_form_tests.robot
```

### Kaikki testit (sisältää Web Form -testit):

```bash
./run_tests.sh
```

## Testien kuvaus

### Test Dropdown Select
- Testaa perinteisen select-elementin toimintaa
- Valitsee vaihtoehtoja sekä arvon että tekstin perusteella
- Varmistaa oikean vaihtoehdon valinnan

### Test Dropdown Datalist
- Testaa modernin datalist-elementin käyttöä
- Syöttää tekstiä input-kenttään
- Varmistaa syötetyn tekstin tallentumisen

### Test File Input
- Testaa tiedoston lataus -toimintoa
- Luo väliaikaisen testitiedoston
- Lataa tiedoston ja varmistaa valinnan

### Test Checkboxes
- Testaa valintaruutujen (checkbox) toimintaa
- Valitsee ja poistaa valintoja
- Varmistaa useiden valintojen toimivuuden

### Test Radio Buttons
- Testaa radiopainikkeiden toimintaa
- Varmistaa että vain yksi vaihtoehto voi olla valittuna kerrallaan
- Testaa vaihtoehtojen vaihto

### Test Text Input
- Testaa yksirivisen tekstikentän toimintaa
- Syöttää ja muuttaa tekstiä
- Varmistaa tekstin tallentumisen

### Test Textarea
- Testaa monirivisen tekstialueen toimintaa
- Syöttää pidempiä tekstejä
- Varmistaa tekstin tallentumisen

### Test Form Reset
- Testaa lomakkeen tyhjennys -toimintoa
- Täyttää lomakkeen ja tyhjentää sen
- Varmistaa että kentät tyhjentyvät

### Test Form Submission
- Testaa lomakkeen lähetys -toimintoa
- Täyttää vaaditut kentät ja lähettää lomakkeen
- Varmistaa onnistuneen lähetysviestin näkymisen

## Testitulokset

**Web Form -testit: 9/9 onnistuu** ✅

Kaikki testatut form-elementit toimivat oikein:
- ✅ Dropdown (Select)
- ✅ Dropdown (Datalist)
- ✅ File Input
- ✅ Checkboxes
- ✅ Radio Buttons
- ✅ Text Input
- ✅ Textarea
- ✅ Form Reset
- ✅ Form Submission

## Testien laajentaminen

Testejä voidaan laajentaa lisäämällä:

- Validointivirheiden testaus
- JavaScript-pohjainen validointi
- Eri selaimien yhteensopivuus
- Suorituskykytestaus
- Visuaalinen regressiotestaus

## Huomioita

- Testit vaativat Chromium-selaimen
- File input -testi luo väliaikaisen tiedoston `/tmp/test_file.txt`
- Kaikki testit ovat itsenäisiä ja voidaan ajaa erikseen