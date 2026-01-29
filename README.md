# Fashion Hub - E-Commerce Application

A modern fashion e-commerce web application built with Laravel 10.

![Laravel](https://img.shields.io/badge/Laravel-10.x-red)
![PHP](https://img.shields.io/badge/PHP-8.1+-blue)
![MySQL](https://img.shields.io/badge/MySQL-8.0+-orange)

## 🚀 Quick Start Guide

### Prerequisites
- **PHP 8.1+** with the following extensions enabled:
  - `pdo_mysql`
  - `mbstring`
  - `openssl`
  - `tokenizer`
  - `xml`
- **MySQL 5.7+** or **MariaDB 10.3+**
- **Composer** (PHP package manager)
- **Node.js & npm** (optional, for frontend assets)

---

## 📦 Installation Steps

### Step 1: Extract the Project
Unzip the project folder to your web server directory:
- **Laragon**: `C:\laragon\www\fashion-hub`
- **XAMPP**: `C:\xampp\htdocs\fashion-hub`
- **WAMP**: `C:\wamp64\www\fashion-hub`
- **Linux/Mac**: `/var/www/html/fashion-hub`

### Step 2: Install Dependencies
Open terminal/command prompt in the project folder:
```bash
cd fashion-hub
composer install
```

### Step 3: Configure Environment
Copy the example environment file:
```bash
cp .env.example .env
```

Edit `.env` file and update database settings:
```env
DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=fashion_hub_db
DB_USERNAME=root
DB_PASSWORD=
```

### Step 4: Generate Application Key
```bash
php artisan key:generate
```

### Step 5: Create Database
Create a MySQL database named `fashion_hub_db`:

**Option A - Using MySQL CLI:**
```bash
mysql -u root -p
CREATE DATABASE fashion_hub_db;
EXIT;
```

**Option B - Using phpMyAdmin:**
1. Open phpMyAdmin (usually http://localhost/phpmyadmin)
2. Click "New" and create database: `fashion_hub_db`

### Step 6: Run Migrations & Seed Data
```bash
php artisan migrate
php artisan db:seed --class=ProductSeeder
```

### Step 7: Start the Server
```bash
php artisan serve
```

Visit: **http://127.0.0.1:8000**

---

## 🎯 Features

| Feature | Description |
|---------|-------------|
| 🔐 **User Authentication** | Register, Login, Logout |
| 🛍️ **Product Catalog** | 16 sample products with images |
| 📂 **Categories** | Men, Women, Kids, Accessories |
| 🔍 **Search** | Search products by name/description |
| 🛒 **Shopping Cart** | Add, update, remove items |
| 👨‍💼 **Admin Dashboard** | Full product management (CRUD) |

---

## 📱 Application URLs

| Page | URL |
|------|-----|
| Home | http://127.0.0.1:8000 |
| All Products | http://127.0.0.1:8000/products |
| Men | http://127.0.0.1:8000/category/Men |
| Women | http://127.0.0.1:8000/category/Women |
| Kids | http://127.0.0.1:8000/category/Kids |
| Accessories | http://127.0.0.1:8000/category/Accessories |
| Cart | http://127.0.0.1:8000/cart |
| Login | http://127.0.0.1:8000/login |
| Register | http://127.0.0.1:8000/register |
| Admin Dashboard | http://127.0.0.1:8000/admin/products |

> **Note:** Admin dashboard requires login. Register a new account first.

---

## 🔧 Troubleshooting

### "Could not find driver" Error
Enable `pdo_mysql` in your `php.ini`:
```ini
extension=pdo_mysql
```
Then restart your web server.

### "No connection could be made" Error
Make sure MySQL is running:
- **Laragon**: Click "Start All"
- **XAMPP**: Start Apache and MySQL from control panel
- **Command line**: `mysql.server start` (Mac/Linux)

### Images Not Loading
Product images use placeholder URLs from placehold.co. Make sure you have internet connection, or upload real images to `public/images/products/`.

### Permission Errors (Linux/Mac)
```bash
chmod -R 775 storage bootstrap/cache
```

---

## 📂 Project Structure

```
fashion-hub/
├── app/
│   ├── Http/Controllers/
│   │   ├── AuthController.php      # Login/Register
│   │   ├── CartController.php      # Shopping cart
│   │   └── ProductController.php   # Products & Admin
│   └── Models/
│       ├── Product.php
│       └── User.php
├── database/
│   ├── migrations/                 # Database tables
│   └── seeders/
│       └── ProductSeeder.php       # Sample products
├── resources/views/
│   ├── admin/                      # Admin pages
│   ├── auth/                       # Login/Register
│   ├── cart/                       # Cart page
│   └── products/                   # Product pages
├── routes/
│   └── web.php                     # All routes
└── public/
    └── images/                     # Product images
```

---

## 👤 Test Credentials

After seeding, you can register a new account or use:
- **Email**: test@example.com
- **Password**: password123

*(Only works if you've registered this account)*

---

## 📝 License

This project is open-sourced software licensed under the [MIT license](https://opensource.org/licenses/MIT).
