# 🚀 部署到 Cloudflare Pages

本项目是纯静态网站，可以通过以下方式免费部署到 Cloudflare Pages。

## 方法一：通过 Cloudflare Dashboard（推荐）

1. 访问 https://pages.cloudflare.com
2. 使用 GitHub 账号登录
3. 点击 **"Create a project"**
4. 选择 **"Connect to Git"**
5. 选择仓库：`jifen-poster-generator`
6. **构建设置**：
   - Build command: **留空**
   - Build output directory: `/` (根目录)
7. 点击 **"Save and Deploy"**
8. 等待部署完成，获得 `https://jifen-poster-generator.pages.dev` 域名

## 方法二：使用 Wrangler CLI

```bash
# 安装 Wrangler
npm install -g wrangler

# 登录 Cloudflare
wrangler login

# 部署到 Pages
wrangler pages deploy . --project-name=jifen-poster-generator
```

## 中国大陆访问优化

### 1. 绑定自定义域名（可选但推荐）

- 在 Cloudflare Pages Dashboard → Settings → Custom domains
- 添加你的域名
- 按照提示配置 DNS

### 2. 开启 Cloudflare 优化功能

在 Cloudflare Dashboard 中启用：
- **Speed** → **Optimization** → **Auto Minify** (压缩 HTML/CSS/JS)
- **Caching** → 开启所有缓存选项
- **SSL/TLS** → 设置为 **Full** 或 **Flexible**

## 自动部署

连接 GitHub 后，每次 push 到 main 分支都会自动重新部署。

---

**费用**: 💰 完全免费（Cloudflare Pages 免费套餐包含无限带宽和请求）
