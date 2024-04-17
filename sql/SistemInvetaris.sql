-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 17, 2024 at 07:49 AM
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
(6, 'KU0001SD', 'KURSI', 'INFORMA', 'FURNITURE', 'Sangat Baik', 'Dana Bos', 14, 15, 'SD', 'A', '1 A', '1', 350000, '2023-08-27 23:58:19', '2023-08-28 17:11:31'),
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
  `StatusPeminjaman` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Sedang Dipinjam',
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

--
-- Dumping data for table `peminjaman_barangs`
--

INSERT INTO `peminjaman_barangs` (`id`, `user_id`, `NamaPeminjam`, `StatusPeminjaman`, `KodeBarang`, `NamaBarang`, `Merek`, `Kategori`, `KondisiBarang`, `SumberDana`, `Jumlah`, `Unit`, `Status`, `created_at`, `updated_at`) VALUES
(1, 2, 'Muhammad Syahid Abdillah', 'Sudah Dipulangkan', 'KU0001SD', 'KURSI', 'INFORMA', 'FURNITURE', 'Sangat Baik', 'Dana Bos', 0, 'SD', 0, '2023-08-28 02:19:31', '2023-08-28 17:11:31');

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
  `is_admin` tinyint(1) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `is_admin`, `created_at`, `updated_at`) VALUES
(2, 'Admin', '1871122334455', NULL, '$2y$10$CDpjxqlYmswn5.MZDmvpO.mhxoZX1GIaMyiffh9oKL4anvFZJF08m', NULL, 1, '2023-07-20 21:06:49', '2023-08-20 22:00:18');

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
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
