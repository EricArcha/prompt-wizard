# Governance — Prompt Wizard

This document defines the release and maintenance process for the Prompt Wizard skill. It exists to prevent a known failure mode: updating SKILL.md while forgetting to sync READMEs, CHANGELOG, or ClawHub.

## File Dependency Map

When you modify one file, these are the files that MUST be checked for sync:

| Modified | Must Check | Reason |
|----------|------------|--------|
| **SKILL.md** | README.md, README_zh.md | Command table, workflow descriptions, new/changed behavior |
| **SKILL.md** | CHANGELOG.md | Record all Added/Changed/Fixed/Removed entries |
| **scripts/** | SKILL.md | Update the relevant `/wizard` command description |
| **scripts/** | CHANGELOG.md | Record script behavior changes |
| **references/** | SKILL.md | If reference docs add/remove dimensions or categories |
| **.clawhubignore** | — | Verify excluded files are intentional |
| **config.json** | SKILL.md | If schema changes, update config file section |

## Release Checklist

Before every `git push`, verify:

```
### Pre-commit
- [ ] CHANGELOG.md: version header and date correct, all changes listed under correct section (Added/Changed/Fixed/Removed)
- [ ] README.md: command table matches SKILL.md help card, new behavior documented
- [ ] README_zh.md: same as README.md, in Chinese
- [ ] SKILL.md: no broken cross-references, no "skippable"/"optional"/(if chosen) permission slips added
- [ ] scripts/: bash -n passes, logic verified

### Commit
- [ ] git status: only intended files modified
- [ ] Commit message: `feat:` (new feature), `fix:` (bug fix), `docs:` (doc only), or `chore:` (config/scripts)
- [ ] Commit message describes WHY, not just WHAT

### Push & Publish
- [ ] git push origin main — verify success
- [ ] clawhub sync --bump <patch|minor|major> --changelog "<summary>" --root .
- [ ] Verify: clawhub inspect prompt-wizard — check version matches
```

## Version Bump Rules

| Change Type | Bump | Examples |
|-------------|------|---------|
| **patch** | 1.0.X | Bug fix, fence hardening, wording clarification, anti-pattern addition |
| **minor** | 1.X.0 | New command, new mode, new reference document, substantial workflow improvement |
| **major** | X.0.0 | Breaking change: command removed, workflow restructured, mandatory behavior changed incompatibly |

Version numbers in CHANGELOG.md and ClawHub MUST match.

## Fence Design Principles

These are the non-negotiable rules for SKILL.md editing. They exist because the agent treats the skill as its instruction set and will rationalize around weak language.

### Language Rules

- **Use RFC 2119 style**: MUST, MUST NOT, NEVER — not "should", "consider", "try to"
- **Never add permission slips**: no `(skippable)`, `(optional)`, `(if chosen)`, `(if desired)`
- **If a step CAN be skipped**: the ONLY valid trigger is the user explicitly typing "skip" or "continue" — never the agent's own judgment
- **GATE markers**: any step that requires user confirmation before proceeding gets a `⛔ GATE: STOP.` marker

### Grounding Rules

- Every prompt generation step (single, multi, pro) MUST have a case library search preceding it
- Every prompt MUST cite at least one case in the Related Cases section
- The "no match" transparency procedure (inform user, present 3 options) MUST NOT be bypassed
- The Output Format's Related Cases section MUST NOT be omitted, even during "confirmation" or "preview" steps

### Anti-Pattern Maintenance

- When a new failure mode is discovered in real usage, add it to the Common Violations table
- Each entry MUST include: the violation action, the rationalization the agent uses, and the correct behavior
- The rationalization column is critical — it's how the agent self-identifies the violation

### File Existence Checks

- Before displaying any local file path, MUST verify the file exists (use `ls` or equivalent)
- Before showing the "update-library to download" fallback, MUST first check if images are already present
- The update-library script MUST detect light installs (missing images) regardless of version match

## Review Triggers

After any of these events, run the full release checklist:

- SKILL.md edited
- Script in `scripts/` modified
- New reference doc added to `references/`
- `.clawhubignore` changed
- New anti-pattern discovered and added to Common Violations
