# Prompt Wizard（提示词向导）

> ChatGPT Image 2 高质量提示词生成器。描述你的想法，获得专业级英文 prompt。

[![ChatGPT Image 2](https://img.shields.io/badge/ChatGPT-Image_2-10a37f?logo=openai&logoColor=white)](https://openai.com/chatgpt)
[![Claude Code](https://img.shields.io/badge/Claude-Code-d97706?logo=anthropic&logoColor=white)](https://claude.ai)
[![OpenClaw](https://img.shields.io/badge/OpenClaw-Compatible-7c3aed)](https://openclaw.ai)
[![ClawHub](https://img.shields.io/badge/ClawHub-Published-7c3aed)](https://clawhub.ai/skills/prompt-wizard)
[![English](https://img.shields.io/badge/English-View-111111)](README.md)
[![中文](https://img.shields.io/badge/中文-默认-ef476f)](README_zh.md)

## 演示视频

[![Prompt Wizard 演示](https://github.com/EricArcha/prompt-wizard/releases/download/v1.0-demo/demo-animation-bgm.gif)](https://github.com/EricArcha/prompt-wizard/releases/download/v1.0-demo/demo-animation-bgm.mp4)

*点击 GIF 观看含音频的完整 MP4 演示。*

也可查看[功能落地页](https://htmlpreview.github.io/?https://github.com/EricArcha/prompt-wizard/blob/main/demo/landing.html)了解完整功能概览。

---

## 快速上手

```
/wizard 一只赛博朋克猫坐在霓虹灯照亮的阳台上，俯瞰雨中的东京街道
```

Prompt Wizard 会追问 2-5 个关键问题（文案需求、目标市场、风格偏好、画面细节），然后输出完整的 **英文** prompt——英文是 ChatGPT Image 2 生图质量最佳的语言。

## 命令

| 命令 | 说明 | 示例 |
|------|------|------|
| `/wizard [想法]` | 对话式生成，支持风格锚定 | `/wizard 奢华手表广告` |
| `/wizard pro` | 结构化八步引导（`/back` 回退，`/skip` 跳过） | `/wizard pro` |
| `/wizard multi [想法]` | 一次生成多个 prompt（批量、变体、系列） | `/wizard multi 3种不同风格的产品图` |
| `/wizard examples` | 展示精选案例及本地图片预览 | `/wizard examples` |
| `/wizard templates [类别]` | 浏览七大类别社区验证模板 | `/wizard templates portrait` |
| `/wizard lang [code]` | 切换对话语言（prompt 始终输出英文） | `/wizard lang en` |
| `/wizard update-library` | 从上游拉取最新提示词库 | `/wizard update-library` |
| `/wizard version` | 查看 skill 和案例库版本信息 | `/wizard version` |

**生成后微调：** 直接输入 `更暗`、`更亮`、`更简约`、`更近的构图`、`暖色调` 等。

**风格锚定：** `/wizard` 模式下，会在案例库中搜索匹配参考，并在生成前锚定到特定案例的光影、构图或配色——这是默认工作流的必要环节，必须经用户确认后才进入生成。

**多图模式（`/wizard multi`）：** 4张及以上或系列叙事时，会先生成首张 prompt 供你确认风格方向，再继续生成其余——确保风格锚定后再批量产出。

**市场维度：** 两种模式都会询问目标市场/受众（中式、日式、韩式、欧美、全球），以对齐审美方向。

支持对话语言：`zh`、`en`、`ja`、`ko`、`es`、`fr`、`de`、`ru`、`pt`

## 安装

### Claude Code

**Git**（推荐 · 完整包，含 175+ 案例图片，~90MB）：
```bash
git clone https://github.com/EricArcha/prompt-wizard.git ~/.claude/skills/prompt-wizard
```

**npx clawhub**（轻量，~8MB）：
```bash
npx clawhub@latest install prompt-wizard
```

### OpenClaw

**openclaw skills install**（推荐 · 轻量，~8MB）：
```bash
openclaw skills install prompt-wizard
```
安装后运行 `/wizard update-library` 下载完整案例库（含 175+ 参考图片）。

**Git**（完整包，含 175+ 案例图片，~90MB）：
```bash
git clone https://github.com/EricArcha/prompt-wizard.git ~/.openclaw/skills/prompt-wizard
```

### 更新提示词库

案例库已随 skill 内置。拉取社区最新 prompt：

更新 **skill 本身**（新功能、bug 修复）：

```bash
cd ~/.claude/skills/prompt-wizard && git pull
```

更新 **案例库**（最新社区 prompt）：

```
/wizard update-library
```

此命令从 [awesome-gpt-image-2-prompts](https://github.com/EvoLinkAI/awesome-gpt-image-2-prompts) 拉取最新版，并更新 `config.json` 中的版本号。

## 原理

基于对 175+ 个社区验证的 GPT-Image-2 提示词分析构建：

1. **市场感知** — 对齐目标受众审美（中式/日式/韩式/欧美/全球）
2. **风格锚定** — 生成前匹配案例库中验证过的风格模式
3. **六维度覆盖** — 主体 → 场景 → 光线 → 构图 → 风格 → 技术参数
4. **英文输出** — 所有 prompt 以英文生成，确保最优图像质量
5. **强制案例扎根** — 每个 prompt 必须锚定至少一个社区验证的案例库条目；输出中 Related Cases 为必填项

## 文件结构

```
prompt-wizard/
├── SKILL.md                      # 核心 skill 逻辑
├── README.md / README_zh.md      # 文档
├── demo/                         # 演示动画 + 落地页
│   ├── demo-animation-bgm.mp4    # 产品演示视频（含音频）
│   ├── demo-animation.html       # 动画源码
│   └── landing.html              # 功能落地页
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
- [x] ClawHub 注册发布
- [x] 多图 prompt 支持（序列、网格、分镜）
- [ ] 用户 prompt 历史 / 收藏

## 许可证

个人及教育用途免费。商业使用需获得授权。
详见 [LICENSE](LICENSE)。

> **注意：** `data/awesome-gpt-image-2-prompts/` 遵循 CC BY 4.0 协议（详见 [LICENSE](LICENSE#L26-L28)）。
>
> 通过 ClawHub 安装的包采用 MIT-0 协议（平台要求）。本仓库使用自定义 License。

---

<p align="center">
  <a href="https://github.com/EricArcha/prompt-wizard">Prompt Wizard</a> ·
  开发者 <a href="https://github.com/EricArcha">EricArcha</a><br>
  <sub>可在 Claude Code 和 OpenClaw 上使用</sub>
</p>
