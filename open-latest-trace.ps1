# Otevře nejnovější trace.zip z ui-test-artifacts
param()

# Info o aktivním venv
if ($env:VIRTUAL_ENV -eq $null) {
  Write-Host "Aktivuj venv: .\.venv\Scripts\Activate.ps1" -ForegroundColor Yellow
}

$trace = Get-ChildItem ".\ui-test-artifacts" -Recurse -Filter trace.zip |
          Sort-Object LastWriteTime -Descending |
          Select-Object -First 1

if (-not $trace) {
  Write-Host "Žádný trace.zip nenalezen." -ForegroundColor Red
  exit 1
}

Write-Host "Otevírám: $($trace.FullName)" -ForegroundColor Cyan
python -m playwright show-trace $trace.FullName