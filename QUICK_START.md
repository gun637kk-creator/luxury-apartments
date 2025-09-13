# 🚀 دليل البدء السريع

## التثبيت والتشغيل

### الطريقة الأولى: التشغيل التلقائي (موصى بها)

#### على Windows:
```bash
start.bat
```

#### على macOS/Linux:
```bash
./start.sh
```

### الطريقة الثانية: التشغيل اليدوي

1. **تثبيت التبعيات:**
```bash
npm install
```

2. **إعداد متغيرات البيئة:**
```bash
cp env.example .env.local
```

3. **تشغيل المشروع:**
```bash
npm run dev
```

4. **فتح المتصفح:**
```
http://localhost:3000
```

## 📁 الصفحات المتاحة

- **الصفحة الرئيسية:** `/`
- **عرض الشقق:** `/apartments`
- **تسجيل الدخول:** `/auth/login`
- **إنشاء حساب:** `/auth/register`
- **لوحة التحكم:** `/dashboard`

## ⚙️ الإعدادات المطلوبة

### 1. قاعدة البيانات
قم بتحديث `DATABASE_URL` في ملف `.env.local`:
```env
DATABASE_URL="postgresql://username:password@localhost:5432/luxury_apartments"
```

### 2. Google Maps (اختياري)
```env
GOOGLE_MAPS_API_KEY="your-google-maps-api-key"
```

### 3. Stripe للدفع (اختياري)
```env
STRIPE_PUBLISHABLE_KEY="pk_test_your_stripe_publishable_key"
STRIPE_SECRET_KEY="sk_test_your_stripe_secret_key"
```

### 4. البريد الإلكتروني (اختياري)
```env
SMTP_HOST="smtp.gmail.com"
SMTP_PORT="587"
SMTP_USER="your-email@gmail.com"
SMTP_PASS="your-app-password"
```

## 🛠️ الأوامر المتاحة

```bash
# تشغيل المشروع
npm run dev

# بناء المشروع للإنتاج
npm run build

# تشغيل المشروع المبني
npm start

# فحص الأخطاء
npm run lint

# فحص الأنواع
npm run type-check

# إعداد قاعدة البيانات
npm run db:generate
npm run db:push
npm run db:seed

# فتح Prisma Studio
npm run db:studio
```

## 🎨 المميزات المتاحة

### ✅ مكتملة
- ✅ الصفحة الرئيسية مع محرك البحث
- ✅ عرض الشقق مع الفلاتر
- ✅ نظام تسجيل الدخول وإنشاء الحساب
- ✅ لوحة تحكم المستخدمين
- ✅ تصميم متجاوب باللغة العربية
- ✅ نظام الألوان الفاخرة
- ✅ الحركات والانتقالات السلسة

### 🔄 قيد التطوير
- 🔄 نظام الحجوزات والتقويم
- 🔄 نظام الدفع الإلكتروني
- 🔄 لوحة الإدارة
- 🔄 الخريطة التفاعلية
- 🔄 نظام التقارير

## 🐛 حل المشاكل الشائعة

### 1. خطأ في تثبيت التبعيات
```bash
# حذف node_modules وإعادة التثبيت
rm -rf node_modules package-lock.json
npm install
```

### 2. خطأ في قاعدة البيانات
تأكد من:
- تثبيت PostgreSQL
- صحة `DATABASE_URL`
- تشغيل قاعدة البيانات

### 3. خطأ في البورت
```bash
# استخدام بورت مختلف
npm run dev -- -p 3001
```

## 📞 الدعم

- **البريد الإلكتروني:** info@luxuryapartments.com
- **الهاتف:** +966 50 123 4567
- **الموقع:** [luxuryapartments.com](https://luxuryapartments.com)

## 🎉 استمتع بتطوير منصتك!

هذه المنصة مصممة لتكون نقطة انطلاق ممتازة لمشروع تأجير الشقق الفندقية. يمكنك تخصيصها وتطويرها حسب احتياجاتك.

