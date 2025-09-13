# منصة الشقق الفندقية الفاخرة | Luxury Apartment Platform

منصة ويب احترافية لتأجير الشقق الفندقية الفاخرة مع واجهة عربية حديثة ومميزات متقدمة.

## 🌟 المميزات الرئيسية

### واجهة المستخدم (UI/UX)
- ✅ تصميم عصري متجاوب (Responsive) يعمل على الجوال والكمبيوتر
- ✅ ألوان فاخرة تعكس الطابع الفندقي (ذهبي وأسود وأزرق وأبيض)
- ✅ صفحة رئيسية مع محرك بحث متقدم للشقق
- ✅ عرض الشقق بصور احترافية مع الأسعار والتفاصيل
- ✅ تصميم RTL كامل للغة العربية

### خصائص المنصة
- ✅ تسجيل مستخدمين (عملاء + أصحاب الشقق)
- ✅ لوحة تحكم لكل مستخدم
- ✅ نظام حجوزات مباشر مع تقويم التوافر
- ✅ إدارة العقود الإلكترونية والفواتير
- ✅ إرسال إشعارات عبر البريد الإلكتروني
- ✅ تصنيف الشقق (متاحة – محجوزة – منتهية)
- ✅ دعم طرق الدفع المتعددة

### لوحة الإدارة (Admin Panel)
- ✅ إدارة جميع الشقق والحجوزات
- ✅ إضافة عروض وخصومات
- ✅ تقارير مالية يومية/شهرية
- ✅ متابعة تقييمات العملاء

### مميزات إضافية
- ✅ دعم اللغتين العربية والإنجليزية
- ✅ خريطة تفاعلية (Google Maps API)
- ✅ تصدير تقارير إلى PDF و Excel
- ✅ نظام أمان وحماية للبيانات

## 🚀 التقنيات المستخدمة

### Frontend
- **Next.js 14** - إطار عمل React مع App Router
- **TypeScript** - لكتابة كود آمن ومنظم
- **Tailwind CSS** - للتصميم السريع والمتجاوب
- **Framer Motion** - للحركات والانتقالات السلسة
- **React Hook Form** - لإدارة النماذج
- **React Query** - لإدارة البيانات وحالة الخادم

### Backend & Database
- **Next.js API Routes** - لبناء API
- **Prisma** - ORM للتعامل مع قاعدة البيانات
- **PostgreSQL** - قاعدة البيانات الرئيسية
- **NextAuth.js** - للمصادقة والأمان

### Payment & Services
- **Stripe** - لمعالجة المدفوعات
- **Nodemailer** - لإرسال الإيميلات
- **Cloudinary** - لإدارة الصور
- **Google Maps API** - للخرائط التفاعلية

### Development Tools
- **ESLint** - لفحص جودة الكود
- **Prettier** - لتنسيق الكود
- **Husky** - لإعداد Git hooks

## 📦 التثبيت والإعداد

### المتطلبات
- Node.js 18+ 
- npm أو yarn
- PostgreSQL
- حساب Stripe (اختياري)
- حساب Google Maps API (اختياري)

### خطوات التثبيت

1. **استنساخ المشروع**
```bash
git clone https://github.com/your-username/luxury-apartment-platform.git
cd luxury-apartment-platform
```

2. **تثبيت التبعيات**
```bash
npm install
# أو
yarn install
```

3. **إعداد متغيرات البيئة**
```bash
cp env.example .env.local
```

قم بتعديل ملف `.env.local` وأضف القيم المطلوبة:

```env
# Database
DATABASE_URL="postgresql://username:password@localhost:5432/luxury_apartments"

# NextAuth
NEXTAUTH_URL="http://localhost:3000"
NEXTAUTH_SECRET="your-secret-key-here"

# Google Maps API
GOOGLE_MAPS_API_KEY="your-google-maps-api-key"

# Stripe Payment
STRIPE_PUBLISHABLE_KEY="pk_test_your_stripe_publishable_key"
STRIPE_SECRET_KEY="sk_test_your_stripe_secret_key"

# Email Configuration
SMTP_HOST="smtp.gmail.com"
SMTP_PORT="587"
SMTP_USER="your-email@gmail.com"
SMTP_PASS="your-app-password"
```

4. **إعداد قاعدة البيانات**
```bash
npx prisma generate
npx prisma db push
npx prisma db seed
```

5. **تشغيل المشروع**
```bash
npm run dev
# أو
yarn dev
```

