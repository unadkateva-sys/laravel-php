@echo off
echo ========================================
echo Fashion Hub - Quick Setup
echo ========================================
echo.
echo This script will:
echo - Run database migrations
echo - Seed sample products
echo.
echo IMPORTANT: Make sure MySQL is running in Laragon!
echo.
pause

cd /d "%~dp0"

echo.
echo [1/3] Running migrations...
php artisan migrate --force

if %errorlevel% neq 0 (
    echo.
    echo ERROR: Migration failed!
    echo Make sure:
    echo 1. MySQL is running in Laragon
    echo 2. Database 'fashion_hub_db' exists
    echo 3. .env file has correct database settings
    echo.
    pause
    exit /b 1
)

echo.
echo [2/3] Seeding sample products...
php artisan db:seed --class=ProductSeeder --force

if %errorlevel% neq 0 (
    echo.
    echo ERROR: Seeding failed!
    pause
    exit /b 1
)

echo.
echo [3/3] Clearing cache...
php artisan config:clear
php artisan cache:clear

echo.
echo ========================================
echo Setup Complete!
echo ========================================
echo.
echo 16 sample products have been added!
echo.
echo Start server: php artisan serve
echo Visit: http://127.0.0.1:8000/products
echo.
pause
