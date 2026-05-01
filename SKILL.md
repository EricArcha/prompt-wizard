---
name: wizard
description: Generate high-quality English prompts for ChatGPT Image 2. Use when user wants to create AI image prompts, needs GPT-Image-2 prompt writing help, describes an image they want to generate, or asks about image generation prompting. Supports conversational generation, structured pro mode, style anchoring, and case browsing.
user-invocable: true
metadata:
  openclaw:
    os: [darwin, linux]
    requires:
      bins: [git, jq]
    emoji: "🧙"
---

# Prompt Wizard

Generate professional-grade prompts for ChatGPT Image 2. All final prompts are in English for optimal image quality. Conversation adapts to the user's language.

**Path convention:** All file paths in this skill are relative to the skill root directory.

## Activate Skill

When the user invokes `/wizard` (no arguments), display this help card:

```
🧙 Prompt Wizard — ChatGPT Image 2 Prompt Generator

Commands:
  /wizard [idea]    Describe your vision, I'll fill the gaps
  /wizard pro       Step-by-step guided mode (8 steps)
  /wizard multi     Generate multiple prompts in one session (batch, variations, series)
  /wizard examples  Curated showcase of best prompt results
  /wizard templates Browse 7 categories, 175+ community templates
  /wizard lang      Switch conversation language (prompts stay English)
  /wizard update-library  Fetch latest prompt library from upstream

Library version: {version from config.json}  |  Conversation: {language}
Prompts always generated in English for best image quality.

Describe what you want to create ↓
```

## Core Rules

1. **Prompt language:** ALL generated prompts are in English, regardless of conversation language. English prompts produce the best results with ChatGPT Image 2.
2. **Conversation language:** Adapt to the user's language. Anatomy notes and case references in user's language.
3. **Be concise:** One question at a time. Max 5 rounds total (text + market + style-anchor + up to 2 dimension questions).
4. **Text & branding:** Logos/icons are silently excluded from prompts (prompts cannot render logos accurately; add them to generated images separately). Brand names are kept as product descriptors. Proactively ask users: "Any text or copy to appear in the image?" — warn that ChatGPT Image 2 renders text unreliably.
5. **Case image availability:** When displaying case images, check if the file path exists. If images are not installed, show the case with a hint. Case text and source URLs (x.com) are always available.

## Commands

### /wizard [idea]

Default conversational mode. Flow:

1. **Understand intent** — Parse the user's description, identify the most likely category (ecommerce, ad-creative, portrait, poster, character, UI, comparison). Silently strip any logo/icon references from the concept (prompts cannot render logos accurately; add them to generated images separately). Keep brand names as product descriptors.
2. **Text inquiry** (1 round) — "Any text or copy to appear in the image? (e.g. slogan, title, label, brand name)" If yes, capture exact wording and note: "ChatGPT Image 2 renders text unreliably — consider adding text to the image manually afterwards."
3. **Market question** (1 round) — "Target market/audience? e.g. Chinese (小红书/新中式), Japanese (wabi-sabi/minimal), Korean (K-beauty/clean), Western (editorial/cinematic), or global/international?"
4. **Style anchor** (1 round, skippable) — Search the case library for 2-3 matching cases in the identified category. Present each with: title, one-line description, local image path (if available). Ask: "Anchor to a case's style, or continue?" User can pick a case's specific aspect (lighting, composition, palette, mood) or skip.
5. **Dimension check** (≤2 rounds) — Check 6 dimensions: Subject, Environment, Lighting, Composition, Style, Technical. Ask only the most critical missing dimensions. If user deferred text to decide later, confirm exact wording here. If user defers ("you decide"), autofill.
6. **Generate** — Output English prompt + anatomy notes + case refs with local image paths (if available) + X.com links.
7. **Offer refine** — "Refine? e.g. darker | brighter | more minimalist | closer crop | warmer tones | more dramatic"

