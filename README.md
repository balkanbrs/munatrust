# MunaTrust

**Your AI writes code. MunaTrust decides if it's safe.**

MunaTrust is a local-first AI Software Trust Infrastructure platform. It sits between AI-generated code and production deployment, combining deterministic review, local AI reasoning, trust governance, hallucination detection, review memory, telemetry, and IDE workflows.

MunaTrust collects privacy-safe usage metadata only. It never sends source code, diffs, file contents, secrets, project names, or repo names.

## Free Preview

MunaTrust is currently in **Free Preview**.

- All main trust commands are available during the preview
- LemonSqueezy and license wiring remain in the codebase
- Upgrade to Pro opens the production LemonSqueezy checkout
- Billing does not block usage in the current preview

Core commands available in Free Preview:

- `MunaTrust: Diagnostics`
- `MunaTrust: Full Project Scan`
- `MunaTrust: Friday Night Deploy`
- `MunaTrust: Deployment Confidence Check`
- `MunaTrust: Hallucination Scan`
- `MunaTrust: Autonomous Repair`

## Manual Install

Until Open VSX namespace verification is completed, MunaTrust is distributed manually through GitHub Release or direct VSIX download.

Install with:

```powershell
code --install-extension munatrust-0.1.0.vsix
```

Then:

1. Reload VSCode
2. Press `Ctrl+Shift+P`
3. Type `MunaTrust`
4. Run `MunaTrust: Diagnostics`

If you need to reinstall:

```powershell
code --install-extension munatrust-0.1.0.vsix --force
```

If you need to uninstall:

```powershell
code --uninstall-extension munatrust.munatrust
```

## Open VSX status

Open VSX publishing is currently pending namespace verification. Until that is completed, manual VSIX installation is the supported public preview path.

## Project Structure

```text
munatrust/
  backend/      FastAPI API, trust engine, analytics, repo memory, CLI entrypoint
  extension/    VSCode extension for trust reviews inside the editor
  web/          Vite + React command center
  docs/         privacy, publishing, architecture, test cases
  start-dev.ps1 one-command local development
```

## Implemented Systems

- Local-first backend with deterministic review engine
- Optional Ollama reasoning with `qwen2.5-coder:3b`
- Multi-agent trust engine:
  - Security AI
  - Architecture AI
  - Performance AI
  - Business Logic AI
  - Database AI
  - Tenant Safety AI
  - Reliability AI
  - Deployment AI
- Deployment governance:
  - deployment confidence
  - Friday Night Deploy signal
  - Friday Night Deploy score
  - senior engineer approval
  - blast radius estimation
  - rollback risk
  - deploy approval posture
- Hallucination infrastructure:
  - repo reality checks
  - unresolved import/helper detection
  - invention labels
  - hallucination heatmap
- Repo memory and trust intelligence:
  - local review history
  - trust trend summary
  - stability forecast
- System health dashboard
- Local Codex detection and orchestration readiness diagnostics
- Autonomous planning and generate-app flow
- Safe Local Codex task runner with execution preview
- Autonomous repair planning
- Full repo/project scan with dead-button and broken-route detection
- Project scan job engine with live progress and dedicated report pages
- ZIP project analysis
- Dead Flow Intelligence engine and heatmap
- Hybrid trust layer with optional metadata-only cloud sync
- Privacy dashboard with explicit local-vs-cloud boundaries
- Local account and billing-ready dashboard
- Trust intelligence update packs and refresh flow
- Privacy-safe telemetry and admin analytics
- Hybrid trust analytics:
  - privacy dashboard views
  - trust update refreshes
  - account login activity
  - plan/source/event breakdowns
- VSCode extension packaging
- Local CLI

## One-command local development

From the project root:

```powershell
powershell -ExecutionPolicy Bypass -File .\start-dev.ps1
```

What it does:

