# Prompt Wizard

> AI-powered prompt generator for ChatGPT Image 2. Describe your vision, get a professional-grade prompt.

[![English](https://img.shields.io/badge/English-Default-111111)](README.md)
[![中文](https://img.shields.io/badge/中文-查看-ef476f)](README_zh.md)

## Quick Start

```
/wizard a cyberpunk cat sitting on a neon-lit balcony overlooking a rainy Tokyo street
```

Prompt Wizard asks clarifying questions, then outputs a polished GPT-Image-2 prompt with technical annotations and case references.

## Commands

| Command | Description | Example |
|---------|-------------|---------|
| `/wizard [idea]` | Conversational generation (default) | `/wizard cinematic poster of a space bakery` |
| `/wizard pro` | Structured 6-step guided mode | `/wizard pro` |
| `/templates` | Browse 7 categories of verified templates | `/templates portrait` |
| `/lang [code]` | Switch output language | `/lang ja` |
| `/update` | Pull latest prompt library | `/update` |

Supported languages: `zh`, `en`, `ja`, `ko`, `es`, `fr`, `de`, `ru`, `pt`

## Install

### Claude Code

```bash
git clone https://github.com/EricArcha/prompt-wizard.git ~/.claude/skills/prompt-wizard
```

For shorter trigger, add to `~/.claude/settings.json`:
```json
{
  "skillAliases": {
    "wizard": "prompt-wizard"
  }
}
```

### OpenClaw

```bash
git clone https://github.com/EricArcha/prompt-wizard.git ~/.openclaw/skills/prompt-wizard
```

Or symlink to share with Claude Code:
```bash
ln -s ~/.claude/skills/prompt-wizard ~/.openclaw/skills/prompt-wizard
```

### ClawHub (coming soon)

```bash
npx clawhub@latest install prompt-wizard
```

### Update the prompt library

After installation, the case library is version-pinned. To pull the latest community prompts:

```
/update
```

This runs `git pull` on the embedded [awesome-gpt-image-2-prompts](https://github.com/EvoLinkAI/awesome-gpt-image-2-prompts) dataset and updates the version tracked in `config.json`.

## How It Works

Prompt Wizard is built on analysis of 175+ community-verified GPT-Image-2 prompts. It encodes the patterns that consistently produce high-quality results:

1. **6-dimension coverage**: Subject → Environment → Lighting → Composition → Style → Technical
2. **Technical vocabulary**: Lens specs, lighting setups, film types, camera angles
3. **Case references**: Links to real examples so you can study what works

## File Structure

```
prompt-wizard/
├── SKILL.md                      # Core skill logic
├── README.md / README_zh.md      # Docs
├── references/
│   ├── prompt-structure.md       # 6-dimension reference
│   └── category-guides.md        # Category-specific tips
├── scripts/
│   └── update-prompts.sh         # Library update script
├── data/
│   └── awesome-gpt-image-2-prompts/  # Case library
└── config.json                   # Version + preferences
```

## Credits

- Case library: [awesome-gpt-image-2-prompts](https://github.com/EvoLinkAI/awesome-gpt-image-2-prompts) (CC BY 4.0) by EvoLinkAI and community contributors
- Skill design: built for Claude Code and OpenClaw

## License

MIT
