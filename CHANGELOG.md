# Changelog

All notable changes to Prompt Wizard will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/).

## [1.0.1] — 2026-05-01

### Added
- `/wizard multi` multi-prompt generation (batch, variations, series)
- Text/copy proactive inquiry before prompt generation
- Logo silent removal from prompts (add logo to generated images separately)
- Lightweight ClawHub distribution (case images downloadable on demand)

### Changed
- `/wizard pro` extended to 8 steps with Text/Copy step
- Case images gracefully degrade when not installed
- `.clawhubignore` excludes non-essential files from ClawHub publish

## [1.0.0] — 2026-05-01

### Added
- `/wizard` conversational prompt generation with 6-dimension coverage
- `/wizard pro` structured 7-step guided mode with `/back` and `/skip`
- Market/audience dimension for regional aesthetic alignment
- Style anchoring: pre-generation case pattern matching from the library
- `/examples` command with 6 curated highlight cases
- `/templates` command to browse 175+ community-verified prompts
- `/lang` command for multi-language conversation support
- `/update` command to fetch the latest case library
- Quick refine after generation (darker, brighter, more minimalist, etc.)
- Bundled case library with local image references
- OpenClaw platform compatibility
- Bilingual documentation (English + Chinese)

### Deprecated
- `setup.sh` removed — data is now bundled directly in the repository

[1.0.1]: https://github.com/EricArcha/prompt-wizard/releases/tag/v1.0.1
[1.0.0]: https://github.com/EricArcha/prompt-wizard/releases/tag/v1.0.0

Repository: https://github.com/EricArcha/prompt-wizard
