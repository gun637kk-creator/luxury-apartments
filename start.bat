@echo off
echo ========================================
echo    منصة الشقق الفندقية الفاخرة
echo    Luxury Apartment Platform
echo ========================================
echo.

echo جاري فحص المتطلبات...
node --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ Node.js غير مثبت. يرجى تثبيت Node.js 18 أو أحدث
    pause
    exit /b 1
)

echo ✅ Node.js مثبت
echo.

echo جاري تثبيت التبعيات...
call npm install
if %errorlevel% neq 0 (
    echo ❌ فشل في تثبيت التبعيات
    pause
    exit /b 1
)

echo ✅ تم تثبيت التبعيات بنجاح
echo.

echo جاري إنشاء ملفات الإعداد...
if not exist .env.local (
    if exist env.example (
        copy env.example .env.local >nul
        echo ✅ تم إنشاء ملف .env.local
        echo ⚠️  يرجى تحديث متغيرات البيئة في ملف .env.local
    )
)

echo.
echo ========================================
echo    بدء تشغيل الخادم...
echo ========================================
echo.
echo 🌐 سيفتح المتصفح تلقائياً على: http://localhost:3000
echo.
echo لإيقاف الخادم: اضغط Ctrl+C
echo.

start http://localhost:3000
call npm run dev