افتح [http://localhost:3000](http://localhost:3000) في المتصفح.

## 📁 هيكل المشروع

```
luxury-apartment-platform/
├── app/                    # Next.js App Router
│   ├── globals.css        # الأنماط العامة
│   ├── layout.tsx         # التخطيط الرئيسي
│   ├── page.tsx           # الصفحة الرئيسية
│   └── providers.tsx      # مقدمي السياق
├── components/            # المكونات
│   ├── home/              # مكونات الصفحة الرئيسية
│   ├── layout/            # مكونات التخطيط
│   └── ui/                # مكونات واجهة المستخدم
├── context/               # سياق React
│   ├── AuthContext.tsx    # سياق المصادقة
│   ├── CartContext.tsx    # سياق سلة التسوق
│   ├── LanguageContext.tsx # سياق اللغة
│   └── ThemeContext.tsx   # سياق الثيم
├── lib/                   # المكتبات والأدوات
├── types/                 # تعريفات TypeScript
├── public/                # الملفات الثابتة
└── prisma/                # مخطط قاعدة البيانات
```

## 🎨 التصميم والألوان

### نظام الألوان
- **الذهبي الفاخر**: `#D4AF37` - اللون الأساسي
- **الذهبي الفاتح**: `#F4E4BC` - للخلفيات
- **الذهبي الداكن**: `#B8860B` - للتفاعلات
- **الأسود الفاخر**: `#1a1a1a` - للنصوص
- **الأزرق الملكي**: `#1e40af` - للعناصر الثانوية

### الخطوط
- **العربية**: Cairo, Tajawal
- **الإنجليزية**: Inter

## 🔧 المميزات التقنية

### الأداء
- تحميل سريع مع Next.js 14
- تحسين الصور التلقائي
- تقسيم الكود (Code Splitting)
- تخزين مؤقت ذكي

### الأمان
- مصادقة آمنة مع NextAuth.js
- تشفير كلمات المرور
- حماية من CSRF
- التحقق من البيانات

### التجاوب
- تصميم متجاوب 100%
- دعم جميع أحجام الشاشات
- تجربة مستخدم محسنة للموبايل

## 📱 الصفحات والمكونات

### الصفحات الرئيسية
- **الصفحة الرئيسية** - عرض الشقق المميزة ومحرك البحث
- **صفحة الشقق** - قائمة بجميع الشقق المتاحة
- **صفحة تفاصيل الشقة** - عرض تفاصيل شقة معينة
- **صفحة الحجز** - عملية حجز الشقة
- **لوحة التحكم** - إدارة الحساب والحجوزات

### المكونات الرئيسية
- **Hero** - القسم الرئيسي في الصفحة الرئيسية
- **SearchBar** - محرك البحث المتقدم
- **FeaturedApartments** - عرض الشقق المميزة
- **Categories** - تصنيفات الشقق
- **Testimonials** - آراء العملاء
- **Header/Footer** - رأس وتذييل الموقع

## 🌐 دعم اللغات

### العربية (الافتراضية)
- دعم كامل للغة العربية
- اتجاه RTL
- خطوط عربية جميلة
- ترجمة شاملة لجميع النصوص

### الإنجليزية
- دعم كامل للغة الإنجليزية
- اتجاه LTR
- ترجمة احترافية
- تبديل سهل بين اللغات

## 💳 طرق الدفع المدعومة

- **البطاقات الائتمانية**: Visa, Mastercard
- **الدفع المحلي**: مدى (Mada)
- **التحويل البنكي**: للدفعات الكبيرة
- **Stripe**: معالجة آمنة للمدفوعات

## 📊 التقارير والإحصائيات

### تقارير المبيعات
- تقارير يومية وشهرية
- إحصائيات الحجوزات
- تحليل الإيرادات
- تقارير العملاء

### تصدير البيانات
- تصدير إلى PDF
- تصدير إلى Excel
- تقارير مخصصة
- تحليل الأداء

## 🔒 الأمان والخصوصية

### حماية البيانات
- تشفير البيانات الحساسة
- حماية من SQL Injection
- حماية من XSS
- HTTPS إجباري

### الخصوصية
- سياسة خصوصية شاملة
- موافقة المستخدم
- حماية البيانات الشخصية
- الامتثال للقوانين المحلية

## 🚀 النشر والإنتاج

### متطلبات الخادم
- Node.js 18+
- PostgreSQL 13+
- Redis (اختياري)
- Nginx (اختياري)

### متغيرات البيئة للإنتاج
```env
NODE_ENV=production
DATABASE_URL=your-production-database-url
NEXTAUTH_URL=https://your-domain.com
NEXTAUTH_SECRET=your-production-secret
```

## 🤝 المساهمة

نرحب بمساهماتكم! يرجى اتباع الخطوات التالية:

1. Fork المشروع
2. إنشاء فرع للميزة الجديدة (`git checkout -b feature/AmazingFeature`)
3. Commit التغييرات (`git commit -m 'Add some AmazingFeature'`)
4. Push إلى الفرع (`git push origin feature/AmazingFeature`)
5. فتح Pull Request

## 📄 الترخيص

هذا المشروع مرخص تحت رخصة MIT - راجع ملف [LICENSE](LICENSE) للتفاصيل.

## 📞 الدعم والاتصال

- **البريد الإلكتروني**: info@luxuryapartments.com
- **الهاتف**: +966 50 123 4567
- **الموقع**: [luxuryapartments.com](https://luxuryapartments.com)

## 🙏 شكر وتقدير

- فريق Next.js للتقنية الرائعة
- مجتمع React للمساعدة والدعم
- جميع المساهمين في المشروع

---

**تم تطوير هذا المشروع بحب ❤️ لخدمة المجتمع العربي**

