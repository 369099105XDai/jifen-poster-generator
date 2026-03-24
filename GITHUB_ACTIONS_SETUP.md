# 🔧 GitHub Actions 自动部署配置指南

## ✅ 已完成的配置

以下文件已经创建并准备好使用：

### 1. `.github/workflows/deploy.yml`
GitHub Actions 工作流文件，配置了：
- 触发条件：push 到 main 分支 / 手动触发
- 自动部署到 Cloudflare Pages

### 2. `wrangler.toml`
Wrangler 配置文件

### 3. 本地 Git 仓库
- ✅ Git 仓库已初始化
- ✅ 所有文件已 commit
- ⏳ 需要推送到 GitHub

---

## 📋 需要手动完成的步骤

### 步骤 1: 推送到 GitHub

由于网络连接原因，请手动执行以下命令：

```bash
cd d:\QODER\jifen-poster-generator

# 如果推送失败，先拉取远程代码
git pull origin main --allow-unrelated-histories

# 然后推送
git push -u origin main

# 如果遇到冲突，强制推送
git push -f origin main
```

---

### 步骤 2: 创建 Cloudflare API Token

1. 访问：https://dash.cloudflare.com/profile/api-tokens
2. 点击 **"Create Token"**
3. 选择 **"Edit Cloudflare Workers"** 模板
4. 配置权限：
   ```
   Account.Cloudflare Pages → Edit
   Account.Account Settings → Read
   ```
5. 点击 **"Continue to summary"**
6. 点击 **"Create Token"**
7. **复制 Token**（只显示一次！）

---

### 步骤 3: 在 GitHub 添加 Secret

1. 访问：https://github.com/369099105XDai/jifen-poster-generator/settings/secrets/actions/new
2. 填写：
   - **Name**: `CLOUDFLARE_API_TOKEN`
   - **Value**: 粘贴刚才创建的 Token
3. 点击 **"Add secret"**

---

### 步骤 4: 验证自动部署

推送代码后，GitHub Actions 会自动运行：

1. 访问：https://github.com/369099105XDai/jifen-poster-generator/actions
2. 查看 "Deploy to Cloudflare Pages" 工作流
3. 等待部署完成（约 1-2 分钟）
4. 访问部署的 URL

---

## 🎯 手动部署（备选方案）

如果不想使用 GitHub Actions，可以手动部署：

### Windows PowerShell
```powershell
cd d:\QODER\jifen-poster-generator
.\deploy.ps1
```

### 或者使用 Wrangler CLI
```bash
wrangler pages deploy . --project-name=jifen-poster-generator
```

---

## 📊 查看部署状态

- **Cloudflare Dashboard**: https://dash.cloudflare.com/?to=/:account/pages
- **项目 URL**: https://jifen-poster-generator.pages.dev
- **GitHub Actions**: https://github.com/369099105XDai/jifen-poster-generator/actions

---

## ❓ 常见问题

### Q: 推送时遇到冲突？
```bash
# 保留本地代码，强制推送
git push -f origin main
```

### Q: GitHub Actions 运行失败？
检查：
1. Secret 是否正确添加
2. API Token 是否有效
3. 仓库名称是否正确

### Q: 如何手动触发部署？
1. 访问仓库 → Actions
2. 选择 "Deploy to Cloudflare Pages"
3. 点击 "Run workflow"

---

## 🎉 完成后的效果

配置完成后：
- ✅ 每次 push 到 main 分支都会自动部署
- ✅ 可以在 GitHub Actions 中查看部署历史
- ✅ 部署失败会收到通知
- ✅ 完全免费，无限带宽
