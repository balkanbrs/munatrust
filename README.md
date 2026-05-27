# MunaTrust Code Trust

**Trust your code. Ship with confidence.**

MunaTrust Code Trust is a local-first AI code trust scanner for reviewing risky generated code patterns, exposed secrets, package risk, and release confidence before you ship.

It is designed as a professional developer security tool: local-first, manual-first, and focused on helping developers and teams understand what to fix first without changing code automatically.

## Key features

- Full Project Scan with trust scoring
- Standalone local scan mode that works even without a bundled backend project
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

## How to run a workspace scan

1. Open a project folder in VS Code
2. Open the Command Palette
3. Run `MunaTrust: Scan Workspace`
4. Review the local trust report with executive summary, top risks, and detailed findings
5. Run `MunaTrust: Show Report` to reopen the latest report panel

MunaTrust does not edit files, apply automatic fixes, or upload your source code during this flow.

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

## Free vs Pro

### Free Preview

- Full Project Scan with limited usage
- Hallucination scan preview
- Deployment confidence preview
- Local actionable trust report
- Local diagnostics
- Manual-first review experience

### Pro

- Deeper scan coverage
- Export-oriented reporting workflows
- Advanced release trust checks
- Extended usage limits
- Future team governance features

## Lemon Squeezy licensing

MunaTrust Code Trust is prepared for external licensing with Lemon Squeezy.

Typical flow:

1. User opens the upgrade flow
2. MunaTrust opens the configured Lemon Squeezy checkout in the external browser
3. User receives a license key
4. User runs `MunaTrust: Activate License`
5. MunaTrust validates the key through the configured backend endpoint
6. License status is stored locally in the extension

No Lemon Squeezy API secrets are hardcoded into this extension package.

## Workspace Trust

If VS Code opens your folder in Restricted Mode, MunaTrust stays available in limited mode and explains why trust is required for filesystem scanning.

Use:

- `MunaTrust: Workspace Trust Help`
- `Manage Workspace Trust`
- `Trust this workspace`

## Marketplace screenshot set

The 0.1.24 release includes a polished screenshot set for marketplace listings:

- Command Palette
- Scan Report Overview
- Actionable Finding Detail
- Workspace Trust Guidance

## Repositories and listings

- GitHub: https://github.com/balkanbrs/munatrust
- Open VSX: https://open-vsx.org/extension/munatrust/munatrust
- Visual Studio Marketplace publisher: https://marketplace.visualstudio.com/publishers/MunaTrust

## Support

- `support@munatrust.online`
