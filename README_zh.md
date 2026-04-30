# Prompt Wizard（提示词向导）

> ChatGPT Image 2 高质量提示词生成器。用自然语言描述你的想法，获得专业级 prompt。

[![English](https://img.shields.io/badge/English-View-111111)](README.md)
[![中文](https://img.shields.io/badge/中文-默认-ef476f)](README_zh.md)

## 快速上手

```
/wizard 一只赛博朋克风格的猫坐在霓虹灯照亮的阳台上，俯瞰着雨中的东京街道
```

Prompt Wizard 会追问几个关键问题，然后输出完整的专业 prompt，附带技术注解和案例参考。

## 命令

| 命令 | 说明 | 示例 |
|------|------|------|
| `/wizard [想法]` | 对话式生成（默认模式） | `/wizard 太空面包店的电影海报` |
| `/wizard pro` | 结构化六步引导模式 | `/wizard pro` |
| `/templates` | 浏览七大类别验证模板 | `/templates portrait` |
| `/lang [code]` | 切换输出语言 | `/lang en` |
| `/update` | 拉取最新提示词库 | `/update` |

支持语言：`zh`、`en`、`ja`、`ko`、`es`、`fr`、`de`、`ru`、`pt`

## 安装

### Claude Code

```bash
git clone https://github.com/EricArcha/prompt-wizard.git ~/.claude/skills/prompt-wizard
```

推荐设置短触发词，在 `~/.claude/settings.json` 中添加：
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

或通过软链接与 Claude Code 共享：
```bash
ln -s ~/.claude/skills/prompt-wizard ~/.openclaw/skills/prompt-wizard
```

### ClawHub（即将上线）

```bash
npx clawhub@latest install prompt-wizard
```

### 更新提示词库

安装后案例库版本锁定。拉取社区最新提示词：

```
/update
```

此命令对内置的 [awesome-gpt-image-2-prompts](https://github.com/EvoLinkAI/awesome-gpt-image-2-prompts) 数据集执行 `git pull`，并更新 `config.json` 中的版本号。

## 原理

Prompt Wizard 基于对 175+ 个社区验证的 GPT-Image-2 提示词分析构建，编码了持续产出高质量结果的模式：

1. **六维度覆盖**：主体 → 场景 → 光线 → 构图 → 风格 → 技术参数
2. **专业术语**：镜头规格、布光方案、胶片类型、机位角度
3. **案例参考**：链接到真实案例，便于学习有效写法

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
│   └── awesome-gpt-image-2-prompts/  # 案例库
└── config.json                   # 版本号 + 偏好配置
```

## 致谢

- 案例库：[awesome-gpt-image-2-prompts](https://github.com/EvoLinkAI/awesome-gpt-image-2-prompts) (CC BY 4.0)，由 EvoLinkAI 及社区贡献者维护
- Skill 设计：为 Claude Code 和 OpenClaw 构建

## 许可证

MIT
