<div align="center">
  
<h2 id="claude-code-community-guide">Claude Code 社区指南</h2>

*获取最新更新和贡献信息，请访问 [Claude Code 官方文档](https://claude.ai/code)*

![Claude Code](https://img.shields.io/npm/v/@anthropic-ai/claude-code?label=Claude%20Code&logo=anthropic)
[![Status](https://img.shields.io/badge/Status-Active-brightgreen)](https://github.com/anthropics/claude-code)
[![License](https://img.shields.io/badge/License-Anthropic-orange)](https://claude.ai/code)

</div>

<div align="center">

<kbd>

| 章节                                    | 状态          |
|---------------------------------------------|------------------------------|
| Windows、Linux、MacOS 安装指南 | ✅ |
| 技巧与窍门                            | ✅ |
| MCP 概述与使用方法              | ✅ |
| 社区指南                           | ✅ |
| 故障排除                            | ✅ |
| Claude Code 最佳使用方法| ✅ |

</kbd>

#### [点击查看每日更新的 Claude 更新日志与新闻](https://github.com/zebbern/claude-code-guide/tree/main/Official%20Claude%20Releases)

</div>

---

<h3 id="content">目录</h3>

> - **[快速开始](#getting-started)**
>   - **[快速启动](#quick-start)**
>   - **[系统要求](#system-requirements)**
>   - **[初始设置](#initial-setup)**
> - **[配置与环境](#configuration--environment)**
>   - **[环境变量](#environment-variables)**
>   - **[全局配置选项](#global-config-options)**
>   - **[配置文件](#configuration-files)**
> - **[命令与使用](#commands--usage)**
>   - **[Claude 命令](#claude-commands)**
>   - **[命令行参数](#command-line-flags)**
>   - **[速查表](#cheat-sheet)**
> - **[界面与输入](#interface--input)**
>   - **[键盘快捷键](#keyboard-shortcuts)**
>     - **[多行输入](#multiline-input)**
>     - **[快捷命令](#quick-commands)**
>   - **[Vim 模式](#vim-mode)**
>     - **[Vim 模式切换](#vim-mode-switching)**
>     - **[Vim 导航](#vim-navigation)**
>     - **[Vim 编辑](#vim-editing)**
>   - **[命令历史](#command-history)**
> - **[高级功能](#advanced-features)**
>   - **[思考关键词](#thinking-keywords)**
>   - **[子代理](#sub-agents)**
>     - **[每个子代理有自己的上下文](#each-sub-agent-has-its-own-context)**
>     - **[配置代理](#configure-agents)**
>     - **[创建核心代理](#create-your-core-agents)**
>   - **[MCP 集成](#mcp-integration)**
>     - **[理解 MCP](#understanding-mcp-model-context-protocol)**
>     - **[MCP 设置与配置](#mcp-setup--configuration)**
>     - **[流行的 MCP 服务器](#popular-mcp-servers)**
>   - **[钩子系统](#hooks-system)**
>     - **[配置](#hooks-configuration)**
>     - **[钩子事件](#hook-events)**
>     - **[钩子输入](#hook-input)**
>     - **[钩子输出](#hook-output)**
>     - **[使用 MCP 工具](#working-with-mcp-tools)**
>     - **[安全考虑](#security-considerations)**
>     - **[调试](#hooks-debugging)**
> - **[安全与权限](#security--permissions)**
>   - **[安全最佳实践](#security-best-practices-main)**
>   - **[危险模式](#dangerous-mode)**
> - **[自动化与集成](#automation--integration)**
>   - **[自动化与脚本](#automation--scripting-with-claude-code)**
>   - **[自动 PR 审查](#auto-pr-review-inline-comments)**
>   - **[每个 PR 的安全审查](#security-review-on-every-pr)**
>   - **[问题分类](#issue-triage-suggest-labels--severity)**
> - **[帮助与故障排除](#help--troubleshooting)**
>   - **[调试快捷命令](#debug-quick-commands)**
>   - **[安装问题](#installation--nodejs-issues)**
>   - **[认证问题](#authentication-issues)**
>   - **[权限问题](#permission--allowed-tools-issues)**
>   - **[MCP 问题](#mcp-model-context-protocol-issues)**
>   - **[最佳实践](#best-practices)**
>     - **[有效提示](#effective-prompting)**
>     - **[性能技巧](#performance-tips)**
>     - **[监控与警报](#monitoring--alerting)**
>     - **[协作最佳实践](#collaboration-best-practices)**
>   - **[常见陷阱避免](#common-pitfalls-to-avoid)**
>     - **[安全陷阱](#security-pitfalls)**
>     - **[性能陷阱](#performance-pitfalls)**
>     - **[工作流陷阱](#workflow-pitfalls)**
> - **[第三方集成](#third-party-integrations)**
>   - **[DeepSeek 集成](#deepseek-integration)**

---

<h1 id="getting-started">快速开始</h1>

**启用 Claude 完成任务时的声音提醒：**
> 
> <kbd>claude config set --global preferredNotifChannel terminal_bell</kbd>

<h2 id="quick-start">快速启动</h2>

> [!TIP]
> **在终端中发送 <mark>claude</mark> 或 <mark>npx claude</mark> 启动界面**
>
> **前往 [帮助与故障排除](#help--troubleshooting) 修复问题...**

```C
# Node.js 18+⭐️              
/*通用方法       */ npm install -g @anthropic-ai/claude-code
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# Windows
/* 通过 CMD               */ npm install -g @anthropic-ai/claude-code
/* 通过 Powershell        */ irm https://claude.ai/install.ps1 | iex
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# WSL/GIT
/* 通过终端          */ npm install -g @anthropic-ai/claude-code
/* 通过终端          */ curl -fsSL https://claude.ai/install.sh | bash
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# MacOS                  */ brew install node && npm install -g @anthropic-ai/claude-code
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# Linux 
/* 通过终端          */ sudo apt update && sudo apt install -y nodejs npm
/* 通过终端          */ npm install -g @anthropic-ai/claude-code
/* 通过终端          */ curl -fsSL https://claude.ai/install.sh | bash
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# Arch                     
/* 通过终端          */ yay -S claude-code*/ 
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# Docker 
/* Windows (CMD)         */ docker run -it --rm -v "%cd%:/workspace" -e ANTHROPIC_API_KEY="sk-your-key" node:20-slim bash -lc "npm i -g @anthropic-ai/claude-code && cd /workspace && claude"
/* macOS/Linux (bash/zsh)*/ docker run -it --rm -v "$PWD:/workspace" -e ANTHROPIC_API_KEY="sk-your-key" node:20-slim bash -lc 'npm i -g @anthropic-ai/claude-code && cd /workspace && claude'
/* 无 bash 备用方案      */ docker run -it --rm -v "$PWD:/workspace" -e ANTHROPIC_API_KEY="sk-your-key" node:20-slim sh -lc 'npm i -g @anthropic-ai/claude-code && cd /workspace && claude'
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# 检查 claude 是否正确安装
/* Linux                 */ which claude 
/* Windows               */ where claude
/* 通用             */ claude --version
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# 常用管理命令
/*claude config          */ 配置设置
/*claude mcp list        */ 设置 MCP 服务器，也可以将 "list" 替换为 add/remove
/*claude /agents         */ 为不同任务配置/设置子代理
/*claude update          */ 更新到最新版本
```

---

> [!Tip]
> <ins>**通过终端打开项目到 VS Code / Cursor**</ins>
>  ### $ - <kbd>cd /path/to/project</kbd>
>  ### $ - <kbd>code .</kbd>
> 
**确保你已经在 VS Code / Cursor 中安装了 <mark>(Claude Code 扩展)</mark>**

---

<h2 id="system-requirements">系统要求</h2>

> - 操作系统：macOS 10.15+、Ubuntu 20.04+/Debian 10+、或 Windows 10/11 或 WSL

> - 硬件：最少 4GB RAM，推荐 8GB+

> - 软件：Node.js 18+ 或 git 2.23+（可选）以及用于 PR 工作流的 GitHub 或 GitLab CLI（可选）

> - 网络：用于 API 调用的互联网连接

> - Node.js 18+

---

<h2 id="initial-setup">初始设置</h2>

> [!Tip]
> **从 [Anthropic 控制台](https://console.anthropic.com) 找到 API 密钥**
>
> **不要提交真实密钥，请使用 git-ignored 文件、操作系统密钥存储或秘密管理器**

```C
# 通用
/* 开始登录过程                    */ claude /login
/* 设置长期身份验证令牌  */ claude setup-token
----------------------------------------------------------------------------------------------------------------------------------
# Windows
/* 设置 API 密钥        */ set ANTHROPIC_API_KEY=sk-your-key-here-here
/* 命令行遮罩检查   */ echo OK: %ANTHROPIC_API_KEY:~0,8%***
/* 设置持久密钥 */ setx ANTHROPIC_API_KEY "sk-your-key-here-here"
/* 命令行取消设置密钥      */ set ANTHROPIC_API_KEY=
----------------------------------------------------------------------------------------------------------------------------------
# Linux
/* 设置 API 密钥        */ export ANTHROPIC_API_KEY="sk-your-key-here-here"
/* 遮罩检查       */ echo "OK: ${ANTHROPIC_API_KEY:0:8}***"
/* 移除会话     */ unset ANTHROPIC_API_KEY
```

---

## 🎯 翻译说明

这是 [zebbern/claude-code-guide](https://github.com/zebbern/claude-code-guide) 的中文翻译版本。

**原始仓库信息：**
- 原作者：zebbern
- 原仓库：https://github.com/zebbern/claude-code-guide
- Star 数量：1.6k+
- 许可证：请参考原仓库

**翻译目标：**
- 将英文文档完整翻译成中文
- 保持原有格式和结构
- 保留所有代码示例和链接
- 使中文开发者更容易理解和使用 Claude Code

**注意事项：**
- 本翻译仅供学习交流使用
- 请以官方英文版本为准
- 如有翻译错误或建议，欢迎提出改进意见

---

*由于原文档内容庞大，这只是翻译的开始部分。完整翻译正在进行中...*