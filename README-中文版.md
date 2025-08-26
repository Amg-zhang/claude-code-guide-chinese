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

----------------------------------------------------------------------------------------------------------------------------------
# Powershell
/* ps-session         */ $env:ANTHROPIC_API_KEY = "sk-your-key-here-here"
/* ps-masked-check    */ "OK: $($env:ANTHROPIC_API_KEY.Substring(0,8))***"
/* ps-persist         */ [Environment]::SetEnvironmentVariable("ANTHROPIC_API_KEY","sk-your-key-here-here","User") 
/* ps-rotate          */ $env:ANTHROPIC_API_KEY = "sk-new-key"
/* ps-remove          */ Remove-Item Env:\ANTHROPIC_API_KEY
----------------------------------------------------------------------------------------------------------------------------------
# 其他方法...
# persist-bash/*      */ echo 'export ANTHROPIC_API_KEY="sk-your-key-here-here"' >> ~/.bashrc && source ~/.bashrc
# persist-zsh /*      */ echo 'export ANTHROPIC_API_KEY="sk-your-key-here-here"' >> ~/.zshrc  && source ~/.zshrc
# persist-fish/*      */ fish -lc 'set -Ux ANTHROPIC_API_KEY sk-your-key-here-here'
----------------------------------------------------------------------------------------------------------------------------------
```

---

<h1 id="configuration--environment">配置与环境</h1>

<h2 id="environment-variables">环境变量</h2>

> **您也可以在 settings.json 文件的 "env" 键下设置这些变量以自动应用。**

> [!Important] 
> **Windows 用户请将 <kbd>export</kbd> 替换为 <kbd>set</kbd> 或 <kbd>setx</kbd> 以实现持久化**

```bash
# 环境变量开关（放在 ~/.bashrc 或 ~/.zshrc 中）
export ANTHROPIC_API_KEY="sk-your-key-here-here"      # 作为 X-Api-Key 头发送的 API 密钥（交互式使用：/login）
export ANTHROPIC_AUTH_TOKEN="my-auth-token"           # 自定义 Authorization 头；Claude 自动添加 "Bearer " 前缀
export ANTHROPIC_CUSTOM_HEADERS="X-Trace-Id: 12345"   # 额外的请求头（格式："Name: Value"）

export ANTHROPIC_MODEL="claude-sonnet-4-20250514"                # 要使用的自定义模型名称
export ANTHROPIC_DEFAULT_SONNET_MODEL="claude-sonnet-4-20250514" # 默认 Sonnet 模型别名
export ANTHROPIC_DEFAULT_OPUS_MODEL="claude-opus-4-20250514"     # 默认 Opus 模型别名
export ANTHROPIC_SMALL_FAST_MODEL="haiku-model"                  # 用于后台任务的 Haiku 类模型（占位符）
export ANTHROPIC_SMALL_FAST_MODEL_AWS_REGION="REGION"            # 覆盖 Bedrock 上小/快模型的 AWS 区域（占位符）

export AWS_BEARER_TOKEN_BEDROCK="bedrock_..."         # Amazon Bedrock 身份验证的 API 密钥/令牌

export BASH_DEFAULT_TIMEOUT_MS=60000                  # 长时间运行 bash 命令的默认超时（毫秒）
export BASH_MAX_TIMEOUT_MS=300000                     # 长时间运行 bash 命令允许的最大超时（毫秒）
export BASH_MAX_OUTPUT_LENGTH=20000                   # bash 输出中间截断前的最大字符数

export CLAUDE_BASH_MAINTAIN_PROJECT_WORKING_DIR=1     # (0 或 1) 每次 Bash 命令后返回到原始项目目录
export CLAUDE_CODE_API_KEY_HELPER_TTL_MS=600000       # 使用 apiKeyHelper 时刷新凭证的间隔（毫秒）
export CLAUDE_CODE_IDE_SKIP_AUTO_INSTALL=1            # (0 或 1) 跳过 IDE 扩展的自动安装
export CLAUDE_CODE_MAX_OUTPUT_TOKENS=4096             # 大多数请求的最大输出令牌数

export CLAUDE_CODE_USE_BEDROCK=1                      # (0 或 1) 使用 Amazon Bedrock
export CLAUDE_CODE_USE_VERTEX=0                       # (0 或 1) 使用 Google Vertex AI
export CLAUDE_CODE_SKIP_BEDROCK_AUTH=0                # (0 或 1) 跳过 Bedrock 的 AWS 身份验证（例如，通过 LLM 网关）
export CLAUDE_CODE_SKIP_VERTEX_AUTH=0                 # (0 或 1) 跳过 Vertex 的 Google 身份验证（例如，通过 LLM 网关）

