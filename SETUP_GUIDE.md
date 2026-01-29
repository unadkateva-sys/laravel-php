# Fashion Hub - Complete Setup Instructions

## 🚀 Quick Automated Setup (Windows)

### Option 1: Use the Automated Script (Easiest!)

1. **Start MySQL in Laragon:**
   - Open Laragon
   - Click **"Start All"** button
   - Wait until MySQL shows as "Running" (green indicator)

2. **Run the setup script:**
   - Go to `C:\laragon\www\fashion-hub`
   - Double-click **`setup-database.bat`**
   - Follow the prompts

That's it! The script will:
- ✅ Create the database
- ✅ Run migrations
- ✅ Add 16 sample products
- ✅ Clear caches

---

## 🔧 Manual Setup (If Script Doesn't Work)

### Step 1: Start MySQL

1. Open **Laragon**
2. Click **"Start All"** button
3. Verify MySQL is running (green light)

### Step 2: Create Database

**Option A - Using Laragon's Database Tool:**
1. In Laragon, click **"Database"** button
2. This opens HeidiSQL or phpMyAdmin
3. Create new database: `fashion_hub`

**Option B - Using Laragon Terminal:**
```bash
# Open Laragon Terminal (click Terminal button in Laragon)
mysql -u root
```
Then type:
```sql
CREATE DATABASE fashion_hub;
EXIT;
```

### Step 3: Update .env File

Open `C:\laragon\www\fashion-hub\.env` and ensure these lines are correct:

```env
DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=fashion_hub
DB_USERNAME=root
DB_PASSWORD=
```

Save the file.

### Step 4: Run Migrations

Open **Laragon Terminal** and run:

```bash
cd C:\laragon\www\fashion-hub

# Run migrations (creates tables)
php artisan migrate

# Seed sample products
php artisan db:seed --class=ProductSeeder

# Clear caches
php artisan config:clear
php artisan cache:clear
```

### Step 5: Start Server

```bash
php artisan serve
```

### Step 6: Test the Application

Visit these URLs:
- **Home:** http://127.0.0.1:8000
- **All Products:** http://127.0.0.1:8000/products
- **Men Category:** http://127.0.0.1:8000/category/Men
- **Women Category:** http://127.0.0.1:8000/category/Women
- **Admin Dashboard:** http://127.0.0.1:8000/admin/products (requires login)

---

## 📦 What Gets Created

### Database Tables
- `users` - User accounts
- `products` - Product catalog
- `password_reset_tokens` - Password recovery
- `personal_access_tokens` - API authentication
- `failed_jobs` - Queue management

### Sample Products (16 total)

**Men's Products (4):**
- Classic Cotton T-Shirt - ₹599
- Denim Jeans - ₹1,299
- Formal Shirt - ₹899
- Sports Jacket - ₹2,499

**Women's Products (4):**
- Floral Summer Dress - ₹1,599
- Skinny Fit Jeans - ₹1,199
- Elegant Blouse - ₹799
- Winter Coat - ₹3,499

**Kids Products (4):**
- Kids Graphic T-Shirt - ₹399
- Kids Denim Shorts - ₹499
- Kids Hoodie - ₹699
- Kids Sneakers - ₹899

**Accessories (4):**
- Leather Wallet - ₹599
- Sunglasses - ₹799
- Designer Handbag - ₹2,999
- Leather Belt - ₹499

---

## 🐛 Troubleshooting

### Error: "No connection could be made"
**Solution:** MySQL is not running
- Open Laragon and click "Start All"
- Make sure you see MySQL status as "Running"

### Error: "Access denied for user"
**Solution:** Wrong database credentials
- Check `.env` file
- Default Laragon credentials:
  - Username: `root`
  - Password: (empty)

### Error: "Database 'fashion_hub' doesn't exist"
**Solution:** Database not created
- Run the script again, OR
- Create database manually using HeidiSQL/phpMyAdmin

### Products show but images are broken
**Solution:** Placeholder images being used
- Upload real products through admin panel: http://127.0.0.1:8000/admin/add-product
- Or add actual images to `public/images/products/` folder

### Can't access admin pages
**Solution:** Need to register an account first
1. Register: http://127.0.0.1:8000/register
2. Login: http://127.0.0.1:8000/login
3. Then access admin: http://127.0.0.1:8000/admin/products

---

## 🔄 Reset Everything

If something goes wrong and you want to start fresh:

```bash
# Open Laragon Terminal
cd C:\laragon\www\fashion-hub

# Drop all tables and recreate
php artisan migrate:fresh

# Seed products again
php artisan db:seed --class=ProductSeeder
```

**WARNING:** This deletes ALL data in the database!

---

## ✅ Verification Checklist

After setup, verify these work:

- [ ] MySQL is running in Laragon (green status)
- [ ] Database `fashion_hub` exists
- [ ] Can visit http://127.0.0.1:8000 (home page)
- [ ] Products page shows 16 items: http://127.0.0.1:8000/products
- [ ] Category filters work (Men, Women, Kids, Accessories)
- [ ] Search bar finds products
- [ ] Can register new user
- [ ] Can login
- [ ] Can access admin dashboard
- [ ] Can add new products with images
- [ ] Cart functionality works

---

## 📞 Need Help?

If you're still having issues:
1. Check that Laragon shows MySQL as "Running"
2. Verify `.env` database settings
3. Try running the automated script again
4. Check Laragon logs for errors
