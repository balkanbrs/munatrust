# Changelog

All notable changes to the MunaTrust Code Trust VS Code extension are documented here.

## 0.1.30

- Switched paid plan checkout flow from Lemon Squeezy copy to Gumroad-ready launch copy
- Added Gumroad-ready website pricing links that carry plan hints for purchase automation
- Prepared public license automation endpoints for purchase ping ingestion and remote license verification
- Clarified the 7-day Solo trial launch positioning and automatic license email delivery

## 0.1.29

- Refined marketplace positioning and package metadata for a sharper product pitch
- Updated pricing copy to Free, Solo $9, Pro $19, and Team $99
- Switched marketplace screenshots and logo references to stable GitHub raw asset URLs

## 0.1.28

- Finalized monetized scan levels for Free, Solo, Pro, and Team plans
- Added monthly Advanced AI Scan quota messaging to the packaged scan experience
- Clarified that Free uses basic local private scan while Solo+ unlocks full private deep scan
- Updated packaged overview copy for OpenVSX and VS Marketplace readiness

## 0.1.27

- Added explicit scan type selection for Basic Scan, Advanced AI Scan, and Full Private Deep Scan
- Added local Ollama model presets for full private scans with exact `ollama pull` guidance
- Clarified that Advanced AI Scan sends only sanitized risk context to MunaTrust's Ollama Cloud integration
- Documented that Basic Scan remains fast, local, and free while Full Private Deep Scan stays fully local

## 0.1.26

- Repackaged the release after verified VS Code smoke coverage
- Kept the explicit local AI model note for `qwen2.5-coder:3b`
- Prepared synchronized Open VSX and VS Code Marketplace release artifacts

## 0.1.25

- Clarified local AI model requirements in the packaged README
- Documented that `qwen2.5-coder:3b` is the current default local reasoning model
- Explained the difference between deterministic-only local scan mode and advanced AI-assisted reasoning

## 0.1.24

- Updated Marketplace and project metadata to the real GitHub repository `balkanbrs/munatrust`
- Added approved Marketplace screenshot set to the packaged README
- Prepared a fresh Open VSX and VS Code Marketplace release pass after `0.1.23`

## 0.1.22

- Renamed the user-facing product display to `MunaTrust Code Trust`
- Kept the existing Open VSX extension identity while aligning the product name across release artifacts
- Preserved standalone local scan, actionable findings, trust guidance, and Lemon Squeezy checkout behavior

## 0.1.21

- Aligned the production extension identity to `munatrust.munatrust`
- Expanded scan exclusions for `.vscode-test`, `build`, and `vendor` style folders
- Downgraded likely test fixture findings so they do not collapse trust scores as aggressively
- Restored real Lemon Squeezy checkout behavior for paid upgrade commands
- Kept standalone local scan, workspace trust guidance, and actionable findings working in normal VS Code installs

## 0.1.20

- Refreshed the Open VSX and Marketplace overview copy to match the standalone local scan experience
- Highlighted actionable findings, safe snippets, and private-rollout billing status
- Kept the standalone scan fix and local-first privacy messaging intact

## 0.1.19

- Removed the hard backend requirement from standalone Full Project Scan
- Added standalone local scan fallback when no MunaTrust backend project is available
- Added real Extension Host smoke coverage for standalone scan and core command execution
- Kept private rollout billing guidance intact

## 0.1.15

- Synced `munatrust-vs` with the latest tested extension code
- Switched paid plan upgrades to a private rollout guidance flow instead of opening live checkout
- Kept FREE / SOLO / PRO / TEAM plan surfaces visible while live billing and license delivery are being finalized
- Preserved command registration, backend lifecycle, and scan/report behavior

## 0.1.14

- Prepared a clean Marketplace-ready extension package in `munatrust-vs`
- Added `Munatrust: Show Report`
- Kept local-only workspace scan behavior
- Kept license activation and status commands
- Cleaned package assets for `.vsix` packaging
- Integrated the new Munatrust logo into Marketplace branding assets
- Updated README with polished developer-security positioning and branding

## 0.1.0

- Initial VS Code extension release
- Added local workspace scan
- Added trust score summary
- Added secret-pattern and environment checks
- Added package file detection
- Added local report panel
