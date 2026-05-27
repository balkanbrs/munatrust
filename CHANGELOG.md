# Changelog

All notable changes to the MunaTrust Code Trust VS Code extension are documented here.

## 0.1.24

- Updated Marketplace and project metadata to the real GitHub repository `balkanbrs/munatrust`
- Added the approved Marketplace screenshot set to the release package
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
