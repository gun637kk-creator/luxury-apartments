# 🚀 نشر سريع للمشروع

## الخطوة 1: إعداد Supabase (قاعدة البيانات)

### 1.1 إنشاء حساب Supabase
1. اذهب إلى: https://supabase.com
2. اضغط "Start your project"
3. سجل حساب جديد
4. اضغط "New Project"
5. املأ البيانات:
   - Project name: `luxury-apartments`
   - Database password: اختر كلمة مرور قوية
   - Region: اختر أقرب منطقة (Dubai)
6. اضغط "Create new project"

### 1.2 الحصول على معلومات الاتصال
بعد إنشاء المشروع:
1. اذهب إلى **Settings > Database**
2. انسخ **Connection string** (URI)
3. اذهب إلى **Settings > API**
4. انسخ **Project URL** و **anon public key**

### 1.3 إعداد الجداول
اذهب إلى **SQL Editor** وأضف هذا الكود:

```sql
-- إنشاء جدول المستخدمين
CREATE TABLE users (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  name TEXT NOT NULL,
  email TEXT UNIQUE NOT NULL,
  phone TEXT,
  avatar TEXT,
  role TEXT DEFAULT 'customer' CHECK (role IN ('customer', 'host', 'admin')),
  is_verified BOOLEAN DEFAULT false,
  is_active BOOLEAN DEFAULT true,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- إنشاء جدول الشقق
CREATE TABLE apartments (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  title TEXT NOT NULL,
  description TEXT,
  short_description TEXT,
  location JSONB NOT NULL,
  price_per_night INTEGER NOT NULL,
  original_price INTEGER,
  discount INTEGER,
  images TEXT[],
  amenities TEXT[],
  features TEXT[],
  rules TEXT[],
  capacity JSONB NOT NULL,
  size INTEGER,
  floor INTEGER,
  building_type TEXT DEFAULT 'apartment',
  category TEXT DEFAULT 'standard',
  status TEXT DEFAULT 'available',
  rating DECIMAL(3,2) DEFAULT 0,
  review_count INTEGER DEFAULT 0,
  host_id UUID REFERENCES users(id),
  is_verified BOOLEAN DEFAULT false,
  is_featured BOOLEAN DEFAULT false,
  is_instant_book BOOLEAN DEFAULT false,
  check_in_time TEXT DEFAULT '15:00',
  check_out_time TEXT DEFAULT '11:00',
  cancellation_policy TEXT DEFAULT 'flexible',
  minimum_stay INTEGER DEFAULT 1,
  maximum_stay INTEGER,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- إنشاء جدول الحجوزات
CREATE TABLE bookings (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  apartment_id UUID REFERENCES apartments(id),
  customer_id UUID REFERENCES users(id),
  host_id UUID REFERENCES users(id),
  check_in DATE NOT NULL,
  check_out DATE NOT NULL,
  guests INTEGER NOT NULL,
  rooms INTEGER NOT NULL,
  total_nights INTEGER NOT NULL,
  price_per_night INTEGER NOT NULL,
  total_price INTEGER NOT NULL,
  discount INTEGER,
  final_price INTEGER NOT NULL,
  status TEXT DEFAULT 'pending',
  payment_status TEXT DEFAULT 'pending',
  payment_method TEXT,
  payment_id TEXT,
  special_requests TEXT,
  cancellation_reason TEXT,
  cancelled_at TIMESTAMP WITH TIME ZONE,
  refund_amount INTEGER,
  refunded_at TIMESTAMP WITH TIME ZONE,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- إدراج بيانات تجريبية
INSERT INTO users (name, email, role, is_verified) VALUES
('أحمد المضيف', 'ahmed@example.com', 'host', true),
('فاطمة العميلة', 'fatima@example.com', 'customer', true),
('محمد المدير', 'mohamed@example.com', 'admin', true);

INSERT INTO apartments (title, description, location, price_per_night, amenities, capacity, host_id, is_verified) VALUES
('شقة فاخرة - الرياض', 'شقة فندقية فاخرة في قلب الرياض', '{"address": "حي النخيل، الرياض", "city": "الرياض", "coordinates": {"lat": 24.7136, "lng": 46.6753}}', 450, '["واي فاي", "تكييف", "مطبخ", "غسالة"]', '{"guests": 4, "bedrooms": 2, "bathrooms": 2, "beds": 2}', (SELECT id FROM users WHERE email = 'ahmed@example.com'), true),
('إطلالة بحرية - جدة', 'شقة مع إطلالة بحرية خلابة', '{"address": "الكورنيش، جدة", "city": "جدة", "coordinates": {"lat": 21.4858, "lng": 39.1925}}', 680, '["واي فاي", "تكييف", "مطبخ", "غسالة", "مسبح"]', '{"guests": 6, "bedrooms": 3, "bathrooms": 3, "beds": 3}', (SELECT id FROM users WHERE email = 'ahmed@example.com'), true);
```

