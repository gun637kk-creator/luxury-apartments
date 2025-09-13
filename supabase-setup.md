# إعداد قاعدة البيانات - Supabase

## 1. إنشاء حساب Supabase
1. اذهب إلى: https://supabase.com
2. اضغط "Start your project"
3. سجل حساب جديد أو سجل الدخول
4. اضغط "New Project"
5. اختر "Organization" أو أنشئ واحدة جديدة
6. املأ البيانات:
   - Project name: luxury-apartments
   - Database password: اختر كلمة مرور قوية
   - Region: اختر أقرب منطقة لك
7. اضغط "Create new project"

## 2. الحصول على معلومات الاتصال
بعد إنشاء المشروع:
1. اذهب إلى Settings > Database
2. انسخ "Connection string" (URI)
3. اذهب إلى Settings > API
4. انسخ "Project URL" و "anon public key"

## 3. إعداد الجداول
اذهب إلى SQL Editor وأضف هذا الكود:

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

-- إنشاء جدول التقييمات
CREATE TABLE reviews (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  apartment_id UUID REFERENCES apartments(id),
  customer_id UUID REFERENCES users(id),
  booking_id UUID REFERENCES bookings(id),
  rating INTEGER NOT NULL CHECK (rating >= 1 AND rating <= 5),
  title TEXT,
  comment TEXT,
  images TEXT[],
  is_verified BOOLEAN DEFAULT false,
  helpful INTEGER DEFAULT 0,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- إنشاء جدول المفضلة
CREATE TABLE favorites (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  customer_id UUID REFERENCES users(id),
  apartment_id UUID REFERENCES apartments(id),
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  UNIQUE(customer_id, apartment_id)
);

-- إنشاء جدول الإشعارات
CREATE TABLE notifications (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  user_id UUID REFERENCES users(id),
  type TEXT NOT NULL,
  title TEXT NOT NULL,
  message TEXT NOT NULL,
  is_read BOOLEAN DEFAULT false,
  data JSONB,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
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

## 4. تفعيل Row Level Security (RLS)
```sql
-- تفعيل RLS
ALTER TABLE users ENABLE ROW LEVEL SECURITY;
ALTER TABLE apartments ENABLE ROW LEVEL SECURITY;
ALTER TABLE bookings ENABLE ROW LEVEL SECURITY;
ALTER TABLE reviews ENABLE ROW LEVEL SECURITY;
ALTER TABLE favorites ENABLE ROW LEVEL SECURITY;
ALTER TABLE notifications ENABLE ROW LEVEL SECURITY;

-- سياسات الأمان
CREATE POLICY "Users can view their own data" ON users FOR SELECT USING (auth.uid() = id);
CREATE POLICY "Users can update their own data" ON users FOR UPDATE USING (auth.uid() = id);

CREATE POLICY "Anyone can view apartments" ON apartments FOR SELECT USING (true);
CREATE POLICY "Hosts can manage their apartments" ON apartments FOR ALL USING (auth.uid() = host_id);

CREATE POLICY "Users can view their own bookings" ON bookings FOR SELECT USING (auth.uid() = customer_id OR auth.uid() = host_id);
CREATE POLICY "Users can create bookings" ON bookings FOR INSERT WITH CHECK (auth.uid() = customer_id);
```

## 5. إعداد المصادقة
1. اذهب إلى Authentication > Settings
2. فعّل "Enable email confirmations"
3. اذهب إلى Authentication > Providers
4. فعّل "Email" provider
5. أضف Google provider (اختياري):
   - احصل على Google OAuth credentials
   - أضف Client ID و Client Secret

