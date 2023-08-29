-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Aug 28, 2023 at 08:10 AM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `inventaris-fix`
--

-- --------------------------------------------------------

--
-- Table structure for table `distribusis`
--

CREATE TABLE `distribusis` (
  `id` bigint UNSIGNED NOT NULL,
  `KodeBarang` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `NamaBarang` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Merek` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Kategori` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `KondisiBarang` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `SumberDana` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Jumlah` int NOT NULL,
  `Stok` int NOT NULL,
  `Unit` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Gedung` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Ruangan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Lantai` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Valuasi` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `distribusis`
--

INSERT INTO `distribusis` (`id`, `KodeBarang`, `NamaBarang`, `Merek`, `Kategori`, `KondisiBarang`, `SumberDana`, `Jumlah`, `Stok`, `Unit`, `Gedung`, `Ruangan`, `Lantai`, `Valuasi`, `created_at`, `updated_at`) VALUES
(6, 'KU0001SD', 'KURSI', 'INFORMA', 'FURNITURE', 'Sangat Baik', 'Dana Bos', 14, 14, 'SD', 'A', '1 A', '1', 350000, '2023-08-27 23:58:19', '2023-08-27 23:58:19'),
(7, 'KU0001SMPFD', 'KURSI', 'INFORMA', 'FURNITURE', 'Sangat Baik', 'Dana Sekolah', 20, 20, 'SMP FULLDAY', 'B', '8 A', '1', 350000, '2023-08-27 23:59:05', '2023-08-27 23:59:05'),
(8, 'KU0001SMPBD', 'KURSI', 'INFORMA', 'FURNITURE', 'Sangat Baik', 'Dana Bos', 10, 10, 'SMP BOARDING', 'A BD', '9 A BD', '1', 350000, '2023-08-27 23:59:54', '2023-08-27 23:59:54'),
(9, 'KU0001SMA', 'KURSI', 'INFORMA', 'FURNITURE', 'Cukup Baik', 'Dana Sekolah', 10, 10, 'SMA', 'C', '10 A', '2', 500000, '2023-08-28 00:00:57', '2023-08-28 00:00:57');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `form_pembelians`
--

CREATE TABLE `form_pembelians` (
  `id` bigint UNSIGNED NOT NULL,
  `KodeBarang` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `NamaBarang` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Merek` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Kategori` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Jumlah` int NOT NULL,
  `HargaPerUnit` int NOT NULL,
  `Valuasi` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `form_pembelians`
--

INSERT INTO `form_pembelians` (`id`, `KodeBarang`, `NamaBarang`, `Merek`, `Kategori`, `Jumlah`, `HargaPerUnit`, `Valuasi`, `created_at`, `updated_at`) VALUES
(52, 'KU0001SD', 'KURSI', 'INFORMA', 'FURNITURE', 7, 50000, 350000, '2023-08-27 21:30:43', '2023-08-27 21:30:43'),
(53, 'KU0001SD', 'KURSI', 'INFORMA', 'FURNITURE', 8, 50000, 400000, '2023-08-27 21:30:43', '2023-08-27 21:30:43'),
(54, 'KU0001SD', 'KURSI', 'INFORMA', 'FURNITURE', 9, 50000, 450000, '2023-08-27 21:30:43', '2023-08-27 21:30:43'),
(55, 'KU0001SMPFD', 'KURSI', 'INFORMA', 'FURNITURE', 7, 50000, 350000, '2023-08-27 21:30:43', '2023-08-27 21:30:43'),
(56, 'KU0001SMPFD', 'KURSI', 'INFORMA', 'FURNITURE', 8, 50000, 400000, '2023-08-27 21:30:43', '2023-08-27 21:30:43'),
(57, 'KU0001SMPFD', 'KURSI', 'INFORMA', 'FURNITURE', 9, 50000, 450000, '2023-08-27 21:30:43', '2023-08-27 21:30:43'),
(58, 'KU0001SMPBD', 'KURSI', 'INFORMA', 'FURNITURE', 7, 50000, 350000, '2023-08-27 21:30:43', '2023-08-27 21:30:43'),
(59, 'KU0001SMPBD', 'KURSI', 'INFORMA', 'FURNITURE', 8, 50000, 400000, '2023-08-27 21:30:43', '2023-08-27 21:30:43'),
(60, 'KU0001SMPBD', 'KURSI', 'INFORMA', 'FURNITURE', 9, 50000, 450000, '2023-08-27 21:30:43', '2023-08-27 21:30:43'),
(61, 'KU0001SMA', 'KURSI', 'INFORMA', 'FURNITURE', 10, 50000, 500000, '2023-08-27 21:30:43', '2023-08-27 21:30:43'),
(62, 'KU0001SMA', 'KURSI', 'INFORMA', 'FURNITURE', 11, 50000, 550000, '2023-08-27 21:30:43', '2023-08-27 21:30:43'),
(63, 'KU0001SMA', 'KURSI', 'INFORMA', 'FURNITURE', 12, 50000, 600000, '2023-08-27 21:30:43', '2023-08-27 21:30:43'),
(64, 'SP00001SD', 'SPEAKER', 'YAMAHA', 'ELECTRONIK', 7, 130000, 910000, '2023-08-27 21:30:43', '2023-08-27 21:30:43'),
(65, 'SP00001SD', 'SPEAKER', 'YAMAHA', 'ELECTRONIK', 8, 130000, 1040000, '2023-08-27 21:30:43', '2023-08-27 21:30:43'),
(66, 'SP00001SD', 'SPEAKER', 'YAMAHA', 'ELECTRONIK', 9, 130000, 1170000, '2023-08-27 21:30:43', '2023-08-27 21:30:43'),
(67, 'SP00001SMPFD', 'SPEAKER', 'YAMAHA', 'ELECTRONIK', 10, 130000, 1300000, '2023-08-27 21:30:43', '2023-08-27 21:30:43'),
(68, 'SP00001SMPFD', 'SPEAKER', 'YAMAHA', 'ELECTRONIK', 11, 130000, 1430000, '2023-08-27 21:30:43', '2023-08-27 21:30:43'),
(69, 'SP00001SMPFD', 'SPEAKER', 'YAMAHA', 'ELECTRONIK', 12, 130000, 1560000, '2023-08-27 21:30:43', '2023-08-27 21:30:43'),
(70, 'SP00001SMPBD', 'SPEAKER', 'YAMAHA', 'ELECTRONIK', 7, 130000, 910000, '2023-08-27 21:30:44', '2023-08-27 21:30:44'),
(71, 'SP00001SMPBD', 'SPEAKER', 'YAMAHA', 'ELECTRONIK', 8, 130000, 1040000, '2023-08-27 21:30:44', '2023-08-27 21:30:44'),
(72, 'SP00001SMPBD', 'SPEAKER', 'YAMAHA', 'ELECTRONIK', 9, 130000, 1170000, '2023-08-27 21:30:44', '2023-08-27 21:30:44'),
(73, 'SP00001SMA', 'SPEAKER', 'YAMAHA', 'ELECTRONIK', 7, 130000, 910000, '2023-08-27 21:30:44', '2023-08-27 21:30:44'),
(74, 'SP00001SMA', 'SPEAKER', 'YAMAHA', 'ELECTRONIK', 8, 130000, 1040000, '2023-08-27 21:30:44', '2023-08-27 21:30:44'),
(75, 'SP00001SMA', 'SPEAKER', 'YAMAHA', 'ELECTRONIK', 9, 130000, 1170000, '2023-08-27 21:30:44', '2023-08-27 21:30:44'),
(76, 'KU0001SD', 'KURSI', 'INFORMA', 'Furniture', 15, 50000, 750000, '2023-08-27 21:32:56', '2023-08-27 21:32:56');

-- --------------------------------------------------------

--
-- Table structure for table `gudangs`
--

CREATE TABLE `gudangs` (
  `id` bigint UNSIGNED NOT NULL,
  `KodeBarang` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `NamaBarang` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Merek` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Kategori` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Jumlah` int NOT NULL,
  `Stok` int NOT NULL,
  `Valuasi` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `gudangs`
--

INSERT INTO `gudangs` (`id`, `KodeBarang`, `NamaBarang`, `Merek`, `Kategori`, `Jumlah`, `Stok`, `Valuasi`, `created_at`, `updated_at`) VALUES
(9, 'KU0001SD', 'KURSI', 'INFORMA', 'FURNITURE', 53, 39, 1100000, '2023-08-27 21:31:51', '2023-08-27 23:58:19'),
(10, 'KU0001SMPFD', 'KURSI', 'INFORMA', 'FURNITURE', 24, 4, 350000, '2023-08-27 23:29:06', '2023-08-27 23:59:05'),
(11, 'KU0001SMPBD', 'KURSI', 'INFORMA', 'FURNITURE', 24, 14, 350000, '2023-08-27 23:29:31', '2023-08-27 23:59:54'),
(12, 'KU0001SMA', 'KURSI', 'INFORMA', 'FURNITURE', 33, 23, 500000, '2023-08-27 23:30:14', '2023-08-28 00:00:57');

-- --------------------------------------------------------

--
-- Table structure for table `maintenances`
--

CREATE TABLE `maintenances` (
  `id` bigint UNSIGNED NOT NULL,
  `KodeBarang` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `NamaBarang` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `MaintenanceSd` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `MaintenanceSmpBd` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `MaintenanceSmpFd` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `MaintenanceSma` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `maintenances`
--

INSERT INTO `maintenances` (`id`, `KodeBarang`, `NamaBarang`, `MaintenanceSd`, `MaintenanceSmpBd`, `MaintenanceSmpFd`, `MaintenanceSma`, `created_at`, `updated_at`) VALUES
(1, 'KU0001SD', 'KURSI', '2023-08-31', '2023-09-06', '2023-09-02', '2023-09-08', '2023-08-28 00:02:09', '2023-08-28 00:02:09');

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

CREATE TABLE `media` (
  `id` bigint UNSIGNED NOT NULL,
  `Judul` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Konten` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `published_at` date DEFAULT NULL,
  `Gambar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `media`
--

INSERT INTO `media` (`id`, `Judul`, `slug`, `Konten`, `published_at`, `Gambar`, `created_at`, `updated_at`) VALUES
(1, 'Laboratorium SMP', 'laboratorium-smp', 'Ruangan laboratorium sains yang modern dan tertata dengan rapi. Ruangan ini dipenuhi dengan peralatan ilmiah canggih yang tersebar di sepanjang dinding, menciptakan atmosfer yang penuh dengan keingintahuan dan penemuan. Cahaya lampu putih hangat terang di langit-langit memberikan pencahayaan yang optimal tanpa mengganggu pengamatan ilmiah.', NULL, 'MbvdLAqaG5lbnzamq3qHs4HuZl40Hx-metadHJuYXZhLXVuaXZlcnNpdHktXzl4UkhyTU9qZWctdW5zcGxhc2guanBn-.jpg', '2023-08-27 20:47:10', '2023-08-27 20:47:10');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2023_08_14_014811_create_form_pembelians_table', 1),
(6, '2023_08_14_020556_create_gudangs_table', 1),
(7, '2023_08_14_023720_create_distribusis_table', 2),
(8, '2023_08_14_025400_create_ruangans_table', 2),
(9, '2023_08_14_081517_create_peminjaman_barangs_table', 2),
(10, '2023_08_18_075751_create_media_table', 2),
(11, '2023_08_22_042318_create_pemulangan_barangs_table', 2),
(12, '2023_08_25_085309_create_maintenances_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `peminjaman_barangs`
--

CREATE TABLE `peminjaman_barangs` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` int NOT NULL,
  `NamaPeminjam` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `StatusPeminjaman` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `KodeBarang` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `NamaBarang` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Merek` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Kategori` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `KondisiBarang` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `SumberDana` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Jumlah` int NOT NULL,
  `Unit` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Status` int NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pemulangan_barangs`
--

CREATE TABLE `pemulangan_barangs` (
  `id` bigint UNSIGNED NOT NULL,
  `NamaPeminjam` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `KodeBarang` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Unit` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ruangans`
--

CREATE TABLE `ruangans` (
  `id` bigint UNSIGNED NOT NULL,
  `Unit` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Gedung` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Ruangan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Lantai` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ruangans`
--

INSERT INTO `ruangans` (`id`, `Unit`, `Gedung`, `Ruangan`, `Lantai`, `created_at`, `updated_at`) VALUES
(3, 'SD', 'A', '1 A', '1', '2023-08-27 21:49:54', '2023-08-27 21:49:54'),
(4, 'SD', 'A', '2 A', '1', '2023-08-27 21:49:54', '2023-08-27 21:49:54'),
(5, 'SD', 'A', '3 A', '1', '2023-08-27 21:49:54', '2023-08-27 21:49:54'),
(6, 'SD', 'A', '4 A', '1', '2023-08-27 21:49:54', '2023-08-27 21:49:54'),
(7, 'SD', 'A', '5 A', '2', '2023-08-27 21:49:54', '2023-08-27 21:49:54'),
(8, 'SD', 'A', '6 A', '2', '2023-08-27 21:49:54', '2023-08-27 21:49:54'),
(9, 'SD', 'A', '2 A', '2', '2023-08-27 21:49:54', '2023-08-27 21:49:54'),
(10, 'SD', 'A', '2 B', '2', '2023-08-27 21:49:55', '2023-08-27 21:49:55'),
(11, 'SMP FULLDAY', 'B', '7 A', '1', '2023-08-27 21:49:55', '2023-08-27 21:49:55'),
(12, 'SMP FULLDAY', 'B', '8 A', '1', '2023-08-27 21:49:55', '2023-08-27 21:49:55'),
(13, 'SMP FULLDAY', 'B', '9 A', '1', '2023-08-27 21:49:55', '2023-08-27 21:49:55'),
(14, 'SMP FULLDAY', 'B', '7 B', '2', '2023-08-27 21:49:55', '2023-08-27 21:49:55'),
(15, 'SMP FULLDAY', 'B', '8 B', '2', '2023-08-27 21:49:55', '2023-08-27 21:49:55'),
(16, 'SMP FULLDAY', 'B', '9 B', '2', '2023-08-27 21:49:55', '2023-08-27 21:49:55'),
(17, 'SMP BOARDING', 'A BD', '7 A BD', '1', '2023-08-27 21:49:55', '2023-08-27 21:49:55'),
(18, 'SMP BOARDING', 'A BD', '8 A BD', '1', '2023-08-27 21:49:55', '2023-08-27 21:49:55'),
(19, 'SMP BOARDING', 'A BD', '9 A BD', '1', '2023-08-27 21:49:55', '2023-08-27 21:49:55'),
(20, 'SMP BOARDING', 'A BD', '7 B BD', '2', '2023-08-27 21:49:55', '2023-08-27 21:49:55'),
(21, 'SMP BOARDING', 'A BD', '8 B BD', '2', '2023-08-27 21:49:55', '2023-08-27 21:49:55'),
(22, 'SMP BOARDING', 'A BD', '9 B BD', '2', '2023-08-27 21:49:56', '2023-08-27 21:49:56'),
(23, 'SMP BOARDING', 'A BD', '7 B BD', '1', '2023-08-27 21:49:56', '2023-08-27 21:49:56'),
(24, 'SMP BOARDING', 'A BD', '8 B BD', '1', '2023-08-27 21:49:56', '2023-08-27 21:49:56'),
(25, 'SMA', 'C', '10 A', '1', '2023-08-27 21:49:56', '2023-08-27 21:49:56'),
(26, 'SMA', 'C', '11 A', '2', '2023-08-27 21:49:56', '2023-08-27 21:49:56'),
(27, 'SMA', 'C', '12 A', '2', '2023-08-27 21:49:56', '2023-08-27 21:49:56'),
(28, 'SMA', 'C', '10 B', '2', '2023-08-27 21:49:56', '2023-08-27 21:49:56');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_admin` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `is_admin`, `created_at`, `updated_at`) VALUES
(2, 'Muhammad Syahid Abdillah', '1871102604950002', NULL, '$2y$10$/TWhi3lkX8C4fFqiDi4JD.iJm8PdakuJNKiMcwzo8KEAhkLipCAd6', NULL, 1, '2023-07-20 21:06:49', '2023-08-20 22:00:18'),
(3, 'Aulia Rahmat, S.Pd.', '1806010507930001', NULL, '$2y$10$81XA9s/lOMmMjgILod7bge/fmBnWn2AaxI0nqzww7Rvh/WZz4CX9y', NULL, 0, '2023-07-20 21:19:18', '2023-08-23 22:01:09'),
(4, 'Guru', 'guru@gmail.com', NULL, '$2y$10$k0Thd3V5uhX80MYgGP0xG.k2.JzjSE/WzXOOlQpwAtomIX9awgB..', NULL, 0, '2023-07-22 06:51:46', '2023-08-20 22:02:33'),
(10, 'Ahmad Hadi Setiawan, M.Pd.I.', '1809070202880005', NULL, '$2y$10$KDl5if69P73aNd8Gw02aBO1oOV5SInFkn.hSkk5OKlkUBwEKir9Pm', NULL, NULL, '2023-08-03 00:35:55', '2023-08-03 00:35:55'),
(11, 'Agung Prayitno, S.Pd.I.', '1801133108840003', NULL, '$2y$10$97iopvL0Sr/.OPpUBAk7OuQIUp0gPmIV4YpkTNih0.L/ERpF0mAXK', NULL, NULL, '2023-08-03 00:35:55', '2023-08-03 00:35:55'),
(12, 'Fatkhur Rohman, S.Pd.I., Lc., M.Pd., Gr.', '1871101609850008', NULL, '$2y$10$HgO7YA2t8azhvtAd7/0pGO4txvHuXSKhSfmcuFlCzn9At0F3Btsmq', NULL, NULL, '2023-08-03 00:35:55', '2023-08-03 00:35:55'),
(13, 'Maryanti, S.Pd.I.', '1809015702910009', NULL, '$2y$10$0/K5zUseH2wGY1sGF7mlSuDx/HqlibyYOFBudgTH6HzFsu0iV8BZe', NULL, NULL, '2023-08-03 00:35:56', '2023-08-03 00:35:56'),
(14, 'Nur Indah Gunawati, S.Si., Gr.', '1871105508810001', NULL, '$2y$10$MmZpO3Id.AiCRnEiUPgUyOa4i/98WMgR0qAECwsthph2iziD37Q4u', NULL, NULL, '2023-08-03 00:35:56', '2023-08-03 00:35:56'),
(15, 'Hendra Kurniawan, S.Pd.', '1812010205910004', NULL, '$2y$10$YEvXAeeON2E28RBIQ/9L7ubLxiHjNTypAMaSinZTxMS6Eyl570JVC', NULL, NULL, '2023-08-03 00:35:56', '2023-08-03 00:35:56'),
(16, 'Mela Marzuki, S.Pd.', '1801045911910009', NULL, '$2y$10$QQqosap0XeXM0kgP9uMWP.6TeiZAeHNronVpq/CruZUkQd4DUgUT.', NULL, NULL, '2023-08-03 00:35:56', '2023-08-03 00:35:56'),
(17, 'Aria Safitri, S.Pd., Gr.', '1871026204920008', NULL, '$2y$10$HNhcvkTU3Ryuz7jZttrVEOaA75E90nRvf8EbeBKFkyrk9U3AgnvEy', NULL, NULL, '2023-08-03 00:35:56', '2023-08-03 00:35:56'),
(18, 'Uswatun Hasanah, S.Pd.', '1871037996860002', NULL, '$2y$10$hWe3i.WvIPbCz3fySjsl2uHKgzBf5OdbA/UjFWc.jzYhIOA2xcU/2', NULL, NULL, '2023-08-03 00:35:56', '2023-08-03 00:35:56'),
(19, 'Fitri Fita Sari, S.Pd.I.', '1809074602940005', NULL, '$2y$10$KwKCbU01HjIZNTurOPykcePIKF7njCAl7HAdqp3a3LbFvTJiGWuXa', NULL, NULL, '2023-08-03 00:35:56', '2023-08-03 00:35:56'),
(20, 'Miftahul Rohman, S.Pd.', '1803081710930003', NULL, '$2y$10$DvzKb0Egv4CbmId7YD8Cl.TlizeHIGH1cOAuaylBTCKJhV5/mDnFm', NULL, NULL, '2023-08-03 00:35:57', '2023-08-03 00:35:57'),
(21, 'Fitria Tiarani, S.Pd., M.Pd.', '1803036203930001', NULL, '$2y$10$6GXQE/Gu8JbzaPlknqsAX.hVG54igL9lkkkxDMRgRi8QhhahSjknC', NULL, NULL, '2023-08-03 00:35:57', '2023-08-03 00:35:57'),
(22, 'Kinasih Cahyono, S.Pd., M.Pd.', '1871010810950004', NULL, '$2y$10$FUHCJ2yzhJncy3gjoODtyOFQRQ4hUOHnIB8pXrTYsASN0gey3ScZ6', NULL, NULL, '2023-08-03 00:35:57', '2023-08-03 00:35:57'),
(23, 'A. Faqih \'Afina Nura, S.Pd.', '1801041502950005', NULL, '$2y$10$tgirgQk6vOKvtmkIKcho/erbNerid0oD.gGIri6nwOhUP7YnTsVNa', NULL, NULL, '2023-08-03 00:35:57', '2023-08-03 00:35:57'),
(24, 'Asep Mujahid, S.Pd.', '1808011206940006', NULL, '$2y$10$0cGyZvLSXkUhSPBOJ.TxnuNrvyuF8ZzIi2uTy8xncA7lKf7VnrEaG', NULL, NULL, '2023-08-03 00:35:57', '2023-08-03 00:35:57'),
(25, 'Hasyim As\'ari, S.Pd.', '1871130506930005', NULL, '$2y$10$IyOjfA.hrWx3RYPvgNDD..o13Kjv1vAeDXd87JkdRXBqycG.qMuBu', NULL, NULL, '2023-08-03 00:35:57', '2023-08-03 00:35:57'),
(26, 'Miftahul Awaludin, S.Pd.I.', '1802012005940007', NULL, '$2y$10$7DLN2ljVxzOe6yBYc2gXXuAqKfll6EIShZQ/DIV0Q9LknOYYwpsq.', NULL, NULL, '2023-08-03 00:35:58', '2023-08-03 00:35:58'),
(27, 'Restu Dwi Aprian, S.Pd., Gr.', '1806121404950005', NULL, '$2y$10$CrXU8AYXlVUPnMoZj7T/nO/GHz1ZLwRQw/9R.6K7XuxqEyOfa/1Q2', NULL, NULL, '2023-08-03 00:35:58', '2023-08-03 00:35:58'),
(28, 'Ridho Surya Ariska, S.Pd.', '1803231205940007', NULL, '$2y$10$dsn5ZchhO1HxX3z/kr3at.dhd.6k7e9O3jpZ2PJm/NoANLAK1Omy6', NULL, NULL, '2023-08-03 00:35:58', '2023-08-03 00:35:58'),
(29, 'Siti Fathonah, S.Pd.', '1809076808950003', NULL, '$2y$10$NOUjn7pOCXn9wWvduoi3k.HmyNmtS3qmH0TgtoMGTGO4kdIAM5p6i', NULL, NULL, '2023-08-03 00:35:58', '2023-08-03 00:35:58'),
(30, 'Toni Eriyanto, S.Pd.I.', '1802010201940004', NULL, '$2y$10$0qPf8yQKytYOC1SU2BfzSeOZZvoaAf5z1YQ.YrcP6la1DBFOJHm6.', NULL, NULL, '2023-08-03 00:35:58', '2023-08-03 00:35:58'),
(31, 'Reza Ayu Amelia, S.Pd.', '1871056206970002', NULL, '$2y$10$Vy30/mo8OP06ManHKXXLYO.WwC3x5DRwsNNrZOILYtKncMwKM6pJy', NULL, NULL, '2023-08-03 00:35:58', '2023-08-03 00:35:58'),
(32, 'Septian Akbar Maulana, S.Kom', '1871022309910006', NULL, '$2y$10$jPJ2RZ6X7Xsh2bMcZiaENekYoAjr2Z9SzuqLJO5XozoaaxyIjoazu', NULL, NULL, '2023-08-03 00:35:58', '2023-08-03 00:35:58'),
(33, 'Theo Tri Ramadhan, S.Pd.', '1871122702940001', NULL, '$2y$10$0a3/N3HYfiLHA0mtXQ.DzOgYtO8pFh4Fe0jgmQ798b2/dwtGRu1AK', NULL, NULL, '2023-08-03 00:35:59', '2023-08-03 00:35:59'),
(34, 'Ana Wahyu Nurrohmah, S.Pd.', '1802235704950003', NULL, '$2y$10$klkl1B6wedtmwxVqpptkDeM7cdO8fwB4iumdfMiMRkjOvCalfRxmq', NULL, NULL, '2023-08-03 00:35:59', '2023-08-03 00:35:59'),
(35, 'Hendri Syaiful Nugraha, S.H.', '1802192509910001', NULL, '$2y$10$rXeVqh5e1UOfNEQD26xgOupKFYT4JO29gdI5U1JSV2y/174GQy6Fe', NULL, NULL, '2023-08-03 00:35:59', '2023-08-03 00:35:59'),
(36, 'Muhermansyah, S.Pd.', '1804082407910004', NULL, '$2y$10$h21nP2dX5cH5hJzQcSZ7KOsS1F.TaBMVyg88DW/UY2erNIlDaNQPi', NULL, NULL, '2023-08-03 00:35:59', '2023-08-03 00:35:59'),
(37, 'Sumaliyo, M.Pd.', '1871101409810005', NULL, '$2y$10$dYpny9xIcvvpd4SzYbbzMO4Y0D97qeaVMdlB82SoA2MzUCOKeScZi', NULL, NULL, '2023-08-03 00:35:59', '2023-08-03 00:35:59'),
(38, 'Yunda Setyowati, S.Pd.', '1803074305960004', NULL, '$2y$10$tk3LfhAv7/dWouo6VF887eWdUhU2HCBrKi62f9rMB4/bq2nGXbL5C', NULL, NULL, '2023-08-03 00:35:59', '2023-08-03 00:35:59'),
(39, 'Asep Bambang Susanto,M.Pd.', '1803131808870008', NULL, '$2y$10$yzD/jZO3KykxOj1tE1wd6Oh3M3zL3h5rFNiZrf02.xU89VUGpOijS', NULL, NULL, '2023-08-03 00:36:00', '2023-08-03 00:36:00'),
(40, 'Diah Asih Nurhayati, S.Pd. ', '1810015510960005', NULL, '$2y$10$CGA/SWejF/ZriMEVkkAlxOmYvZVbdlls7g844OBepus87M/q6lY2m', NULL, NULL, '2023-08-03 00:36:00', '2023-08-03 00:36:00'),
(41, 'Farhatunnisa, S.Pd.', '1809076504980003', NULL, '$2y$10$EJHSvs/Q1fx6B1xx/UadMeZM9AJ7K4bJi3kfBVZjRPvpO9bIOAPXG', NULL, NULL, '2023-08-03 00:36:00', '2023-08-03 00:36:00'),
(42, 'Hafidz Munir Nasrullah, S.Pd. ', '1801042709970007', NULL, '$2y$10$UGJ4/DONugpJkT0raJa/Z.Psm2MFQAvEvpDgQzczbEf.tL1MTnikS', NULL, NULL, '2023-08-03 00:36:00', '2023-08-03 00:36:00'),
(43, 'Hendri Jaya, M.Pd.', '1871102108850007', NULL, '$2y$10$lRw3GL.In3ABjYkjdN28XeHdPB0tUdxRWYprtiVc0mWWa3upk4XtK', NULL, NULL, '2023-08-03 00:36:00', '2023-08-03 00:36:00'),
(44, 'Heriansah, S.Pd.I., M.Pd.', '1603012210840001', NULL, '$2y$10$gvrzFizgYghgSm9aS4C.xumvRlss7mtjK.LTiAfOtlHDHg5Tj6Z.i', NULL, NULL, '2023-08-03 00:36:00', '2023-08-03 00:36:00'),
(45, 'Laila Ulfa, S.Pd.', '1809075405970004', NULL, '$2y$10$J/SNC8U98CCpSCBtNxZ/rOofuDSeUNrMsKYBd0c3c.g/DoJxxiJuq', NULL, NULL, '2023-08-03 00:36:00', '2023-08-03 00:36:00'),
(46, 'M. Atshil Maulana Akbar, S.Sos.', '1871102303950007', NULL, '$2y$10$YK1tiOX.QLdP3FMmZIj.b.SH58kIVM.gtYvKYwLtooCvoM7R1awE2', NULL, NULL, '2023-08-03 00:36:01', '2023-08-03 00:36:01'),
(47, 'Nasrul Waton, S.Pd.', '1802190702950003', NULL, '$2y$10$jbEkn93i15zfh63igACPLu1WzHYeidk2Kax6vlDyoQcWO2XVyLnLS', NULL, NULL, '2023-08-03 00:36:01', '2023-08-03 00:36:01'),
(48, 'Okta Syafi\'i, M.Pd.', '1802012010980001', NULL, '$2y$10$JJ4D/l5a62cDsUXBk1cSPeup5tPjCP4I5mHJuwrc77vDuMqHFDVGa', NULL, NULL, '2023-08-03 00:36:01', '2023-08-03 00:36:01'),
(49, 'Riska Lestari, S.Pd.', '1871095501970002', NULL, '$2y$10$Jb2QJ0D/Kl1ASjk1BWwXtu5ZeutD3ZEAb2VMlzT6hqAQpLcQpZODG', NULL, NULL, '2023-08-03 00:36:01', '2023-08-03 00:36:01'),
(50, 'Adi Restiawan, S.Pd., M.pd.', '1801102601970003', NULL, '$2y$10$REjY.Pv5VeL8yddiovrGmewELHDHZ/NysLbuNr4rgmwS6p8hWohF6', NULL, NULL, '2023-08-03 00:36:01', '2023-08-03 00:36:01'),
(51, 'Apriansyah Tisarna, S.Pd.', '1804111404960007', NULL, '$2y$10$/svW2cu55jg7d6Cvz6fV1etGxNtiM23XMylTVG3CosZa0EccR18wO', NULL, NULL, '2023-08-03 00:36:01', '2023-08-03 00:36:01'),
(52, 'Arif Rahman Muhayat, S.Pd.', '1801080107870054', NULL, '$2y$10$EcfHeUkaqipyoT7XbmjvSeAe6qYPknxxS6zDSS0SIVmv5rWJzYtMS', NULL, NULL, '2023-08-03 00:36:02', '2023-08-03 00:36:02'),
(53, 'Eva Itma Anna, S.Kom,. M.T.I', '1871085908850001', NULL, '$2y$10$VDm94keXCZU311wbjZB3puLYxu.cQZzhYKLNFhr1quj8VyDEuFbGe', NULL, NULL, '2023-08-03 00:36:02', '2023-08-03 00:36:02'),
(54, 'Kartika Mei Linda, S.Pd., M.Pd.', '1803085005980001', NULL, '$2y$10$alqEKyzF8r8DnmAMB/3RcetklVI0YhtM2VrEqqqyQA6J6WDKZiz6a', NULL, NULL, '2023-08-03 00:36:02', '2023-08-03 00:36:02'),
(55, 'M. Hendrian Saputra, S.Pd.', '1871061602970001', NULL, '$2y$10$zar1RVHed0xlnDBiq5ibN..XO/QO.zfHFGIGYS/CVC/UN/fsycFdG', NULL, NULL, '2023-08-03 00:36:02', '2023-08-03 00:36:02'),
(56, 'Muhamad Soim, S.Pd.', '1810051011900005', NULL, '$2y$10$xSoNs.wLpEU2zt9WbdFtROjk2LrKz0fdFLIJnkA.iJwtInBhrd/bO', NULL, NULL, '2023-08-03 00:36:02', '2023-08-03 00:36:02'),
(57, 'Ridwan Saputra, S.Pd.', '1671101302980009', NULL, '$2y$10$OwTJf8Pht5ZWQGNovpvzHuvE1rfg/DKkSKWi8fv2E6GpXi4wyzRSO', NULL, NULL, '2023-08-03 00:36:02', '2023-08-03 00:36:02'),
(58, 'Sugeng Prayitno, S.Kom.', '1801041902890009', NULL, '$2y$10$d.4ksr6mKjeJCiMMu846zuFP/lYZrNIM2uv8TGFUqVf5w87vt7M8e', NULL, NULL, '2023-08-03 00:36:02', '2023-08-03 00:36:02'),
(59, 'Yulina Winda Rahma, S.Pd., M.Pd.', '1601215507980001', NULL, '$2y$10$XO1kKS03Q0PBsI7.bOMNMOpNlCvpVrW0gCT8zmpr3tN4WuaTm/wk2', NULL, NULL, '2023-08-03 00:36:03', '2023-08-03 00:36:03'),
(60, 'Zulkarnain, S.Pd.', '1812010807970001', NULL, '$2y$10$cjQfQ1brAbhSj2lSH4Io/OVY.pfGaYznYxPS8kQLwG3n2s1oqBzKS', NULL, NULL, '2023-08-03 00:36:03', '2023-08-03 00:36:03'),
(61, 'Ahmad Thohir, S.Pd.I.', '1812012510900005', NULL, '$2y$10$cXjS8.UpiDNPvm1yCI5OReRAKMwCf.b7Zg2HoMhdACsnVw5ZH4J0i', NULL, NULL, '2023-08-03 00:36:03', '2023-08-03 00:36:03'),
(62, 'Budy Saptono, S.Pd.', '1810081209950001', NULL, '$2y$10$jkkB6XTlpw5T4igjfe/9TOBWkNwYyzRBkWe.9pgJPeQpBKO.dULsW', NULL, NULL, '2023-08-03 00:36:03', '2023-08-03 00:36:03'),
(63, 'Desy Dwi Riyana, S.Pd.', '1809046612990003', NULL, '$2y$10$ktjUDJjpuhjGW6WXbKfyTO8QFPlAbd/qBlshAXcS5mRskAZW8KP1a', NULL, NULL, '2023-08-03 00:36:03', '2023-08-03 00:36:03'),
(64, 'Dewi Rahmawati, S.Pd.', '1802205103980001', NULL, '$2y$10$4c.ki9Zp6FYphCfxLQGcWe1h1zfiLv7CTxGrVCGaNIYHHr.WR4ebu', NULL, NULL, '2023-08-03 00:36:03', '2023-08-03 00:36:03'),
(65, 'Faruq Abdur Rasyid', '1803142009980003', NULL, '$2y$10$dDsRpmC8BvKu99o4D.FpuOIfwoksxlxd/jIm8NR2aGra2HlbM6vKK', NULL, NULL, '2023-08-03 00:36:04', '2023-08-03 00:36:04'),
(66, 'Firman Rudiansyah, S.Pd.I., Lc., M.Pd.', '1801182103850010', NULL, '$2y$10$v4sLiQxeMeVAd808E4FuHeYcuUPHtCDybuOhsOlMlp8xNhtijSH2K', NULL, NULL, '2023-08-03 00:36:04', '2023-08-03 00:36:04'),
(67, 'Iwan Ansori, S.Pd. ', '1801041306830008', NULL, '$2y$10$m4dr7NMRwn0BlrKtysPsdO3tFj1xi9lvFIPvuNP1nJ0r6sT4EfrMu', NULL, NULL, '2023-08-03 00:36:04', '2023-08-03 00:36:04'),
(68, 'Khoirul Ikhwan, S.Pd.', '1809072311980005', NULL, '$2y$10$fw0AXmYLUIGcbITqVieLOelNdwcRCKCLhaeZV0ntuwHa0.X4BGzTy', NULL, NULL, '2023-08-03 00:36:04', '2023-08-03 00:36:04'),
(69, 'Luthfi Nuraini, S.Pd.', '1808015512980001', NULL, '$2y$10$mL5p4SMmGz3IGvmon0O/R.DXEaRadufF.I76UUcGPe0GjEmPmZz3a', NULL, NULL, '2023-08-03 00:36:04', '2023-08-03 00:36:04'),
(70, 'M. Abdullah Hamid, S.Pd.', '1801082010940005', NULL, '$2y$10$VYYmPKJmPRtUDkb0s58Eq.Tnsro2XZz0xt8lbCOEZ2c0JIO1beXJW', NULL, NULL, '2023-08-03 00:36:04', '2023-08-03 00:36:04'),
(71, 'Mahmud Nurdiana, S.Pd.I.', '1871013011850004', NULL, '$2y$10$5S4Sfo90PsNScFV/QTdTKuyUcfFi7eqd4gkdefMtS2w8.i0dT1tUO', NULL, NULL, '2023-08-03 00:36:04', '2023-08-03 00:36:04'),
(72, 'Muhammad Hamim Fauzi, S.Pd.I.', '1803140803920001', NULL, '$2y$10$2a43AJuX80bpICWPjXRwRuSVtgW7DA4L6mWu2DDiFdnyHonXW0g.6', NULL, NULL, '2023-08-03 00:36:05', '2023-08-03 00:36:05'),
(73, 'Muhammad Ilal Akbar, S.Pd.I.', '1810010406930007', NULL, '$2y$10$z3rMgB8.32JjqWL0yaByIu4y81/71ApvvJidAQqU3K1.rGk5HjyHu', NULL, NULL, '2023-08-03 00:36:05', '2023-08-03 00:36:05'),
(74, 'Sabanul Yamin, M.Pd.', '1803142303910001', NULL, '$2y$10$r7Kg8uFyL4s7ObDicihc7edTwbWEhMfxysa2YjWdhiB7W49Jhxf0m', NULL, NULL, '2023-08-03 00:36:05', '2023-08-03 00:36:05'),
(75, 'Septian Pratama, S.Pd., S.E.', '1871021909920002', NULL, '$2y$10$PWbcSofHYeJ0O23cMdvdIeFIcryMRv/oLpgnkcqDHrlw.fGNEco1C', NULL, NULL, '2023-08-03 00:36:05', '2023-08-03 00:36:05'),
(76, 'Tsurayya Kamilah, S.Pd.', '1871104502990004', NULL, '$2y$10$txLjjqZHD3zbKJhYIkkCYOK0wYChXZBSfODXpA11tYYkzryrZ/Zw.', NULL, NULL, '2023-08-03 00:36:05', '2023-08-03 00:36:05'),
(77, 'Yayang Ratu Mega Putri, S.Pd.', '1802204609970001', NULL, '$2y$10$nrSwib/JNv.AROZKP2PAienLr9by9CeJNkg/ffI/otT5UrtdShe1e', NULL, NULL, '2023-08-03 00:36:05', '2023-08-03 00:36:05'),
(78, 'Dian Agus Setyaningsih, S.Pd.', '1807216808960004', NULL, '$2y$10$5EEIjPo18dGOuNWDH4e16ucZi5nwjycu7h/UDZ1P.hwcHQcEBKguG', NULL, NULL, '2023-08-03 00:36:06', '2023-08-03 00:36:06'),
(79, 'Ikhlasul Amalia Wardah', '1810016205020004', NULL, '$2y$10$r0huluhT0skpQzCBb1Jl/eRlf/KGkNaMRbhN0x6K0M8Gl3mBS6SFG', NULL, NULL, '2023-08-03 00:36:06', '2023-08-03 00:36:06'),
(80, 'M. Anhar Robbany', '1871101502020002', NULL, '$2y$10$11LlupbbV9WM19EfiAtAveN1eb8BWvXOlzzebBcJlfLhcu2Mtuita', NULL, NULL, '2023-08-03 00:36:06', '2023-08-03 00:36:06'),
(81, 'Ali Akbar, S.Pd.', '1602051903952000', NULL, '$2y$10$QPv.Ya/Q1Yhb87EEMzJ.GOQ/An6d87ACD19PxDXS42kTiDEhi.xEu', NULL, NULL, '2023-08-03 00:36:06', '2023-08-03 00:36:06'),
(82, 'Ayu Piatiwi, S.Pd.', '1805026008980000', NULL, '$2y$10$PTIiffmjvtapeHX23bDu1uf8AjOr4KalhpakMx3Jgnpn32a7lHGui', NULL, NULL, '2023-08-03 00:36:06', '2023-08-03 00:36:06'),
(83, 'Muhammad Ilham, S.S.', '1871120612940000', NULL, '$2y$10$YuisgQgRcxeru7bHMNLijewt032DFiarLUwrZp09dthlOOeSYzT0O', NULL, NULL, '2023-08-03 00:36:06', '2023-08-03 00:36:06'),
(84, 'Nurul Fadhillah, S.Pd.', '1802075006850000', NULL, '$2y$10$0ZaLuFgFOFnUMu0Mm6msgets7X1LYlPF8Y37LMcH96mN.XJfpWzxC', NULL, NULL, '2023-08-03 00:36:07', '2023-08-03 00:36:07'),
(85, 'Putri agustina, S.S.', '1802175408940000', NULL, '$2y$10$yaQLkWVmjWy3bkH74d8vx.p4YYpGMHCtwu5rvsab6eG7ZPMro7AQO', NULL, NULL, '2023-08-03 00:36:07', '2023-08-03 00:36:07'),
(86, 'Rifan Winarto, S. Pd.', '1802010410970000', NULL, '$2y$10$ymRj1koNY8mNsf1rD6GQq.XuTDplnh62le/OMkMa0hmKyj591JfEm', NULL, NULL, '2023-08-03 00:36:07', '2023-08-03 00:36:07'),
(87, 'Mukhlis Zainurrahman, S.Pd.', '1803081005000000', NULL, '$2y$10$y1.H6K4YmCUErUhmKR9TcOXex94wpSyRMlJXDx7pfZU8Au6ZdaybK', NULL, NULL, '2023-08-03 00:36:07', '2023-08-03 00:36:07'),
(88, 'Abidaturrohmah, S.Pd.', '1808142903000002', NULL, '$2y$10$RZHioCesrAtzGkzqUg7ZguVZiFf499VReiThmAw33mqnrV3rFOzIe', NULL, NULL, '2023-08-03 00:36:07', '2023-08-03 00:36:07'),
(89, 'Amarullah, S.Pd.', '1803081201970002', NULL, '$2y$10$21aaK/9RulJ51fVwhuS8pe/kCeWO9yGB2qrxwXHd5EExtS60xP6NS', NULL, NULL, '2023-08-03 00:36:07', '2023-08-03 00:36:07'),
(90, 'Arip Setia Budi, M. Pd', '1811030911930001', NULL, '$2y$10$KVlX26IRZku4G2JroB2IS.FiC86aKdvqLsUMDEEE6ESqpb2uvNTke', NULL, NULL, '2023-08-03 00:36:07', '2023-08-03 00:36:07'),
(91, 'Ar Rizki Prakasa Aslamsyah, S.Pd.', '1871032910980004', NULL, '$2y$10$0ld46joxpnSRkEx2P0qXUOBhqLYU01kgXmNvs1QMXe3YcG8kZNymG', NULL, NULL, '2023-08-03 00:36:08', '2023-08-03 00:36:08'),
(92, 'Cornelia Zahra, S.Pd.', '1871126211000004', NULL, '$2y$10$cdPcIENfTR8o9dxyqExe.e.s3er.E9lW1xe9s9BxY8KjE7mp2dCJm', NULL, NULL, '2023-08-03 00:36:08', '2023-08-03 00:36:08'),
(93, 'Darul Aman, S.Pd.', '1807022503960001', NULL, '$2y$10$hJQ97O6taN1Y7ZmmCo0A1OoWIj.nzZ4INwNsMaPws1h69rUADgRCe', NULL, NULL, '2023-08-03 00:36:08', '2023-08-03 00:36:08'),
(94, 'Dhika Ari Pratama, S.Pd. ', '1871011812970002', NULL, '$2y$10$VGw9xMAQgftJiRQdZDh7leaJlzSABW7AQHGfVrAT2f98tEoHaO8CC', NULL, NULL, '2023-08-03 00:36:08', '2023-08-03 00:36:08'),
(95, 'Ely Susanti, M.Pd.', '1803086611950001', NULL, '$2y$10$oiobDqjYc7JqJpdsqUHzcOvBmhZuaQ8sVVWieAQBuKwkP.0DLMqhi', NULL, NULL, '2023-08-03 00:36:08', '2023-08-03 00:36:08'),
(96, 'Era Sapitri, S.Pd.', '1804065312970002', NULL, '$2y$10$LoF0LMX2d/v7EHrggJwPeuvBb.zvRQhxQpbvh51i8hJ6jnkexIl7W', NULL, NULL, '2023-08-03 00:36:08', '2023-08-03 00:36:08'),
(97, 'Febian Rizaldi, S.Pd.', '1801040802990006', NULL, '$2y$10$pypc5UTzEeDsMeUPbcqKWuS.Qz./.QXOw5n.cUizYU0YwO.vtiM52', NULL, NULL, '2023-08-03 00:36:09', '2023-08-03 00:36:09'),
(98, 'Indra Mulya, S.Pd.', '1802090210850004', NULL, '$2y$10$VzkyRkKvXIbPotiOCNOlG.nnK5xwHyqUaP7kxLEnsyyCbv6DCMubK', NULL, NULL, '2023-08-03 00:36:09', '2023-08-03 00:36:09'),
(99, 'Latifatul Khasanah, S.Pd.', '1904066707000002', NULL, '$2y$10$ph/Q9BCIKvnvQJrrfSfRauyCBT3sBL2hmt8eJwTrrg.iLcMOpf9X.', NULL, NULL, '2023-08-03 00:36:09', '2023-08-03 00:36:09'),
(100, 'Mhd Ibnu Hanan Al Faruqi, S.Pd.', '1804042002000005', NULL, '$2y$10$aVARqY7w/0s9sjodPKPu2O6dbx.3FJ8D3Nbe26s02S45fsaBB87Tm', NULL, NULL, '2023-08-03 00:36:09', '2023-08-03 00:36:09'),
(101, 'Mar\'atus Sholehah, S.Pd.', '1871107108970004', NULL, '$2y$10$chnrdRo30FmfViilyzQNaeAHlMHZxBXoXJIoGkpchdVcpdNshdpLe', NULL, NULL, '2023-08-03 00:36:09', '2023-08-03 00:36:09'),
(102, 'Nina Heriyati, S.Pd', '1806175010970004', NULL, '$2y$10$SFIjqZfGkn6MKGaerPGkpucSLe1sXGGI/ELfSIdIV1B0gUbUXBkC2', NULL, NULL, '2023-08-03 00:36:09', '2023-08-03 00:36:09'),
(103, 'Nola Miranda, S.Pd.', '1871136011970001', NULL, '$2y$10$7EvmmNWMXZ4yVC6Q5Jtho.7.9oVyBR9cFVvw.a0V2P6Hk3Sl17/Si', NULL, NULL, '2023-08-03 00:36:09', '2023-08-03 00:36:09'),
(104, 'Nur Lailatul Bisriyah, S.Ag', '1810044606960004', NULL, '$2y$10$p7UMTTqZgJmIq0y88UOt2O0z6T2zH3Eb5oGeowr4GZw3fHbexOB7q', NULL, NULL, '2023-08-03 00:36:09', '2023-08-03 00:36:09'),
(105, 'Prasojo, S.M.', '1804120703980004', NULL, '$2y$10$yx7qne0MWXxISkVsBOsEqek6AVcT0qH2YJTALy/llsr1l00vKJbim', NULL, NULL, '2023-08-03 00:36:10', '2023-08-03 00:36:10'),
(106, 'Riko Pangestu, S.Pd.', '1871060609960001', NULL, '$2y$10$1uF9gpbUajifhFwe0Fw/zeLuRlrCB2YNSn5OKc.x1fqn/MTYO18kG', NULL, NULL, '2023-08-03 00:36:10', '2023-08-03 00:36:10'),
(107, 'Sestika Sari, M. Pd', '1803106407970001', NULL, '$2y$10$FegpF2gwGWhLRA4cBF6.E.WAZrfFmSIUgZiEe2GMNKPZ12UMKxZU.', NULL, NULL, '2023-08-03 00:36:10', '2023-08-03 00:36:10'),
(108, 'Siti Zainab, S.Pd.', '1810054202990002', NULL, '$2y$10$IgzmJ1kERnRkFBN6XsEsZOdC.StmVKRhxSviFk/pXucTKQN7T68W2', NULL, NULL, '2023-08-03 00:36:10', '2023-08-03 00:36:10'),
(109, 'Surya Hidayat, S.Pd.', '1801072811000002', NULL, '$2y$10$CmRuCffZR0lZKMxkawgTT.HL5kxT4.ebknhMwIjmK8.5Ghc7MnjR6', NULL, NULL, '2023-08-03 00:36:10', '2023-08-03 00:36:10'),
(110, 'Thesya Alda Nia, S.Pd.', '1871044503990005', NULL, '$2y$10$6l95DD6TRoRmr73Novc63.Xj.7WTcTuQ4mpag2M6VuoQxHNa9mmNu', NULL, NULL, '2023-08-03 00:36:10', '2023-08-03 00:36:10'),
(111, 'Umi Miftahul Aprilia, S.Pd.', '1802274204980001', NULL, '$2y$10$NhKCoUH8acvS6JY412AGGOkBEpRrEJAkSSvoMBNa2sJTL.9eZ/Kc6', NULL, NULL, '2023-08-03 00:36:10', '2023-08-03 00:36:10'),
(112, 'Zahrotul Jannah, S.Pd.', '1801175610970001', NULL, '$2y$10$Sn4fEA5FG18j3P.lhY2aN.diuplHGFJj2IIho2Ey6cSXuyXZHTan.', NULL, NULL, '2023-08-03 00:36:11', '2023-08-03 00:36:11'),
(113, 'Iid Nurul Abidah, S.Pd.', '1871105811930003', NULL, '$2y$10$9LCtv36v1kEChU.plSUS0O.JuojlOpM9lxsMr1vpxjnZ6HqS2Wq4q', NULL, NULL, '2023-08-03 00:36:11', '2023-08-03 00:36:11'),
(114, 'Via Nur \'Afifah, S.Pd.', ' 1802076604000003', NULL, '$2y$10$ow59d4XHAelWIdHUddw6Au81r0.sWftVqTIY6SOZ2ANve1.cEjmEq', NULL, NULL, '2023-08-03 00:36:11', '2023-08-03 00:36:11'),
(115, 'M. Rifki Haikal Adam, S.Pd.', '1809042401000003', NULL, '$2y$10$1pB67ZNIX8zN89XNuZBKdukm43XcES7BFPD6zi4K6Ko5SYTfCkOra', NULL, NULL, '2023-08-03 00:36:11', '2023-08-03 00:36:11'),
(116, 'Aziz Prayoga,S.Pd.', '1809011804980004', NULL, '$2y$10$qKg2B.dxcXGvA9dTPXb3j.dnEIHYTwi7nPLJOG.nio5df4pwr87/S', NULL, NULL, '2023-08-03 00:36:11', '2023-08-03 00:36:11'),
(117, 'Achmad Fatih Perdana', '1807021303000002', NULL, '$2y$10$eZedv1.8zSaFKVi1kug0w.cib1OuUTvyZTs0gfITlAvLBgJfgDUMG', NULL, NULL, '2023-08-03 00:36:11', '2023-08-03 00:36:11'),
(118, 'Al Mahdi', '1803080101000001', NULL, '$2y$10$vgP6S6P8rzJBesDCFxCCz.VuNhUhqWldiYC6Grh7HjxfjjmrVWli2', NULL, NULL, '2023-08-03 00:36:12', '2023-08-03 00:36:12'),
(119, 'Husnul Hotimah, M.Pd.', '1871104203950003', NULL, '$2y$10$EiCu/YzKogr9fYySWKex0uhjGrCii55.f9m8tOFZHExJw3XKMDIA.', NULL, NULL, '2023-08-03 00:36:12', '2023-08-03 00:36:12'),
(120, 'Jihadul Akbar', '1803211609990001', NULL, '$2y$10$ktGWWtqbdXgLJb3i6sGtkug309z9gcvNTaaSXcw/SpnrTYk3MpH46', NULL, NULL, '2023-08-03 00:36:12', '2023-08-03 00:36:12'),
(121, 'Masyrifah', '1803084910000003', NULL, '$2y$10$rS1ZNx8AX32ptM3x2XVIrOnnFfSvDywB8ap6OE7lQc3pwRQZZ0PPa', NULL, NULL, '2023-08-03 00:36:12', '2023-08-03 00:36:12'),
(122, 'Mayang Fajriana', '1801076606000001', NULL, '$2y$10$/B82xeCHb2f3O0yofQgdxeh1prt/KKbEpDPCG8T8Zx6wV6UC6lhBe', NULL, NULL, '2023-08-03 00:36:12', '2023-08-03 00:36:12'),
(123, 'Miftahun Nuri, S.Pd.', '1802082707950001', NULL, '$2y$10$MWRcgcAeAUd7SB.QmQzFx..B5RBnuvpLf4cgrOLJ.tWdE5V7JtHaG', NULL, NULL, '2023-08-03 00:36:12', '2023-08-03 00:36:12'),
(124, 'Muhammad Yani', '1602051408010007', NULL, '$2y$10$lr8fSUVTbPH64pUSd3lTVeKK2bOXn5TMRmdOwy6FZeT1MVQaH.yfK', NULL, NULL, '2023-08-03 00:36:12', '2023-08-03 00:36:12'),
(125, 'Muzandia Atma, S.Pd.', '1809071103990007', NULL, '$2y$10$iKB8566Rh7tX8a2Tjhe9IeefBa45.94CgjvviFkshVVFK2p915aH6', NULL, NULL, '2023-08-03 00:36:13', '2023-08-03 00:36:13'),
(126, 'Nanda Sukmana', '1871055610000003', NULL, '$2y$10$L65WV4FHKOb4.cH3kZSvZ.Z0INfDSc4lAAEOsw3hMdzyxIY9nb.Bq', NULL, NULL, '2023-08-03 00:36:13', '2023-08-03 00:36:13'),
(127, 'Raissa Aldora', '1871015704020004', NULL, '$2y$10$v4Ylq8V0MWfjBjizJYvP4u.qrGy14oUc0xwn8mCjud0ddafi4BevW', NULL, NULL, '2023-08-03 00:36:13', '2023-08-03 00:36:13'),
(128, 'Suyitno', '1803081512000001', NULL, '$2y$10$BxQDnn.NMQOQ6oFZAQsVC.s2wj4CTJYZEENsKaVkoE/0jOD7m/88y', NULL, NULL, '2023-08-03 00:36:13', '2023-08-03 00:36:13'),
(129, 'Zaenal Abidin, S,Pd.Si.', '3471031805840002', NULL, '$2y$10$qT1IgAvwFsBmV3pL8YwcFexOANh/0M91oyKScG5skH/781I1wRCua', NULL, NULL, '2023-08-03 00:36:13', '2023-08-03 00:36:13'),
(130, 'Zahro Nur Fidiniyah', '1810056602000005', NULL, '$2y$10$Haesq7z/GUiVMzsQeFDSdOa0Ys3oau3hXqt0c1nozcrURlogP7HNu', NULL, NULL, '2023-08-03 00:36:13', '2023-08-03 00:36:13'),
(131, 'Dewi Maryam Wulandari, S.Pd.', '1803136906940002', NULL, '$2y$10$ZLkAkaj.XWwPfLFfube4WeNAgK2e1IZ7si6CKHlr6jgua/SxJjMUm', NULL, NULL, '2023-08-03 00:36:14', '2023-08-03 00:36:14'),
(132, 'Farin Fatwa Sugesty, S.Pd.', '1871024904000005', NULL, '$2y$10$de85rljBg.r.GLMGeC5e6u7519zYDM98KULlRj8XisoBrgWmYxSXi', NULL, NULL, '2023-08-03 00:36:14', '2023-08-03 00:36:14'),
(133, 'Ziah Seli Utami, S.Pd.', '1871015105000003', NULL, '$2y$10$dOmvYt.jCUSHCHCedSZA0.CHfmcNTvRTD.WaMuSmHPPgaSA9Sp7jK', NULL, NULL, '2023-08-03 00:36:14', '2023-08-03 00:36:14'),
(134, 'Aan Gus\'ap Setiawan, S.Pd.', '1801041808990012', NULL, '$2y$10$0wjpQqCP2ASUKmInUB5OpOjRJ/ijk.tDD7KqUB.xV0.JnKQrnEM7S', NULL, NULL, '2023-08-03 00:36:14', '2023-08-03 00:36:14'),
(135, 'Afiani Subhan, S.Pd.', '1804115608000001', NULL, '$2y$10$3qQWJiKY0.X2tjB7cUPkEuvvOGq1q5LopFX96ejTuzx0hkEEIbMom', NULL, NULL, '2023-08-03 00:36:14', '2023-08-03 00:36:14'),
(136, 'Chandra Ramadan, S.Pd.', '1804042512990007', NULL, '$2y$10$RD5XndO1nDAhv1Fic0e8Lu8kKEoX/9WR5sz3S500bf2veMyOxUjmm', NULL, NULL, '2023-08-03 00:36:14', '2023-08-03 00:36:14'),
(137, 'Imroatus Sholikhah, S.Pd.', '1871085612990006', NULL, '$2y$10$gSGsBhhYUP2FYuMhPbD/5eF7kXU7B/7Ve7xkYG91FeMBOgJ8SC.3.', NULL, NULL, '2023-08-03 00:36:14', '2023-08-03 00:36:14'),
(138, 'Muhammad Fathan Syah, S.Pd.', '1871120902970003', NULL, '$2y$10$jf6DDJMzPcIJt90Tvohm..bAbfl6/vmrXAG2bVDXcYsq8VetsZJ9W', NULL, NULL, '2023-08-03 00:36:15', '2023-08-03 00:36:15'),
(139, 'Nurul Ikhsana Amalia, S.Pd.', '1803012310000001', NULL, '$2y$10$Wb9ZCeRuOHMYiNwWv35qveM4GqB1TOTcHJiH5L9.QXHySy4nX5b.y', NULL, NULL, '2023-08-03 00:36:15', '2023-08-03 00:36:15'),
(140, 'Prayoga Ramadhani, S.Pd.', '1802072612990006', NULL, '$2y$10$kDWspHVwnnz5vLWHV1iple3tWdZQeY2/t67uLAOThbLIBfxm4vW2.', NULL, NULL, '2023-08-03 00:36:15', '2023-08-03 00:36:15'),
(141, 'Rizky Setiawan, S.Pd.', '1806011603990003', NULL, '$2y$10$zhGi3U/y7ASkXSqSPvUjDOuj.jpSFxmGbYS7cV6pwwOQL.Fg.DQTS', NULL, NULL, '2023-08-03 00:36:15', '2023-08-03 00:36:15'),
(142, 'Sigit Waluto, S.Pd.', '1871061001000005', NULL, '$2y$10$Te0QTagYM/CCHxT96M2SL.pxetpv1204LIENj3oYO.pTjN1/o5Qg6', NULL, NULL, '2023-08-03 00:36:15', '2023-08-03 00:36:15');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `distribusis`
--
ALTER TABLE `distribusis`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `distribusis_kodebarang_unique` (`KodeBarang`),
  ADD KEY `KodeBarang` (`KodeBarang`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `form_pembelians`
--
ALTER TABLE `form_pembelians`
  ADD PRIMARY KEY (`id`),
  ADD KEY `form_pembelians_kodebarang_index` (`KodeBarang`),
  ADD KEY `form_pembelians_hargaperunit_index` (`HargaPerUnit`);

--
-- Indexes for table `gudangs`
--
ALTER TABLE `gudangs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `gudangs_kodebarang_unique` (`KodeBarang`),
  ADD KEY `KodeBarang` (`KodeBarang`);

--
-- Indexes for table `maintenances`
--
ALTER TABLE `maintenances`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `maintenances_kodebarang_unique` (`KodeBarang`),
  ADD KEY `KodeBarang` (`KodeBarang`);

--
-- Indexes for table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `media_slug_unique` (`slug`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `peminjaman_barangs`
--
ALTER TABLE `peminjaman_barangs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `peminjaman_barangs_kodebarang_index` (`KodeBarang`),
  ADD KEY `peminjaman_barangs_unit_index` (`Unit`);

--
-- Indexes for table `pemulangan_barangs`
--
ALTER TABLE `pemulangan_barangs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pemulangan_barangs_kodebarang_index` (`KodeBarang`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `ruangans`
--
ALTER TABLE `ruangans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Unit` (`Unit`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `distribusis`
--
ALTER TABLE `distribusis`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `form_pembelians`
--
ALTER TABLE `form_pembelians`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- AUTO_INCREMENT for table `gudangs`
--
ALTER TABLE `gudangs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `maintenances`
--
ALTER TABLE `maintenances`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `media`
--
ALTER TABLE `media`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `peminjaman_barangs`
--
ALTER TABLE `peminjaman_barangs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pemulangan_barangs`
--
ALTER TABLE `pemulangan_barangs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ruangans`
--
ALTER TABLE `ruangans`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=143;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `distribusis`
--
ALTER TABLE `distribusis`
  ADD CONSTRAINT `distribusis_kodebarang_foreign` FOREIGN KEY (`KodeBarang`) REFERENCES `gudangs` (`KodeBarang`) ON DELETE RESTRICT;

--
-- Constraints for table `gudangs`
--
ALTER TABLE `gudangs`
  ADD CONSTRAINT `gudangs_kodebarang_foreign` FOREIGN KEY (`KodeBarang`) REFERENCES `form_pembelians` (`KodeBarang`) ON DELETE RESTRICT;

--
-- Constraints for table `maintenances`
--
ALTER TABLE `maintenances`
  ADD CONSTRAINT `maintenances_kodebarang_foreign` FOREIGN KEY (`KodeBarang`) REFERENCES `distribusis` (`KodeBarang`) ON DELETE RESTRICT;

--
-- Constraints for table `peminjaman_barangs`
--
ALTER TABLE `peminjaman_barangs`
  ADD CONSTRAINT `peminjaman_barangs_kodebarang_foreign` FOREIGN KEY (`KodeBarang`) REFERENCES `distribusis` (`KodeBarang`) ON DELETE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
