$ErrorActionPreference = "Stop"

$projectRoot = Split-Path -Parent $MyInvocation.MyCommand.Path
$backendDir = Join-Path $projectRoot "backend"
$webDir = Join-Path $projectRoot "web"
$venvDir = Join-Path $backendDir ".venv"
$venvPython = Join-Path $venvDir "Scripts\python.exe"
$venvActivate = Join-Path $venvDir "Scripts\Activate.ps1"
$requirementsPath = Join-Path $backendDir "requirements.txt"
$backendEnvPath = Join-Path $backendDir ".env"
$logsDir = Join-Path $projectRoot "logs"

New-Item -ItemType Directory -Force -Path $logsDir | Out-Null

function Write-Step {
    param([string]$Message)
    Write-Host ""
    Write-Host "==> $Message" -ForegroundColor Cyan
}

function Ensure-Command {
    param(
        [string]$CommandName,
        [string]$InstallHint
    )

    if (-not (Get-Command $CommandName -ErrorAction SilentlyContinue)) {
        throw "$CommandName was not found. $InstallHint"
    }
}

function Ensure-BackendEnvironment {
    Write-Step "Preparing backend environment"

    if (-not (Test-Path $venvPython)) {
        Write-Host "Creating backend virtual environment in $venvDir" -ForegroundColor Yellow
        Push-Location $backendDir
        try {
            python -m venv .venv
        }
        finally {
            Pop-Location
        }
    }
    else {
        Write-Host "Reusing existing backend virtual environment." -ForegroundColor Green
    }

    Push-Location $backendDir
    try {
        & $venvPython -m pip install --upgrade pip | Out-Host
        & $venvPython -m pip install -r $requirementsPath | Out-Host
    }
    finally {
        Pop-Location
    }
}

function Ensure-WebDependencies {
    Write-Step "Preparing web dependencies"

    Push-Location $webDir
    try {
        $nodeModulesPath = Join-Path $webDir "node_modules"
        if (-not (Test-Path $nodeModulesPath)) {
            Write-Host "Installing web dependencies..." -ForegroundColor Yellow
            npm install | Out-Host
        }
        else {
            Write-Host "Reusing existing web node_modules." -ForegroundColor Green
        }
    }
    finally {
        Pop-Location
    }
}

function Get-ListeningProcessInfo {
    param([int]$Port)

    $connections = Get-NetTCPConnection -State Listen -ErrorAction SilentlyContinue |
        Where-Object { $_.LocalPort -eq $Port } |
        Select-Object -ExpandProperty OwningProcess -Unique

    $results = @()
    foreach ($procId in $connections) {
        try {
            $process = Get-CimInstance Win32_Process -Filter "ProcessId = $procId"
            if ($null -ne $process) {
                $results += [PSCustomObject]@{
                    Id = $procId
                    Name = $process.Name
                    CommandLine = $process.CommandLine
                }
            }
        }
        catch {
        }
    }

    return $results
}

function Stop-ManagedProcessOnPort {
    param(
        [int]$Port,
        [string[]]$SafeMarkers
    )

    $listeners = Get-ListeningProcessInfo -Port $Port
    if (-not $listeners -or $listeners.Count -eq 0) {
        return
    }

    foreach ($listener in $listeners) {
        $commandLine = [string]($listener.CommandLine)
        $isManaged = $false
        foreach ($marker in $SafeMarkers) {
            if ($commandLine -like "*$marker*") {
                $isManaged = $true
                break
            }
        }

        if ($isManaged) {
            Write-Host "Stopping existing MunaTrust process on port $Port (PID $($listener.Id))." -ForegroundColor Yellow
            Stop-Process -Id $listener.Id -Force -ErrorAction SilentlyContinue
        }
        else {
            Write-Host "Port $Port is already in use by PID $($listener.Id): $($listener.Name)" -ForegroundColor Red
            Write-Host "Command line: $commandLine" -ForegroundColor DarkRed
            throw "Port $Port is occupied by a process that does not look like a MunaTrust dev server."
        }
    }

    Start-Sleep -Seconds 1
}

