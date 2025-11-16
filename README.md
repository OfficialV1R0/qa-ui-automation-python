# QA UI Automation – Python + Playwright + pytest

[![UI tests](https://github.com/OfficialV1R0/qa-ui-automation-python/actions/workflows/pytest.yml/badge.svg)](https://github.com/OfficialV1R0/qa-ui-automation-python/actions/workflows/pytest.yml)

Testovací aplikace: https://www.saucedemo.com

Scénáře:
- Login success
- Login invalid (negativní)
- Add to cart
- Remove from cart
- Logout
- Locked out user (negativní)

## Lokální běh

```powershell
python -m venv .venv
.venv\Scripts\Activate.ps1
pip install -r requirements.txt
python -m playwright install
pytest
```

Poznámka: Pokud se nepodaří aktivovat venv, povol si spouštění skriptů (jednorázově):
```powershell
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
```

## CI
GitHub Actions workflow `.github/workflows/pytest.yml` spustí testy při každém pushi.
Artefakty se nahrávají vždy (i při zeleném běhu) do artefaktu „ui-test-artifacts“.

## Artifacts
- Výstup lokálně: složka `test-results/` – pro každý test najdeš `trace.zip`.
- Na GitHubu: v běhu Actions otevři „Artifacts“ → `ui-test-artifacts`.
- Otevření trace:

```powershell
python -m playwright show-trace trace.zip
```

## Co se naučeno
- Základy Playwright sync API a práce se selektory
- Organizace testů a fixture (login) v Pytestu
- CI/CD: instalace Playwrightu na Linux runneru a nahrávání artefaktů
