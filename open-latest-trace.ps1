# Otevře nejnovější trace.zip z ui-test-artifacts
param(
    [string]$TestName
)

if (-not $env:VIRTUAL_ENV) {
    Write-Host "Aktivuj venv: .\.venv\Scripts\Activate.ps1" -ForegroundColor Yellow
}

$traces = Get-ChildItem ".\ui-test-artifacts" -Recurse -Filter trace.zip -ErrorAction SilentlyContinue

if (-not $traces -or $traces.Count -eq 0) {
    Write-Host "Žádný trace.zip nenalezen." -ForegroundColor Red
    exit 1
}

if ($TestName) {
    $filtered = $traces | Where-Object { $_.Directory.Name -like "*$TestName*" }
    if (-not $filtered -or $filtered.Count -eq 0) {
        Write-Host "Žádný trace odpovídající '$TestName'." -ForegroundColor Red
        exit 1
    }
    $trace = $filtered | Sort-Object LastWriteTime -Descending | Select-Object -First 1
} else {
    $trace = $traces | Sort-Object LastWriteTime -Descending | Select-Object -First 1
}

Write-Host "Otevírám trace: $($trace.FullName)" -ForegroundColor Cyan
python -m playwright show-trace $trace.FullName