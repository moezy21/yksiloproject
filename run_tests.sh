#!/bin/bash

# Robot Framework Test Runner Script
# Tämä skripti suorittaa kaikki automaatiotestit

echo "=========================================="
echo "Robot Framework - Testien suoritus"
echo "=========================================="

# Tarkista että virtuaaliympäristö on aktivoitu
if [ -z "$VIRTUAL_ENV" ]; then
    echo "❌ Virtuaaliympäristö ei ole aktivoitu!"
    echo "Aktivoi virtuaaliympäristö komennolla:"
    echo "source .venv/bin/activate"
    exit 1
fi

echo "✅ Virtuaaliympäristö aktivoitu"

# Tarkista että robot-komento löytyy
if ! command -v robot &> /dev/null; then
    echo "❌ Robot Framework ei löydy!"
    echo "Asenna Robot Framework komennolla:"
    echo "pip install robotframework"
    exit 1
fi

echo "✅ Robot Framework löytyi"

# Luo results-hakemisto jos ei ole
mkdir -p results

echo ""
echo "Suoritetaan testit..."
echo ""

# Suorita testit ja generoi raportit
robot --outputdir results tests/

echo ""
echo "=========================================="
echo "Testaus valmis!"
echo "Raportit löytyvät results/ -hakemistosta:"
echo "- report.html (yhteenveto)"
echo "- log.html (yksityiskohtainen loki)"
echo "=========================================="