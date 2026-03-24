@echo off
echo =====================================
echo   Cloudflare Pages 部署脚本
echo =====================================
echo.

REM 检查 wrangler 是否安装
where wrangler >nul 2>nul
if %ERRORLEVEL% NEQ 0 (
    echo [错误] Wrangler 未安装，正在安装...
    npm install -g wrangler
)

echo [步骤 1] 登录 Cloudflare...
wrangler login

echo.
echo [步骤 2] 部署到 Cloudflare Pages...
echo.
wrangler pages deploy . --project-name=jifen-poster-generator

echo.
echo =====================================
echo   部署完成！
echo =====================================
echo.
echo 请访问 https://dash.cloudflare.com/?to=/:account/pages 查看部署状态
echo.
pause