export CLAUDE_CODE_DISABLE_NONESSENTIAL_TRAFFIC=0     # (0 或 1) 禁用非必要流量（等同于下面的 DISABLE_*）
export CLAUDE_CODE_DISABLE_TERMINAL_TITLE=0           # (0 或 1) 禁用自动终端标题更新

export DISABLE_AUTOUPDATER=0                          # (0 或 1) 禁用自动更新（覆盖 autoUpdates 设置）
export DISABLE_BUG_COMMAND=0                          # (0 或 1) 禁用 /bug 命令
export DISABLE_COST_WARNINGS=0                        # (0 或 1) 禁用成本警告信息
export DISABLE_ERROR_REPORTING=0                      # (0 或 1) 选择退出 Sentry 错误报告
export DISABLE_NON_ESSENTIAL_MODEL_CALLS=0            # (0 或 1) 禁用非关键路径的模型调用
export DISABLE_TELEMETRY=0                            # (0 或 1) 选择退出 Statsig 遥测

export HTTP_PROXY="http://proxy:8080"                 # HTTP 代理服务器 URL
export HTTPS_PROXY="https://proxy:8443"               # HTTPS 代理服务器 URL

export MAX_THINKING_TOKENS=0                          # (0 或 1 关闭/开启) 为模型强制设置思考预算
export MCP_TIMEOUT=120000                             # MCP 服务器启动超时（毫秒）
export MCP_TOOL_TIMEOUT=60000                         # MCP 工具执行超时（毫秒）
export MAX_MCP_OUTPUT_TOKENS=25000                    # MCP 工具响应中允许的最大令牌数（默认 25000）

export USE_BUILTIN_RIPGREP=0                          # (0 或 1) 设置为 0 以使用系统安装的 rg 而不是内置的

export VERTEX_REGION_CLAUDE_3_5_HAIKU="REGION"        # Vertex AI 上 Claude 3.5 Haiku 的区域覆盖
export VERTEX_REGION_CLAUDE_3_5_SONNET="REGION"       # Vertex AI 上 Claude 3.5 Sonnet 的区域覆盖
export VERTEX_REGION_CLAUDE_3_7_SONNET="REGION"       # Vertex AI 上 Claude 3.7 Sonnet 的区域覆盖
export VERTEX_REGION_CLAUDE_4_0_OPUS="REGION"         # Vertex AI 上 Claude 4.0 Opus 的区域覆盖
export VERTEX_REGION_CLAUDE_4_0_SONNET="REGION"       # Vertex AI 上 Claude 4.0 Sonnet 的区域覆盖
export VERTEX_REGION_CLAUDE_4_1_OPUS="REGION"         # Vertex AI 上 Claude 4.1 Opus 的区域覆盖
```

<h2 id="global-config-options">全局配置选项</h2>

```bash
claude config set -g theme dark                               # 主题: dark | light | light-daltonized | dark-daltonized
claude config set -g preferredNotifChannel iterm2_with_bell   # 通知渠道: iterm2 | iterm2_with_bell | terminal_bell | notifications_disabled
claude config set -g autoUpdates true                         # 自动下载并安装更新（在重启时应用）
claude config set -g verbose true                             # 显示完整的 bash/命令输出

claude config set -g includeCoAuthoredBy false                # 在 git 提交/PR 中省略 "co-authored-by Claude"
claude config set -g forceLoginMethod console                 # 限制登录到 Anthropic 控制台（API 计费）
claude config set -g model "claude-3-5-sonnet-20241022"       # 默认模型覆盖
claude config set -g statusLine '{"type":"command","command":"~/.claude/statusline.sh"}'  # 自定义状态行

claude config set -g enableAllProjectMcpServers true              # 自动批准来自 .mcp.json 的所有 MCP 服务器
claude config set -g enabledMcpjsonServers '["memory","github"]'  # 批准特定的 MCP 服务器
claude config set -g disabledMcpjsonServers '["filesystem"]'      # 拒绝特定的 MCP 服务器
```

> [!Important] 
> **Windows 用户请将 <kbd>export</kbd> 替换为 <kbd>set</kbd>**

```bash
export DISABLE_AUTOUPDATER=1                      # 全局关闭自动更新（覆盖 autoUpdates）
export CLAUDE_CODE_DISABLE_NONESSENTIAL_TRAFFIC=1 # 禁用非必要流量（等同于下面的 DISABLE_* 开关）
export DISABLE_TELEMETRY=1                        # 选择退出 Statsig 遥测
export DISABLE_ERROR_REPORTING=1                  # 选择退出 Sentry 错误报告
export DISABLE_BUG_COMMAND=1                      # 禁用 /bug 命令
export DISABLE_COST_WARNINGS=0                    # 保留成本警告（设置为 1 隐藏）
export DISABLE_NON_ESSENTIAL_MODEL_CALLS=1        # 跳过非关键模型调用（装饰文本等）

