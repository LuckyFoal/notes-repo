---
title: "Git 基础命令"
date: 2024-03-08
subject: "版本控制"
tags: [git, version-control, basics]
level: beginner
---

# Git 基础命令

## 📚 学习目标
- 掌握 Git 基本工作流程
- 学会常用 Git 命令
- 理解分支管理基础

## 🔍 核心概念

### 仓库 (Repository)
**定义**：Git 用来存储项目历史记录的地方
**初始化**：`git init`

### 提交 (Commit)
**定义**：项目在某个时间点的快照
**命令**：`git commit -m "提交信息"`

### 分支 (Branch)
**定义**：独立开发线
**创建**：`git branch 分支名`
**切换**：`git checkout 分支名`

## 💻 常用命令

### 基础工作流
```bash
# 1. 查看状态
git status

# 2. 添加文件到暂存区
git add 文件名
git add .  # 添加所有文件

# 3. 提交更改
git commit -m "提交说明"

# 4. 推送到远程仓库
git push origin 分支名
```

### 分支管理
```bash
# 查看分支
git branch
git branch -a  # 查看所有分支（包括远程）

# 创建并切换分支
git checkout -b 新分支名

# 合并分支
git merge 分支名
```

## 📖 参考资料
1. [Git 官方文档](https://git-scm.com/doc) - 最权威的参考资料
2. [GitHub Git 备忘单](https://training.github.com/) - 实用命令集合

## 🧠 知识总结
- Git 是分布式版本控制系统
- 工作流程：工作区 → 暂存区 → 仓库
- 分支让协作开发更高效

## ❓ 自测问题
1. `git add` 和 `git commit` 有什么区别？
2. 如何查看当前的 Git 状态？
3. 创建新分支的命令是什么？
