#!/bin/bash

# resume-assistant 安装脚本
# 用法：curl -sL https://github.com/liwei-xyz/resume-assistant/raw/main/install.sh | bash

set -e

echo "🦐 正在安装 resume-assistant 简历助手..."

# 自动检测技能目录
SKILL_DIR=""
if [ -d "$HOME/.openclaw/workspace/skills" ]; then
    SKILL_DIR="$HOME/.openclaw/workspace/skills"
    echo "✓ 检测到 OpenClaw 技能目录：$SKILL_DIR"
elif [ -d "$HOME/openclaw/workspace/skills" ]; then
    SKILL_DIR="$HOME/openclaw/workspace/skills"
    echo "✓ 检测到技能目录：$SKILL_DIR"
else
    echo "❌ 未找到技能目录，请手动指定："
    echo "   export SKILL_DIR=你的技能目录"
    echo "   curl -sL https://github.com/liwei-xyz/resume-assistant/raw/main/install.sh | bash"
    exit 1
fi

# 检查是否已安装
if [ -d "$SKILL_DIR/resume-assistant" ]; then
    echo "⚠️  技能已安装，正在更新..."
    cd "$SKILL_DIR/resume-assistant"
    git pull
else
    echo "📦 正在克隆到：$SKILL_DIR/resume-assistant"
    git clone https://github.com/liwei-xyz/resume-assistant.git "$SKILL_DIR/resume-assistant"
fi

echo ""
echo "✅ 安装完成！"
echo ""

# 创建新安装标记
touch "$SKILL_DIR/resume-assistant/.new-install"

# 自动打开模板
if [ -f "$SKILL_DIR/resume-assistant/resume-template.html" ]; then
    open "$SKILL_DIR/resume-assistant/resume-template.html" 2>/dev/null || true
    echo "📄 模板已在浏览器打开！"
fi

# 显示欢迎引导
echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "🦐 你好！我是你的简历助手"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "我帮你创建一份**专业、可编辑的 HTML 简历**，特别适合游戏行业服务器开发岗位。"
echo ""
echo "**特点**："
echo "✅ 浏览器直接点击编辑，无需安装软件"
echo "✅ 一页纸布局，符合 HR 筛选习惯"
echo "✅ 自动优化措辞（动词开头 + 量化成果）"
echo "✅ 一键导出 PDF"
echo "✅ HR/招聘者视角审视（针对 AI 游戏开发岗位）"
echo ""
echo "**你想怎么用？**"
echo "A：我提供信息，你帮我生成和优化简历"
echo "B：给我空白模板，我自己编辑"
echo ""
echo "📝 在 OpenClaw 中回复 A 或 B，或者直接开始提供信息！"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