export CLAUDE_CODE_DISABLE_TERMINAL_TITLE=1       # 停止自动更新终端标题
export CLAUDE_BASH_MAINTAIN_PROJECT_WORKING_DIR=1 # 每次 Bash 命令后返回到原始项目目录
export CLAUDE_CODE_IDE_SKIP_AUTO_INSTALL=1        # 跳过 IDE 扩展的自动安装
export USE_BUILTIN_RIPGREP=0                      # 使用系统 'rg' (0) 而不是内置 'rg'

export MAX_THINKING_TOKENS=0                      # (0 或 1 关闭/开启) 为模型强制设置思考预算
export CLAUDE_CODE_MAX_OUTPUT_TOKENS=4096         # 限制典型响应大小（示例值）

export HTTP_PROXY="http://proxy.company:8080"     # HTTP 代理（如果需要）
export HTTPS_PROXY="https://proxy.company:8443"   # HTTPS 代理（如果需要）
```

<h2 id="configuration-files">配置文件</h2>

**（内存类型）Claude Code 在层次结构中提供四个内存位置，每个都有不同的目的：**

| 内存类型                | 位置                                                                                                                                                | 目的                                             | 用例示例                                                    | 共享范围                     |
| -------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------- | -------------------------------------------------------------------- | ------------------------------- |
| **企业策略**      | macOS: `/Library/Application Support/ClaudeCode/CLAUDE.md`<br />Linux: `/etc/claude-code/CLAUDE.md`<br />Windows: `C:\ProgramData\ClaudeCode\CLAUDE.md` | 由 IT/DevOps 管理的组织范围指令 | 公司编码标准、安全策略、合规要求 | 组织内所有用户       |
| **项目内存**         | `./CLAUDE.md`                                                                                                                                           | 项目的团队共享指令            | 项目架构、编码标准、常用工作流程             | 通过源代码控制共享给团队成员 |
| **用户内存**            | `~/.claude/CLAUDE.md`                                                                                                                                   | 所有项目的个人偏好               | 代码样式偏好、个人工具快捷方式                 | 只有您（所有项目）         |
| **项目内存（本地）** | `./CLAUDE.local.md`                                                                                                                                     | 个人项目特定偏好               | *（已弃用，见下文）* 您的沙盒 URL、偏好的测试数据     | 只有您（当前项目）      |

> 所有内存文件在启动 Claude Code 时会自动加载到上下文中。层次结构中较高的文件优先并首先加载，为更具体的内存构建基础。

---

<h1 id="commands--usage">命令与使用</h1>

<h2 id="claude-commands">Claude 命令</h2>

| 命令                   | 目的                                                                                                                                      |
| :------------------------ | :------------------------------------------------------------------------------------------------------------------------------------------- |
| `/add-dir`                | 添加额外的工作目录                                                                                                           |
| `/agents`                 | 管理专门任务的自定义 AI 子代理                                                                                             |
| `/bug`                    | 报告错误（将对话发送给 Anthropic）                                                                                                |
| `/clear`                  | 清除对话历史                                                                                                                   |
| `/compact [instructions]` | 使用可选的重点指令压缩对话                                                                                        |
| `/config`                 | 查看/修改配置                                                                                                                    |
| `/cost`                   | 显示令牌使用统计和计费信息 |
| `/doctor`                 | 检查您的 Claude Code 安装健康状况                                                                                           |
| `/help`                   | 获取使用帮助                                                                                                                               |
| `/init`                   | 使用 CLAUDE.md 指南初始化项目                                                                                                      |
| `/login`                  | 切换 Anthropic 账户                                                                                                                    |
| `/logout`                 | 从您的 Anthropic 账户登出                                                                                                         |
| `/mcp`                    | 管理 MCP 服务器连接和 OAuth 身份验证                                                                                       |
| `/memory`                 | 编辑 CLAUDE.md 内存文件                                                                                                                  |
| `/model`                  | 选择或更改 AI 模型                                                                                                                |
| `/permissions`            | 查看或更新工具权限 |
| `/pr_comments`            | 查看拉取请求评论                                                                                                                   |
| `/review`                 | 请求代码审查                                                                                                                          |
| `/status`                 | 查看账户和系统状态                                                                                                             |
| `/terminal-setup`         | 为换行安装 Shift+Enter 键绑定（仅限 iTerm2 和 VSCode）                                                                        |
| `/vim`                    | 进入 vim 模式以交替插入和命令模式                                                                                      |

<h2 id="command-line-flags">命令行参数</h2>

| 参数 / 命令                             | 描述                                                                                                                                              | 示例                                                     |
| :----------------------------------------- | :------------------------------------------------------------------------------------------------------------------------------------------------------- | :---------------------------------------------------------- |
| `-d, --debug`                              | 启用调试模式（显示详细调试输出）。                                                                                                        | `claude -d -p "query"`                                      |
| `--mcp-debug`                               | [已弃用] MCP 调试模式（显示 MCP 服务器错误）。请改用 `--debug`。                                                                             | `claude --mcp-debug`                                        |
| `--verbose`                                 | 覆盖配置中的详细模式设置（显示扩展日志/逐步输出）。                                                                | `claude --verbose`                                          |
| `-p, --print`                               | 打印响应并退出（对管道输出有用）。                                                                                                     | `claude -p "query"`                                         |
| `--output-format <format>`                  | 输出格式（仅与 `--print` 一起使用）：`text`（默认）、`json`（单个结果）或 `stream-json`（实时流）。                              | `claude -p "query" --output-format json`                    |
| `--input-format <format>`                   | 输入格式（仅与 `--print` 一起使用）：`text`（默认）或 `stream-json`（实时流输入）。                                                  | `claude -p --output-format stream-json --input-format stream-json` |
| `--replay-user-messages`                    | 将用户消息从 stdin 重新发送到 stdout 以确认——**仅与** `--input-format=stream-json` **和** `--output-format=stream-json` **一起使用**。 | `claude --input-format stream-json --output-format stream-json --replay-user-messages` |
| `--allowedTools`, `--allowed-tools <tools...>`  | 以逗号/空格分隔的允许工具名称列表（例如 `"Bash(git:*) Edit"`）。                                                                           | `--allowed-tools "Bash(git:*)" Edit"`                       |
| `--disallowedTools`, `--disallowed-tools <tools...>` | 以逗号/空格分隔的拒绝工具名称列表（例如 `"Bash(git:*) Edit"`）。                                                                            | `--disallowed-tools "Edit"`                                 |
| `--mcp-config <configs...>`                 | 从 JSON 文件或字符串加载 MCP 服务器（空格分隔）。                                                                                          | `claude --mcp-config ./mcp-servers.json`                    |
| `--strict-mcp-config`                       | 仅使用来自 `--mcp-config` 的 MCP 服务器，忽略其他 MCP 配置。                                                                             | `claude --mcp-config ./a.json --strict-mcp-config`          |
| `--append-system-prompt <prompt>`           | 将系统提示附加到默认系统提示（在打印模式下有用）。                                                                              | `claude -p --append-system-prompt "Do X then Y"`            |
| `--permission-mode <mode>`                  | 会话的权限模式（选择包括 `acceptEdits`、`bypassPermissions`、`default`、`plan`）。                                                 | `claude --permission-mode plan`                             |
| `--permission-prompt-tool <tool>`           | 指定 MCP 工具在非交互模式下处理权限提示。                                                                               | `claude -p --permission-prompt-tool mcp_auth_tool "query"`  |
| `--fallback-model <model>`                  | 当默认模型过载时启用自动回退到指定模型（注意：根据帮助仅与 `--print` 一起工作）。                                 | `claude -p --fallback-model claude-haiku-20240307 "query"`  |
| `--model <model>`                            | 当前会话的模型。接受别名如 `sonnet`/`opus` 或完整模型名称（例如 `claude-sonnet-4-20250514`）。                               | `claude --model sonnet`                                     |
| `--settings <file-or-json>`                  | 从 JSON 文件或 JSON 字符串加载额外设置。                                                                                              | `claude --settings ./settings.json`                         |
| `--add-dir <directories...>`                 | 允许工具访问的额外目录。                                                                                                          | `claude --add-dir ../apps ../lib`                           |
| `--ide`                                      | 如果恰好有一个有效的 IDE 可用，则在启动时自动连接到 IDE。                                                                        | `claude --ide`                                              |
| `-c, --continue`                             | 继续当前目录中最近的对话。                                                                                          | `claude --continue`                                         |
| `-r, --resume [sessionId]`                   | 恢复对话；提供会话 ID 或交互式选择一个。                                                                                 | `claude -r "abc123"`                                        |
| `--session-id <uuid>`                        | 为对话使用特定的会话 ID（必须是有效的 UUID）。                                                                                   | `claude --session-id 123e4567-e89b-12d3-a456-426614174000`  |
| `--dangerously-skip-permissions`             | 绕过所有权限检查（仅用于受信任的沙盒）。                                                                                               | `claude --dangerously-skip-permissions`                     |
| `-v, --version`                              | 显示已安装的 `claude` CLI 版本。                                                                                                                 | `claude --version`                                          |
| `-h, --help`                                 | 显示帮助/用法。                                                                                                                                     | `claude --help`                                             |

