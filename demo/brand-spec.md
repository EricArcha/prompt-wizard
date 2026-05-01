# Prompt Wizard · Brand Spec
> 采集日期：2026-05-01
> 资产来源：项目自有，无外部品牌依赖
> 资产完整度：推断（全新创建）

## 🎯 核心资产

### Logo
- 尚未创建 → 建议：基于 🧙 符号化，风格化 wizard hat + 魔法星光
- 使用场景：Landing Page hero / 动画片头 / GitHub social preview
- 临时方案：纯文字「Prompt Wizard」+ 衬线字体

### 产品图
- 无实体产品
- 产品本质：Claude Code skill（AI prompt 生成器）
- 视觉映射：Terminal CLI 界面 + ChatGPT Image 2 配图

### UI 截图
- 核心 UI = CLI 终端交互界面
- 风格：Terminal / REPL 风格，类似 Claude Code 自身

## 🎨 辅助资产

### 色板
- Background (deep): `#0A0C10` — 深邃空间背景
- Surface (card): `#13161C` — 卡片/终端背景
- Surface border: `#1E2230` — 边框色
- Accent Magic: `#F59E0B` — 琥珀色，魔法/星光高亮
- Accent Wizard: `#8B5CF6` — 紫罗兰，wizard/AI 回复
- Accent Quality: `#10B981` — 翠绿，生图质量/确认
- Accent Info: `#60A5FA` — 蓝色，链接/信息
- Text Primary: `#F1F0ED` — 主文字
- Text Secondary: `#8B8986` — 次要文字
- Text Dim: `#52504D` — 弱文字/占位符
- Terminal Green: `#4ADE80` — 终端用户输入
- Terminal Prompt: `#F59E0B` — 终端 prompt 符

### 字型
- Display (标题/装饰): `'Newsreader', 'Georgia', serif` — 衬线魔法感
- Code (terminal/命令): `'JetBrains Mono', 'Fira Code', 'Cascadia Code', monospace`
- Body (正文): `-apple-system, 'Inter', sans-serif`

### 签名细节（120% 做到的）
- 所有 terminal 交互场景带真实 cursor blink 动画
- 魔法 accent 用极细 amber 发光（`box-shadow: 0 0 20px rgba(245,158,11,0.15)`）
- 场景过渡用 cross-fade, 无 blank gap

### 气质关键词
- `充满魔力的 · 开发者向 · 专业 · 智能 · 高品质`

### 禁区
- 不用纯黑 `#000000` 背景（用深色代替 `#0A0C10`）
- 不用 AI 紫渐变 slop（紫色仅作为文字 accent，不做大面积渐变）
- 不用 emoji 作图标（🧙 仅在标题出现）
