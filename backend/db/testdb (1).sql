-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 30, 2025 at 08:01 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `testdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `addresses`
--

CREATE TABLE `addresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `province` varchar(255) NOT NULL,
  `district` varchar(255) NOT NULL,
  `ward` varchar(255) NOT NULL,
  `street` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `addresses`
--

INSERT INTO `addresses` (`id`, `full_name`, `phone`, `province`, `district`, `ward`, `street`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'Nguyễn Phúc Trường', '0354422737', 'Đà Nẵng', 'Quận Ngũ Hành Sơn', 'Phường Hoà Quý', '428 trần đại nghĩa', 14, '2025-11-27 12:43:21', '2025-11-27 12:43:21'),
(2, 'Nguyễn Phúc Trường', '0354422737', 'Quảng Trị', 'Thị xã Quảng Trị', 'Xã Hải Lệ', 'đội 1 thôn tích tường, xã hải lệ, thị xã quản trị tỉnh quảng trị', 13, '2025-12-28 17:55:18', '2025-12-28 17:55:18');

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

CREATE TABLE `blogs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` longtext DEFAULT NULL,
  `content` longtext NOT NULL,
  `slug` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `status` enum('draft','published') NOT NULL DEFAULT 'published',
  `published_at` timestamp NULL DEFAULT NULL,
  `author_id` bigint(20) UNSIGNED NOT NULL,
  `blog_category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blog_categories`
--