> `--output-format json` 参数对于脚本和自动化特别有用，允许您以编程方式解析 Claude 的响应。

<h2 id="cheat-sheet">速查表</h2>

```md
## Claude 速查表
# 基础 / 交互式
claude                                 # 启动交互式 REPL
claude "explain this project"          # 使用提示启动 REPL
claude -p "summarize README.md"        # 非交互式打印模式（SDK支持）
cat logs.txt | claude -p "explain"     # 将输入管道到 Claude 并退出
claude -c                              # 继续最近的对话（--continue 的别名）
claude -r "<session-id>" "finish this" # 通过 ID 恢复特定会话（--resume 的别名）
claude --model claude-sonnet-4-20250514# 为此运行选择模型
claude --max-turns 3 -p "lint this"    # 在打印模式下限制代理轮数
claude --replay-user-messages          # 将用户消息重放到 stdout 以进行调试/SDK 工作流

# 更新和安装
claude update                          # 手动更新 Claude Code
claude doctor                          # 诊断安装/版本和设置
claude install                         # 启动原生二进制安装程序（测试版）
claude migrate-installer               # 从全局 npm 迁移到本地安装程序

# 配置：交互式向导 + 直接操作
claude config                          # 交互式配置向导
claude config get <key>                # 获取值（例如，claude config get theme）
claude config set <key> <val>          # 设置值（例如，claude config set theme dark）
claude config add <key> <vals…>        # 追加到数组类型键（例如，claude config add env DEV=1）
claude config remove <key> <vals…>     # 从列表类型键中删除项目
claude config list                     # 显示项目的所有当前设置（项目范围是默认的）

# 项目范围设置示例
claude config set model "claude-3-5-sonnet-20241022"   # 覆盖此项目的默认模型
claude config set includeCoAuthoredBy false            # 在 git/PR 中禁用 "co-authored-by Claude" 署名
claude config set forceLoginMethod claudeai            # 限制登录流程：claudeai | console
claude config set enableAllProjectMcpServers true      # 自动批准来自 .mcp.json 的所有 MCP 服务器
claude config set defaultMode "acceptEdits"            # 设置默认权限模式
claude config set disableBypassPermissionsMode disable # 防止 bypassPermissions 模式（示例键）

# 管理列表设置（项目范围）
claude config add enabledMcpjsonServers github         # 批准来自 .mcp.json 的特定 MCP 服务器
claude config add enabledMcpjsonServers memory         # 添加另一个
claude config remove enabledMcpjsonServers memory      # 删除一个条目
claude config add disabledMcpjsonServers filesystem    # 明确拒绝特定的 MCP 服务器

# 全局范围（使用 -g 或 --global）
claude config set -g autoUpdates false                 # 全局关闭自动更新
claude config set --global preferredNotifChannel iterm2_with_bell
claude config set -g theme dark                        # 主题：dark | light | light-daltonized | dark-daltonized
claude config set -g verbose true                      # 在所有地方显示完整的 bash/命令输出
claude config get -g theme                             # 确认全局值

# MCP（模型上下文协议）管理
claude mcp                          # 启动 MCP 向导/配置 MCP 服务器
claude mcp list                     # 列出已配置的 MCP 服务器
claude mcp get <name>               # 显示服务器详细信息
claude mcp remove <name>            # 删除服务器
claude mcp add <name> <command> [args...]                 # 添加本地 stdio 服务器
claude mcp add --transport sse <name> <url>               # 添加远程 SSE 服务器
claude mcp add --transport http <name> <url>              # 添加远程 HTTP 服务器
claude mcp add <name> --env KEY=VALUE -- <cmd> [args...]  # 向服务器命令传递环境变量
claude mcp add --transport sse private-api https://api.example/mcp \
  --header "Authorization: Bearer TOKEN"                  # 使用认证头添加
claude mcp add-json <name> '<json>'                       # 通过 JSON blob 添加服务器
claude mcp add-from-claude-desktop                        # 从 Claude Desktop 导入服务器
claude mcp reset-project-choices                          # 重置项目 .mcp.json 服务器的批准
claude mcp serve                                          # 将 Claude Code 本身作为 MCP stdio 服务器运行

# 其他有用的参数（打印/SDK 模式）
claude --add-dir ../apps ../lib                     # 添加额外的工作目录
claude --allowedTools "Bash(git log:*)" "Read"      # 允许列出的工具而不提示权限
claude --disallowedTools "Edit"                     # 禁止列出的工具而不提示权限
claude --append-system-prompt "Custom instruction"  # 追加到系统提示（仅与 -p 一起使用）
claude -p "query" --output-format json --input-format stream-json  # 控制脚本的 IO 格式
claude --verbose                                    # 详细日志（逐步）
claude --dangerously-skip-permissions               # 跳过权限提示（谨慎使用）

# 快速验证/注意事项
# - 'claude config' 默认项目范围；使用 -g/--global 影响所有项目。
# - 设置优先级：企业 > CLI 参数 > 本地项目 > 共享项目 > 用户 (~/.claude)。
# - 仅对列表类型键使用 'add'/'remove'（例如，enabledMcpjsonServers）。
# - CLI 参考和发布说明是参数和最新添加的权威来源。
```

