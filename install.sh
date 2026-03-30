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

# 创建新安装标记，触发 OpenClaw 主动欢迎
touch "$SKILL_DIR/resume-assistant/.new-install"
echo "📝 正在启动简历助手..."
echo ""

# 尝试触发 OpenClaw 会话（如果 openclaw CLI 可用）
if command -v openclaw &> /dev/null; then
    openclaw message send --message "🦐 resume-assistant 已安装，开始欢迎流程" 2>/dev/null || true
fi

# 自动打开模板（可选）
if [ -f "$SKILL_DIR/resume-assistant/resume-template.html" ]; then
    open "$SKILL_DIR/resume-assistant/resume-template.html" 2>/dev/null || true
fi

echo "📄 模板已在浏览器打开！"
echo ""
