![MunaTrust](https://raw.githubusercontent.com/balkanbrs/munatrust/main/media/munatrust-logo.png)

# MunaTrust Code Trust

**Trust your code. Ship with confidence.**

MunaTrust Code Trust is an AI code trust scanner for detecting risky generated code patterns, exposed secrets, and release trust issues before they reach production.

Catch dangerous AI-generated code fast, see what is actually risky, and decide what to fix before you ship. MunaTrust stays local-first while giving you deeper reasoning when you want it and a full private local deep scan when you need maximum privacy.

## Scan options

### Basic Scan

- Fast, local, free
- Static and filesystem-based trust scan
- No Ollama requirement
- No cloud usage

### Advanced AI Scan

- Runs the same local extraction first
- Sends only sanitized risk context for deeper reasoning
- Designed for deeper prioritization, explanation, and release trust reasoning
- Optional: you can keep using MunaTrust without it

### Full Private Local Deep Scan

- Fully local deep reasoning
- No code leaves your machine
- Best for users who want deeper local reasoning without cloud usage

## MunaTrust scan levels

- **Basic Scan** - unlimited local scan, fast and free
- **Advanced AI Scan** - deeper AI reasoning with monthly quotas
- **Full Private Scan** - full private local deep scan

## Key features

- Full Project Scan with trust scoring
- Standalone local scan mode that works even without a bundled backend project
- Scan type selector for Basic, Advanced AI, and Full Private Deep Scan
- Actionable findings with severity, category, file path, why-it-matters notes, and suggested fixes
- `.env` and environment exposure detection
- Secret-like string detection with safe snippet redaction
- Package manifest and release-sensitive file discovery
- Suspicious generated-code marker detection
- Diagnostics, system health, and workspace trust guidance
- License activation and upgrade-ready extension flow

## Commands

Open `Ctrl+Shift+P` and run:

- `MunaTrust: Scan Workspace`
- `MunaTrust: Show Report`
- `MunaTrust: Diagnostics`
- `MunaTrust: Workspace Trust Help`
- `MunaTrust: Activate License`
- `MunaTrust: Check License Status`
- `MunaTrust: Upgrade to SOLO`
- `MunaTrust: Upgrade to Pro`
- `MunaTrust: Upgrade to TEAM`

Additional preview commands are available for diagnostics, workspace trust help, backend guidance, and advanced release workflows.

## How to run a workspace scan

1. Open a project folder in VS Code
2. Open the Command Palette
3. Run `MunaTrust: Scan Workspace`
4. Choose a scan type:
   - `Basic Scan - Fast, local, free`
   - `Advanced AI Scan - Deeper AI reasoning`
   - `Full Private Scan - Full private local deep scan`
5. Review the local trust report with executive summary, top risks, and detailed findings
6. Run `MunaTrust: Show Report` to reopen the latest report panel

MunaTrust does not edit files, apply automatic fixes, or upload your source code during this flow.

## Local and cloud AI requirements

MunaTrust has three operating layers:

- **Basic Scan** works without Ollama or a local model
- **Advanced AI Scan** uses sanitized risk context for deeper reasoning
- **Full Private Deep Scan** uses local deep reasoning

Current default local fast model:

- `qwen2.5-coder:3b`

Recommended Full Private presets:

- `qwen2.5-coder:3b` - default fast
- `qwen2.5-coder:7b` - deep analysis
- `llama3.1:8b` - better explanation
- `phi3:mini` - fallback

If a local model is missing, MunaTrust stays usable in deterministic-only mode and shows the exact install command:

```bash
ollama pull <model>
```

## What the report shows

MunaTrust Code Trust reports are designed to be actionable instead of just informational.

Each finding can include:

- severity
- category
- file path
- line number when available
- safe code snippet
- why it matters
- suggested fix
- review status

The report also includes:

- Executive Summary
- Top Risks
- Detailed Findings
- Environment Files
- Package Manifests
- Recommended Next Steps

## Local-first privacy

**MunaTrust scans locally and does not upload your code by default.**

By default, MunaTrust does not upload:

- source code
- repository contents
- file contents
- project names
- prompts
- secrets
- tokens

Telemetry is disabled by default unless the user explicitly enables privacy-safe metadata collection.

Advanced AI Scan note:

- Basic Scan and Full Private Deep Scan keep code local
- Advanced AI Scan sends only sanitized risk context, not a blind raw repository upload

## Pricing and plans

MunaTrust is currently positioned around a **7-day Solo trial** for launch installs and upgrade flows.

- **7-day Solo trial**
  - Lets new users experience the Solo workflow first
  - License key is emailed automatically after checkout
- **Solo - $9/month**
  - Basic Scan: unlimited
  - Advanced AI Scan: 50 scans/month
  - Full Private Scan: full private deep scan
- **Pro - $19/month**
  - Basic Scan: unlimited
  - Advanced AI Scan: 200 scans/month
  - Full Private Scan: full private deep scan plus advanced workflows
- **Team - $99/month**
  - Basic Scan: unlimited
  - Advanced AI Scan: 1000 scans/month
  - Full Private Scan: full private deep scan plus team and governance features

Positioning:

- Local-first AI trust scanning
- Advanced cloud reasoning when you need it
- Full private local AI scanning for sensitive projects
- MunaTrust remains local-first

## Gumroad licensing

MunaTrust Code Trust is prepared for external licensing with Gumroad.

Typical flow:

1. User starts a 7-day Solo trial or selects Solo / Pro / Team
2. MunaTrust opens the configured Gumroad checkout in the external browser
3. Gumroad checkout opens in the external browser
4. Gumroad sends the license key by email automatically after checkout
5. User runs `MunaTrust: Activate License`
6. MunaTrust validates the key through the configured backend endpoint
7. License status is stored locally in the extension

No Gumroad or mail secrets are hardcoded into this extension package.

Current billing note:

- Upgrade commands open the configured checkout flow.
- License activation remains local-first and uses the configured validation endpoint when available.
- Launch checkout can point users into a 7-day Solo trial before they choose a paid plan.

## Workspace Trust

If VS Code opens your folder in Restricted Mode, MunaTrust stays available in limited mode and explains why trust is required for filesystem scanning.

Use:

- `MunaTrust: Workspace Trust Help`
- `Manage Workspace Trust`
- `Trust this workspace`

## Screenshots

### Command Palette

![MunaTrust Command Palette](https://raw.githubusercontent.com/balkanbrs/munatrust/main/media/screenshots/command-palette.png)

### Scan Report Overview

![MunaTrust Scan Report Overview](https://raw.githubusercontent.com/balkanbrs/munatrust/main/media/screenshots/report-overview.png)

### Actionable Finding Detail

![MunaTrust Finding Detail](https://raw.githubusercontent.com/balkanbrs/munatrust/main/media/screenshots/finding-detail.png)

### Workspace Trust Guidance

![MunaTrust Workspace Trust Guidance](https://raw.githubusercontent.com/balkanbrs/munatrust/main/media/screenshots/workspace-trust.png)

## Support

Support / contact placeholder:

- `support@munatrust.online`

Replace this with the final public support channel before Marketplace publication.
