# 电脑系统配置清单

**创建日期**: 2026-03-08  
**最后更新**: 2026-03-08  
**分类**: 系统配置 / 软件清单

---

## 系统信息

### 基础信息
- **操作系统**: Ubuntu 24.04.4 LTS (Noble)
- **内核版本**: 6.8.0-101-generic
- **架构**: x86_64
- **主机名**: lucky-ubuntu-server

### 硬件信息
> *注：需要运行 `lscpu`, `free -h`, `df -h` 获取详细硬件信息*

---

## 软件配置清单

### 1. 开发工具和编程语言

#### Node.js 环境
- **Node.js 版本**: v25.8.0 (通过 nvm 安装)
- **npm 版本**: v11.11.0
- **全局包**:
  - `openclaw@2026.3.2` - AI 助手框架
  - `clawhub@0.7.0` - 技能仓库
  - `obsidian-cli@0.5.1` - 笔记工具命令行
  - `npm@11.11.0` - Node 包管理器

#### Go 语言
- **Go**: 已安装 (`golang-go` 包)

#### 容器化工具
- **Docker**: Docker CE
- **Docker Compose**: 已安装
- **Docker Buildx**: 插件已安装

#### 构建和版本控制
- **Git**: 版本控制
- **Make**: 构建工具
- **Build Essential**: 编译工具链

### 2. 桌面环境和 GUI 应用

#### 桌面环境
- **Kubuntu Desktop**: KDE Plasma 桌面环境

#### 浏览器
- **Firefox**: 148.0-1 (Snap 版本)
- **Google Chrome**: 稳定版

#### KDE 应用套件
- **Dolphin**: KDE 文件管理器
- **Konsole**: KDE 终端
- **Kwrite**: KDE 文本编辑器

#### 实用工具
- **Flameshot**: 截图工具
- **Xarchiver**: 归档管理器
- **Byobu**: 终端多路复用器

### 3. 输入法和字体

#### 输入法框架
- **Fcitx5**: 输入法框架
- **Fcitx5 中文插件**:
  - `fcitx5-chinese-addons-bin`
  - `fcitx5-pinyin`
  - `fcitx5-module-lua`

#### 字体
- **中文字体**:
  - `fonts-noto-cjk`
  - `fonts-wqy-microhei` (文泉驿微米黑)
  - `fonts-wqy-zenhei` (文泉驿正黑)
- **图标字体**: `fonts-font-awesome`
- **表情符号**: `fonts-noto-color-emoji`

### 4. 网络和代理工具

#### VPN 和代理
- **Clash Verge**: 代理客户端
- **Tailscale**: VPN 工具

#### 网络服务
- **Network Manager**: 网络管理
- **OpenSSH Server**: SSH 服务器
- **Certbot**: Let's Encrypt 证书工具

### 5. Snap 安装的软件
- **Firefox**: 148.0-1
- **Micro**: 2.0.15 (终端文本编辑器)
- **Prometheus**: 2.37.0 (监控系统)

### 6. Docker 环境

#### 当前运行的容器项目
**WeKnora** - AI/文档处理平台
- **PostgreSQL**: `paradedb/paradedb:v0.21.4-pg17`
- **Redis**: `redis:7.0-alpine`
- **Neo4j**: `neo4j:latest` (图数据库)
- **Qdrant**: `qdrant/qdrant:v1.16.2` (向量数据库)
- **MinIO**: `minio/minio:latest` (对象存储)
- **Jaeger**: `jaegertracing/all-in-one:latest` (分布式追踪)
- **WeKnora 组件**:
  - `wechatopenai/weknora-docreader:latest`
  - `wechatopenai/weknora-sandbox:latest`
  - `wechatopenai/weknora-ui:latest`

#### 其他 Docker 镜像
- **Lucky**: `gdy666/lucky:latest` (自定义镜像)

### 7. 系统服务状态
- **Docker**: 已启用 (`docker.service`)
- **SSH**: 已启用 (`ssh.service`)
- **Tailscale**: 已启用 (`tailscaled.service`)

### 8. 其他工具
- **7zip**: 压缩工具
- **BPFtrace**: eBPF 追踪工具
- **Sassc**: Sass 编译器

---

## 软件分类总结

### 开发环境
1. **编程语言**: Node.js, Go
2. **容器化**: Docker, Docker Compose
3. **数据库**: PostgreSQL, Redis, Neo4j, Qdrant
4. **构建工具**: Make, Build Essential

### AI/ML 相关
1. **AI 框架**: OpenClaw
2. **向量数据库**: Qdrant
3. **文档处理**: WeKnora 套件
4. **监控**: Prometheus, Jaeger

### 桌面应用
1. **浏览器**: Firefox, Chrome
2. **办公工具**: Dolphin, Konsole, Flameshot
3. **输入法**: Fcitx5 中文输入

### 网络工具
1. **VPN**: Tailscale
2. **代理**: Clash Verge
3. **远程访问**: SSH

### 系统工具
1. **监控**: Prometheus, BPFtrace
2. **压缩**: 7zip, Xarchiver
3. **终端**: Byobu, Micro

---

## 维护建议

### 1. 清理建议
- Docker 中有多个已停止的容器，可以考虑清理
- 检查未使用的 Docker 镜像

### 2. 更新建议
- 定期检查 Snap 和 APT 包的更新
- 更新 Node.js 全局包

### 3. 安全建议
- 确保所有服务都有适当的安全配置
- 定期更新系统安全补丁

### 4. 备份建议
- 重要数据（如笔记）已备份到 GitHub
- 考虑系统配置的备份

### 5. 监控建议
- Prometheus 已安装，可配置系统监控
- 考虑设置日志聚合

---

## 使用说明

### 笔记系统
- **笔记目录**: `/home/lucky/Documents/note`
- **Git 仓库**: https://github.com/LuckyFoal/notes-repo
- **同步命令**:
  ```bash
  cd /home/lucky/Documents/note
  git add .
  git commit -m "更新说明"
  git push
  ```

### 常用命令
```bash
# 查看 Docker 状态
docker ps -a
docker images

# 查看系统服务
systemctl status docker
systemctl status ssh

# 更新系统
sudo apt update && sudo apt upgrade
```

---

## 变更记录

| 日期 | 变更内容 | 备注 |
|------|----------|------|
| 2026-03-08 | 创建系统配置清单 | 初始版本 |

---

**标签**: #系统配置 #软件清单 #Ubuntu #Docker #开发环境  
**相关文件**: 
- `system/` 目录下的其他系统配置文档
- `projects/` 目录下的项目文档

> *注：此文档应定期更新以反映系统配置的变化*