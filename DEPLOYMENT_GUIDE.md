# 🚀 دليل النشر والإنتاج

## نظرة عامة على المشروع

تم إنشاء منصة ويب احترافية لتأجير الشقق الفندقية باللغة العربية مع جميع المميزات المطلوبة:

### ✅ المميزات المكتملة

#### واجهة المستخدم (UI/UX)
- ✅ تصميم عصري متجاوب (Responsive) يعمل على الجوال والكمبيوتر
- ✅ ألوان فاخرة تعكس الطابع الفندقي (ذهبي وأسود وأزرق وأبيض)
- ✅ صفحة رئيسية مع محرك بحث متقدم للشقق
- ✅ عرض الشقق بصور احترافية مع الأسعار والتفاصيل
- ✅ تصميم RTL كامل للغة العربية

#### خصائص المنصة
- ✅ تسجيل مستخدمين (عملاء + أصحاب الشقق)
- ✅ لوحة تحكم لكل مستخدم
- ✅ نظام حجوزات مباشر مع تقويم التوافر
- ✅ إدارة العقود الإلكترونية والفواتير
- ✅ إرسال إشعارات عبر البريد الإلكتروني
- ✅ تصنيف الشقق (متاحة – محجوزة – منتهية)
- ✅ دعم طرق الدفع المتعددة

#### لوحة الإدارة (Admin Panel)
- ✅ إدارة جميع الشقق والحجوزات
- ✅ إضافة عروض وخصومات
- ✅ تقارير مالية يومية/شهرية
- ✅ متابعة تقييمات العملاء

#### مميزات إضافية
- ✅ دعم اللغتين العربية والإنجليزية
- ✅ خريطة تفاعلية (Google Maps API)
- ✅ تصدير تقارير إلى PDF و Excel
- ✅ نظام أمان وحماية للبيانات

## 🛠️ التقنيات المستخدمة

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

## 📦 التثبيت والتشغيل

### المتطلبات
- Node.js 18+
- npm أو yarn
- PostgreSQL 13+
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
```

افتح [http://localhost:3000](http://localhost:3000) في المتصفح.

## 🌐 النشر للإنتاج

### 1. إعداد الخادم

#### متطلبات الخادم
- Ubuntu 20.04+ أو CentOS 8+
- Node.js 18+
- PostgreSQL 13+
- Nginx (اختياري)
- PM2 (لإدارة العمليات)

#### تثبيت Node.js
```bash
# Ubuntu/Debian
curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
sudo apt-get install -y nodejs

# CentOS/RHEL
curl -fsSL https://rpm.nodesource.com/setup_18.x | sudo bash -
sudo yum install -y nodejs
```

#### تثبيت PostgreSQL
```bash
# Ubuntu/Debian
sudo apt update
sudo apt install postgresql postgresql-contrib

# CentOS/RHEL
sudo yum install postgresql-server postgresql-contrib
sudo postgresql-setup initdb
sudo systemctl enable postgresql
sudo systemctl start postgresql
```

### 2. إعداد قاعدة البيانات

```bash
# إنشاء قاعدة البيانات
sudo -u postgres psql
CREATE DATABASE luxury_apartments;
CREATE USER app_user WITH PASSWORD 'your_password';
GRANT ALL PRIVILEGES ON DATABASE luxury_apartments TO app_user;
\q
```

### 3. نشر التطبيق

#### باستخدام PM2
```bash
# تثبيت PM2
npm install -g pm2

# بناء التطبيق
npm run build

# تشغيل التطبيق
pm2 start npm --name "luxury-apartments" -- start

# حفظ إعدادات PM2
pm2 save
pm2 startup
```

#### باستخدام Docker
```dockerfile
# Dockerfile
FROM node:18-alpine

WORKDIR /app

COPY package*.json ./
RUN npm ci --only=production

COPY . .
RUN npm run build

EXPOSE 3000

CMD ["npm", "start"]
```

```bash
# بناء وتشغيل Docker
docker build -t luxury-apartments .
docker run -p 3000:3000 luxury-apartments
```

### 4. إعداد Nginx (اختياري)

```nginx
# /etc/nginx/sites-available/luxury-apartments
server {
    listen 80;
    server_name your-domain.com;

    location / {
        proxy_pass http://localhost:3000;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection 'upgrade';
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
        proxy_cache_bypass $http_upgrade;
    }
}
```

```bash
# تفعيل الموقع
sudo ln -s /etc/nginx/sites-available/luxury-apartments /etc/nginx/sites-enabled/
sudo nginx -t
sudo systemctl reload nginx
```

### 5. إعداد SSL (HTTPS)

```bash
# تثبيت Certbot
sudo apt install certbot python3-certbot-nginx

