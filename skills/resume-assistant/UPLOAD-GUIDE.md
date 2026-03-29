# 📤 上传到 GitHub 完整指南

## 📋 准备工作

### 1. 创建 GitHub 账号（如果没有）

访问 https://github.com/signup 注册账号

---

## 🚀 上传步骤

### 第 1 步：创建 GitHub 仓库

1. 访问 https://github.com/new
2. 填写仓库信息：
   - **Repository name**: `resume-assistant`
   - **Description**: 专业可编辑的 HTML 简历模板生成工具
   - **Public**: 公开（推荐，让更多人看到）
   - **Private**: 私有（仅自己可见）
   - ❌ 不要勾选 "Add a README file"
   - ❌ 不要勾选 ".gitignore"
   - ❌ 不要选择许可证
3. 点击 **"Create repository"**

---

### 第 2 步：复制仓库地址

创建成功后，GitHub 会显示：
```
Quick setup
-----------
git remote add origin https://github.com/你的用户名/resume-assistant.git
```

**复制这个地址**（HTTPS 或 SSH 都可以）

---

### 第 3 步：在本地添加远程仓库

打开终端，运行：

```bash
# 进入技能目录
cd /Users/qindan/.openclaw/workspace/skills/resume-assistant

# 添加远程仓库（替换为你的仓库地址）
git remote add origin https://github.com/你的用户名/resume-assistant.git

# 验证是否添加成功
git remote -v
```

**预期输出**：
```
origin  https://github.com/你的用户名/resume-assistant.git (fetch)
origin  https://github.com/你的用户名/resume-assistant.git (push)
```

---

### 第 4 步：推送到 GitHub

```bash
# 查看当前分支
git branch

# 如果显示 main，执行：
git push -u origin main

# 如果显示 master，执行：
git push -u origin master
```

**可能需要输入**：
- GitHub 用户名
- GitHub 密码（或个人访问令牌）

---

### 第 5 步：验证上传

1. 刷新 GitHub 仓库页面
2. 应该能看到以下文件：
   ```
   resume-assistant/
   ├── .gitignore
   ├── LICENSE
   ├── README.md
   ├── SKILL.md
   └── resume-template.html
   ```

---

## 🔧 常见问题

### 问题 1：提示 `remote origin already exists`

**原因**：已经添加过远程仓库

**解决**：
```bash
git remote remove origin
git remote add origin https://github.com/你的用户名/resume-assistant.git
git push -u origin main
```

---

### 问题 2：提示 `permission denied`

**原因**：SSH key 未配置

**解决（使用 HTTPS）**：
```bash
# 改用 HTTPS 地址
git remote set-url origin https://github.com/你的用户名/resume-assistant.git
git push -u origin main
```

**解决（配置 SSH）**：
```bash
# 生成 SSH key
ssh-keygen -t ed25519 -C "your_email@example.com"

# 查看公钥
cat ~/.ssh/id_ed25519.pub

# 复制输出内容，添加到 GitHub:
# Settings → SSH and GPG keys → New SSH key
```

---

### 问题 3：推送失败，提示分支不存在

**解决**：
```bash
# 创建并切换到 main 分支
git checkout -b main
git push -u origin main
```

---

## 📝 后续更新

修改文件后，推送更新：

```bash
cd /Users/qindan/.openclaw/workspace/skills/resume-assistant

# 添加修改的文件
git add .

# 提交
git commit -m "fix: 修复 XXX 问题"

# 推送
git push
```

---

## 🔗 分享你的简历

上传成功后，别人可以：

1. **直接下载 HTML 模板**：
   ```
   https://github.com/你的用户名/resume-assistant/raw/main/resume-template.html
   ```

2. **克隆整个项目**：
   ```bash
   git clone https://github.com/你的用户名/resume-assistant.git
   ```

3. **作为 OpenClaw 技能安装**：
   ```bash
   git clone https://github.com/你的用户名/resume-assistant.git ~/.openclaw/workspace/skills/resume-assistant
   ```

---

## ✅ 检查清单

- [ ] 已创建 GitHub 账号
- [ ] 已创建仓库 `resume-assistant`
- [ ] 已复制仓库地址
- [ ] 已运行 `git remote add origin ...`
- [ ] 已运行 `git push -u origin main`
- [ ] 已在 GitHub 上看到上传的文件

---

**完成！** 🎉 现在你的简历助手已经分享给全世界了！
