---
title: "OpenClaw 设置笔记"
date: 2024-03-08
project: "OpenClaw"
status: "in-progress"
tags: [openclaw, setup, configuration]
---

# OpenClaw 设置笔记

## 🎯 项目目标
设置和配置 OpenClaw 个人助理系统

## 📋 已完成任务
- [x] 安装 OpenClaw
- [x] 配置基础工作空间
- [x] 设置笔记系统框架
- [ ] 配置消息通道
- [ ] 安装额外技能

## 🔧 技术配置

### 环境信息
- **系统**: Ubuntu Server
- **OpenClaw 版本**: 2026.3.2
- **工作空间**: /home/lucky/.openclaw/workspace
- **模型**: deepseek/deepseek-chat

### 目录结构
```
.openclaw/
├── workspace/          # 工作空间
│   ├── AGENTS.md      # 代理配置
│   ├── SOUL.md        # 核心身份
│   └── note/          # 笔记系统（新创建）
└── config/            # 配置文件
```

## 💡 遇到的问题

### 问题1：消息发送需要 target
**描述**: 使用 message 工具时提示需要 target 参数
**解决**: 在 webchat 通道中，直接回复即可，不需要显式调用 message 工具

### 问题2：模型配置
**描述**: 初始模型配置问题
**解决**: 已正确配置 deepseek/deepseek-chat 模型

## 📅 下一步计划
1. 配置 Telegram 或 WhatsApp 消息通道
2. 安装更多实用技能
3. 设置定期维护任务
4. 创建项目文档

## 🔗 相关资源
- [OpenClaw 文档](https://docs.openclaw.ai)
- [GitHub 仓库](https://github.com/openclaw/openclaw)
- [ClawHub 技能市场](https://clawhub.com)
