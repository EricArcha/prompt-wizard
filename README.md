# Prompt Wizard

> AI-powered prompt generator for ChatGPT Image 2. Describe your vision, get a professional-grade English prompt.

[![ChatGPT Image 2](https://img.shields.io/badge/ChatGPT-Image_2-10a37f?logo=openai&logoColor=white)](https://openai.com/chatgpt)
[![Claude Code](https://img.shields.io/badge/Claude-Code-d97706?logo=anthropic&logoColor=white)](https://claude.ai)
[![OpenClaw](https://img.shields.io/badge/OpenClaw-Compatible-7c3aed)](https://openclaw.ai)
[![English](https://img.shields.io/badge/English-Default-111111)](README.md)
[![中文](https://img.shields.io/badge/中文-查看-ef476f)](README_zh.md)

## Demo

> Animated showcase of Prompt Wizard's workflow and features (20s).

<video src="https://github.com/EricArcha/prompt-wizard/raw/main/demo/demo-animation-bgm.mp4" controls width="100%" poster="https://github.com/EricArcha/prompt-wizard/raw/main/demo/demo-animation-poster.jpg">
  Your browser doesn't support video — <a href="demo/demo-animation-bgm.mp4">download MP4</a>
</video>

Also check the [Landing Page](https://htmlpreview.github.io/?https://github.com/EricArcha/prompt-wizard/blob/main/demo/landing.html) for a full feature overview.

---

## Quick Start

```
/wizard a cyberpunk cat sitting on a neon-lit balcony overlooking a rainy Tokyo street
```

Prompt Wizard asks 2-4 clarifying questions (market, style preferences, key details), then outputs a polished GPT-Image-2 prompt in **English** — the optimal language for image generation quality.

## Commands

| Command | Description | Example |
|---------|-------------|---------|
| `/wizard [idea]` | Conversational generation with style anchoring | `/wizard luxury watch ad` |
| `/wizard pro` | Structured 7-step guided mode (`/back` to revise, `/skip` to accept default) | `/wizard pro` |
| `/wizard examples` | Showcase curated highlight cases with local image previews | `/wizard examples` |
| `/wizard templates [cat]` | Browse 7 categories of community-verified templates | `/wizard templates portrait` |
| `/wizard lang [code]` | Switch conversation language (prompts always English) | `/wizard lang ja` |
| `/wizard update-library` | Fetch latest prompt library from upstream | `/wizard update-library` |

**Refine after generation:** `darker`, `brighter`, `more minimalist`, `closer crop`, `warmer tones`, etc.

**Style anchoring in `/wizard`:** The skill searches the case library for matching references and lets you anchor your prompt to a specific case's lighting, composition, or palette — before generation.

**Market dimension:** Both modes ask about target market/audience (Chinese, Japanese, Korean, Western, global) to align the aesthetic direction.

Supported conversation languages: `zh`, `en`, `ja`, `ko`, `es`, `fr`, `de`, `ru`, `pt`

## Install

### Claude Code

```bash
git clone https://github.com/EricArcha/prompt-wizard.git ~/.claude/skills/prompt-wizard
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

The case library is bundled with the skill. To fetch the latest community prompts:

To update the **skill itself** (new features, bug fixes):

```bash
cd ~/.claude/skills/prompt-wizard && git pull
```

To update the **case library** (latest community prompts):

```
/wizard update-library
```

This fetches the latest version of [awesome-gpt-image-2-prompts](https://github.com/EvoLinkAI/awesome-gpt-image-2-prompts) and updates the version in `config.json`.

## How It Works

Prompt Wizard is built on analysis of 175+ community-verified GPT-Image-2 prompts. It encodes the patterns that consistently produce high-quality results:

1. **Market-aware direction** — aligns aesthetic to target audience (Chinese/Japanese/Korean/Western/global)
2. **Style anchoring** — matches your vision to proven case patterns before generation
3. **6-dimension coverage** — Subject → Environment → Lighting → Composition → Style → Technical
4. **English output** — all prompts generated in English for optimal ChatGPT Image 2 performance
5. **Case references with images** — local file paths so you can view reference images directly

## File Structure

```
prompt-wizard/
├── SKILL.md                      # Core skill logic
├── README.md / README_zh.md      # Docs
├── demo/                         # Demo animation + landing page
│   ├── demo-animation-bgm.mp4    # Product demo video (with audio)
│   ├── demo-animation.html       # Source HTML animation
│   └── landing.html              # Feature landing page
├── references/
│   ├── prompt-structure.md       # 6-dimension reference
│   └── category-guides.md        # Category-specific tips
├── scripts/
│   └── update-prompts.sh         # Library update script
├── data/
│   └── awesome-gpt-image-2-prompts/  # Bundled case library (~88MB, 500+ files)
└── config.json                   # Version + preferences
```

## Credits

- Case library: [awesome-gpt-image-2-prompts](https://github.com/EvoLinkAI/awesome-gpt-image-2-prompts) (CC BY 4.0) by EvoLinkAI and community
- Skill design: built for Claude Code and OpenClaw

## Roadmap

- [x] Conversational + pro mode generation
- [x] Style anchoring with case library
- [x] Bundled case library with local images
- [x] Bilingual documentation (EN/ZH)
- [ ] ClawHub registry publication
- [ ] Multi-image prompt support (sequences, grids, storyboards)
- [ ] User prompt history / favorite collection

## License

Personal & educational use is free. Commercial use requires authorization.
See [LICENSE](LICENSE) for full terms.

> **Note:** `data/awesome-gpt-image-2-prompts/` is CC BY 4.0 (see [LICENSE](LICENSE#L26-L28)).

---

<p align="center">
  <a href="https://github.com/EricArcha/prompt-wizard">Prompt Wizard</a> ·
  Built by <a href="https://github.com/EricArcha">EricArcha</a><br>
  <sub>Available on Claude Code &amp; OpenClaw</sub>
</p>