- reuses `backend/.venv` when present
- installs missing backend and web dependencies
- starts FastAPI with `uvicorn --reload`
- starts the Vite web dev server
- opens [http://localhost:5173](http://localhost:5173)

Backend Python code reloads automatically. If you change `backend/.env`, restart `start-dev.ps1`.

## Exact startup commands

### Backend

```powershell
cd backend
python -m venv .venv
.venv\Scripts\activate
python -m pip install -r requirements.txt
$env:ADMIN_TOKEN="123456"
uvicorn app.main:app --host 127.0.0.1 --port 8787 --reload
```

### Web

```powershell
cd web
npm install
npm run dev
```

Open:

- [http://127.0.0.1:5173](http://127.0.0.1:5173)
- Admin: [http://127.0.0.1:5173/admin](http://127.0.0.1:5173/admin)

### VSCode Extension

```powershell
cd extension
npm install
npm run compile
code .
```

Press `F5`, then run:

- `MunaTrust: Review Current Changes`
- `MunaTrust: Review Current File`
- `MunaTrust: Friday Night Deploy Review`
- `MunaTrust: Hallucination Scan`
- `MunaTrust: Deployment Confidence Check`
- `MunaTrust: Generate App`
- `MunaTrust: Autonomous Repair`
- `MunaTrust: Full Project Scan`
- `MunaTrust: Dead Flow Scan`
- `MunaTrust: Diagnostics`
- `MunaTrust: Open Trust Report`

### CLI

Install the local CLI entrypoint:

```powershell
cd backend
.venv\Scripts\activate
python -m pip install -e .
```

Then use. The CLI runs local trust logic directly, so it still works even if the backend server is offline:

```powershell
munatrust diagnostics
munatrust review --diff-file C:\path\to\change.diff
munatrust trust-score --diff-file C:\path\to\change.diff
munatrust hallucination-scan --diff-file C:\path\to\change.diff
munatrust deploy-check --diff-file C:\path\to\change.diff
munatrust friday-night-review --diff-file C:\path\to\change.diff
munatrust generate-app --goal "Build a multi-tenant restaurant ordering platform"
munatrust repair --problem "Checkout helper import missing"
munatrust full-scan --path C:\path\to\repo
munatrust dead-flow-scan --path C:\path\to\repo
```

## Important local endpoints

- `GET /health`
- `GET /models`
- `GET /diagnostics`
- `GET /hybrid/status`
- `POST /hybrid/settings`
- `GET /privacy/summary`
- `GET /trust-updates`
- `POST /trust-updates/refresh`
- `GET /account`
- `POST /account/login/mock`
- `POST /account/subscription/mock`
- `GET /license/status`
- `GET /dev/reload-info`
- `POST /review`
- `POST /review/friday-night`
- `GET /usage`
- `POST /license/mock-upgrade`
- `POST /telemetry/event`
- `GET /admin/analytics`
- `GET /admin/analytics/installs`
- `GET /admin/analytics/active-users`
- `GET /admin/analytics/command-usage`
- `GET /admin/analytics/daily-activity`
- `GET /admin/analytics/extension-versions`
- `GET /admin/users`
- `GET /admin/events`
- `GET /trust/summary`
- `GET /reviews/history`
- `POST /orchestrate/plan`
- `POST /orchestrate/generate-app`
- `POST /orchestrate/brief`
- `POST /orchestrate/run-codex`
- `POST /repair/plan`
- `POST /scan/full`
- `POST /scan/dead-flow`
- `POST /scan/zip`
- `POST /project-scan/start`
- `GET /project-scan/status/{job_id}`
- `GET /project-scan/result/{job_id}`
- `GET /project-scan/latest`

## Admin analytics

Set `ADMIN_TOKEN=123456` before starting the backend.

The admin dashboard is local-owner only. It is intentionally hidden from the product UI and is only reachable directly at [http://127.0.0.1:5173/admin](http://127.0.0.1:5173/admin) or the `localhost` equivalent on the machine that owns the install.

MunaTrust now requires both:

- a local loopback request (`127.0.0.1`, `localhost`, or `::1`)
- the correct `ADMIN_TOKEN`

Non-local, LAN, and external requests are rejected with `403 Forbidden`. Failed admin attempts are rate limited and logged locally.

Open [http://127.0.0.1:5173/admin](http://127.0.0.1:5173/admin) and enter the same token.

## Hybrid trust architecture

MunaTrust now runs as a hybrid trust platform with a strict privacy boundary.

Local responsibilities:

- code review
- ZIP and full repo analysis
- hallucination detection
- deployment confidence
- Friday Night Deploy review
- dead flow detection
- Local Codex orchestration
- business logic analysis

Optional cloud responsibilities:

- licensing and subscriptions
- telemetry aggregation
- trust intelligence updates
- orchestration policy updates
- enterprise analytics

Source code, ZIP contents, diffs, repo names, project names, and secrets stay local by default.

## Privacy dashboard

Open the main command center and look for the `Hybrid trust layer` and `Privacy dashboard` sections.

They show:

- what stays local
- what may sync as metadata only
- whether cloud sync is enabled
- which trust update pack is active
- whether telemetry upload is enabled

Cloud sync is disabled by default. When enabled, it is metadata-only.

## Privacy-safe telemetry

MunaTrust uses anonymous install analytics for product health and preview-launch learning.

What MunaTrust may send:

- anonymous machine or install identifier
- command usage events
- extension activation events
- project scan completion events
- hallucination detection counts
- autonomous repair run events
- app version and extension version
- OS metadata

What MunaTrust never sends by default:

- source code
- diffs
- ZIP contents
- file contents
- secrets
- repo names
- project names

VSCode users can opt out of telemetry in settings:

- `munatrust.telemetryEnabled = false`

## Account and billing dashboard

The web command center now includes a local account and billing-ready dashboard.

Current state:

- local mock login
- local plan switching
- production LemonSqueezy checkout URL wiring
- local license status endpoint
- no live subscription processor connected yet

### Billing setup

Configure these backend env variables for LemonSqueezy-ready billing:

- `CHECKOUT_URL`
- `LEMONSQUEEZY_STORE_ID`
- `LEMONSQUEEZY_VARIANT_SOLO`
- `LEMONSQUEEZY_VARIANT_PRO`
- `LEMONSQUEEZY_VARIANT_TEAM`
- `LEMONSQUEEZY_WEBHOOK_SECRET`

New billing and license endpoints:

- `POST /api/billing/create-checkout`
- `POST /api/billing/webhook`
- `POST /api/license/verify`
- `GET /api/license/status`

If these env variables are missing, MunaTrust still works in Free Preview mode. Billing is currently non-blocking while public preview is active.

`MunaTrust: Upgrade to Pro` opens the configured LemonSqueezy checkout when billing is available. If billing is unavailable, MunaTrust falls back gracefully and keeps all preview commands working.

Admin endpoints accept:

- `x-admin-token: <token>`
- `Authorization: Bearer <token>`

## Pricing model in the product

- `FREE PREVIEW` - full feature access during the current public preview
- `SOLO` - $19/month
- `PRO` - $49/month
- `TEAM` - $199/month, 5 seats included
- `ENTERPRISE` - custom pricing

The current MVP keeps billing local-first and non-blocking. Free Preview remains active even when production checkout is configured.

## VSCode Marketplace publish steps

1. `cd extension`
2. `npm install`
3. `npm run compile`
4. `npm run package`
5. Sign in with your publisher account:

```powershell
vsce login <publisher-name>
```

6. Publish:

```powershell
vsce publish
```

Current output package:

- [munatrust-0.1.0.vsix](C:/Users/balka/Documents/Codex/2026-05-21/you-are-a-senior-full-stack/munatrust/extension/munatrust-0.1.0.vsix)

## OpenVSX publish steps

```powershell
cd extension
npx ovsx publish munatrust-0.1.0.vsix -p <openvsx-token>
```

## GitHub App preparation status

Prepared:

- trust review logic lives behind backend endpoints instead of inside the extension only
- telemetry/admin layer already supports event aggregation
- trust history and governance decisions are persisted locally
- review output is structured enough to become PR comments or CI status output

Still needed:

- GitHub App auth flow
- webhook receiver
- PR annotation renderer
- merge-blocking and deployment-gate integration
- CI action templates

## What is production-ready now

- local deterministic trust review
- local Ollama reasoning fallback model
- trust dashboard and diagnostics
- privacy-safe telemetry
- admin analytics
- VSCode extension dev workflow
- VSIX packaging
- CLI trust checks

## What still needs to be added before real platform launch

- real auth and accounts
- LemonSqueezy webhook handling and subscription sync
- enterprise policy management
- team dashboards with identity
- JetBrains plugin
- GitHub App runtime
- OpenVSX publisher setup
- repository URL and final marketplace assets
- polished screenshots and branding kit

## Docs

- [START_WINDOWS.md](C:/Users/balka/Documents/Codex/2026-05-21/you-are-a-senior-full-stack/munatrust/START_WINDOWS.md)
- [ARCHITECTURE.md](C:/Users/balka/Documents/Codex/2026-05-21/you-are-a-senior-full-stack/munatrust/docs/ARCHITECTURE.md)
- [PRIVACY.md](C:/Users/balka/Documents/Codex/2026-05-21/you-are-a-senior-full-stack/munatrust/docs/PRIVACY.md)
- [PUBLISHING.md](C:/Users/balka/Documents/Codex/2026-05-21/you-are-a-senior-full-stack/munatrust/docs/PUBLISHING.md)
- [OPENVSX_PUBLISHING.md](C:/Users/balka/Documents/Codex/2026-05-21/you-are-a-senior-full-stack/munatrust/docs/OPENVSX_PUBLISHING.md)
- [TEST_CASES.md](C:/Users/balka/Documents/Codex/2026-05-21/you-are-a-senior-full-stack/munatrust/docs/TEST_CASES.md)
- [LAUNCH_CHECKLIST.md](C:/Users/balka/Documents/Codex/2026-05-21/you-are-a-senior-full-stack/munatrust/docs/LAUNCH_CHECKLIST.md)
