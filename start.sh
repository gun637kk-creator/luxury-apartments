#!/bin/bash

echo "========================================"
echo "   منصة الشقق الفندقية الفاخرة"
echo "   Luxury Apartment Platform"
echo "========================================"
echo

echo "جاري فحص المتطلبات..."
if ! command -v node &> /dev/null; then
    echo "❌ Node.js غير مثبت. يرجى تثبيت Node.js 18 أو أحدث"
    exit 1
fi

echo "✅ Node.js مثبت"
echo

echo "جاري تثبيت التبعيات..."
if ! npm install; then
    echo "❌ فشل في تثبيت التبعيات"
    exit 1
fi

echo "✅ تم تثبيت التبعيات بنجاح"
echo

echo "جاري إنشاء ملفات الإعداد..."
if [ ! -f .env.local ]; then
    if [ -f env.example ]; then
        cp env.example .env.local
        echo "✅ تم إنشاء ملف .env.local"
        echo "⚠️  يرجى تحديث متغيرات البيئة في ملف .env.local"
    fi
fi

echo
echo "========================================"
echo "   بدء تشغيل الخادم..."
echo "========================================"
echo
echo "🌐 سيفتح المتصفح تلقائياً على: http://localhost:3000"
echo
echo "لإيقاف الخادم: اضغط Ctrl+C"
echo

# Open browser (works on macOS and Linux)
if command -v open &> /dev/null; then
    open http://localhost:3000
elif command -v xdg-open &> /dev/null; then
    xdg-open http://localhost:3000
fi

npm run dev

