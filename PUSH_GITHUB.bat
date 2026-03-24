@echo off
chcp 65001 >nul
echo =====================================
echo   推送到 GitHub
echo =====================================
echo.

cd /d %~dp0

echo 当前目录：%CD%
echo.
echo [检查] Git 状态...
git status --short
echo.

echo [推送] 正在推送到 GitHub...
echo 如果遇到网络错误，请稍后重试
echo.

git push origin main

if %ERRORLEVEL% EQU 0 (
    echo.
    echo =====================================
    echo   ✓ 推送成功！
    echo =====================================
    echo.
    echo 查看部署状态:
    echo https://github.com/369099105XDai/jifen-poster-generator/actions
    echo.
) else (
    echo.
    echo =====================================
    echo   ✗ 推送失败
    echo =====================================
    echo.
    echo 可能原因:
    echo 1. 网络连接问题 - 请_retry
    echo 2. 需要 Git 凭证 - 请配置
    echo.
    echo 手动 retry:
    echo   git push origin main
    echo.
)

pause