---

<h1 id="interface--input">界面与输入</h1>

<h2 id="keyboard-shortcuts">键盘快捷键</h2>

| 快捷键         | 描述                        | 上下文                    |
| :--------------- | :--------------------------------- | :------------------------- |
| `Ctrl+C`         | 取消当前输入或生成 | 标准中断         |
| `Ctrl+D`         | 退出 Claude Code 会话           | EOF 信号                 |
| `Ctrl+L`         | 清除终端屏幕              | 保留对话历史 |
| `Up/Down arrows` | 浏览命令历史           | 回忆之前的输入     |
| `Esc` + `Esc`    | 编辑上一条消息              | 双击 Esc 修改    |

<h3 id="multiline-input">多行输入</h3>

| 方法           | 快捷键       | 上下文                           |
| :--------------- | :------------- | :-------------------------------- |
| 快速转义     | `\` + `Enter`  | 在所有终端中工作            |
| macOS 默认    | `Option+Enter` | macOS 默认                  |
| 终端设置   | `Shift+Enter`  | 在 `/terminal-setup` 之后           |
| 控制序列 | `Ctrl+J`       | 多行的换行符字符 |
| 粘贴模式       | 直接粘贴 | 用于代码块、日志             |

<h3 id="quick-commands">快捷命令</h3>

| 快捷键     | 描述                        | 注释                                                     |
| :----------- | :--------------------------------- | :-------------------------------------------------------- |
| 开头的 `#` | 内存快捷方式添加到 CLAUDE.md | 提示选择文件                                |
| 开头的 `/` | 斜杠命令                      |  