## الخطوة 2: نشر المشروع على Vercel

### 2.1 إنشاء حساب Vercel
1. اذهب إلى: https://vercel.com
2. اضغط "Sign Up"
3. سجل حساب جديد أو سجل الدخول بـ GitHub
4. اضغط "New Project"

### 2.2 رفع المشروع
1. ارفع مجلد المشروع إلى GitHub:
   - اذهب إلى GitHub.com
   - اضغط "New repository"
   - اسم المستودع: `luxury-apartment-platform`
   - ارفع جميع الملفات

2. في Vercel:
   - اضغط "Import Project"
   - اختر المستودع من GitHub
   - اضغط "Deploy"

### 2.3 إعداد متغيرات البيئة
في Vercel Dashboard:
1. اذهب إلى **Settings > Environment Variables**
2. أضف المتغيرات التالية:

```
NEXT_PUBLIC_SUPABASE_URL = your-supabase-project-url
NEXT_PUBLIC_SUPABASE_ANON_KEY = your-supabase-anon-key
NEXTAUTH_URL = https://your-app.vercel.app
NEXTAUTH_SECRET = your-random-secret-key
NEXT_PUBLIC_GOOGLE_MAPS_API_KEY = your-google-maps-key
NEXT_PUBLIC_STRIPE_PUBLISHABLE_KEY = your-stripe-publishable-key
STRIPE_SECRET_KEY = your-stripe-secret-key
```

### 2.4 إعادة النشر
1. اذهب إلى **Deployments**
2. اضغط "Redeploy" على آخر deployment
3. انتظر حتى يكتمل النشر

## الخطوة 3: اختبار المشروع

بعد النشر، ستحصل على رابط مثل:
`https://luxury-apartment-platform-xxx.vercel.app`

### الصفحات المتاحة:
- **الصفحة الرئيسية:** `/`
- **عرض الشقق:** `/apartments`
- **تسجيل الدخول:** `/auth/login`
- **إنشاء حساب:** `/auth/register`
- **لوحة التحكم:** `/dashboard`
- **لوحة الإدارة:** `/admin`
- **التقارير:** `/reports`

## الخطوة 4: إعداد Google Maps (اختياري)

1. اذهب إلى: https://console.cloud.google.com
2. أنشئ مشروع جديد
3. فعّل Google Maps JavaScript API
4. أنشئ API Key
5. أضف API Key في متغيرات البيئة في Vercel

## الخطوة 5: إعداد Stripe (اختياري)

1. اذهب إلى: https://stripe.com
2. أنشئ حساب جديد
3. احصل على API Keys من Dashboard
4. أضف Keys في متغيرات البيئة في Vercel

## 🎉 تم النشر!

بعد اكتمال جميع الخطوات، ستحصل على رابط مباشر للمشروع يعمل مع قاعدة بيانات حقيقية!

### المميزات المتاحة:
- ✅ قاعدة بيانات حقيقية (Supabase)
- ✅ نشر سحابي (Vercel)
- ✅ جميع الصفحات تعمل
- ✅ نظام تسجيل الدخول
- ✅ عرض الشقق
- ✅ نظام الحجوزات
- ✅ لوحة الإدارة

**الرابط سيكون:** `https://your-app-name.vercel.app`

