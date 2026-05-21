# Start MunaTrust On Windows

Open three PowerShell windows.

## Fastest Option

From the project root:

```powershell
powershell -ExecutionPolicy Bypass -File .\start-dev.ps1
```

This starts the backend with auto-reload, starts the Vite web dev server, installs missing dependencies when needed, and opens `http://localhost:5173`.

If you change `backend\.env`, restart the script so the backend reloads the new environment values.

## 1. Backend

```powershell
cd backend
python -m venv .venv
.venv\Scripts\activate
python -m pip install -r requirements.txt
$env:ADMIN_TOKEN="123456"
uvicorn app.main:app --host 127.0.0.1 --port 8787 --reload
```

## 2. Web

```powershell
cd web
npm install
npm run dev
```

Open:

- `http://127.0.0.1:5173`
- `http://127.0.0.1:5173/admin`
- Local owner access only. The admin dashboard works only from `127.0.0.1`, `localhost`, or `::1`.

## Hybrid Trust Notes

- Source code, ZIP contents, diffs, repo names, project names, and secrets stay local by default.
- Optional cloud sync is metadata-only.
- Use the `Hybrid trust layer` and `Privacy dashboard` sections in the web UI to verify the current privacy posture.

## 3. VSCode Extension

```powershell
cd extension
npm install
npm run compile
code .
```

Press `F5` to open the Extension Development Host.

## Test Admin Analytics

```powershell
Invoke-RestMethod `
  -Headers @{ "x-admin-token" = "123456" } `
  http://127.0.0.1:8787/admin/analytics
```

## Mock Upgrade

```powershell
Invoke-RestMethod -Method Post `
  -Uri http://127.0.0.1:8787/license/mock-upgrade `
  -ContentType "application/json" `
  -Body '{"telemetry":{"install_id":"manual-test","app_source":"web","os":"windows","app_version":"0.1.0"}}'
```