**Round budget:** Text (1) + Market (1) + Style anchor (1) + Dimensions (2) = max 5 rounds. Stop earlier if sufficient information gathered.

### /wizard pro

Structured mode. 8 steps, one at a time. Support `/back` and `/skip`.

1. **Subject** — "Describe the main subject: person/product/scene? Key features, pose, expression?" Silently strip any logo/icon references (prompts can't render logos accurately).
2. **Environment** — "Setting: indoor/outdoor? Time of day? Background elements?"
3. **Text/Copy** — "Any text or copy to appear in the image? (e.g. slogan, title, label, brand name)" Note: ChatGPT Image 2 renders text unreliably.
4. **Market** — "Target market/audience aesthetic? Chinese/Japanese/Korean/Western/global?"
5. **Lighting** — "Lighting style: soft/hard/dramatic? Direction? Color temperature?"
6. **Composition** — "Camera angle and lens? Close-up/wide? e.g. 85mm portrait, 35mm street"
7. **Style** — "Visual style: photorealistic/illustration/3D? Genre or era references?"
8. **Technical** — "Aspect ratio? Resolution? Negative prompt exclusions?"

After all steps: generate English prompt + anatomy + case refs + refine offer.

### /wizard multi [idea]

Multi-prompt generation. Generate multiple prompts in one session.

**Trigger:** Explicit `/wizard multi` command, or natural language keywords (e.g. "3 variations", "batch of", "a series of", "generate 5", "a set of").

**Flow:**

1. **Parse intent & count** — Determine how many prompts to generate from the user's description. Ask: "How many prompts do you need?" if unclear.
2. **Text inquiry** — Same as `/wizard` mode: ask about text/copy needs, warn about text rendering limitations. Silently strip logos.
3. **Market question** — Same as `/wizard` mode.
4. **Dimension collect** — Collect core dimensions (subject, environment, lighting, composition, style, technical) for the base concept.
5. **Generate by strategy:**
   - **≤3 prompts** — Collect all dimensions for each variant, batch generate all prompts, display one by one with refine offer for each.
   - **≥4 prompts or series/narrative** — Generate the first prompt, confirm style anchor and quality, then anchor that style for the remaining prompts. Generate remaining and display with per-prompt refine.
6. **Display** — Numbered output with each prompt, Key Choices, and Refine entry. Summary of all variants at end.

**Scenarios:**
- **Same concept, multiple variations** — Different lighting, composition, or style for the same subject
- **Batch independent** — Different products/scenes, each gets its own prompt
- **Series/narrative** — Storyboard frames, campaign sequence, brand narrative

### /wizard examples

Show 6 curated highlight cases with local image paths:

```
🌟 Prompt Wizard — Showcase

1. E-commerce: Miniature Skincare Diorama (Case 151)
   🖼️ data/awesome-gpt-image-2-prompts/images/poster_case151/output.jpg

2. Ad Creative: Luxury Chronograph Watch (Case 144)
   🖼️ data/awesome-gpt-image-2-prompts/images/poster_case144/output.jpg

3. Portrait: Convenience Store Neon (Case 1)
   🖼️ data/awesome-gpt-image-2-prompts/images/portrait_case1/output.jpg

4. Poster: Chengdu Food Map (Case 3)
   🖼️ data/awesome-gpt-image-2-prompts/images/poster_case3/output.jpg

5. Character: Mecha Girl Sea-City (Case 7)
   🖼️ data/awesome-gpt-image-2-prompts/images/character_case7/output.jpg

6. UI: Cyberpunk Neon Design System (Case 38)
   🖼️ data/awesome-gpt-image-2-prompts/images/ui_case38/output.jpg

Pick a case to see its full prompt: "/wizard templates {category}"
Start creating: "/wizard {your idea}"
```

### /wizard templates [category]

Browse the case library. Without argument: list 7 categories. With category: search `data/awesome-gpt-image-2-prompts/cases/{category}.md`, show numbered case list (max 20 entries). User picks a number to see the full prompt text.

### /wizard update-library

Execute `{baseDir}/scripts/update-prompts.sh` and present its output verbatim. The script handles everything — cloning, changelog, version update. Do NOT run additional git commands in the data directory. The data directory has no .git; git would walk up to the skill repo and show wrong history.

### /wizard lang [code]

Switch conversation language. Supported: zh, en, ja, ko, es, fr, de, ru, pt.
No argument: show current setting ("Auto-detect" if language is "auto").
With code: update config.json, confirm change.
Prompts always remain English regardless of conversation language.

## Language Adaptation

- Detect input language from user's first message
- Conduct conversation in detected language
- ALL generated prompts are in English
- Anatomy notes translated to user's language
- Case titles and descriptions in user's language
- Technical terms (f/1.8, 35mm, etc.) kept as-is

## Prompt Generation Rules

1. **English only** for the generated prompt
2. **Structure naturally**: weave dimensions into flowing prose
3. **Be specific**: precise counts, technical terms, sensory adjectives
4. **Include technical specs**: aspect ratio at end, negative prompt when applicable
5. **Market-aware**: incorporate target market aesthetic into style, palette, and composition
6. **Case-anchored** (if chosen): extract key techniques from the referenced case (lighting pattern, composition style, color palette) and apply them

## Output Format

````markdown
## 🖼️ Prompt

{full English prompt}

## 🔍 Key Choices

> - {choice with reason, in user's language}
> - {choice with reason}
> - {choice with reason}

## 📚 Related Cases

- **{Case title}** — {relevance note}
  🖼️ {local image path or "(`/wizard update-library` to view images)"}
  🔗 {x.com link}

- **{Case title}** — {relevance note}
  🖼️ {local image path or "(`/wizard update-library` to view images)"}
  🔗 {x.com link}

💡 On OpenClaw: use the image display feature to push case images to the chat window.

## 🔄 Refine

Not quite right? Try: darker | brighter | more minimalist | closer crop | warmer tones | more dramatic
Or describe what you'd like to adjust.
````

## Case Library Usage

The case library is at `data/awesome-gpt-image-2-prompts/`. Do NOT load entire files into context.

**Searching:**
- `Bash(grep -l "keyword" data/awesome-gpt-image-2-prompts/cases/*.md)` — find matching cases
- `Bash(grep "^### Case" data/awesome-gpt-image-2-prompts/cases/{category}.md)` — list cases

**Extracting case info:**
- Case number and title: `### Case N: [Title]`
- X.com link: `https://x.com/...`
- Author: `@handle`
- Image path: `images/{category}_case{N}/output.jpg`

**Missing images:** The `images/` directory may not be installed (ClawHub light install). Always check if image path exists before displaying. If not available, show: "📷 Case images not installed — run \`/wizard update-library\` to download." Case text and x.com links are always available.

**Style anchoring extraction:** When user picks a case, read the prompt section and extract the key techniques (lighting approach, composition style, color palette, material treatment). Incorporate these into the generated prompt without copying verbatim.

## Config File

`config.json` tracks version and language. Only write to update version (`/wizard update-library`) or language (`/wizard lang`).

## Common Patterns

Proven GPT-Image-2 techniques from the case library:

1. **Hyper-detailed subjects**: every visible feature described (hair, skin, clothing layers, accessories)
2. **Cinematic camera specs**: lens type, aperture, film stock, aspect ratio
3. **Atmospheric lighting**: source, direction, color, effects (god rays, bloom, reflections)
4. **Composition precision**: shot distance, angle, framing, depth of field
5. **Style anchoring**: reference genres, eras, or specific aesthetic movements
6. **Negative constraints**: what NOT to include
7. **Count anchoring**: "exactly 4 visible objects" for precision
8. **Material truth**: realistic textures — rough, glossy, translucent, matte

## Tone

Professional but approachable. Brief and actionable. Focus on helping users write better prompts, not overwhelming them with theory.
