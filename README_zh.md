# Prompt Wizard（提示词向导）

> ChatGPT Image 2 高质量提示词生成器。描述你的想法，获得专业级英文 prompt。

[![ChatGPT Image 2](https://img.shields.io/badge/ChatGPT-Image_2-10a37f?logo=openai&logoColor=white)](https://openai.com/chatgpt)
[![Claude Code](https://img.shields.io/badge/Claude-Code-d97706?logo=anthropic&logoColor=white)](https://claude.ai)
[![OpenClaw](https://img.shields.io/badge/OpenClaw-Compatible-7c3aed)](https://openclaw.ai)
[![English](https://img.shields.io/badge/English-View-111111)](README.md)
[![中文](https://img.shields.io/badge/中文-默认-ef476f)](README_zh.md)

## 快速上手

```
/wizard 一只赛博朋克猫坐在霓虹灯照亮的阳台上，俯瞰雨中的东京街道
```

Prompt Wizard 会追问 2-4 个关键问题（目标市场、风格偏好、画面细节），然后输出完整的 **英文** prompt——英文是 ChatGPT Image 2 生图质量最佳的语言。

## 命令

| 命令 | 说明 | 示例 |
|------|------|------|
| `/wizard [想法]` | 对话式生成，支持风格锚定 | `/wizard 奢华手表广告` |
| `/wizard pro` | 结构化七步引导（`/back` 回退，`/skip` 跳过） | `/wizard pro` |
| `/wizard examples` | 展示精选案例及本地图片预览 | `/wizard examples` |
| `/wizard templates [类别]` | 浏览七大类别社区验证模板 | `/wizard templates portrait` |
| `/wizard lang [code]` | 切换对话语言（prompt 始终输出英文） | `/wizard lang en` |
| `/wizard update` | 从上游拉取最新提示词库 | `/wizard update` |

**生成后微调：** 直接输入 `更暗`、`更亮`、`更简约`、`更近的构图`、`暖色调` 等。

**风格锚定：** `/wizard` 模式下，会根据你的描述在案例库中搜索匹配参考，生成前即可指定锚定某个案例的光影、构图或配色。

**市场维度：** 两种模式都会询问目标市场/受众（中式、日式、韩式、欧美、全球），以对齐审美方向。

支持对话语言：`zh`、`en`、`ja`、`ko`、`es`、`fr`、`de`、`ru`、`pt`

## 安装

### Claude Code

```bash
git clone https://github.com/EricArcha/prompt-wizard.git ~/.claude/skills/prompt-wizard
```

### OpenClaw

```bash
git clone https://github.com/EricArcha/prompt-wizard.git ~/.openclaw/skills/prompt-wizard
```

或通过软链接与 Claude Code 共享：
```bash
ln -s ~/.claude/skills/prompt-wizard ~/.openclaw/skills/prompt-wizard
```

### ClawHub（即将上线）

```bash
npx clawhub@latest install prompt-wizard
```

### 更新提示词库

案例库已随 skill 内置。拉取社区最新 prompt：

```
/wizard update
```

此命令从 [awesome-gpt-image-2-prompts](https://github.com/EvoLinkAI/awesome-gpt-image-2-prompts) 拉取最新版，并更新 `config.json` 中的版本号。

## 原理

基于对 175+ 个社区验证的 GPT-Image-2 提示词分析构建：

1. **市场感知** — 对齐目标受众审美（中式/日式/韩式/欧美/全球）
2. **风格锚定** — 生成前匹配案例库中验证过的风格模式
3. **六维度覆盖** — 主体 → 场景 → 光线 → 构图 → 风格 → 技术参数
4. **英文输出** — 所有 prompt 以英文生成，确保最优图像质量
5. **案例图片参考** — 本地文件路径，可直接打开查看

## 文件结构

```
prompt-wizard/
├── SKILL.md                      # 核心 skill 逻辑
├── README.md / README_zh.md      # 文档
├── references/
│   ├── prompt-structure.md       # 六维度参考指南
│   └── category-guides.md        # 各类别写作要点
├── scripts/
│   └── update-prompts.sh         # 库更新脚本
├── data/
│   └── awesome-gpt-image-2-prompts/  # 内置案例库（~88MB, 500+ 文件）
└── config.json                   # 版本号 + 偏好配置
```

## 致谢

- 案例库：[awesome-gpt-image-2-prompts](https://github.com/EvoLinkAI/awesome-gpt-image-2-prompts) (CC BY 4.0)，由 EvoLinkAI 及社区维护
- Skill 设计：为 Claude Code 和 OpenClaw 构建

## 路线图

- [x] 对话式 + 专业模式生成
- [x] 案例库风格锚定
- [x] 内置案例库及本地图片
- [x] 中英双语文档
- [ ] ClawHub 注册发布
- [ ] 多图 prompt 支持（序列、网格、分镜）
- [ ] 用户 prompt 历史 / 收藏

## 许可证

MIT