<h2 id="vim-mode">Vim 模式</h2>

> [!Note]
>  使用 `/vim` 命令启用 vim 样式编辑，或通过 `/config` 永久配置。

<h3 id="vim-mode-switching">Vim 模式切换</h3>

| 命令 | 动作                      | 从模式 |
| :------ | :-------------------------- | :-------- |
| `Esc`   | 进入 NORMAL 模式           | INSERT    |
| `i`     | 在光标前插入        | NORMAL    |
| `I`     | 在行首插入 | NORMAL    |
| `a`     | 在光标后插入         | NORMAL    |
| `A`     | 在行末插入       | NORMAL    |
| `o`     | 在下方打开新行             | NORMAL    |
| `O`     | 在上方打开新行             | NORMAL    |

<h3 id="vim-navigation">Vim 导航</h3>

| 命令         | 动作                    |
| :-------------- | :------------------------ |
| `h`/`j`/`k`/`l` | 左/下/上/右移动   |
| `w`             | 下一个单词                 |
| `e`             | 单词结尾               |
| `b`             | 上一个单词             |
| `0`             | 行首         |
| `$`             | 行末               |
| `^`             | 第一个非空白字符 |
| `gg`            | 输入开始        |
| `G`             | 输入结束              |

<h3 id="vim-editing">Vim 编辑</h3>

| 命令        | 动作                  |
| :------------- | :---------------------- |
| `x`            | 删除字符        |
| `dd`           | 删除行             |
| `D`            | 删除到行末   |
| `dw`/`de`/`db` | 删除单词/到末尾/向后 |
| `cc`           | 更改行             |
| `C`            | 更改到行末   |
| `cw`/`ce`/`cb` | 更改单词/到末尾/向后 |
| `.`            | 重复上次更改      |

> [!Tip]
> 在终端设置中配置您偏好的换行行为。运行 `/terminal-setup` 为 iTerm2 和 VS Code 终端安装 Shift+Enter 绑定。

<h2 id="command-history">命令历史</h2>

> Claude Code 为当前会话维护命令历史：

```
* 历史按工作目录存储
* 使用 `/clear` 命令清除
* 使用上/下箭头导航（见上面的键盘快捷键）
* **Ctrl+R**: 反向搜索历史（如果终端支持）
* **注意**: 历史展开 (`!`) 默认禁用
```

---

<h1 id="advanced-features">高级功能</h1>

<h2 id="thinking-keywords">思考关键词</h2>

