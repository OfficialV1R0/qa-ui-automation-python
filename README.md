# QA UI Automation – Python + Playwright + pytest

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
Artefakty (trace/screenshot/video při selhání) se nahrají jako „ui-test-artifacts“.

Badge (volitelné – funguje po prvním pushi):
[![UI tests](https://github.com/OfficialV1R0/qa-ui-automation-python/actions/workflows/pytest.yml/badge.svg)](https://github.com/OfficialV1R0/qa-ui-automation-python/actions/workflows/pytest.yml)

## Co se naučeno
- Základy Playwright sync API a práce se selektory
- Organizace testů a fixture (login) v Pytestu
- CI/CD: instalace Playwrightu na Linux runneru a nahrávání artefaktů
