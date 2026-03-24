# 🚀 Cloudflare Pages 部署完整指南

## 💰 费用说明
**完全免费！** Cloudflare Pages 免费套餐包含：
- ✅ 无限带宽
- ✅ 无限请求数
- ✅ 全球 CDN 加速（中国大陆可访问）
- ✅ 自动 HTTPS
- ✅ 500 次构建/月
- ✅ 自定义域名绑定

---

## 方法一：GitHub Actions 自动部署（推荐）

### 步骤 1: 获取 Cloudflare API Token

1. 访问 https://dash.cloudflare.com/profile/api-tokens
2. 点击 **"Create Token"**
3. 选择 **"Edit Cloudflare Workers"** 模板
4. 权限配置：
   - **Account.Cloudflare Pages** → `Edit`
   - **Account.Account Settings** → `Read`
5. 点击 **"Continue to summary"**
6. 点击 **"Create Token"**
7. **复制并保存 Token**（只显示一次！）

### 步骤 2: 在 GitHub 配置 Secret

1. 打开你的仓库：https://github.com/369099105XDai/jifen-poster-generator
2. 进入 **Settings** → **Secrets and variables** → **Actions**
3. 点击 **"New repository secret"**
4. 添加：
   - **Name**: `CLOUDFLARE_API_TOKEN`
   - **Value**: 粘贴刚才创建的 Token
5. 点击 **"Add secret"**

### 步骤 3: 推送代码

```bash
git add .
git commit -m "Add Cloudflare Pages deployment configuration"
git push origin main
```

### 步骤 4: 查看部署状态

1. 访问仓库的 **Actions** 标签
2. 查看部署工作流运行状态
3. 部署成功后，访问 `https://jifen-poster-generator.pages.dev`

---

## 方法二：本地一键部署

### Windows PowerShell

```powershell
cd d:\QODER\jifen-poster-generator
.\deploy.ps1
```

### 或者手动执行

```bash
# 1. 安装 Wrangler
npm install -g wrangler

# 2. 登录 Cloudflare
wrangler login

# 3. 部署
wrangler pages deploy . --project-name=jifen-poster-generator
```

---

## 方法三：Cloudflare Dashboard 手动部署

1. 访问 https://pages.cloudflare.com
2. 点击 **"Create a project"**
3. 选择 **"Connect to Git"**
4. 授权并选择仓库 `jifen-poster-generator`
5. 配置：
   - **Build command**: 留空
   - **Build output directory**: `/`
6. 点击 **"Save and Deploy"**

---

## 🇨🇳 中国大陆访问优化

### 1. 绑定自定义域名（可选）

1. 在 Pages Dashboard → **Settings** → **Custom domains**
2. 点击 **"Add custom domain"**
3. 输入你的域名
4. 按照提示在 DNS 服务商处添加 CNAME 记录

### 2. 开启 Cloudflare 优化

访问 Cloudflare Dashboard → 你的域名：

- **Speed** → **Optimization**
  - ✅ Auto Minify (压缩 HTML/CSS/JS)
  - ✅ Brotli 压缩
  - ✅ Early Hints
  
- **Caching**
  - ✅ Caching Level: Standard
  - ✅ Browser Cache TTL: 1 month

- **SSL/TLS**
  - ✅ Encryption Mode: Full

---

## 🔧 配置文件说明

### `.github/workflows/deploy.yml`
GitHub Actions 工作流文件，每次 push 到 main 分支自动部署。

### `wrangler.toml`
Wrangler 配置文件，定义项目名称和部署参数。

### `deploy.ps1` / `deploy.bat`
本地部署脚本，一键完成登录和部署。

---

## 📊 查看部署状态

- **Dashboard**: https://dash.cloudflare.com/?to=/:account/pages
- **项目 URL**: `https://jifen-poster-generator.pages.dev`
- **GitHub Actions**: 仓库 → Actions 标签

---

## ❓ 常见问题

### Q: 部署失败怎么办？
A: 检查：
1. Cloudflare API Token 是否正确配置
2. GitHub Secret 是否正确添加
3. 仓库名称是否与配置一致

### Q: 如何更新部署？
A: 只需 push 新代码到 main 分支，会自动重新部署。

### Q: 中国大陆访问速度慢？
A: 建议绑定自定义域名，并将 DNS 托管到 Cloudflare。

---

## 📞 支持

如有问题，请查看：
- Cloudflare Pages 文档：https://developers.cloudflare.com/pages/
- Wrangler 文档：https://developers.cloudflare.com/workers/wrangler/