> [!Note]
> **通过在提示中添加以下任一关键词，为 Claude 提供额外的回答前计划时间。**
> **顺序（最低 → 最高）令牌消耗**
> <table><tr><td>
> 
> > **<kbd>think</kbd> -------------> 最低**
> 
> > **<kbd>think hard</kbd>**
> 
> > **<kbd>think harder</kbd>**
> 
> > **<kbd>ultrathink</kbd> --------> 最高**
> 
> </td></tr></table>

<h3 id="this-makes-claude-spend-more-time">这让 Claude 花更多时间在：</h3>

1. **规划解决方案**
2. #### 分解步骤
3. #### 权衡替代方案/权衡取舍
4. #### 检查约束和边界情况
> > #### 更高级别通常增加**延迟**和**令牌使用量**，选择有效的最小级别。

<h5 id="thinking-examples">示例</h5>

```md
# 小幅提升
claude -p "Think. Outline a plan to refactor the auth module."

# 中等提升
claude -p "Think harder. Draft a migration plan from REST to gRPC."

# 最大提升
claude -p "Ultrathink. Propose a step-by-step strategy to fix flaky payment tests and add guardrails."
```

<h2 id="sub-agents">子代理</h2>

> 子代理是具有**自己的提示、工具和隔离上下文窗口**的专用助手。将此视为您为每个仓库**组合**的"专家混合"。

**何时使用它们**
> - 您需要高信号响应（计划、审查、差异）而不产生副作用。
> - 您希望与代码库一起进行版本控制的提示和工具策略。
> - 您在 PR 驱动的团队中工作，希望按角色进行范围化编辑。

<h3 id="each-sub-agent-has-its-own-context">每个子代理都有自己的上下文</h3>

**为您的阵容设计规则**
> - 为每个代理定义**一个明确的责任**。
> - 保持该角色所需的**最少**工具集。
> - 对于分析/审查任务，优先选择**只读**代理。
> - 尽可能少地给代理编辑权限。

<img width="700" height="160" alt="image" src="https://github.com/user-attachments/assets/42767417-20aa-4bd4-aaf2-cfa0e515b54b" />

*说明：终端中的代理选择 UI。*

<h3 id="configure-agents">配置代理</h3>

> 将代理保留**在项目中**，这样它们就与仓库一起版本化，并通过 PR 演进。

<h3 id="agents-quick-start">快速开始</h3>

> 更新 CLI 并打开代理面板

```bash
claude update
/agents
```

<h3 id="create-your-core-agents">创建您的核心代理</h3>

> - **planner**（只读）：将功能/问题转化为小的、可测试的任务；输出任务列表或 plan.md。
> - **codegen**（可编辑）：实现任务；限制在 `src/` + `tests/`。
> - **tester**（只读或仅补丁）：编写*一个*失败的测试或最小复现。
> - **reviewer**（只读）：留下结构化审查评论；从不编辑。
> - **docs**（可编辑）：仅更新 `README.md`/`docs/`。

***策略**提示：为可编辑的代理优先选择**补丁输出**，这样更改通过您正常的 Git 工作流程落地。*

<img width="700" height="173" alt="image" src="https://github.com/user-attachments/assets/84bc80de-35b8-4ef7-9b27-f74f7d4a51f9" />

*说明：只选择代理真正需要的工具（例如，建议性 vs 编辑性访问）。*

<h3 id="example-prompts">示例提示</h3>

> 保持提示简短、可测试且特定于仓库。将它们签入 `agents/`：

<img width="700" height="217" alt="image" src="https://github.com/user-attachments/assets/b4f92591-ff5c-4775-aec2-051f145b9616" />

*说明：**测试覆盖分析器**代理的示例提示。*

**tester.prompt.md（示例）**

```
角色：为我描述的特定场景编写单个、专注的失败测试。
范围：仅在 tests/ 下创建/修改测试。不要更改 src/。
输出：简要说明 + 统一差异或补丁。
如果场景不清楚，请只问一个明确的问题。
```

<h3 id="expected-output">期望输出</h3>

> 您的测试代理应该产生一个小的差异或补丁加上简短的说明：

<img width="700" height="273" alt="image" src="https://github.com/user-attachments/assets/839151ce-02c9-4283-a53b-9dd105802ada" />

*说明：**测试覆盖分析器**代理的示例响应。*

<h3 id="why-this-shift-matters">为什么这种转变很重要</h3>

**操作优势**
> - **减少上下文切换：**您保持在一种心理模式中；代理完成其余工作。
> - **更清洁的 PR：**狭窄的提示 + 有限的工具 → 更小、可审查的差异。
> - **更少的回归：**测试器/审查器代理在合并前捕获空白。
> - **可重复性：**提示 + 策略存在于仓库中并与分支一起传递。

