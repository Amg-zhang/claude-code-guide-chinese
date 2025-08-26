#!/bin/bash

# Claude Code 中文翻译版 - GitHub 上传脚本
# 使用前请先在 GitHub.com 创建新仓库：claude-code-guide-chinese

echo "🚀 开始上传 Claude Code 中文翻译版到 GitHub..."

# 检查是否在正确的目录
if [ ! -f "README-中文版.md" ]; then
    echo "❌ 错误：请在 claude-code-guide-chinese 目录中运行此脚本"
    exit 1
fi

# 提示用户输入 GitHub 用户名
echo "📝 请输入您的 GitHub 用户名："
read -p "GitHub 用户名: " GITHUB_USERNAME

if [ -z "$GITHUB_USERNAME" ]; then
    echo "❌ 错误：GitHub 用户名不能为空"
    exit 1
fi

echo "🔗 添加远程仓库..."
git remote add origin https://github.com/$GITHUB_USERNAME/claude-code-guide-chinese.git

echo "📤 推送到 GitHub..."
git branch -M main
git push -u origin main

if [ $? -eq 0 ]; then
    echo "✅ 成功！您的仓库已上传到："
    echo "   https://github.com/$GITHUB_USERNAME/claude-code-guide-chinese"
    echo ""
    echo "🎉 项目特色："
    echo "   - 📖 专业的中文翻译"
    echo "   - ⭐ 基于 1.6k+ stars 的优质源项目"
    echo "   - 🔗 保留完整的原始格式和链接"
    echo "   - 📋 详细的翻译说明文档"
else
    echo "❌ 上传失败，请检查："
    echo "   1. 是否已在 GitHub 创建了仓库"
    echo "   2. 用户名是否正确"
    echo "   3. 网络连接是否正常"
fi