CREATE TABLE `blog_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `slug` varchar(255) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `name`, `description`, `image`, `slug`, `is_active`, `parent_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Uniqlo', 'Thương hiệu thời trang Nhật Bản nổi tiếng', 'brands/zUuqCnNkqKGKXwiJQWg0hfESDq9Q4vaedB9WXf6n.png', 'uniqlo', 1, NULL, '2025-10-05 15:55:09', '2025-10-19 13:15:53', NULL),
(2, 'Zara', 'Thương hiệu thời trang nhanh từ Tây Ban Nha', 'brands/CaVpbz777G6nJ5JGtSO0Gyzo7buXczfrbSM9jTPN.png', 'zara', 1, NULL, '2025-10-05 15:55:09', '2025-10-19 13:16:11', NULL),
(3, 'H&M', 'Thương hiệu thời trang giá rẻ từ Thụy Điển', 'brands/U2Ohv9d8qdIvUzPXYbkj7Y5GNpUf5yP3ZLOQVNbX.png', 'hm', 1, NULL, '2025-10-05 15:55:09', '2025-10-19 13:17:28', NULL),
(4, 'Nike', 'Thương hiệu thể thao hàng đầu thế giới', 'brands/6KL60Qw8nHMmFD4GEWxccv5q4hhfjUSHmnmnR96E.png', 'nike', 1, NULL, '2025-10-05 15:55:09', '2025-10-19 13:18:51', NULL),
(5, 'Adidas', 'Thương hiệu thể thao nổi tiếng', 'brands/v6oaomZ8PN1h9uRqJDWdqTXuZi6rWvLMpAtXxd22.png', 'adidas', 1, NULL, '2025-10-05 15:55:09', '2025-10-19 13:20:09', NULL),
(6, 'Gucci', 'Thương hiệu thời trang cao cấp', 'brands/47TZE6oULXhhgl3Iuop8Bqs9PKBx7z4hLx6EBA2O.jpg', 'gucci', 1, NULL, '2025-10-05 15:55:09', '2025-10-19 13:20:36', NULL),
(7, 'Chanel', 'Thương hiệu thời trang cao cấp', 'brands/UOEMu1BbTRc8OuQreAaB6QZRUNw8PugoZljmcCS2.png', 'chanel', 1, NULL, '2025-10-05 15:55:09', '2025-10-19 13:25:59', NULL),
(8, 'Louis Vuitton', 'Thương hiệu thời trang cao cấp', 'brands/iKMwN8L0O7UhCSfPdUhKM5ferf8ZD4ZaUuyIC20Y.png', 'louis-vuitton', 1, NULL, '2025-10-05 15:55:09', '2025-10-19 13:26:34', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `session_id` varchar(255) DEFAULT NULL,
  `variant_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1,
  `price` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`id`, `user_id`, `session_id`, `variant_id`, `quantity`, `price`, `created_at`, `updated_at`) VALUES
(6, 23, NULL, 54, 2, 499000, '2025-12-29 14:34:33', '2025-12-29 14:34:33');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `slug` varchar(255) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `description`, `image`, `slug`, `is_active`, `parent_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Áo nam', 'Các loại áo dành cho nam giới', 'categories/JgM3yjGcGzmyKOrp52cWmckrnlZdoXDA9lLuOvlr.jpg', 'ao-nam', 1, NULL, '2025-10-05 15:55:09', '2025-10-19 13:09:37', NULL),
(2, 'Quần nam', 'Các loại quần dành cho nam giới', 'categories/y7qXSO3fazfkg93vO6JsOfYZ1g5Ti5xuIozQIsl5.jpg', 'quan-nam', 1, NULL, '2025-10-05 15:55:09', '2025-10-19 13:10:07', NULL),
(3, 'Áo nữ', 'Các loại áo dành cho nữ giới', 'categories/BiSvC2UdLWVha3mwCLSJJSWyFHb6WWn25ZhUYerD.jpg', 'ao-nu', 1, NULL, '2025-10-05 15:55:09', '2025-10-19 13:10:58', NULL),
(4, 'Quần nữ', 'Các loại quần dành cho nữ giới', 'categories/pE1kanwDv2D2ZwHlfkEk6sQtUYggL3f1GCaKaO3P.jpg', 'quan-nu', 1, NULL, '2025-10-05 15:55:09', '2025-10-19 13:11:29', NULL),
(5, 'Váy nữ', 'Các loại váy dành cho nữ giới', 'categories/1daDVhiKbgV5YL49zeRu8XB7XeBb4NyTXyMmsmA9.jpg', 'vay-nu', 1, NULL, '2025-10-05 15:55:09', '2025-10-19 13:12:16', NULL),
(6, 'Áo sơ mi nam', 'Áo sơ mi dành cho nam giới', 'categories/w7r0XCSL6zV5DTNe0wJhwhPOt83SbNt08wekkW7u.jpg', 'ao-so-mi-nam', 1, 1, '2025-10-05 15:55:09', '2025-10-19 13:12:47', NULL),
(7, 'Áo thun nam', 'Áo thun dành cho nam giới', 'categories/rfnaFTRrlgj7w0hYYbqHoyAARD5txdCicsSBXJNB.jpg', 'ao-thun-nam', 1, 1, '2025-10-05 15:55:09', '2025-10-19 13:13:13', NULL),
(8, 'Quần jean nam', 'Quần jean dành cho nam giới', 'categories/15I8Ne8KQgQbaG45Xk695ep8AJAoUDMkG51jIBXf.jpg', 'quan-jean-nam', 1, 2, '2025-10-05 15:55:09', '2025-10-19 13:13:37', NULL),
(9, 'Áo thun nữ', 'Áo thun dành cho nữ giới', 'categories/xdlnFqPP5UuoBbEScciUolV2zM29cK5HxK42Eh3l.jpg', 'ao-thun-nu', 1, 3, '2025-10-05 15:55:09', '2025-10-19 13:14:03', NULL),
(10, 'Váy liền nữ', 'Váy liền dành cho nữ giới', 'categories/B90HsCcARdRjd9wfRlxqBwZLl2gLrDNrTKfkOE3M.jpg', 'vay-lien-nu', 1, 5, '2025-10-05 15:55:09', '2025-10-19 13:14:27', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `admin_reply` text DEFAULT NULL,
  `replied_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `type` enum('percent','fixed','shipping') NOT NULL,
  `description` text DEFAULT NULL,
  `value` int(11) NOT NULL,
  `min_order_value` int(11) NOT NULL DEFAULT 0,
  `max_discount_value` int(11) DEFAULT NULL,
  `usage_limit` int(11) DEFAULT NULL,
  `used_count` int(11) NOT NULL DEFAULT 0,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `coupon_user`
--

CREATE TABLE `coupon_user` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `coupon_id` bigint(20) UNSIGNED NOT NULL,
  `claimed_at` timestamp NULL DEFAULT NULL,
  `used_at` timestamp NULL DEFAULT NULL,
  `status` enum('claimed','used') NOT NULL DEFAULT 'claimed',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `favorite_products`
--

CREATE TABLE `favorite_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `product_slug` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `flash_sales`
--

CREATE TABLE `flash_sales` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `start_time` timestamp NULL DEFAULT NULL,
  `end_time` timestamp NULL DEFAULT NULL,
  `repeat` tinyint(1) NOT NULL DEFAULT 0,
  `repeat_minutes` int(11) DEFAULT NULL,
  `auto_increase` tinyint(1) NOT NULL DEFAULT 0,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `flash_sale_products`
--

CREATE TABLE `flash_sale_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `flash_sale_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `flash_price` decimal(15,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `sold` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

CREATE TABLE `images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `image_path` varchar(255) NOT NULL,
  `is_main` tinyint(1) NOT NULL DEFAULT 0,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `variant_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `images`
--

INSERT INTO `images` (`id`, `image_path`, `is_main`, `product_id`, `created_at`, `updated_at`, `variant_id`) VALUES
(3, 'products/FbVoXBqTPV4FgNJHqI8dK3LVW0qydTd5E8A58iTX.jpg', 1, 10, '2025-10-19 12:39:01', '2025-10-19 12:39:01', NULL),
(4, 'products/eU711W3JXvtKyB6QEYdAK64nQeaaoN3lKRrmw7Ed.jpg', 0, 10, '2025-10-19 12:39:01', '2025-10-19 12:39:01', NULL),
(5, 'products/CRqtIOFTL1nRMAg6EmzeToP261iVeJG9Zwi9mm8R.jpg', 0, 10, '2025-10-19 12:39:01', '2025-10-19 12:39:01', NULL),
(6, 'products/39I5UkDZnD0rNssLjPIHgd98wgbzjd9XhXKQyMiL.jpg', 0, 10, '2025-10-19 12:39:01', '2025-10-19 12:39:01', NULL),
(7, 'products/U6zqpsPhqu2sG2vdmxZ7TUsLdR8VO4qZFD1V0RF7.jpg', 1, 9, '2025-10-19 12:40:07', '2025-10-19 12:40:07', NULL),
(8, 'products/jzofC22GAZsf26gCllNOQnQEjfKb12FdIuuwSo1c.jpg', 0, 9, '2025-10-19 12:40:07', '2025-10-19 12:40:07', NULL),
(9, 'products/ZHUYtBQor7xOy3TdFyot2BpUWX5Kr70Lk9cYVo4Q.jpg', 0, 9, '2025-10-19 12:40:07', '2025-10-19 12:40:07', NULL),
(10, 'products/QpLk2ljBsx9snJNPEZkoYxC9ZohvkjdhWAFyEybW.jpg', 0, 9, '2025-10-19 12:40:07', '2025-10-19 12:40:07', NULL),
(11, 'products/VTWe3sPaVHhIBEqQbQF3lhmIdbJyhmObB6Beexfd.jpg', 1, 8, '2025-10-19 12:40:53', '2025-10-19 12:40:53', NULL),
(12, 'products/FrJeDyZiOGoGILBBM1dXEgZDs6ePfIHP6YMGvxMC.jpg', 0, 8, '2025-10-19 12:40:53', '2025-10-19 12:40:53', NULL),
(13, 'products/BeRq3VdFAYnxRdl9zVuAfGR7DSR9jMoR2nwat8yr.jpg', 0, 8, '2025-10-19 12:40:53', '2025-10-19 12:40:53', NULL),
(14, 'products/JguWLKbRDt9JHIEHmBQJdo4Q2GMmE0k5MZacYLQe.jpg', 0, 8, '2025-10-19 12:40:53', '2025-10-19 12:40:53', NULL),
(15, 'products/FkESXj3FCJKMh6g9o0M7ZlAZ0uUDJcD91ZyEGKNt.jpg', 1, 7, '2025-10-19 12:41:34', '2025-10-19 12:41:34', NULL),
(16, 'products/kVw9h3qVVu1oTSFPspjxt8DyiVRGH8EIVxxCPb10.jpg', 0, 7, '2025-10-19 12:41:34', '2025-10-19 12:41:34', NULL),
(17, 'products/6lDoGIIKRq9lwxnE2X0YczowoSSJGVtqHTcSVZQF.jpg', 0, 7, '2025-10-19 12:41:34', '2025-10-19 12:41:34', NULL),
(18, 'products/SjyMFS8XzwvIgnGxTrSGuV3x8QJAsVEtkveIpoyl.jpg', 0, 7, '2025-10-19 12:41:34', '2025-10-19 12:41:34', NULL),
(19, 'products/RfxfSbTjZq9MvfTuL1dNjhiFaxr5VGt7ADin77Cf.jpg', 1, 6, '2025-10-19 12:42:19', '2025-10-19 12:42:19', NULL),
(20, 'products/KZDyvbwdWff4dF7S9DZUgvFc3gjSAx0cqfpgEXaM.jpg', 0, 6, '2025-10-19 12:42:19', '2025-10-19 12:42:19', NULL),
(21, 'products/IHSr7vGwksDLqj2u7tX5JMJzimI6i2li1abMO3Xm.jpg', 0, 6, '2025-10-19 12:42:19', '2025-10-19 12:42:19', NULL),
(22, 'products/JGBSeqZaZlyafseFhzJZZtJZAg1hHfwRhrt4sUyP.jpg', 0, 6, '2025-10-19 12:42:19', '2025-10-19 12:42:19', NULL),
(23, 'products/KBwWUsz6umAUo8OxBOwRIhE8opBED8NgcwDhcHT3.jpg', 1, 5, '2025-10-19 12:43:11', '2025-10-19 12:43:11', NULL),
(24, 'products/PWhEwRvByGGMfz8HURC5iO5oVcfuV2PbRX55hw9x.jpg', 0, 5, '2025-10-19 12:43:11', '2025-10-19 12:43:11', NULL),
(25, 'products/xZAUJuzzRBOXjM3ItO4QWyNEuO7NmHjFV3Wlp9oC.jpg', 0, 5, '2025-10-19 12:43:11', '2025-10-19 12:43:11', NULL),
(26, 'products/Jd4DCBAmCPhvCzpFpM3k08qK2pgJ3uKhxGVAP4Cx.jpg', 1, 4, '2025-10-19 12:44:38', '2025-10-19 12:44:38', NULL),
(27, 'products/nTfXBkiibphvhBFsuHlEXtxYhw6JPccMJFlc51sM.jpg', 0, 4, '2025-10-19 12:44:38', '2025-10-19 12:44:38', NULL),
(28, 'products/xI8vU8YCkuQYm1QcvmFCe7Syu7l7v7HV2g9xrtak.jpg', 0, 4, '2025-10-19 12:44:38', '2025-10-19 12:44:38', NULL),
(29, 'products/8CkK5zY8HNVIKJP3fdTAK0sR5CEziKkDBmneykeR.jpg', 0, 4, '2025-10-19 12:44:38', '2025-10-19 12:44:38', NULL),
(30, 'products/xIYeINMKnOlA2FcnJiVKWQiI99PUbrFVPefPJw9j.jpg', 0, 4, '2025-10-19 12:44:38', '2025-10-19 12:44:38', NULL),
(31, 'products/etKiaJBvS7QJ72EhjOGYF6XBcEcACALqvp2yXfsU.jpg', 1, 3, '2025-10-19 13:02:49', '2025-10-19 13:02:49', NULL),
(32, 'products/YbtRTzuLqbQwp5bYcHp7hKxXHaaHHw1fYoVs0JS3.jpg', 0, 3, '2025-10-19 13:02:49', '2025-10-19 13:02:49', NULL),
(33, 'products/4XzGri1snp61sjuf86E2GXDiTm1QEHrFy6DP2lS7.jpg', 0, 3, '2025-10-19 13:02:49', '2025-10-19 13:02:49', NULL),
(34, 'products/L77fbjeg3ZIiZ6XwhgqyTQWocGAvncqKLAEP18yV.jpg', 0, 3, '2025-10-19 13:02:49', '2025-10-19 13:02:49', NULL),
(35, 'products/4X1yk4hzUiTi0lQm859WQFffjSxgTTINAsbVSwim.jpg', 0, 3, '2025-10-19 13:02:49', '2025-10-19 13:02:49', NULL),
(36, 'products/0s6qoYZWBQRazOb9S7RUZABdeBmZ1ZUBio8rORxH.jpg', 1, 2, '2025-12-28 16:02:29', '2025-12-28 16:02:29', NULL),
(37, 'products/uLIGSg5O7WrEIszqcBYr68nhmh2IV43SZpXm9yxA.jpg', 0, 2, '2025-12-28 16:02:29', '2025-12-28 16:02:29', NULL),
(38, 'products/s5UKg2H8hTskcUOF4HSTRfdyZnjaLgP9kxmlrfjM.jpg', 0, 2, '2025-12-28 16:02:29', '2025-12-28 16:02:29', NULL),
(39, 'products/9Aabz32a75GCGnzsG50T4AlXDgRnPIb8RakynGLb.jpg', 1, 1, '2025-12-28 16:07:59', '2025-12-28 16:07:59', NULL),
(40, 'products/9lifmAWs61zjeADR5N48DSsOuKejO1YN7gioucLH.jpg', 0, 1, '2025-12-28 16:07:59', '2025-12-28 16:07:59', NULL),
(41, 'products/bwnBaFgUc9A9CWfmeVY9piL05hXa13BZZKjqtHGp.jpg', 0, 1, '2025-12-28 16:07:59', '2025-12-28 16:07:59', NULL),
(42, 'products/RYJru28BJEmBKg4MlFnLUOotBayEkpPG54cC9Q57.jpg', 0, 1, '2025-12-28 16:07:59', '2025-12-28 16:07:59', NULL),
(43, 'products/dENx4EIawOzL6kJvwJtTf0ZIEWUnPyGtypnfkXyv.jpg', 0, 6, '2025-12-28 16:16:41', '2025-12-28 16:16:41', 51),
(44, 'products/5C8R7lYrJFWLVyPBIbXPI90PsxKiuwT4BiLHt4ij.jpg', 0, 6, '2025-12-28 16:16:41', '2025-12-28 16:16:41', 51),
(45, 'products/JSXXpYcpHiVzVMHwqvXYcJiOmIeyA34kqWX8Zn37.jpg', 0, 6, '2025-12-28 16:16:41', '2025-12-28 16:16:41', 52),
(46, 'products/F9MNE5GVXyFpkjHVAoRpsBl8CQ83Cn8Rq9kN2Uqm.jpg', 0, 6, '2025-12-28 16:16:41', '2025-12-28 16:16:41', 52),
(47, 'products/p81XgMMCHJ6IoKfqMlbIWDD2iy8v8eF1tebaAJGd.jpg', 0, 10, '2025-12-28 16:19:05', '2025-12-28 16:19:05', 53),
(48, 'products/SKiT1IOyWJjktAwlXsX5N8aK51CkMugWlrkyysLg.jpg', 0, 10, '2025-12-28 16:19:05', '2025-12-28 16:19:05', 54),
(49, 'products/otZWr9vgGQmhYjRxIuCdybbRlOV8vh09XbcSwawm.jpg', 0, 9, '2025-12-28 16:20:44', '2025-12-28 16:20:44', 55),
(50, 'products/UBT8XW1f5ztx83FTOIeX0VqWrBy5Ef26S469IqI2.jpg', 0, 9, '2025-12-28 16:20:44', '2025-12-28 16:20:44', 56),
(51, 'products/bzQvHEsblhtO77IRXr3g97m4MZcXYtwAjP8IJhBZ.jpg', 0, 8, '2025-12-28 16:21:49', '2025-12-28 16:21:49', 57),
(52, 'products/WOrz4NZcNWrxDhOvUQQlNeFb7LKADFbzIHS2CQKn.jpg', 0, 8, '2025-12-28 16:21:49', '2025-12-28 16:21:49', 58),
(53, 'products/KG6fycTnJgvkDirxtKi2kuAK7xwnNVVXOQITaJg1.jpg', 0, 7, '2025-12-28 16:23:18', '2025-12-28 16:23:18', 59),
(54, 'products/e0Ay74A97I47Ui7G09b0dktAYoOKQ3fiE6a9W2AM.jpg', 0, 7, '2025-12-28 16:23:18', '2025-12-28 16:23:18', 60);

-- --------------------------------------------------------

--
-- Table structure for table `inventories`
--

CREATE TABLE `inventories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `variant_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `inventories`
--

INSERT INTO `inventories` (`id`, `quantity`, `created_at`, `updated_at`, `variant_id`) VALUES
(3, 28, '2025-10-26 14:55:02', '2025-12-29 16:16:56', 36),
(4, 15, '2025-10-26 14:55:02', '2025-10-26 14:55:02', 37),
(5, 18, '2025-10-26 14:55:02', '2025-10-26 14:55:02', 40),
(6, 19, '2025-10-26 14:55:29', '2025-10-26 14:55:29', 39),
(7, 18, '2025-10-26 14:56:02', '2025-10-26 14:56:02', 38),
(8, 30, '2025-10-28 06:10:54', '2025-10-28 06:10:54', 31),
(9, 40, '2025-10-28 06:11:25', '2025-10-28 06:11:25', 35),
(10, 40, '2025-10-28 06:11:59', '2025-10-28 06:11:59', 32),
(11, 40, '2025-10-28 06:12:44', '2025-10-28 06:12:44', 34),
(12, 40, '2025-10-28 06:13:06', '2025-10-28 06:13:06', 33),
(13, 30, '2025-10-28 06:13:51', '2025-10-28 06:13:51', 30),
(14, 40, '2025-10-28 06:14:19', '2025-10-28 06:14:19', 27),
(15, 40, '2025-10-28 06:14:55', '2025-10-28 06:14:55', 29),
(16, 40, '2025-10-28 06:14:55', '2025-10-28 06:14:55', 28),
(17, 40, '2025-10-28 06:15:18', '2025-10-28 06:15:18', 26),
(26, 130, '2025-12-28 16:28:00', '2025-12-28 16:28:00', 60),
(27, 180, '2025-12-28 16:28:29', '2025-12-28 16:28:29', 59),
(28, 150, '2025-12-28 16:29:29', '2025-12-28 16:29:29', 57),
(29, 140, '2025-12-28 16:29:29', '2025-12-28 16:29:29', 58),
(30, 180, '2025-12-28 16:31:28', '2025-12-28 16:31:28', 55),
(31, 200, '2025-12-28 16:31:28', '2025-12-28 16:31:28', 56),
(32, 140, '2025-12-28 16:32:35', '2025-12-28 16:32:35', 53),
(33, 189, '2025-12-28 16:32:35', '2025-12-28 18:33:01', 54),
(34, 170, '2025-12-28 16:33:57', '2025-12-28 16:33:57', 51),
(35, 300, '2025-12-28 16:33:57', '2025-12-28 16:33:57', 52),
(36, 150, '2025-12-28 16:35:17', '2025-12-28 16:35:17', 50),
(37, 150, '2025-12-28 16:36:42', '2025-12-28 16:36:42', 49),
(38, 139, '2025-12-28 16:36:42', '2025-12-29 16:10:38', 48),
(39, 140, '2025-12-28 16:36:42', '2025-12-28 16:36:42', 47),
(40, 150, '2025-12-28 16:36:42', '2025-12-28 16:36:42', 46),
(41, 140, '2025-12-28 16:38:21', '2025-12-28 16:38:21', 41),
(42, 120, '2025-12-28 16:38:21', '2025-12-28 16:38:21', 42),
(43, 160, '2025-12-28 16:38:21', '2025-12-28 16:38:21', 43),
(44, 120, '2025-12-28 16:38:21', '2025-12-28 16:38:21', 44),
(45, 120, '2025-12-28 16:38:21', '2025-12-28 16:38:21', 45);

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `messengers`
--

CREATE TABLE `messengers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user1_id` bigint(20) UNSIGNED NOT NULL,
  `user2_id` bigint(20) UNSIGNED NOT NULL,
  `messages` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`messages`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `messengers`
--

INSERT INTO `messengers` (`id`, `user1_id`, `user2_id`, `messages`, `created_at`, `updated_at`) VALUES
(1, 13, 14, '[{\"id\":\"69286e40059f1\",\"sender_id\":14,\"message\":\"xin ch\\u00e0o\",\"attachment\":null,\"is_read\":true,\"sent_at\":\"2025-11-27 22:29:04\",\"read_at\":\"2025-11-27 22:29:30\"},{\"id\":\"69286e668437b\",\"sender_id\":13,\"message\":\"ch\\u00e0o b\\u1ea1n\",\"attachment\":null,\"is_read\":true,\"sent_at\":\"2025-11-27 22:29:42\",\"read_at\":\"2025-11-27 22:29:45\"},{\"id\":\"69286e80d96ff\",\"sender_id\":14,\"message\":\"shop c\\u00f3 \\u00e1o phao kh\\u00f4ng\",\"attachment\":null,\"is_read\":true,\"sent_at\":\"2025-11-27 22:30:08\",\"read_at\":\"2025-11-27 22:30:18\"},{\"id\":\"69286e95450ba\",\"sender_id\":14,\"message\":\"kh\\u00f4ng \\u1ea1\",\"attachment\":null,\"is_read\":true,\"sent_at\":\"2025-11-27 22:30:29\",\"read_at\":\"2025-11-27 22:30:38\"},{\"id\":\"69286eb0de656\",\"sender_id\":13,\"message\":\"kh\\u00f4ng c\\u00f3 \\u1ea1\",\"attachment\":null,\"is_read\":true,\"sent_at\":\"2025-11-27 22:30:56\",\"read_at\":\"2025-11-27 22:30:58\"},{\"id\":\"6952a3922c889\",\"sender_id\":14,\"message\":\"xin ch\\u00e0o\",\"attachment\":null,\"is_read\":true,\"sent_at\":\"2025-12-29 22:51:46\",\"read_at\":\"2025-12-29 22:52:17\"},{\"id\":\"6952a3bd7af2d\",\"sender_id\":13,\"message\":\"ch\\u00e0o b\\u1ea1n \\u1ea1\",\"attachment\":null,\"is_read\":true,\"sent_at\":\"2025-12-29 22:52:29\",\"read_at\":\"2025-12-29 22:54:34\"},{\"id\":\"6952a3e7438c7\",\"sender_id\":14,\"message\":\"t\\u00f4i c\\u1ea7n mua \\u00e1o\",\"attachment\":null,\"is_read\":true,\"sent_at\":\"2025-12-29 22:53:11\",\"read_at\":\"2025-12-29 22:53:14\"},{\"id\":\"6952a4dae0486\",\"sender_id\":13,\"message\":\"v\\u00e2ng \\u1ea1 b\\u1ea1n c\\u1ea7n mua \\u00e1o g\\u00ec \\u1ea1\",\"attachment\":null,\"is_read\":true,\"sent_at\":\"2025-12-29 22:57:14\",\"read_at\":\"2025-12-29 23:09:01\"},{\"id\":\"6952a4f1ce855\",\"sender_id\":14,\"message\":\"t\\u00f4i c\\u1ea7n mua ao thun nike\",\"attachment\":null,\"is_read\":true,\"sent_at\":\"2025-12-29 22:57:37\",\"read_at\":\"2025-12-29 22:57:50\"},{\"id\":\"6952a51859967\",\"sender_id\":13,\"message\":\"b\\u1ea1n mu\\u1ed1n m\\u1eb7c size g\\u00ec \\u1ea1\",\"attachment\":null,\"is_read\":true,\"sent_at\":\"2025-12-29 22:58:16\",\"read_at\":\"2025-12-29 23:09:01\"},{\"id\":\"6952a58636c01\",\"sender_id\":14,\"message\":\"t\\u00f4i c\\u1ea7n m\\u1eb7c size xl \\u1ea1\",\"attachment\":null,\"is_read\":true,\"sent_at\":\"2025-12-29 23:00:06\",\"read_at\":\"2025-12-29 23:07:04\"},{\"id\":\"6952a73328f33\",\"sender_id\":13,\"message\":\"m\\u00e0u g\\u00ec \\u1ea1\",\"attachment\":null,\"is_read\":true,\"sent_at\":\"2025-12-29 23:07:15\",\"read_at\":\"2025-12-29 23:09:01\"},{\"id\":\"6952a73e4f06d\",\"sender_id\":14,\"message\":\"m\\u00e0u \\u0111en nh\\u00e9\",\"attachment\":null,\"is_read\":true,\"sent_at\":\"2025-12-29 23:07:26\",\"read_at\":\"2025-12-29 23:09:39\"}]', '2025-11-27 15:29:04', '2025-12-29 16:09:39'),
(2, 13, 13, '[{\"id\":\"69515feacdfe2\",\"sender_id\":13,\"message\":\"alo\",\"attachment\":null,\"is_read\":false,\"sent_at\":\"2025-12-28 23:50:50\",\"read_at\":null}]', '2025-12-28 16:50:50', '2025-12-28 16:50:50'),
(3, 14, 18, '[{\"id\":\"6952a45278613\",\"sender_id\":14,\"message\":\"xin ch\\u00e0o\",\"attachment\":null,\"is_read\":false,\"sent_at\":\"2025-12-29 22:54:58\",\"read_at\":null}]', '2025-12-29 15:54:58', '2025-12-29 15:54:58');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_sessions_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_05_27_021206_create_personal_access_tokens_table', 1),
(5, '2025_05_27_023351_user', 1),
(6, '2025_05_28_152715_create_categories_table', 1),
(7, '2025_05_28_152805_create_brands_table', 1),
(8, '2025_05_28_152815_create_products_table', 1),
(9, '2025_05_28_152825_create_variants_table', 1),
(10, '2025_05_29_033917_create_images_table', 1),
(11, '2025_06_04_022631_create_inventories_table', 1),
(12, '2025_06_05_131316_address', 1),
(13, '2025_06_05_153736_create_carts_table', 1),
(14, '2025_06_07_143020_create_coupons_table', 1),
(15, '2025_06_07_151337_create_blog_categires_table', 1),
(16, '2025_06_08_155843_create_blogs_table', 1),
(17, '2025_06_11_000001_create_product_reviews_table', 1),
(18, '2025_06_11_000002_create_review_images_table', 1),
(19, '2025_06_11_151638_create_orders_table', 1),
(20, '2025_06_11_151649_create_orders_details_table', 1),
(21, '2025_06_14_211934_add_quantity_to_variants_table', 1),
(22, '2025_06_16_220917_create_favorite_products_table', 1),
(23, '2025_06_24_221346_create_messengers_table', 1),
(24, '2025_07_01_000001_create_stock_movements_table', 1),
(25, '2025_07_01_000002_create_stock_movement_items_table', 1),
(26, '2025_07_02_000001_update_inventories_and_stock_movement_items_to_variant', 1),
(27, '2025_07_03_161014_add_variant_id_to_images_table', 1),
(28, '2025_07_06_121905_create_coupon_user_table', 1),
(29, '2025_07_06_234115_create_settings_table', 1),
(30, '2025_07_10_000001_create_flash_sales_table', 1),
(31, '2025_07_10_000002_create_flash_sale_products_table', 1),
(32, '2025_07_24_223300_create_contacts_table', 1),
(33, '2025_08_04_215049_add_shipping_fields_to_products_table', 1),
(34, '2025_08_04_215050_create_pages_table', 1),
(35, '2025_08_06_235426_create_notifications_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) NOT NULL,
  `type` varchar(255) NOT NULL,
  `notifiable_type` varchar(255) NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` text NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('0b2eeebf-2d32-4163-a34e-fdb43d5ea99b', 'App\\Notifications\\NewOrderNotification', 'App\\Models\\User', 13, '{\"title\":\"C\\u00f3 \\u0111\\u01a1n h\\u00e0ng m\\u1edbi\",\"order_id\":5,\"message\":\"B\\u1ea1n c\\u00f3 \\u0111\\u01a1n h\\u00e0ng m\\u1edbi #5\",\"user_id\":14,\"final_price\":650504,\"created_at\":\"2025-12-29T16:16:56.000000Z\"}', NULL, '2025-12-29 16:16:57', '2025-12-29 16:16:57'),
('45caf947-51b0-4ebd-9151-8d2af4910e01', 'App\\Notifications\\NewOrderNotification', 'App\\Models\\User', 13, '{\"title\":\"C\\u00f3 \\u0111\\u01a1n h\\u00e0ng m\\u1edbi\",\"order_id\":1,\"message\":\"B\\u1ea1n c\\u00f3 \\u0111\\u01a1n h\\u00e0ng m\\u1edbi #1\",\"user_id\":14,\"final_price\":948504,\"created_at\":\"2025-11-27T15:07:56.000000Z\"}', NULL, '2025-11-27 15:08:00', '2025-11-27 15:08:00'),
('6dea133e-aa50-406d-a612-7d4c0429a481', 'App\\Notifications\\NewCommentNotification', 'App\\Models\\User', 13, '{\"title\":\"C\\u00f3 b\\u00ecnh lu\\u1eadn m\\u1edbi\",\"comment_id\":1,\"message\":\"B\\u00ecnh lu\\u1eadn m\\u1edbi: s\\u1ea3n ph\\u1ea9m r\\u1ea5t ch\\u1ea5t l\\u01b0\\u1ee3ng\",\"user_id\":\"14\",\"product_slug\":\"ao-so-mi-nam-uniqlo\",\"created_at\":\"2025-11-27T15:32:58.000000Z\"}', NULL, '2025-11-27 15:33:00', '2025-11-27 15:33:00'),
('9d1601bf-4666-423f-ab34-d84337267b51', 'App\\Notifications\\NewOrderNotification', 'App\\Models\\User', 13, '{\"title\":\"C\\u00f3 \\u0111\\u01a1n h\\u00e0ng m\\u1edbi\",\"order_id\":2,\"message\":\"B\\u1ea1n c\\u00f3 \\u0111\\u01a1n h\\u00e0ng m\\u1edbi #2\",\"user_id\":14,\"final_price\":949504,\"created_at\":\"2025-11-28T03:06:51.000000Z\"}', NULL, '2025-11-28 03:06:56', '2025-11-28 03:06:56');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `address_id` bigint(20) UNSIGNED DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'pending',
  `payment_method` varchar(255) NOT NULL,
  `payment_status` varchar(255) NOT NULL DEFAULT 'unpaid',
  `total_price` int(11) NOT NULL,
  `discount_price` int(11) NOT NULL DEFAULT 0,
  `final_price` int(11) NOT NULL,
  `coupon_id` bigint(20) UNSIGNED DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `tracking_code` varchar(255) DEFAULT NULL,
  `return_status` varchar(255) DEFAULT NULL,
  `cancel_reason` varchar(255) DEFAULT NULL,
  `reject_reason` text DEFAULT NULL,
  `return_reason` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `address_id`, `status`, `payment_method`, `payment_status`, `total_price`, `discount_price`, `final_price`, `coupon_id`, `note`, `tracking_code`, `return_status`, `cancel_reason`, `reject_reason`, `return_reason`, `created_at`, `updated_at`) VALUES
(1, 14, 1, 'completed', 'cod', 'paid', 897000, 0, 948504, NULL, '', 'DG510703', NULL, NULL, NULL, NULL, '2025-11-27 15:07:56', '2025-11-27 15:32:08'),
(2, 14, 1, 'pending', 'cod', 'pending', 898000, 0, 949504, NULL, '', 'DG707847', NULL, NULL, NULL, NULL, '2025-11-28 03:06:51', '2025-11-28 03:06:51'),
(3, 13, 2, 'pending', 'vnpay', 'paid', 499000, 0, 538002, NULL, '', 'DG022824', NULL, NULL, NULL, NULL, '2025-12-28 18:33:01', '2025-12-28 18:33:01'),
(4, 14, 1, 'pending', 'vnpay', 'paid', 299000, 0, 350504, NULL, '', 'DG716081', NULL, NULL, NULL, NULL, '2025-12-29 16:10:38', '2025-12-29 16:10:38'),
(5, 14, 1, 'pending', 'cod', 'pending', 599000, 0, 650504, NULL, '', 'DG920926', NULL, NULL, NULL, NULL, '2025-12-29 16:16:56', '2025-12-29 16:16:56');

-- --------------------------------------------------------

--
-- Table structure for table `orders_details`
--

CREATE TABLE `orders_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `variant_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `original_price` int(11) DEFAULT NULL,
  `total_price` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders_details`
--

INSERT INTO `orders_details` (`id`, `order_id`, `variant_id`, `quantity`, `price`, `original_price`, `total_price`, `created_at`, `updated_at`) VALUES
(2, 2, 36, 1, 599000, 599000, 599000, '2025-11-28 03:06:51', '2025-11-28 03:06:51'),
(4, 3, 54, 1, 499000, 499000, 499000, '2025-12-28 18:33:01', '2025-12-28 18:33:01'),
(5, 4, 48, 1, 299000, 299000, 299000, '2025-12-29 16:10:38', '2025-12-29 16:10:38'),
(6, 5, 36, 1, 599000, 599000, 599000, '2025-12-29 16:16:56', '2025-12-29 16:16:56');

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `content` longtext NOT NULL,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `type` enum('policy','support','about','other') NOT NULL DEFAULT 'other',
  `sort_order` int(11) NOT NULL DEFAULT 0,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  `description` longtext NOT NULL,
  `discount_price` int(11) DEFAULT NULL,
  `slug` varchar(255) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `categories_id` bigint(20) UNSIGNED DEFAULT NULL,
  `brand_id` bigint(20) UNSIGNED DEFAULT NULL,
  `sold_count` int(11) NOT NULL DEFAULT 0,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `weight` int(11) NOT NULL DEFAULT 500 COMMENT 'Cân nặng sản phẩm (gram)',
  `length` int(11) NOT NULL DEFAULT 20 COMMENT 'Chiều dài sản phẩm (cm)',
  `width` int(11) NOT NULL DEFAULT 20 COMMENT 'Chiều rộng sản phẩm (cm)',
  `height` int(11) NOT NULL DEFAULT 20 COMMENT 'Chiều cao sản phẩm (cm)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `price`, `description`, `discount_price`, `slug`, `is_active`, `categories_id`, `brand_id`, `sold_count`, `deleted_at`, `created_at`, `updated_at`, `weight`, `length`, `width`, `height`) VALUES
(1, 'Áo sơ mi nam Uniqlo', 299000, 'Áo sơ mi nam chất liệu cotton 100%, thiết kế đơn giản, phù hợp cho công sở và cuộc sống hàng ngày. Form dáng chuẩn, dễ phối đồ.', 249000, 'ao-so-mi-nam-uniqlo', 1, 6, 1, 161, NULL, '2025-10-05 15:55:09', '2025-12-29 16:10:38', 500, 20, 20, 20),
(2, 'Áo thun nam Nike', 399000, 'Áo thun nam Nike với chất liệu cotton cao cấp, thiết kế thể thao năng động. Phù hợp cho tập luyện và cuộc sống hàng ngày.', 349000, 'ao-thun-nam-nike', 1, 7, 4, 234, NULL, '2025-10-05 15:55:09', '2025-10-05 15:55:09', 500, 20, 20, 20),
(3, 'Quần jean nam Zara', 599000, 'Quần jean nam Zara với chất liệu denim cao cấp, thiết kế hiện đại. Form dáng chuẩn, phù hợp cho mọi hoạt động.', 499000, 'quan-jean-nam-zara', 1, 8, 2, 191, NULL, '2025-10-05 15:55:09', '2025-12-29 16:16:56', 500, 20, 20, 20),
(4, 'Áo thun nữ H&M', 199000, 'Áo thun nữ H&M chất liệu cotton mềm mại, thiết kế đơn giản. Nhiều màu sắc lựa chọn, phù hợp cho mọi lứa tuổi.', 149000, 'ao-thun-nu-hm', 1, 9, 3, 312, NULL, '2025-10-05 15:55:09', '2025-10-05 15:55:09', 500, 20, 20, 20),
(5, 'Váy liền nữ Zara', 899000, 'Váy liền nữ Zara thiết kế thanh lịch, chất liệu vải cao cấp. Phù hợp cho các dịp đặc biệt và công việc.', 799000, 'vay-lien-nu-zara', 1, 10, 2, 145, NULL, '2025-10-05 15:55:09', '2025-10-05 15:55:09', 500, 20, 20, 20),
(6, 'Áo sơ mi nữ Uniqlo', 399000, 'Áo sơ mi nữ Uniqlo với thiết kế tinh tế, chất liệu cotton cao cấp. Form dáng chuẩn, phù hợp cho công sở.', 349000, 'ao-so-mi-nu-uniqlo', 1, 3, 1, 178, NULL, '2025-10-05 15:55:09', '2025-10-05 15:55:09', 500, 20, 20, 20),
(7, 'Quần jean nữ H&M', 399000, 'Quần jean nữ H&M với thiết kế hiện đại, chất liệu denim mềm mại. Nhiều kiểu dáng và màu sắc.', 299000, 'quan-jean-nu-hm', 1, 4, 3, 267, NULL, '2025-10-05 15:55:09', '2025-10-05 15:55:09', 500, 20, 20, 20),
(8, 'Áo khoác nam Adidas', 1299000, 'Áo khoác nam Adidas với thiết kế thể thao, chất liệu cao cấp. Chống nước nhẹ, phù hợp cho mọi thời tiết.', 999000, 'ao-khoac-nam-adidas', 1, 1, 5, 89, NULL, '2025-10-05 15:55:09', '2025-10-05 15:55:09', 500, 20, 20, 20),
(9, 'Váy dạ hội nữ Gucci', 15999000, 'Váy dạ hội nữ Gucci thiết kế sang trọng, chất liệu cao cấp. Phù hợp cho các sự kiện quan trọng.', 13999000, 'vay-da-hoi-nu-gucci', 1, 5, 6, 23, NULL, '2025-10-05 15:55:09', '2025-10-05 15:55:09', 500, 20, 20, 20),
(10, 'Áo len nam Uniqlo', 499000, 'Áo len nam Uniqlo chất liệu len cao cấp, thiết kế đơn giản. Giữ ấm tốt, phù hợp cho mùa đông.', 399000, 'ao-len-nam-uniqlo', 1, 1, 1, 135, NULL, '2025-10-05 15:55:09', '2025-12-28 18:33:01', 500, 20, 20, 20),
(11, 'Áo polo nam Uniqlo', 349000, 'Chất liệu cotton cao cấp, mềm mại, thấm hút mồ hôi tốt. Thiết kế hiện đại, form dáng chuẩn, phù hợp cho mọi hoạt động.', 299000, 'ao-polo-nam-uniqlo', 1, 1, 1, 0, '2025-12-28 16:04:20', '2025-12-28 15:52:56', '2025-12-28 16:04:20', 300, 70, 50, 5),
(12, 'Áo thun cổ tròn nam Nike', 449000, 'Chất liệu cotton cao cấp, mềm mại, thấm hút mồ hôi tốt. Thiết kế hiện đại, form dáng chuẩn, phù hợp cho mọi hoạt động.', 399000, 'ao-thun-co-tron-nam-nike', 1, 1, 4, 0, '2025-12-28 16:04:20', '2025-12-28 15:52:56', '2025-12-28 16:04:20', 250, 65, 48, 3),
(13, 'Áo khoác gió nam Adidas', 1299000, 'Chất liệu cotton cao cấp, mềm mại, thấm hút mồ hôi tốt. Thiết kế hiện đại, form dáng chuẩn, phù hợp cho mọi hoạt động.', 1099000, 'ao-khoac-gio-nam-adidas', 1, 1, 5, 0, '2025-12-28 16:04:20', '2025-12-28 15:52:56', '2025-12-28 16:04:20', 500, 75, 60, 8),
(14, 'Áo len nam Zara', 799000, 'Chất liệu cotton cao cấp, mềm mại, thấm hút mồ hôi tốt. Thiết kế hiện đại, form dáng chuẩn, phù hợp cho mọi hoạt động.', 699000, 'ao-len-nam-zara', 1, 1, 2, 0, '2025-12-28 16:04:20', '2025-12-28 15:52:56', '2025-12-28 16:04:20', 400, 72, 55, 6),
(15, 'Áo hoodie nam H&M', 599000, 'Chất liệu cotton cao cấp, mềm mại, thấm hút mồ hôi tốt. Thiết kế hiện đại, form dáng chuẩn, phù hợp cho mọi hoạt động.', 499000, 'ao-hoodie-nam-hm', 1, 1, 3, 0, '2025-12-28 16:04:20', '2025-12-28 15:52:56', '2025-12-28 16:04:20', 450, 73, 56, 7),
(16, 'Áo cardigan nam Uniqlo', 899000, 'Chất liệu cotton cao cấp, mềm mại, thấm hút mồ hôi tốt. Thiết kế hiện đại, form dáng chuẩn, phù hợp cho mọi hoạt động.', 799000, 'ao-cardigan-nam-uniqlo', 1, 1, 1, 0, '2025-12-28 16:04:20', '2025-12-28 15:52:56', '2025-12-28 16:04:20', 350, 74, 54, 5),
(17, 'Áo blazer nam Zara', 1999000, 'Chất liệu cotton cao cấp, mềm mại, thấm hút mồ hôi tốt. Thiết kế hiện đại, form dáng chuẩn, phù hợp cho mọi hoạt động.', 1799000, 'ao-blazer-nam-zara', 1, 1, 2, 0, '2025-12-28 16:04:20', '2025-12-28 15:52:56', '2025-12-28 16:04:20', 600, 78, 58, 10),
(18, 'Áo vest nam H&M', 1499000, 'Chất liệu cotton cao cấp, mềm mại, thấm hút mồ hôi tốt. Thiết kế hiện đại, form dáng chuẩn, phù hợp cho mọi hoạt động.', 1299000, 'ao-vest-nam-hm', 1, 1, 3, 0, '2025-12-28 16:04:20', '2025-12-28 15:52:56', '2025-12-28 16:04:20', 550, 76, 57, 9);

-- --------------------------------------------------------

--
-- Table structure for table `product_reviews`
--

CREATE TABLE `product_reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `product_slug` varchar(255) NOT NULL,
  `rating` int(11) DEFAULT NULL,
  `content` text NOT NULL,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `is_admin_reply` tinyint(1) NOT NULL DEFAULT 0,
  `is_approved` tinyint(1) NOT NULL DEFAULT 0,
  `is_hidden` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_reviews`
--

INSERT INTO `product_reviews` (`id`, `user_id`, `product_slug`, `rating`, `content`, `parent_id`, `is_admin_reply`, `is_approved`, `is_hidden`, `created_at`, `updated_at`) VALUES
(1, 14, 'ao-so-mi-nam-uniqlo', 4, 'sản phẩm rất chất lượng', NULL, 0, 1, 0, '2025-11-27 15:32:58', '2025-11-27 15:32:58'),
(2, 13, 'ao-so-mi-nam-uniqlo', NULL, 'dạ shop cảm ơn ạ', 1, 1, 1, 0, '2025-11-27 15:34:04', '2025-11-27 15:34:04');

-- --------------------------------------------------------

--
-- Table structure for table `review_images`
--

CREATE TABLE `review_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `review_id` bigint(20) UNSIGNED NOT NULL,
  `image_path` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `review_images`
--

INSERT INTO `review_images` (`id`, `review_id`, `image_path`, `created_at`, `updated_at`) VALUES
(1, 1, 'review_images/Nz3bvATWeFkHrtvG4KELng4lisiBgHyctHseyU3H.jpg', '2025-11-27 15:33:00', '2025-11-27 15:33:00');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(255) NOT NULL,
  `value` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `key`, `value`, `created_at`, `updated_at`) VALUES
(1, 'storeName', 'TruongShop', '2025-10-19 13:37:48', '2025-10-19 13:37:48'),
(2, 'address', '89 Nguyễn Hoàng, Phường 1, Thị xã Quảng Trị, Quảng Trị', '2025-10-19 13:37:48', '2025-11-27 13:57:45'),
(3, 'phone', '0354422737', '2025-10-19 13:37:48', '2025-10-19 13:37:48'),
(4, 'email', 'phuctruong03qt@gmail.com', '2025-10-19 13:37:48', '2025-10-19 13:37:48'),
(5, 'logo', 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAPoAAACWCAIAAAB4uAJLAAAACXBIWXMAAA7EAAAOxAGVKw4bAAAEwmlUWHRYTUw6Y29tLmFkb2JlLnhtcAAAAAAAPD94cGFja2V0IGJlZ2luPSfvu78nIGlkPSdXNU0wTXBDZWhpSHpyZVN6TlRjemtjOWQnPz4KPHg6eG1wbWV0YSB4bWxuczp4PSdhZG9iZTpuczptZXRhLyc+CjxyZGY6UkRGIHhtbG5zOnJkZj0naHR0cDovL3d3dy53My5vcmcvMTk5OS8wMi8yMi1yZGYtc3ludGF4LW5zIyc+CgogPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9JycKICB4bWxuczpBdHRyaWI9J2h0dHA6Ly9ucy5hdHRyaWJ1dGlvbi5jb20vYWRzLzEuMC8nPgogIDxBdHRyaWI6QWRzPgogICA8cmRmOlNlcT4KICAgIDxyZGY6bGkgcmRmOnBhcnNlVHlwZT0nUmVzb3VyY2UnPgogICAgIDxBdHRyaWI6Q3JlYXRlZD4yMDI1LTA4LTA0PC9BdHRyaWI6Q3JlYXRlZD4KICAgICA8QXR0cmliOkV4dElkPjNlNzhkOWZiLWM5NmEtNDBlOS1hNDNhLTU5ZWJkODk2Mzg1MTwvQXR0cmliOkV4dElkPgogICAgIDxBdHRyaWI6RmJJZD41MjUyNjU5MTQxNzk1ODA8L0F0dHJpYjpGYklkPgogICAgIDxBdHRyaWI6VG91Y2hUeXBlPjI8L0F0dHJpYjpUb3VjaFR5cGU+CiAgICA8L3JkZjpsaT4KICAgPC9yZGY6U2VxPgogIDwvQXR0cmliOkFkcz4KIDwvcmRmOkRlc2NyaXB0aW9uPgoKIDxyZGY6RGVzY3JpcHRpb24gcmRmOmFib3V0PScnCiAgeG1sbnM6ZGM9J2h0dHA6Ly9wdXJsLm9yZy9kYy9lbGVtZW50cy8xLjEvJz4KICA8ZGM6dGl0bGU+CiAgIDxyZGY6QWx0PgogICAgPHJkZjpsaSB4bWw6bGFuZz0neC1kZWZhdWx0Jz5sb2dvIGNodeG6qW4gZGV2IGdhbmcgc3RvcmUgLSAzPC9yZGY6bGk+CiAgIDwvcmRmOkFsdD4KICA8L2RjOnRpdGxlPgogPC9yZGY6RGVzY3JpcHRpb24+CgogPHJk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', '2025-10-19 13:37:48', '2025-10-19 13:37:48');
INSERT INTO `settings` (`id`, `key`, `value`, `created_at`, `updated_at`) VALUES
(6, 'siteIcon', 'data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/4gIoSUNDX1BST0ZJTEUAAQEAAAIYanhsIARAAABtbnRyUkdCIFhZWiAH4wAMAAEAAAAAAABhY3NwQVBQTAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAQAA9tYAAQAAAADTLWp4bCACufkBQHM6b/D/A/Tw9worAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAtkZXNjAAABCAAAAERjcHJ0AAABTAAAACR3dHB0AAABcAAAABRjaGFkAAABhAAAACxjaWNwAAABsAAAAAxyWFlaAAABvAAAABRnWFlaAAAB0AAAABRiWFlaAAAB5AAAABRyVFJDAAAB+AAAACBnVFJDAAAB+AAAACBiVFJDAAAB+AAAACBtbHVjAAAAAAAAAAEAAAAMZW5VUwAAACYAAAAcAFIARwBCAF8ARAA2ADUAXwBTAFIARwBfAFIAZQBsAF8AUwBSAEcAAG1sdWMAAAAAAAAAAQAAAAxlblVTAAAABgAAABwAQwBDADAAAFhZWiAAAAAAAAD21gABAAAAANMtc2YzMgAAAAAAAQxAAAAF3f//8yoAAAeSAAD9kP//+6P///2jAAAD2wAAwIFjaWNwAAAAAAENAAFYWVogAAAAAAAAb58AADj1AAADkFhZWiAAAAAAAABilgAAt4cAABjbWFlaIAAAAAAAACSiAAAPhQAAttZwYXJhAAAAAAADAAAAAmZmAADypwAADVkAABPQAAAKW//bAEMAAgEBAQEBAgEBAQICAgICBAMCAgICBQQEAwQGBQYGBgUGBgYHCQgGBwkHBgYICwgJCgoKCgoGCAsMCwoMCQoKCv/bAEMBAgICAgICBQMDBQoHBgcKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCv/AABEIBAAEAAMBEQACEQEDEQH/xAAdAAEBAAIDAQEBAAAAAAAAAAAAAwgJAQIHBgUE/8QAchABAAADAgQIEhENDgQEBwAAAAMEBQYHAQIIEwkRFCMzOEN2EhUZJDE0U1ZhY3OBg5ajtdPUFiEyN0JEUVRXcXWRk5SXs7QYIiVBUlVYYmSEosLDFyY1NkZydIKSlaGkxNJFssHkJ2V34yhIZoax4vD/xAAcAQEBAAIDAQEAAAAAAAAAAAAAAwYHAgQFAQj/xAA/EQEAAQEDCAUICAcBAQAAAAAAAQUCBAYDERIUFjVR8BUhMTJBEzM0NmFxwdEHIiQlQkNEUhcjgZGhsfFF4f/aAAwDAQACEQMRAD8A+wfox+XwAEwUAAAAABMFAAAAAAAAAAAAAAAAAAAATBQAAEwUAAAAAABMFAAAAAAAAATBQAAAAAAAAAAAAAAEwUABMFATBQAAAAEwUAABMFAAAAAAAAATABQAAEwUABMFAAAAATBQAAEwUAAAAAAAAAAAAABMFATAUABMUAABNQEwUBMAFAAAAAATBQAAEwUFEwAAABNQAAEwUAABMFATAAABQAAAAEwUAABMFAATBQAAEwUBMFATABQAAEwAAUABMFAAAAAAAATABQAEwUAAAABMFAATABQEwUAAAAAABMFAATBQAUTE1ABRMTAAUBMAUBMAAAAAFAATUABMUABMBQAAAAAAAAEwUAAAAABMAUBMABQAEwUAABMFAAATBQAEwAUABMFAAATBQAAAAAEwUAABMFAAAATBQEwAAUAAFExNQAAEwAUAAAAAFExNQAAUTE1ABRMTUAAAABMFAAAAAAAATBQAUTE1AAATABQAAAEwAAUBMAAUABMBQExQEwAFATBQAAAEwUBMFAAATBQEwAAAAUAAAAAABMFAABRMTUABMAUBMBQAEwUAAABMFABRMTUABMFATBQAAAAAAEwAAAUBMFAAATBQAUTE1AAAAAATBQAAAAAAEwAUAABMFBRMTUFExNQAEwUAAAFExNQAAAEwUFExNQExQEwAAFATFATAUABMAAAAFATBQAEwUAABMFATBQEwUBMAAFATBQUTE1AAATAAABQAAUTEwFATABQEwUABMFATBQAEwUABMFATBQAAAEwUFExNQEwUAAAABMFATBQAEwUFExNQEwAUAAAABMAAAAFATAABQEwUAFExMABQAAEwUAAABMFAABRMTAUBMUABNQAEwBQEwFAATFATAUAAAABMFAATABQUTE1AAAATFATUAAFExMFATUBMFATAAAFATUAAAAAABMAFAAAAATABQAAEwAAUBMFAAAATBQAAAEwAAAUABMAFAATABQEwUBMFATBQEwUAAABMUBMBQAEwUAABMFAATFATAAUBMFAATBQExQEwAAFAAATAFATUBMAUABMBQAUTE1ATAABQEwUBMFATAABQEwAUAAAFExNQAEwABQE1AAAATAABQAAAAUTE1AATBQAEwUABMFATBQEwUBMFBRMTUAFExNQUTE1ATAABQEwAUBMAFAAATABQAEwAAUAAAAABMAFAAAATBQEwAAAUAABMFATAAAABQAAAAAEwUBMUBMAAFAATAAUAAAABMAAAFAAAATBQAAEwUABMFAAATAAABQAEwAUABMUBNQEwUBMFAAATBQUTE1ATBQAEwAUAAAAAABMFATBQEwAAUFExNQAEwUAABMAAAFAAAATAABQUTE1AATABQEwUABMFABRMATAUBMAAAFAAAAAATBQEwUAABMAUBMAAAAABQAAEwUBMFAAAAAAAATBQEwAAAUAABMFATAABQAEwUAAAAAAABMFBRMTUAABMFAABRMTUABMFATBQUTE1ATBQAEwUBMAFATBQAEwUAABMAFATABQAAAAAAAEwUAAABMFATBQAAEwAUFExMABQEwAAUABMFATABQUTE1AATABQExQAEwAAUBMAAFAAATAAUAAABMFBRMTUBMAAAAFAAAAATFATAUAAAABMFAATABQAUTE1ABRMTUAAFExNQEwUFExNQEwUAAAABMFAATBQAUTE1AAATABQEwUAAABMFAATBQAEwAUAFExNQAAAAEwUBMFATBQEwAUAAAAABMAFBRMTUAFExMBQAAEwBQAAEwFATFAAAAAAAATUAABMAFAAAAATAAAAABQAAEwAAAAUBMFAAAATFATAAUBMAFAATABQEwUBMFAAAATBQEwUAABMFATABQAAEwUAABMFATBQEwUBMAFAATABQEwUAAAAAAABMAFATABQEwAUBMFBRMTUAAAABMAFAAAABRMTUBMUBMBQAExQAAEwAAAFAAAAATBQAAUTE1AATAAABQAAAEwUABMAAFATBQUTE1ATBQAAEwUAAFExNQEwAUABMFBRMTUBMFAAATBQAAEwAAAAUAAAAAFExNQEwUBMAAAFAAABRMTUBMAAFABRMTUABMFATBQAAAEwUAABMFBRMTUBMAAFATBQAEwUBMAUBNQAAExQAEwAFATBQAAAAEwUABMFAATBQAAAAAAAAAEwUAAAAAAAABMFAATAAAABQAEwUAAAAAABMFAAAAATBQEwAAAAUAAABMFAAAATABQAEwAUAAABMAAFBRMTUAAFExNQEwUBMFAAAAAATAABQAAEwAAUAFExNQAAUTAE1AATAAABQAAAAAEwAUAFExNQAUTE1AATBQEwUAAABMFAAAAAATBQAAEwAUAFExNQAEwAUBMFAAAAABRMTUBMFAAATABQAUTE1AATBQAEwUABMFAATBQUTE1AAATBQEwAUFEwBNQEwAUAAFExNQAUTE1ATBQUTE1ATBQAUTE1ATBQAEwUABMFAATBQEwUABMUBNQExQE1ATBQAAAEwUABMAFAAAATBQAUTE1BRMTUABMAFAAAAAAATABQEwAUABMFATBQUTE1ABRMTAAUFExNQAAUTE1AAATABQAEwUAAFExNQUTEwFAAAAATBQAAAAEwBQE1ATABQAEwAUFExNQUTE1ATABQEwAUAAAAFExNQAEwUABMAFAATBQAEwUAABMUBMABQEwUBMFAAAATAFATAUABMFATAABQEwUAAFExMBQEwAAAAUBMFAAABRMTUABMFATAAAAFATUBMFABRMTUAAAAABMAAFBRMTUAAAAABMFBRMTUBMFABRMTUFExNQAUTE1BRMTUAFExNQAEwAUFExNQEwAAAAAUAABMAFABRMTUBMFAAAATBQAUTE1AAAATFATAAAAUBMFATBQAEwBQEwFAAAAAAAATBQExQAEwFAATBQEwUBMFATABQAAAAAAEwUAAFExNQAEwAUBMFATABQAAAAEwAABQE1BRMTUBMAAFATBQEwUAAAABMFATBQUTE1AABRMTUBMAFATBQEwAUBMAFBRMTUBMAAAFATBQEwUAABMFATBQAAAAExQAAE1AABRMTUAABMAAFATBQAEwUAABMAAAAAAAFAAAAATBQEwAAAUFExNQAAEwAUAAAAFExNQAEwBQE1AATAABQEwUAFExNQAEwUBMAAFBRMTUABMFAAATBQEwAAUABMUBNQAEwUABMFAATBQUTE1AATBQEwAAAAAUBMFABRMTUAFExNQAUTE1ATBQExQAAAEwFAAAAATBQAEwUAAAABMAFATABQEwAUAABMFAAAATBQEwAAUAABMFAAAAATBQAAAAEwUAABMFATAABQAAAAAAAEwUAAAFExNQEwAAUABMFATBQUTE1AAAAAATBQAAEwUBMFAATBQEwUAAAABMAFAAAAAAAAATBQAEwBQAAEwUABMAFAATUBMFATAAAAABQEwUABMFATBQEwUAAAAABMAAFATAABQEwAAAUABMAFAAAATAAABQAAUTEwFAABRMTUFExNQAEwUFExNQAAEwUBMFAATBQEwUAABMFAATABQAAEwAUBMAFBRMTUBMAAAFAATBQAAEwAAAUAABMUBMABQAExQAE1AATFAAATBQAE1ATAFATAAAUFExNQEwUAAABMAFAAATFATBQAEwAFATABQAAAEwAUAAAAAABMAAAAFATAABQEwUAAAABMFATBQAAAAEwUAFExNQEwAAUBMFATAFAATAAUAAABMFATBQAEwAAUAAABMFAAAATABQAAExQAAAE1ATFATUAABMUABMAAFAATAAUABMFAABRMTUAAAAABMFAAATAFAAATAUAAABMAFAAAATBQAAAEwAUABMAFAAAATBQAEwUBMFATBQAEwAUFExNQAAAEwUBMFAAAAATBQAEwAUAAAAAABMFATAABQAAEwUAAABMFAAAAATBQExQEwAAAUABMABQExQAEwFATAAAAAABQAAEwAUBMAFAAAAAAAAAATFATAAUAAABMAAFAAAAATAABQAAEwUAFExNQAAAAAAEwAUBMFAATABQEwAAAUBMAFBRMTUBMFATBQEwAUAABMFAAAATABQAEwAAUAAAAAABMFATBQAEwUBMAFAAAATABQEwABQAEwFAATBQEwAAUAAABMAFAATABQAAAAAEwUABMAUBMABQEwUABMFAAATABQAEwAUBMFATBQAAEwAAUBMAAFAATABQAAEwUABMFABRMTUBMFAATBQUTE1ATBQEwUBMAFAAATBQEwUBMFATBQEwUABMAAFBRMTUFExNQAAAAAEwUAAABMUAABMFAAATAUBMAAAAFAATBQEwAUABMFATABQEwUABMFATAAFAATAAUAAAABMAAFAATAAAABQAAAEwUABMAAAAAFAATAABQEwUAAABMFABRMTUFExNQEwAUFExNQAAUTE1AABRMTUAAABMFAAATBQEwAUBMFAAAAAATBQAAEwUABMAAAUAAAAAAABNQEwBQEwAFAATAAABQAAAEwAAAUAAFExMBQEwAAAAAAAUAAAABMFATBQEwAAAUAAABMFAATAAAAFATBQAEwAFAATABQAEwUAABMUBNQAEwUAFExNQAEwAUABMFAAAATBQEwAAAUBMAFAATBQAAAAAAAEwUBMFAATFAAATBQAAAEwAUBMAAABQEwUABMFATAAAABQEwUAABMUBNQAEwABQEwUABMBQAAUTE1AATBQAAAEwAUAFExMFATAAAUAABMAUABMABQAAEwUBMFAAATBQAUTE1AAABRMTUBMAFBRMTUAAAAAAABMAAFATBQEwAUAABMFATBQEwUAABMAFAATFATAAABQEwAAAUBNQAEwAUBMFATBQEwUBMFAAATBQAAAAAAEwAUBMAAAUBMBQAAAEwAUBMFAAATABQEwUFExNQAEwUAAABMFAATBQEwUAAABMFATABQAEwUAAFExNQEwUBMAAFBRMTUAAABMAAFATBQAEwUAABMFAAAAAATBQEwAUABMFBRMTBQEwFAATAABQEwAAUAABMFABRMTUABMAFAAAAATBQEwUAAAAABMAFAATFATAAUABMFAAABRMTUAABMFAATBQAEwAUFExNQUTE1AAATBQAAEwUBMFATBQEwUABMFATBQAEwUBMAFATABQAAEwUBMAFATBQAAAAAEwBQE1AABRMTUAFExNQEwUFExNQEwUBMUBNQEwABQEwAFATFATUAAAAAAABMFAAAAAATABQAEwAUAAAABMFAATFATAAAUAAAABMFAATBQExQE1AAAATABQAAAAEwAUABMFATBQAAAEwUAFExNQAAUTE1AATBQAEwUAABMFABRMTUAABMFAATABQAEwUBMFATBQAEwUAFExNQUTE1ATBQAExQEwAFATAABQEwAAAUABMAFAAAAAAATBQEwUBMAFATAFATAAUBMFAAATAAAFATUABMFATAFATUBMFAATABQEwUBMUBMAAABQAAAAEwAUBMAFBRMTUFExMAAFATUFExNQAAAAEwAUAABMFAATBQEwAAAAUBMFAATBQAEwAUAAFExNQEwUABMAFATFATUABMFAAAAAATABQAEwAAAUAABMFAATBQAEwAUAFEwAATUTUTBQEwAAFAAAATAUABMAUBNQAAUTEwBQEwUBMFFAABMUBMAATAAAUABMFATBQAEwUAABMFAATBQEwAUAABMAAFAABRMTUBMFAATAAAABQAAEwAUBMFAATBQAAAAExQAE1ATFATAAAUBMAAAFATBQAEwAAAAAUAABMAAAFATAAAFAddccvulx+9jXD7pPvZTjZ19Yh39CDjY1iDQhPSx+j777rVPdTQyhpY/R981qnmhlE9LH6PvmtU80MoppY/R981qnmhlDSx+j75rVPNDKGlj9H3zWqea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mCgAAJgAoCYKAAmAAACgomJqAmAACgAAAAJgAoAACYAoCYCgAJgAAoAACYKAAAAAAAmCgJgoAACYoCYCgAomJgKAAmKAAmoAAACYKAAAmCgJgAAoAAAAAACYKAAAAmCgJgoACYAAKAmCgAAAJgoACYKAAmCgomJqAAAAmCgAAJgAoCYKAAAmCgAomJqAAAmAAACgAomJqAmACgomJqAmCgAJgAoAAAAAACYKAAAmAKAmAoACYKAmCgAAAAJgAoAAAAAACYKAAmKAmAoAKJiagAJgoKJiagJgCgJqACiYmAoAAAACYAKAmCgAJgAAAAAoKJiagAomJqAmAACgomJqAmCgomJqCiYmoAAAAACYAAAAKAmCgAJgoAACYAAAKCiYmoAKJiagAJgoCYAAKAAAmCgAJgoAKJiagomJqAACiYAmoACYAAKAAAAmAAACgJgoAAKJiagAAAAJgAoAACYKACiYmoKJiagJgAoCYKAAAAmCgomJqAmACgAJgoACYAKAmACgAJgoACYAKAmCgJgAAoCYKACiYmoAAACYAAKAmACgAJgAAoKJiagJgAAAoCYAKACiYmoCYAAAAKCiYmoCYKAAmCgAJgoCYKAAAmCgJgAAAAoAACYAAKCiYmoAKJiYCgAJgoCYKAAAAAAAAmCgJgoCYAAKAAmCgAAAJgoACYKCiYmoAACYKACiYmoAACYAKAmCgJgoAAAAAKJiagJgAoAAAKJiagJgoKJiagAomJqAmCgJgoAACYAKAmAAAAACgomJqAmAAACgAAAAomJqCiYmoCYKCiYmoCYKAmCgAAJgAoACYKAAAmACgJgoAAACYKAAAmCgAAAJgoAACYKAmAAKAmAoCYAAAKAmAACgomJqAAAACiYmoACYKAmKAAmAAAoCYKAACiYmoACYAKAmCgAAAJgAoAAACYKAAmCgJgoCYKAAmCgJgAAAAAoCYKAAmACgJgAAoAACYKAmACgJgoCYAAKCiYmoAKJiagAAAomJqAAAmAAACgAAAomJgAAAKAmAACgAJgoACYoCagAJigJgAAAAKAAAmCgAAAAJgoAACYAoCYCgAJgAAoAACYKAAAAmCgJgAoCYAKAAAmCgomJqAAAAAAmAACgAAAAJgoCYKACiYmoAACYKAAmCgJgoKJiagAAAomJqAAmCgAAomJqAAAAAAmCgJgAAAoAAAAAAKJiYAAAKAAAmAAAACgJqAAmAAACgJgAAAoCYKAmACgJgAoCYKAmCgAJgoAACYKAAAmCgJgoAAAACYAAKAmCgomJqAmACgJgoAAAAAKJgCYCgomJqCiYmoCYKAmCgAJgoCYKAAAAmCgJgoACYKAAACiYmoKJiagomJqAAmCgAomJqAAmCgJgCgJgAoACYAKAAmAoCYAAAoACYACgJigJqAAAAAAmCgJgAoCYKAAmCgAJgoAAAAAAAAAKJiagJgoCYKCiYmoACYKAAmCgAAAJgAoCYKAmAAACgAAJgoCYAKAAAAAmAACgJgAoAAAAKJiagAJgAoKJiagJgoAKJiagJgoAACYKAAmCgAJgAoAACYoACYAKAAmACgJgAAKAmACgJgoCYKAmKAmoCYKAAAmCgAJgAAoACYKAAAmCgAJgAoACYKAmCgomJqAAmCgJgoCYAKAmACgomJqAmCgJgAAoKJiagJgAAoKJiagJgoCYKAAmAAAAAAAAAACgAJgoAKJiagJgAAoCYKACiYmoAAAAAKJiagAAJgAoACYKAAmACgAAAJgoAACYKAAmCgJgoAAAACYoCYAAACgAomJqAAmCgJgoAKJiagAAomJqAAmACgJgAoCYKAmCgAJgoCYAKCiYmoAAAAACYKAmCgomJqCiYmoCYAKAAmAACgAJgAAAoACYAKAmAAACgAAAAAAJgAAAAAoAACYAAKAAAmCgAJgoCYKAAAAAAAmAACgJgoCYKAAmCgAAJgoAKJiYKAmoCYKAmCgAAAJgAAAoAACYKAmCgJgAoKJiYCgAAAomJqAmACgomJqAAAAAAmACgAAAJgoACYKAmACgJgoACYAKCiYmoCYAKAAmCgAJgoCYAKAmCgAAAAAAAAAAAJgoCYAAKACiYmoACYKACiYmoAAAACYAAAKAAmCgAAAAAAJgoCYAKAAmACgJgAAoAAACYoCYAACgomJqAAAAmCgAAAJgoCYKAAmACgJgoAACYAAAoACYCgAJgoKJiagJgoCYKAAmCgomJqAmCgAAJgAoCYKAAmCgJgoAKJiYACgAAJgAAoAAAAAACYAAKAAACiYmAAoAACYKAAmKAAmCgJgAKAAAmCgAAJigAJgAKAAmKAmoAAAAACYAAAKAAAmCgAAAJgoCYKAmAACgAAAAAAJgAoCYKAAAACiYmAoAACYKAmCgomJqAAmCgAAJgAoCYKAmACgAAomJqAAAAmCgJgoCYKAmCgAJgoCYKAmCgAJigJgKAmACgJgoACYKAAAAAACiYmAAAAoACYAAoCYCgJigAAJgKAAmKAmoCYKCiYmoCYKAmAAACgAAAJgAAAoAACYoCagAJgAAoKJiagJgAAoAACYKAAAAAmCgJgoCYKACiYmoAAKJgCagAomJqCiYmoAKJiYCgAomJqACiYmoAAAACYAAKAAmCgAJgoAAKJgCagAJgoACYAKAAmCgJgoCYAAoCYKAAmoAAACYoCYAAKAAAmoAAKJgCagAJgoCYKAmCgAAAJgoKJiagAAAJgoACYKAAAmAAACgAAAJgoCYKCiYmoAKJiagAJgoAAKJiagomJqAACiYmoAACYAKAmCgJgAoAACYKACiYmoACYAAKAAAmACgAAAAAomJgKAmAACgAAAAJigJqAAAAmAKAAmCgAJqACiYmoACYKAAAmACgJgoACYoCYCgAAAAAAAJgoACYKAAmCgAAAAJgoACYAAKAAmCgJgoAAAKJiagJgAoCYAKAAAmCgAAomJqACiYmoACYAAAKAmAAACgJgoKJiagAJgoACYKAAAAAAAAAmAACgomJqAAAAmACgAAJgoACYKAAmAKAmAAoCYKAAAAmACgJgoAAAACYKAmKAAmAAoAAAAAAAKJiagJgoCYKAAAAAmACgAAAJgoAAAAKJiagJgoCYKACiYmoAAACYKAAAmCgJgAoAKJiagJgAoCYKAmAAACgAAAAAAJgoACYKAAAAmCgJgoACYAKAAAAmCgJgAoAAAACYKAmCgJigAJqAmCgAJigJqAAmCgJgoACYAAKAmKAAmAAoAAACYKAmACgAAJgoCYKAmCgAAJgAAoCYAAKAmCgAJgoACYAKAmCgAAAJgoACYKAACiYmoCYAKAAmACgJgoACYAAKAmAACgAAJgoAKJiagAJgoAACYKACiYmoAAAAAACYAKCiYmoACYKAAmCgJgCgAAJgAKAAAAmAACgomJqAAAAACiYAmoCYKAAAAAAmCgJgAAAAoCYKAAmCgAAAAAomJqAmCgJgoCYKCiYmoACYKAACiYmoACYAKAAmACgJgAoKJiagJgAAoCYKAAmCgomJqAAmAACgAJgoAAAAAACYKAmACgAomJqAmCgAJgAAAoCYKAAmCgAAAJigJgAAAKACiYmoCYKAAAAAmAACgJgCgJqAAmCgAAAJgoCYKAAAAAAAAmCgJgoAACYKAAmCgJgoCYAAKACiYmoAAAAACYAAAAAAAAAAKAmAAAACgAomJqAmCgAAAJgoAAAAKJiagAAAJgAAAoCYAKAmCgJgAAAAAAoCYKAmACgAAJgoACYKAAAmCgAAAAAAomJgKAAAAmKAmoCYKAmCgAAJgoAACYKAAmCgJgoAAAAACYKAmCgJgoAKJiagJgAAAoAKJiagAAJgoCYAAAKAmCgAAAJgoCYAAKCiYmoAACYKAmCgAAAomJgKAmCgJgAAAAoCYKCiYmoCYKAmCgAJgoCYKAmCgAJgoACYKAAmCgJgAAAoACYKCiYmoCYKAACiYAmoACYKAmKAmAAoCYKAAAAAmCgJgAoACYKAAmCgJgoACYAAKAmKAmoACYKAAmCgAJgoCYKAAAAAmACgomJqAAAmAACgJgAoCYKAAmKAmoCYAKAAmACgAomJqAmCgJgAAoKJiagJgoCYKCiYmoACYKCiYmoKJiagAomJgKAmCgAAAAJgACgJgKAmACgAAAomJqACiYAmAAoCYoCagAAAAJgAoCYKAAAAmACgJgoCYKAAAmAAACgomJqAmACgAAAomAJqCiYmoAAAAKJiagJgAoACYKAmAAACgJgoKJiagomJqAAmCgAJgoCYAAAKAAAmCgJgAoACYKAmCgJgoAAAACYKAAmAAACgAJgAAAoAACYoCYACgAomJqAmACgJgoCYAAKACiYmAoCYAKAAAAAmCgAomJqAAAmCgAAAAAAJgAoAACYKAAAmCgAAAJgoCYAKAAAAmACgAJgoACYKAAAmAACgJgoCYAKCiYmoAACYKAmCgJgoAACYAKCiYmoAACYKAAAmACgomJqAAmCgAJgoAKJiagAAAAAAAJgAoCYAKAAmCgJgAoAAAACYAoCYCgAJgoAAAACYKAAAAACiYmoAAACYKAAmACgAAomJqAmAAACgAAJgAoCYAKAmACgJgoACYKAAAmCgAJgAAoAAACYKAmCgomJqAmCgAJgAAoAAKJiagAAomAJqAAmAACgJgoCYKACiYmoAAAAAAAAACYKAmAACgJgoACYKAmCgAJgAoAACYoCagJgAoCYKAAAAAAAAmCgJgoCYAAKAAmCgAAJgAoAACYAKAmACgomJqACiYmoAKJiagJgAoAAAAKJiagJgoCYKAmCgomJqACiYmoKJiagJgoCYKAAAAAACiYmAoCYKAAmCgAAAAJgAoCYKAmACgAAJgoCYKAmCgAAAAJgACgJqAAAAAAmAACgAJgoCYoCagJgoCYKAAAAAAAmCgAAAAJgAAoCYKAAmCgAAAJgoCYKAAAmCgAJgoCYKAmCgomJqAmACgAJgoAACYAKAAAmCgAAAAAAAAAAJgoAAACYKAAmCgAAAAJgoACYKAAAAmCgJgAAAAAoCYKAAAAAAAmCgAAAJgoACYKAAAAAAmAKAmoAKJiagJgoKJiagAAJgoKJiagAAJgoCYKAmCgAAAAAAJgAoAACYKAAmCgJgoACYKAAAmAACgJgoACYKAmACgAJgoCYKAAAAAAmCgAAAomJqAAAAAAAmCgAJgoCYKAmAACgJgoACYAKAAmACgAAomJqAmAAACgJgoAACYKAAmCgJgoACYKAAAmKAAAmCgAJgAAoACYAKAmACgJgAAoCYAAKAAAAAmCgAAAAAJgAoCYKAmAACgJgAAAoCYKAAAAAAmACgAJgoAAACYKAAmCgJgoCYKAAAAAAmACgJgAoCYKAmCgAAJgAAAAoACYAKAAmCgJgoAACYKAAAAmCgJgAAoACYKAAmCgAAP/Z', '2025-10-19 13:37:48', '2025-10-19 13:48:28');
INSERT INTO `settings` (`id`, `key`, `value`, `created_at`, `updated_at`) VALUES
(7, 'enableCod', '1', '2025-10-19 13:37:48', '2025-10-26 13:04:15'),
(8, 'enableMomo', '0', '2025-10-19 13:37:48', '2025-10-26 13:04:15'),
(9, 'momoPartnerCode', NULL, '2025-10-19 13:37:48', '2025-10-19 13:37:48'),
(10, 'momoAccessKey', NULL, '2025-10-19 13:37:48', '2025-10-19 13:37:48'),
(11, 'momoSecretKey', NULL, '2025-10-19 13:37:48', '2025-10-19 13:37:48'),
(12, 'momoUrl', NULL, '2025-10-19 13:37:48', '2025-10-19 13:37:48'),
(13, 'enableVnpay', '1', '2025-10-19 13:37:48', '2025-10-26 13:04:15'),
(14, 'vnpayTmnCode', 'PDYGBW25', '2025-10-19 13:37:48', '2025-10-26 13:04:15'),
(15, 'vnpayHashSecret', '9JZMJKHIIGMK6K9NDH0E9N3W540ZZK9M', '2025-10-19 13:37:48', '2025-10-26 13:04:15'),
(16, 'vnpayUrl', 'https://sandbox.vnpayment.vn/paymentv2/vpcpay.html', '2025-10-19 13:37:48', '2025-10-26 13:04:15'),
(17, 'GHN_BASE_URL', NULL, '2025-10-19 13:37:48', '2025-10-19 13:37:48'),
(18, 'GHN_API_TOKEN', '5936d70f-b273-11f0-9be4-ea98c4bd6ea3', '2025-10-19 13:37:48', '2025-10-26 13:58:48'),
(19, 'GHN_SHOP_ID', '6082991', '2025-10-19 13:37:48', '2025-11-27 13:59:46'),
(20, 'smtpHost', 'smtp.gmail.com', '2025-10-19 13:37:48', '2025-10-26 14:23:12'),
(21, 'smtpPort', '587', '2025-10-19 13:37:48', '2025-10-26 14:23:12'),
(22, 'smtpUser', 'truongnp.21it@vku.udn.vn', '2025-10-19 13:37:48', '2025-10-26 14:23:12'),
(23, 'smtpPass', 'ggay uypi xfyr pskl', '2025-10-19 13:37:48', '2025-10-26 14:23:12'),
(24, 'emailFrom', 'truongnp.21it@vku.udn.vn', '2025-10-19 13:37:48', '2025-10-26 14:23:12'),
(25, 'banners', NULL, '2025-10-19 13:37:48', '2025-10-19 13:37:48');

-- --------------------------------------------------------

--
-- Table structure for table `stock_movements`
--

CREATE TABLE `stock_movements` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` enum('import','export') NOT NULL,
  `reference` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `stock_movements`
--

INSERT INTO `stock_movements` (`id`, `type`, `reference`, `user_id`, `note`, `created_at`, `updated_at`, `deleted_at`) VALUES
(3, 'import', NULL, 13, NULL, '2025-10-26 14:53:51', '2025-10-26 14:53:51', NULL),
(4, 'import', NULL, 13, NULL, '2025-10-26 14:55:02', '2025-10-26 14:55:02', NULL),
(5, 'import', NULL, 13, NULL, '2025-10-26 14:55:29', '2025-10-26 14:55:29', NULL),
(6, 'import', NULL, 13, NULL, '2025-10-26 14:56:02', '2025-10-26 14:56:02', NULL),
(7, 'import', NULL, 13, NULL, '2025-10-28 06:10:54', '2025-10-28 06:10:54', NULL),
(8, 'import', NULL, 13, NULL, '2025-10-28 06:11:25', '2025-10-28 06:11:25', NULL),
(9, 'import', NULL, 13, NULL, '2025-10-28 06:11:59', '2025-10-28 06:11:59', NULL),
(10, 'import', NULL, 13, NULL, '2025-10-28 06:12:44', '2025-10-28 06:12:44', NULL),
(11, 'import', NULL, 13, NULL, '2025-10-28 06:13:06', '2025-10-28 06:13:06', NULL),
(12, 'import', NULL, 13, NULL, '2025-10-28 06:13:51', '2025-10-28 06:13:51', NULL),
(13, 'import', NULL, 13, NULL, '2025-10-28 06:14:19', '2025-10-28 06:14:19', NULL),
(14, 'import', NULL, 13, NULL, '2025-10-28 06:14:55', '2025-10-28 06:14:55', NULL),
(15, 'import', NULL, 13, NULL, '2025-10-28 06:15:18', '2025-10-28 06:15:18', NULL),
(16, 'import', NULL, 13, NULL, '2025-10-28 06:15:59', '2025-10-28 06:15:59', NULL),
(17, 'export', NULL, 14, 'Xuất kho khi đặt hàng #1', '2025-11-27 15:07:56', '2025-11-27 15:07:56', NULL),
(18, 'export', NULL, 14, 'Xuất kho khi đặt hàng #2', '2025-11-28 03:06:51', '2025-11-28 03:06:51', NULL),
(19, 'import', NULL, 13, 'AT-NIKE-BLK-L', '2025-12-28 15:22:10', '2025-12-28 15:22:10', NULL),
(20, 'import', NULL, 13, 'AT-NIKE-BLK-L', '2025-12-28 15:22:56', '2025-12-28 15:22:56', NULL),
(21, 'import', NULL, 13, 'AT-NIKE-BLK-L', '2025-12-28 15:24:03', '2025-12-28 15:24:03', NULL),
(22, 'import', NULL, 13, 'AT-NIKE-BLK-L', '2025-12-28 15:25:03', '2025-12-28 15:25:03', NULL),
(23, 'import', NULL, 13, 'AT-NIKE-BLK-L', '2025-12-28 15:25:56', '2025-12-28 15:25:56', NULL),
(24, 'import', NULL, 13, 'ASM-UNI-WHT-L', '2025-12-28 15:27:22', '2025-12-28 15:27:22', NULL),
(25, 'import', NULL, 13, 'ASM-UNI-WHT-M', '2025-12-28 15:28:19', '2025-12-28 15:28:19', NULL),
(26, 'import', NULL, 13, 'ASM-UNI-WHT-XL', '2025-12-28 15:29:03', '2025-12-28 15:29:03', NULL),
(27, 'import', NULL, 13, 'QUNJ-731946', '2025-12-28 16:28:00', '2025-12-28 16:28:00', NULL),
(28, 'import', NULL, 13, 'QUNJ-731946', '2025-12-28 16:28:29', '2025-12-28 16:28:29', NULL),
(29, 'import', NULL, 13, 'OKHO-878100', '2025-12-28 16:29:29', '2025-12-28 16:29:29', NULL),
(30, 'import', NULL, 13, 'VYDH-684548', '2025-12-28 16:31:28', '2025-12-28 16:31:28', NULL),
(31, 'import', NULL, 13, 'OLEN-841274', '2025-12-28 16:32:35', '2025-12-28 16:32:35', NULL),
(32, 'import', NULL, 13, 'OSMI-010081', '2025-12-28 16:33:57', '2025-12-28 16:33:57', NULL),
(33, 'import', NULL, 13, 'ASM-UNI-NAV-L', '2025-12-28 16:35:17', '2025-12-28 16:35:17', NULL),
(34, 'import', NULL, 13, 'ASM-UNI-NAV-L', '2025-12-28 16:36:42', '2025-12-28 16:36:42', NULL),
(35, 'import', NULL, 13, 'AT-NIKE-BLU-M', '2025-12-28 16:38:21', '2025-12-28 16:38:21', NULL),
(36, 'export', NULL, 13, 'Xuất kho khi đặt hàng #3', '2025-12-28 18:33:01', '2025-12-28 18:33:01', NULL),
(37, 'export', NULL, 14, 'Xuất kho khi đặt hàng #4', '2025-12-29 16:10:38', '2025-12-29 16:10:38', NULL),
(38, 'export', NULL, 14, 'Xuất kho khi đặt hàng #5', '2025-12-29 16:16:56', '2025-12-29 16:16:56', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `stock_movement_items`
--

CREATE TABLE `stock_movement_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `stock_movement_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `variant_id` bigint(20) UNSIGNED NOT NULL,
  `unit_price` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `stock_movement_items`
--

INSERT INTO `stock_movement_items` (`id`, `stock_movement_id`, `quantity`, `created_at`, `updated_at`, `deleted_at`, `variant_id`, `unit_price`) VALUES
(3, 4, 30, '2025-10-26 14:55:02', '2025-10-26 14:55:02', NULL, 36, 80000),
(4, 4, 15, '2025-10-26 14:55:02', '2025-10-26 14:55:02', NULL, 37, 700000),
(5, 4, 18, '2025-10-26 14:55:02', '2025-10-26 14:55:02', NULL, 40, 100000),
(6, 5, 19, '2025-10-26 14:55:29', '2025-10-26 14:55:29', NULL, 39, 90000),
(7, 6, 18, '2025-10-26 14:56:02', '2025-10-26 14:56:02', NULL, 38, 700000),
(8, 7, 30, '2025-10-28 06:10:54', '2025-10-28 06:10:54', NULL, 31, 120000),
(9, 8, 40, '2025-10-28 06:11:25', '2025-10-28 06:11:25', NULL, 35, 130000),
(10, 9, 40, '2025-10-28 06:11:59', '2025-10-28 06:11:59', NULL, 32, 100000),
(11, 10, 40, '2025-10-28 06:12:44', '2025-10-28 06:12:44', NULL, 34, 120000),
(12, 11, 40, '2025-10-28 06:13:06', '2025-10-28 06:13:06', NULL, 33, 100000),
(13, 12, 30, '2025-10-28 06:13:51', '2025-10-28 06:13:51', NULL, 30, 100000),
(14, 13, 40, '2025-10-28 06:14:19', '2025-10-28 06:14:19', NULL, 27, 100000),
(15, 14, 40, '2025-10-28 06:14:55', '2025-10-28 06:14:55', NULL, 29, 100000),
(16, 14, 40, '2025-10-28 06:14:55', '2025-10-28 06:14:55', NULL, 28, 100000),
(17, 15, 40, '2025-10-28 06:15:18', '2025-10-28 06:15:18', NULL, 26, 100000),
(20, 18, 1, '2025-11-28 03:06:51', '2025-11-28 03:06:51', NULL, 36, 599000),
(31, 27, 130, '2025-12-28 16:28:00', '2025-12-28 16:28:00', NULL, 60, 120000),
(32, 28, 180, '2025-12-28 16:28:29', '2025-12-28 16:28:29', NULL, 59, 130000),
(33, 29, 150, '2025-12-28 16:29:29', '2025-12-28 16:29:29', NULL, 57, 200000),
(34, 29, 140, '2025-12-28 16:29:29', '2025-12-28 16:29:29', NULL, 58, 180000),
(35, 30, 180, '2025-12-28 16:31:28', '2025-12-28 16:31:28', NULL, 55, 300000),
(36, 30, 200, '2025-12-28 16:31:28', '2025-12-28 16:31:28', NULL, 56, 320000),
(37, 31, 140, '2025-12-28 16:32:35', '2025-12-28 16:32:35', NULL, 53, 230000),
(38, 31, 190, '2025-12-28 16:32:35', '2025-12-28 16:32:35', NULL, 54, 220000),
(39, 32, 170, '2025-12-28 16:33:57', '2025-12-28 16:33:57', NULL, 51, 130000),
(40, 32, 300, '2025-12-28 16:33:57', '2025-12-28 16:33:57', NULL, 52, 130000),
(41, 33, 150, '2025-12-28 16:35:17', '2025-12-28 16:35:17', NULL, 50, 120000),
(42, 34, 150, '2025-12-28 16:36:42', '2025-12-28 16:36:42', NULL, 49, 120000),
(43, 34, 140, '2025-12-28 16:36:42', '2025-12-28 16:36:42', NULL, 48, 120000),
(44, 34, 140, '2025-12-28 16:36:42', '2025-12-28 16:36:42', NULL, 47, 120000),
(45, 34, 150, '2025-12-28 16:36:42', '2025-12-28 16:36:42', NULL, 46, 120000),
(46, 35, 140, '2025-12-28 16:38:21', '2025-12-28 16:38:21', NULL, 41, 130000),
(47, 35, 120, '2025-12-28 16:38:21', '2025-12-28 16:38:21', NULL, 42, 130000),
(48, 35, 160, '2025-12-28 16:38:21', '2025-12-28 16:38:21', NULL, 43, 130000),
(49, 35, 120, '2025-12-28 16:38:21', '2025-12-28 16:38:21', NULL, 44, 120000),
(50, 35, 120, '2025-12-28 16:38:21', '2025-12-28 16:38:21', NULL, 45, 120000),
(51, 36, 1, '2025-12-28 18:33:01', '2025-12-28 18:33:01', NULL, 54, 499000),
(52, 37, 1, '2025-12-29 16:10:38', '2025-12-29 16:10:38', NULL, 48, 299000),
(53, 38, 1, '2025-12-29 16:16:56', '2025-12-29 16:16:56', NULL, 36, 599000);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `dateOfBirth` date DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT 'user',
  `oauth_provider` varchar(255) DEFAULT NULL,
  `oauth_id` varchar(255) DEFAULT NULL,
  `otp` varchar(255) DEFAULT NULL,
  `otp_expires_at` timestamp NULL DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `ip_user` varchar(255) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `phone`, `avatar`, `gender`, `dateOfBirth`, `password`, `role`, `oauth_provider`, `oauth_id`, `otp`, `otp_expires_at`, `status`, `ip_user`, `note`, `created_at`, `updated_at`, `deleted_at`) VALUES
(13, 'admin', 'truongnp.21it@vku.udn.vn', '0123456789', 'avatars/admin.jpg', 'male', '1990-01-01', '$2y$12$E2zI7EN0LMvjCMzbsuarcufCJHPY9/IBCu51HXXLvki61RJPhnkGq', 'admin', NULL, NULL, NULL, NULL, 1, '127.0.0.1', 'Quản trị viên hệ thống', '2025-10-05 15:58:12', '2025-10-05 16:23:22', NULL),
(14, 'nguyenvana', 'phuctruong03qt@gmail.com', '0987654321', '/storage/avatars/wyU6RttrVMcXJrtBXXgmWnuUcqtJAAlqVAcSeO79.png', 'male', '1995-05-15', '$2y$12$DQjFQZb3BKfd9xDbvOV95.WO6kzu5wh4xfL1HdkupXvSCe8fTA3TW', 'user', 'google', '115052044730571573619', NULL, NULL, 1, '127.0.0.1', NULL, '2025-10-05 15:58:12', '2025-11-27 16:20:05', NULL),
(15, 'tranthib', 'tranthib@gmail.com', '0912345678', 'avatars/user2.jpg', 'female', '1998-08-20', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', NULL, NULL, NULL, NULL, 1, '192.168.1.3', NULL, '2025-10-05 15:58:12', '2025-10-05 15:58:12', NULL),
(16, 'levanc', 'levanc@gmail.com', '0923456789', 'avatars/user3.jpg', 'male', '1992-12-10', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', NULL, NULL, NULL, NULL, 1, '192.168.1.4', NULL, '2025-10-05 15:58:12', '2025-10-05 15:58:12', NULL),
(17, 'phamthid', 'phamthid@gmail.com', '0934567890', 'avatars/user4.jpg', 'female', '1996-03-25', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', NULL, NULL, NULL, NULL, 1, '192.168.1.5', NULL, '2025-10-05 15:58:12', '2025-10-05 15:58:12', NULL),
(18, 'admin', 'admin@devgang.com', '0123456789', NULL, 'male', NULL, '$2y$12$8BDAUHo7lAyYNhc.hzK5.OJkau1gsuwQWMGvtkHp0zkCxJa6ooJHS', 'admin', NULL, NULL, NULL, NULL, 1, NULL, NULL, '2025-10-26 14:41:46', '2025-10-26 14:41:46', NULL),
(21, 'truong', 'annp.24it@vku.udn.vn', NULL, NULL, NULL, NULL, '$2y$12$JYgrysI.sW2kU0zH2OTlYu2O6sJpO4vds1bAc3QQfzmb03bgi2qwS', 'user', NULL, NULL, '579075', '2025-12-29 13:44:37', 0, '127.0.0.1', NULL, '2025-12-29 13:08:51', '2025-12-29 13:34:37', NULL),
(23, 'truong', 'nguyenkyvy112az@gmail.com', NULL, NULL, NULL, NULL, '$2y$12$PCDoQcuUKa.iOeC8l7/.y.oGQc3tpRibs.VbaXCWG2v6BCUkqcWTK', 'user', NULL, NULL, '510255', '2025-12-29 14:09:22', 1, '127.0.0.1', NULL, '2025-12-29 13:46:22', '2025-12-29 13:59:22', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `variants`
--

CREATE TABLE `variants` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `color` varchar(255) DEFAULT NULL,
  `size` varchar(255) DEFAULT NULL,
  `price` int(11) NOT NULL,
  `sku` varchar(255) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 0,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `variants`
--

INSERT INTO `variants` (`id`, `color`, `size`, `price`, `sku`, `quantity`, `product_id`, `created_at`, `updated_at`) VALUES
(26, 'Đen', 'S', 899000, 'VL-ZARA-BLK-S', 0, 5, '2025-10-19 12:43:11', '2025-10-19 12:43:11'),
(27, 'Đen', 'M', 899000, 'VL-ZARA-BLK-M', 0, 5, '2025-10-19 12:43:11', '2025-10-19 12:43:11'),
(28, 'Xanh navy', 'S', 899000, 'VL-ZARA-NAV-S', 0, 5, '2025-10-19 12:43:11', '2025-10-19 12:43:11'),
(29, 'Xanh navy', 'M', 899000, 'VL-ZARA-NAV-M', 0, 5, '2025-10-19 12:43:11', '2025-10-19 12:43:11'),
(30, 'Đỏ', 'S', 899000, 'VL-ZARA-RED-S', 0, 5, '2025-10-19 12:43:11', '2025-10-19 12:43:11'),
(31, 'Trắng', 'S', 199000, 'AT-HM-WHT-S', 0, 4, '2025-10-19 12:44:38', '2025-10-19 12:44:38'),
(32, 'Trắng', 'M', 199000, 'AT-HM-WHT-M', 0, 4, '2025-10-19 12:44:38', '2025-10-19 12:44:38'),
(33, 'Hồng', 'S', 199000, 'AT-HM-PNK-S', 0, 4, '2025-10-19 12:44:38', '2025-10-19 12:44:38'),
(34, 'Hồng', 'M', 199000, 'AT-HM-PNK-M', 0, 4, '2025-10-19 12:44:38', '2025-10-19 12:44:38'),
(35, 'Xanh lá', 'S', 199000, 'AT-HM-GRN-S', 0, 4, '2025-10-19 12:44:38', '2025-10-19 12:44:38'),
(36, 'Xanh đậm', '30', 599000, 'QJ-ZARA-BLU-30', 0, 3, '2025-10-19 13:02:49', '2025-10-19 13:02:49'),
(37, 'Xanh đậm', '32', 599000, 'QJ-ZARA-BLU-32', 0, 3, '2025-10-19 13:02:49', '2025-10-19 13:02:49'),
(38, 'Xanh đậm', '34', 599000, 'QJ-ZARA-BLU-34', 0, 3, '2025-10-19 13:02:49', '2025-10-19 13:02:49'),
(39, 'Đen', '30', 599000, 'QJ-ZARA-BLK-30', 0, 3, '2025-10-19 13:02:49', '2025-10-19 13:02:49'),
(40, 'Đen', '32', 599000, 'QJ-ZARA-BLK-32', 0, 3, '2025-10-19 13:02:49', '2025-10-19 13:02:49'),
(41, 'Trắng', 'M', 399000, 'AT-NIKE-WHT-M', 0, 2, '2025-12-28 16:02:29', '2025-12-28 16:02:29'),
(42, 'Trắng', 'L', 399000, 'AT-NIKE-WHT-L', 0, 2, '2025-12-28 16:02:29', '2025-12-28 16:02:29'),
(43, 'Đen', 'M', 399000, 'AT-NIKE-BLK-M', 0, 2, '2025-12-28 16:02:29', '2025-12-28 16:02:29'),
(44, 'Đen', 'L', 399000, 'AT-NIKE-BLK-L', 0, 2, '2025-12-28 16:02:29', '2025-12-28 16:02:29'),
(45, 'Xanh', 'M', 399000, 'AT-NIKE-BLU-M', 0, 2, '2025-12-28 16:02:29', '2025-12-28 16:02:29'),
(46, 'Trắng', 'M', 299000, 'ASM-UNI-WHT-M', 0, 1, '2025-12-28 16:07:59', '2025-12-28 16:07:59'),
(47, 'Trắng', 'L', 299000, 'ASM-UNI-WHT-L', 0, 1, '2025-12-28 16:07:59', '2025-12-28 16:07:59'),
(48, 'Trắng', 'XL', 299000, 'ASM-UNI-WHT-XL', 0, 1, '2025-12-28 16:07:59', '2025-12-28 16:07:59'),
(49, 'Xanh navy', 'M', 299000, 'ASM-UNI-NAV-M', 0, 1, '2025-12-28 16:07:59', '2025-12-28 16:07:59'),
(50, 'Xanh navy', 'L', 299000, 'ASM-UNI-NAV-L', 0, 1, '2025-12-28 16:07:59', '2025-12-28 16:07:59'),
(51, 'Màu Hồng', 'M', 399000, 'OSMI-151034', 0, 6, '2025-12-28 16:16:41', '2025-12-28 16:16:41'),
(52, 'Áo sơ kẻ dài tay nữ uniqlo', 'S', 399000, 'OSMI-010081', 0, 6, '2025-12-28 16:16:41', '2025-12-28 16:16:41'),
(53, 'Xanh cây đậm', 'XL', 499000, 'OLEN-399537', 0, 10, '2025-12-28 16:19:05', '2025-12-28 16:19:05'),
(54, 'Be', 'XL', 499000, 'OLEN-841274', 0, 10, '2025-12-28 16:19:05', '2025-12-28 16:19:05'),
(55, 'Đỏ', 'L', 15999000, 'VYDH-621882', 0, 9, '2025-12-28 16:20:44', '2025-12-28 16:20:44'),
(56, 'Tím', 'L', 15999000, 'VYDH-684548', 0, 9, '2025-12-28 16:20:44', '2025-12-28 16:20:44'),
(57, 'Đen', 'XL', 1299000, 'OKHO-679493', 0, 8, '2025-12-28 16:21:48', '2025-12-28 16:21:48'),
(58, 'Đen xám', 'XXl', 1299000, 'OKHO-878100', 0, 8, '2025-12-28 16:21:49', '2025-12-28 16:21:49'),
(59, 'Xanh đậm', 'L', 399000, 'QUNJ-092604', 0, 7, '2025-12-28 16:23:18', '2025-12-28 16:23:18'),
(60, 'Xanh nhạt', 'L', 399000, 'QUNJ-731946', 0, 7, '2025-12-28 16:23:18', '2025-12-28 16:23:18');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `addresses_user_id_foreign` (`user_id`);

--
-- Indexes for table `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `blogs_slug_unique` (`slug`),
  ADD KEY `blogs_blog_category_id_foreign` (`blog_category_id`);

--
-- Indexes for table `blog_categories`
--
ALTER TABLE `blog_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `blog_categories_slug_unique` (`slug`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `brands_slug_unique` (`slug`),
  ADD KEY `brands_parent_id_foreign` (`parent_id`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `carts_user_id_foreign` (`user_id`),
  ADD KEY `carts_variant_id_foreign` (`variant_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`),
  ADD KEY `categories_parent_id_foreign` (`parent_id`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `coupons_code_unique` (`code`);

--
-- Indexes for table `coupon_user`
--
ALTER TABLE `coupon_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `coupon_user_user_id_coupon_id_unique` (`user_id`,`coupon_id`),
  ADD KEY `coupon_user_coupon_id_foreign` (`coupon_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `favorite_products`
--
ALTER TABLE `favorite_products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `favorite_products_user_id_product_slug_unique` (`user_id`,`product_slug`),
  ADD KEY `favorite_products_product_slug_foreign` (`product_slug`);

--
-- Indexes for table `flash_sales`
--
ALTER TABLE `flash_sales`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `flash_sale_products`
--
ALTER TABLE `flash_sale_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `flash_sale_products_flash_sale_id_foreign` (`flash_sale_id`),
  ADD KEY `flash_sale_products_product_id_foreign` (`product_id`);

--
-- Indexes for table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `images_product_id_foreign` (`product_id`),
  ADD KEY `images_variant_id_foreign` (`variant_id`);

--
-- Indexes for table `inventories`
--
ALTER TABLE `inventories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `inventories_variant_id_foreign` (`variant_id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messengers`
--
ALTER TABLE `messengers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `messengers_user1_id_user2_id_unique` (`user1_id`,`user2_id`),
  ADD KEY `messengers_user2_id_foreign` (`user2_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `orders_tracking_code_unique` (`tracking_code`),
  ADD KEY `orders_user_id_foreign` (`user_id`),
  ADD KEY `orders_address_id_foreign` (`address_id`),
  ADD KEY `orders_coupon_id_foreign` (`coupon_id`);

--
-- Indexes for table `orders_details`
--
ALTER TABLE `orders_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_details_order_id_foreign` (`order_id`),
  ADD KEY `orders_details_variant_id_foreign` (`variant_id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pages_slug_unique` (`slug`),
  ADD KEY `pages_created_by_foreign` (`created_by`),
  ADD KEY `pages_updated_by_foreign` (`updated_by`),
  ADD KEY `pages_type_status_index` (`type`,`status`),
  ADD KEY `pages_sort_order_index` (`sort_order`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_slug_unique` (`slug`),
  ADD KEY `products_categories_id_foreign` (`categories_id`),
  ADD KEY `products_brand_id_foreign` (`brand_id`);

--
-- Indexes for table `product_reviews`
--
ALTER TABLE `product_reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_reviews_user_id_foreign` (`user_id`),
  ADD KEY `product_reviews_product_slug_foreign` (`product_slug`),
  ADD KEY `product_reviews_parent_id_foreign` (`parent_id`);

--
-- Indexes for table `review_images`
--
ALTER TABLE `review_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `review_images_review_id_foreign` (`review_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_key_unique` (`key`);

--
-- Indexes for table `stock_movements`
--
ALTER TABLE `stock_movements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `stock_movements_user_id_foreign` (`user_id`);

--
-- Indexes for table `stock_movement_items`
--
ALTER TABLE `stock_movement_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `stock_movement_items_stock_movement_id_foreign` (`stock_movement_id`),
  ADD KEY `stock_movement_items_variant_id_foreign` (`variant_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `variants`
--
ALTER TABLE `variants`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `variants_sku_unique` (`sku`),
  ADD KEY `variants_product_id_foreign` (`product_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `addresses`
--
ALTER TABLE `addresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blog_categories`
--
ALTER TABLE `blog_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `coupon_user`
--
ALTER TABLE `coupon_user`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `favorite_products`
--
ALTER TABLE `favorite_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `flash_sales`
--
ALTER TABLE `flash_sales`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `flash_sale_products`
--
ALTER TABLE `flash_sale_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `images`
--
ALTER TABLE `images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `inventories`
--
ALTER TABLE `inventories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `messengers`
--
ALTER TABLE `messengers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `orders_details`
--
ALTER TABLE `orders_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `product_reviews`
--
ALTER TABLE `product_reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `review_images`
--
ALTER TABLE `review_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `stock_movements`
--
ALTER TABLE `stock_movements`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `stock_movement_items`
--
ALTER TABLE `stock_movement_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `variants`
--
ALTER TABLE `variants`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `addresses`
--
ALTER TABLE `addresses`
  ADD CONSTRAINT `addresses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `blogs`
--
ALTER TABLE `blogs`
  ADD CONSTRAINT `blogs_blog_category_id_foreign` FOREIGN KEY (`blog_category_id`) REFERENCES `blog_categories` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `brands`
--
ALTER TABLE `brands`
  ADD CONSTRAINT `brands_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `brands` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `carts_variant_id_foreign` FOREIGN KEY (`variant_id`) REFERENCES `variants` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `coupon_user`
--
ALTER TABLE `coupon_user`
  ADD CONSTRAINT `coupon_user_coupon_id_foreign` FOREIGN KEY (`coupon_id`) REFERENCES `coupons` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `coupon_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `favorite_products`
--
ALTER TABLE `favorite_products`
  ADD CONSTRAINT `favorite_products_product_slug_foreign` FOREIGN KEY (`product_slug`) REFERENCES `products` (`slug`) ON DELETE CASCADE,
  ADD CONSTRAINT `favorite_products_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `flash_sale_products`
--
ALTER TABLE `flash_sale_products`
  ADD CONSTRAINT `flash_sale_products_flash_sale_id_foreign` FOREIGN KEY (`flash_sale_id`) REFERENCES `flash_sales` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `flash_sale_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `images`
--
ALTER TABLE `images`
  ADD CONSTRAINT `images_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `images_variant_id_foreign` FOREIGN KEY (`variant_id`) REFERENCES `variants` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `inventories`
--
ALTER TABLE `inventories`
  ADD CONSTRAINT `inventories_variant_id_foreign` FOREIGN KEY (`variant_id`) REFERENCES `variants` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `messengers`
--
ALTER TABLE `messengers`
  ADD CONSTRAINT `messengers_user1_id_foreign` FOREIGN KEY (`user1_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `messengers_user2_id_foreign` FOREIGN KEY (`user2_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_address_id_foreign` FOREIGN KEY (`address_id`) REFERENCES `addresses` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `orders_coupon_id_foreign` FOREIGN KEY (`coupon_id`) REFERENCES `coupons` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `orders_details`
--
ALTER TABLE `orders_details`
  ADD CONSTRAINT `orders_details_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `orders_details_variant_id_foreign` FOREIGN KEY (`variant_id`) REFERENCES `variants` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `pages`
--
ALTER TABLE `pages`
  ADD CONSTRAINT `pages_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `pages_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `products_categories_id_foreign` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `product_reviews`
--
ALTER TABLE `product_reviews`
  ADD CONSTRAINT `product_reviews_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `product_reviews` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_reviews_product_slug_foreign` FOREIGN KEY (`product_slug`) REFERENCES `products` (`slug`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_reviews_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `review_images`
--
ALTER TABLE `review_images`
  ADD CONSTRAINT `review_images_review_id_foreign` FOREIGN KEY (`review_id`) REFERENCES `product_reviews` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `stock_movements`
--
ALTER TABLE `stock_movements`
  ADD CONSTRAINT `stock_movements_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `stock_movement_items`
--
ALTER TABLE `stock_movement_items`
  ADD CONSTRAINT `stock_movement_items_stock_movement_id_foreign` FOREIGN KEY (`stock_movement_id`) REFERENCES `stock_movements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `stock_movement_items_variant_id_foreign` FOREIGN KEY (`variant_id`) REFERENCES `variants` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `variants`
--
ALTER TABLE `variants`
  ADD CONSTRAINT `variants_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