**安全与治理**
> - 按路径限制写访问（例如，`src/`、`tests/`、`docs/`）。
> - 对高风险区域优先选择只读分析。
> - 将助手输出记录/提交为补丁以便审计。

<h3 id="a-mindset-shift">思维转变</h3>

**应该做的**
> - 将代理视为具有职位描述的队友。
> - 从只读开始；*最后*授予写访问权限。
> - 将提示保留在版本控制中并通过 PR 迭代。

**不应该做的**
> - 要求一个代理在单轮中计划、编码和测试。
> - 给予全面的写权限。
> - 当您要求一个测试时接受多文件差异。

<h2 id="mcp-integration">MCP 集成</h2>

<h3 id="understanding-mcp-model-context-protocol">理解 MCP（模型上下文协议）</h3>

#### 什么是 MCP？
> MCP 通过连接到外部服务、数据库、API 和工具（文件系统、Puppeteer、GitHub、Context7 等）来扩展 Claude 的能力...

###### **MCP 架构：**

```
Claude Code ←→ MCP 协议 ←→ MCP 服务器 ←→ 外部服务
```

<h3 id="mcp-setup--configuration">MCP 设置与配置</h3>

###### 基本 MCP 命令

```bash
claude mcp                   # 交互式 MCP 配置
claude mcp list              # 列出配置的服务器            
claude mcp add <name> <cmd>  # 添加新服务器
claude mcp remove <name>     # 删除服务器
```

###### MCP 配置文件位置

```bash
~/.claude.json      # 全局文件
`.mcp.json`         # 项目范围的服务器存储在项目根目录的文件中
```

<h3 id="popular-mcp-servers">流行的 MCP 服务器</h3>

#### 开发工具

```bash
# npm install -g git-mcp-server         

# claude mcp add git "git-mcp-server"
# claude mcp add github "github-mcp-server --token $GITHUB_TOKEN"
```

#### 数据库集成  

```bash
npm install -g postgres-mcp-server               
npm install -g mysql-mcp-server                  
npm install -g sqlite-mcp-server               

# 设置示例可能如下所示：
# export POSTGRES_URL="postgresql://user:password@localhost:5432/mydb"
# claude mcp add postgres "postgres-mcp-server --url $POSTGRES_URL"
```

#### MCP 工具权限

```bash
# 允许特定的 MCP 工具 
claude --allowedTools "mcp__git__commit,mcp__git__push"

# 允许特定服务器的所有工具
claude --allowedTools "mcp__postgres__*"

# 与内置工具结合
claude --allowedTools "Edit,View,mcp__git__*"
```

<h2 id="hooks-system">钩子系统</h2>

> 本页提供在 Claude Code 中实现钩子的参考文档。

<Tip>
  有关示例的快速入门指南，请参见 [开始使用 Claude Code 钩子](/en/docs/claude-code/hooks-guide)。
</Tip>

<h3 id="hooks-configuration">配置</h3>

Claude Code 钩子在您的[设置文件](/en/docs/claude-code/settings)中配置：

* `~/.claude/settings.json` - 用户设置
* `.claude/settings.json` - 项目设置
* `.claude/settings.local.json` - 本地项目设置（不提交）
* 企业管理的策略设置

#### 结构

钩子按匹配器组织，每个匹配器可以有多个钩子：

```json
{
  "hooks": {
    "EventName": [
      {
        "matcher": "ToolPattern",
        "hooks": [
          {
            "type": "command",
            "command": "echo '钩子触发'"
          }
        ]
      }
    ]
  }
}
```

---

## 🎯 翻译说明

这是 [zebbern/claude-code-guide](https://github.com/zebbern/claude-code-guide) 的中文翻译版本。

**当前翻译状态：**
- ✅ **已完成翻译的部分**：
  - 项目介绍和目录结构
  - 快速开始指南（安装、系统要求、初始设置）
  - 配置与环境（环境变量、全局配置、配置文件）
  - 命令与使用（Claude 命令、命令行参数、速查表）
  - 界面与输入（键盘快捷键、多行输入、Vim 模式、命令历史）
  - 高级功能（思考关键词、子代理、MCP 集成、钩子系统开始部分）

- 📋 **待翻译的部分**：
  - 钩子系统（完整内容）
  - 安全与权限
  - 自动化与集成
  - 帮助与故障排除
  - 最佳实践
  - 常见陷阱避免
  - 第三方集成
  - 其他剩余内容

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

**翻译进度：** 约 35%（811行/2292行）

---

**贡献指南：**
- 欢迎提交 Pull Request 继续完成翻译
- 欢迎指出翻译错误或改进建议
- 协助完成剩余的故障排除和最佳实践部分

*最后更新：2025年1月*