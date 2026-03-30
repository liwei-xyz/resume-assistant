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
echo "📝 使用方法："
echo "   在 OpenClaw 中说：帮我写简历"
echo ""
echo "📄 或直接使用模板："
echo "   open $SKILL_DIR/resume-assistant/resume-template.html"
echo ""
