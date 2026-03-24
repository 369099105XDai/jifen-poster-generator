# Cloudflare Pages 一键部署脚本

$ErrorActionPreference = "Stop"
$projectName = "jifen-poster-generator"
$githubRepo = "https://github.com/369099105XDai/jifen-poster-generator.git"
$tempDir = "temp_deploy_$(Get-Random)"

Write-Host "=====================================" -ForegroundColor Cyan
Write-Host "  Cloudflare Pages 一键部署" -ForegroundColor Cyan
Write-Host "=====================================" -ForegroundColor Cyan
Write-Host ""

# 步骤 1: 检查 wrangler
Write-Host "[1/5] 检查 Wrangler CLI..." -ForegroundColor Yellow
try {
    $wranglerVersion = wrangler --version 2>&1
    Write-Host "✓ Wrangler 已安装：$wranglerVersion" -ForegroundColor Green
} catch {
    Write-Host "✗ Wrangler 未安装，正在安装..." -ForegroundColor Yellow
    npm install -g wrangler
}

# 步骤 2: 登录 Cloudflare
Write-Host ""
Write-Host "[2/5] 登录 Cloudflare..." -ForegroundColor Yellow
wrangler login

# 步骤 3: 克隆仓库
Write-Host ""
Write-Host "[3/5] 克隆 GitHub 仓库..." -ForegroundColor Yellow
git clone $githubRepo $tempDir
Set-Location $tempDir

# 步骤 4: 部署到 Cloudflare Pages
Write-Host ""
Write-Host "[4/5] 部署到 Cloudflare Pages..." -ForegroundColor Yellow
Write-Host ""
wrangler pages deploy . --project-name=$projectName

# 步骤 5: 清理
Write-Host ""
Write-Host "[5/5] 清理临时文件..." -ForegroundColor Yellow
Set-Location ..
Remove-Item -Recurse -Force $tempDir

Write-Host ""
Write-Host "=====================================" -ForegroundColor Green
Write-Host "  ✓ 部署完成！" -ForegroundColor Green
Write-Host "=====================================" -ForegroundColor Green
Write-Host ""
Write-Host "📱 访问 Dashboard: https://dash.cloudflare.com/?to=/:account/pages" -ForegroundColor Cyan
Write-Host "🌐 项目 URL: https://$projectName.pages.dev" -ForegroundColor Cyan
Write-Host ""
Write-Host "按任意键继续..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