# الحصول على شهادة SSL
sudo certbot --nginx -d your-domain.com

# تجديد تلقائي
sudo crontab -e
# أضف: 0 12 * * * /usr/bin/certbot renew --quiet
```

## 🔧 إعدادات الإنتاج

### متغيرات البيئة للإنتاج
```env
NODE_ENV=production
DATABASE_URL=postgresql://app_user:password@localhost:5432/luxury_apartments
NEXTAUTH_URL=https://your-domain.com
NEXTAUTH_SECRET=your-production-secret-key
GOOGLE_MAPS_API_KEY=your-production-google-maps-key
STRIPE_PUBLISHABLE_KEY=pk_live_your_stripe_publishable_key
STRIPE_SECRET_KEY=sk_live_your_stripe_secret_key
SMTP_HOST=smtp.your-domain.com
SMTP_PORT=587
SMTP_USER=noreply@your-domain.com
SMTP_PASS=your-smtp-password
```

### تحسين الأداء
```bash
# تحسين قاعدة البيانات
sudo -u postgres psql luxury_apartments
CREATE INDEX idx_apartments_status ON apartments(status);
CREATE INDEX idx_bookings_date ON bookings(check_in, check_out);
CREATE INDEX idx_users_email ON users(email);
```

### مراقبة الأداء
```bash
# تثبيت أدوات المراقبة
npm install -g pm2-logrotate

# مراقبة الأداء
pm2 monit
pm2 logs luxury-apartments
```

## 🔒 الأمان

### 1. حماية قاعدة البيانات
```bash
# تحديث كلمة مرور PostgreSQL
sudo -u postgres psql
ALTER USER app_user PASSWORD 'new_strong_password';
```

### 2. حماية الخادم
```bash
# تحديث النظام
sudo apt update && sudo apt upgrade -y

# إعداد جدار الحماية
sudo ufw enable
sudo ufw allow ssh
sudo ufw allow 80
sudo ufw allow 443
```

### 3. نسخ احتياطية
```bash
# نسخ احتياطي لقاعدة البيانات
pg_dump luxury_apartments > backup_$(date +%Y%m%d).sql

# نسخ احتياطي للتطبيق
tar -czf app_backup_$(date +%Y%m%d).tar.gz /path/to/app
```

## 📊 المراقبة والصيانة

### 1. مراقبة الأداء
- استخدم PM2 لمراقبة العمليات
- راقب استخدام الذاكرة والمعالج
- تتبع أخطاء التطبيق

### 2. الصيانة الدورية
- تحديث التبعيات شهرياً
- تنظيف ملفات السجلات
- مراجعة أمان النظام

### 3. النسخ الاحتياطية
- نسخ احتياطي يومي لقاعدة البيانات
- نسخ احتياطي أسبوعي للتطبيق
- اختبار استعادة النسخ الاحتياطية

## 🚀 النشر على منصات السحابة

### Vercel (موصى به)
```bash
# تثبيت Vercel CLI
npm i -g vercel

# نشر المشروع
vercel

# ربط بمستودع Git
vercel --prod
```

### Netlify
```bash
# تثبيت Netlify CLI
npm i -g netlify-cli

# نشر المشروع
netlify deploy --prod --dir=out
```

### AWS
```bash
# تثبيت AWS CLI
pip install awscli

# نشر على Elastic Beanstalk
eb init
eb create production
eb deploy
```

## 📞 الدعم والمساعدة

### الموارد المفيدة
- [Next.js Documentation](https://nextjs.org/docs)
- [Tailwind CSS Documentation](https://tailwindcss.com/docs)
- [Prisma Documentation](https://www.prisma.io/docs)
- [Stripe Documentation](https://stripe.com/docs)

### الحصول على المساعدة
- **البريد الإلكتروني:** support@luxuryapartments.com
- **الهاتف:** +966 50 123 4567
- **الموقع:** [luxuryapartments.com](https://luxuryapartments.com)

## 🎉 تهانينا!

لقد تم إنشاء منصة احترافية لتأجير الشقق الفندقية بنجاح! 

هذه المنصة جاهزة للنشر والتشغيل، وتحتوي على جميع المميزات المطلوبة لتوفير تجربة مستخدم متميزة.

**استمتع بتشغيل منصتك الجديدة! 🚀**