function Wait-ForPortRelease {
    param([int]$Port)

    for ($attempt = 0; $attempt -lt 10; $attempt++) {
        $stillListening = Get-NetTCPConnection -State Listen -ErrorAction SilentlyContinue |
            Where-Object { $_.LocalPort -eq $Port }
        if (-not $stillListening) {
            return
        }
        Start-Sleep -Milliseconds 500
    }

    throw "Port $Port did not become free in time."
}

function Start-BackendWindow {
    Write-Step "Starting backend with auto-reload"

    $backendLog = Join-Path $logsDir "backend-dev.log"
    $backendErrLog = Join-Path $logsDir "backend-dev.err.log"

    $backendCommand = @"
Set-Location '$backendDir'
. '$venvActivate'
`$env:MUNATRUST_RELOAD_ENABLED='1'
Write-Host 'MunaTrust backend starting on http://127.0.0.1:8787' -ForegroundColor Green
Write-Host 'Python changes auto-reload. If backend/.env changes, rerun start-dev.ps1.' -ForegroundColor Yellow
uvicorn app.main:app --host 127.0.0.1 --port 8787 --reload 2>&1 | Tee-Object -FilePath '$backendLog'
"@

    Start-Process powershell -ArgumentList @(
        "-NoExit",
        "-ExecutionPolicy", "Bypass",
        "-Command", $backendCommand
    ) -WindowStyle Normal | Out-Null

    Write-Host "Backend logs: $backendLog" -ForegroundColor DarkGray
    Write-Host "Backend errors are included in the same terminal output. Last stderr log path reserved: $backendErrLog" -ForegroundColor DarkGray
}

function Start-WebWindow {
    Write-Step "Starting Vite dev server"

    $webLog = Join-Path $logsDir "web-dev.log"

$webCommand = @"
Set-Location '$webDir'
Write-Host 'MunaTrust web app starting on http://localhost:5173' -ForegroundColor Green
npm run dev -- --strictPort 2>&1 | Tee-Object -FilePath '$webLog'
"@

    Start-Process powershell -ArgumentList @(
        "-NoExit",
        "-ExecutionPolicy", "Bypass",
        "-Command", $webCommand
    ) -WindowStyle Normal | Out-Null

    Write-Host "Web logs: $webLog" -ForegroundColor DarkGray
}

Ensure-Command -CommandName "python" -InstallHint "Install Python 3.11+ and make sure it is on PATH."
Ensure-Command -CommandName "npm" -InstallHint "Install Node.js and npm, then reopen PowerShell."

Ensure-BackendEnvironment
Ensure-WebDependencies

Write-Step "Cleaning up stale MunaTrust dev servers"
Stop-ManagedProcessOnPort -Port 8787 -SafeMarkers @($projectRoot, "uvicorn app.main:app", "munatrust")
Stop-ManagedProcessOnPort -Port 5173 -SafeMarkers @($projectRoot, "vite", "munatrust-web")
Wait-ForPortRelease -Port 8787
Wait-ForPortRelease -Port 5173

if (-not (Test-Path $backendEnvPath)) {
    Write-Host ""
    Write-Host "No backend/.env file found. That's okay for local dev, but add one if you need ADMIN_TOKEN or custom settings." -ForegroundColor Yellow
}

Start-BackendWindow
Start-WebWindow

Write-Step "Opening browser"
Start-Process "http://localhost:5173"

Write-Host ""
Write-Host "MunaTrust dev workflow is up." -ForegroundColor Green
Write-Host "Backend: http://127.0.0.1:8787" -ForegroundColor White
Write-Host "Web:     http://localhost:5173" -ForegroundColor White
Write-Host "Reload info: http://127.0.0.1:8787/dev/reload-info" -ForegroundColor White
Write-Host ""
Write-Host "Tip: backend Python code changes auto-reload. Changes to backend/.env require restarting this script." -ForegroundColor Yellow
