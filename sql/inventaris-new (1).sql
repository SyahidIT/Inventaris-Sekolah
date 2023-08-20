-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Aug 20, 2023 at 03:18 AM
-- Server version: 8.0.30
-- PHP Version: 8.2.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `inventaris-new`
--

-- --------------------------------------------------------

--
-- Table structure for table `absens`
--

CREATE TABLE `absens` (
  `id` bigint UNSIGNED NOT NULL,
  `id_siswa` int NOT NULL,
  `tanggal` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `absens`
--

INSERT INTO `absens` (`id`, `id_siswa`, `tanggal`, `created_at`, `updated_at`) VALUES
(12, 111, '2023-08-09', '2023-08-09 00:53:14', '2023-08-09 00:53:14'),
(14, 111, '2023-08-10', '2023-08-09 17:11:18', '2023-08-09 17:11:18');

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
  `Valuasi` int DEFAULT NULL,
  `Status` int NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `distribusis`
--

INSERT INTO `distribusis` (`id`, `KodeBarang`, `NamaBarang`, `Merek`, `Kategori`, `KondisiBarang`, `SumberDana`, `Jumlah`, `Stok`, `Unit`, `Gedung`, `Ruangan`, `Lantai`, `Valuasi`, `Status`, `created_at`, `updated_at`) VALUES
(9, 'AC0001SD', 'AC', 'GREE', 'Electronik', 'Sangat Baik', 'Dana Bos', 10, 10, 'SD', 'A', '7 A FD', '1', 10000, 1, '2023-08-17 07:06:57', '2023-08-17 07:06:57'),
(10, 'AC0001SMPFD', 'AC', 'GREE', 'Electronik', 'Sangat Baik', 'Dana Sekolah', 10, 10, 'SMP Fullday', 'Gedung B', 'Kelas 7 B', '2', 20000, 1, '2023-08-17 07:21:53', '2023-08-17 07:21:53'),
(11, 'SP0001SD', 'SPEAKER', 'YAMAHA', 'Electronik', 'Sangat Baik', 'Dana Sekolah', 2, 2, 'SD', 'A', '7 A FD', '1', 20, 1, '2023-08-17 07:26:42', '2023-08-17 07:26:42');

--
-- Triggers `distribusis`
--
DELIMITER $$
CREATE TRIGGER `AddValuasiToDistribusi` BEFORE INSERT ON `distribusis` FOR EACH ROW BEGIN
    DECLARE harga_per_unit DECIMAL(10, 2);

    SELECT HargaPerUnit INTO harga_per_unit
    FROM form_pembelians
    WHERE KodeBarang = NEW.KodeBarang;

    SET NEW.Valuasi = NEW.Jumlah * harga_per_unit;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `MinusToStokGudang` AFTER INSERT ON `distribusis` FOR EACH ROW UPDATE Gudangs
    SET Stok = Stok - NEW.Jumlah
    WHERE KodeBarang = NEW.KodeBarang
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `addToStokGudang` AFTER DELETE ON `distribusis` FOR EACH ROW UPDATE Gudangs
        SET Stok = Stok + OLD.Jumlah
        WHERE KodeBarang = OLD.KodeBarang
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `form_pembelians`
--

INSERT INTO `form_pembelians` (`id`, `KodeBarang`, `NamaBarang`, `Merek`, `Kategori`, `Jumlah`, `HargaPerUnit`, `created_at`, `updated_at`) VALUES
(13, 'AC0001SMPFD', 'AC', 'GREE', 'Electronik', 10, 2000, '2023-08-17 05:00:48', '2023-08-17 05:00:48'),
(14, 'AC0001SMPBD', 'AC', 'GREE', 'Electronik', 10, 2000, '2023-08-17 05:01:47', '2023-08-17 05:01:47'),
(15, 'AC0001SMA', 'AC', 'GREE', 'Electronik', 10, 19, '2023-08-17 05:02:47', '2023-08-17 05:02:47'),
(16, 'SP0001SD', 'SPEAKER', 'YAMAHA', 'Electronik', 10, 10, '2023-08-17 05:09:10', '2023-08-17 05:09:10'),
(17, 'SP0001SMPFD', 'SPEAKER', 'YAMAHA', 'Electronik', 20, 20, '2023-08-17 05:10:57', '2023-08-17 05:10:57'),
(18, 'SP0001SMPBD', 'SPEAKER', 'YAMAHA', 'Electronik', 10, 1000, '2023-08-17 06:25:47', '2023-08-17 06:25:47'),
(19, 'SP0001SMA', 'SPEAKER', 'YAMAHA', 'Electronik', 12, 2000, '2023-08-17 06:26:52', '2023-08-17 06:26:52'),
(20, 'ME0001SD', 'MEJA', 'INFORMA', 'Furniture', 32, 32000, '2023-08-17 06:29:21', '2023-08-17 06:29:21');

--
-- Triggers `form_pembelians`
--
DELIMITER $$
CREATE TRIGGER `AddJumlahToGudang` AFTER INSERT ON `form_pembelians` FOR EACH ROW UPDATE Gudangs
    SET Jumlah = Jumlah + NEW.Jumlah,
   		Stok = Stok + NEW.Jumlah
   	WHERE KodeBarang = NEW.KodeBarang
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `AddValuasiToGudang` AFTER INSERT ON `form_pembelians` FOR EACH ROW UPDATE Gudangs
    SET Valuasi = (NEW.Jumlah * NEW.HargaPerUnit) + Valuasi
    WHERE KodeBarang = NEW.KodeBarang
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `deleteJumlahToGudang` AFTER DELETE ON `form_pembelians` FOR EACH ROW UPDATE Gudangs
    SET Jumlah = Jumlah - OLD.Jumlah,
   		Stok = Stok - OLD.Jumlah
   	WHERE KodeBarang = OLD.KodeBarang
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `deleteValuasiToGudang` AFTER DELETE ON `form_pembelians` FOR EACH ROW UPDATE Gudangs
    SET Valuasi = Valuasi - (OLD.Jumlah * OLD.HargaPerUnit)
    WHERE KodeBarang = OLD.KodeBarang
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `gudangs`
--

CREATE TABLE `gudangs` (
  `id` int NOT NULL,
  `KodeBarang` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
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
(2, 'AC0001SMA', 'AC', 'GREE', 'Electronik', 10, 10, 190, '2023-08-17 06:57:04', '2023-08-17 06:57:04'),
(3, 'AC0001SMPBD', 'AC', 'GREE', 'Electronik', 10, 10, 20000, '2023-08-17 06:55:38', '2023-08-17 06:55:38'),
(4, 'AC0001SMPFD', 'AC', 'GREE', 'Electronik', 10, 0, 20000, '2023-08-17 06:55:06', '2023-08-17 06:55:06'),
(5, 'ME0001SD', 'MEJA', 'INFORMA', 'Furniture', 32, 32, 1024000, '2023-08-17 07:02:04', '2023-08-17 07:02:04'),
(6, 'SP0001SD', 'SPEAKER', 'YAMAHA', 'Electronik', 10, 8, 100, '2023-08-17 06:57:52', '2023-08-17 06:57:52'),
(7, 'SP0001SMA', 'SPEAKER', 'YAMAHA', 'Electronik', 12, 12, 24000, '2023-08-17 07:00:57', '2023-08-17 07:00:57'),
(8, 'SP0001SMPBD', 'SPEAKER', 'YAMAHA', 'Electronik', 10, 10, 10000, '2023-08-17 07:00:17', '2023-08-17 07:00:17'),
(9, 'SP0001SMPFD', 'SPEAKER', 'YAMAHA', 'Electronik', 20, 20, 400, '2023-08-17 06:58:38', '2023-08-17 06:58:38');

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
(1, 'Laboratorium SMP', 'laboratorium-smp', 'Contoh deskripsi', NULL, '8sDF8f8zVNecphVFPOuAbHE7k8g29C-metadHJuYXZhLXVuaXZlcnNpdHktXzl4UkhyTU9qZWctdW5zcGxhc2guanBn-.jpg', '2023-08-18 02:04:52', '2023-08-18 02:04:52');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
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
(16, '2023_07_13_063445_create_data_barangs_table', 4),
(20, '2023_07_13_071451_create_data_peminjams_table', 5),
(37, '2014_10_12_100000_create_password_resets_table', 6),
(38, '2023_07_13_064537_create_data_barang_smp_fds_table', 6),
(39, '2023_07_13_064817_create_data_barang_smp_bds_table', 6),
(40, '2023_07_13_064933_create_data_barang_smas_table', 6),
(41, '2023_07_21_030432_create_permission_tables', 7),
(42, '2023_07_24_001554_create_data_ruangan_smas_table', 7),
(43, '2023_07_24_002938_create_data_ruang_smp_fds_table', 7),
(44, '2023_07_24_003035_create_data_ruang_smp_bds_table', 7),
(45, '2023_07_24_003149_create_data_barang_sds_table', 8),
(46, '2023_07_24_003312_create_data_ruang_sds_table', 8),
(47, '2023_07_26_062024_create_jadwal_maintenances_table', 9),
(48, '2023_07_26_094531_create_jadwal_maintenances_table', 10),
(49, '2023_07_27_021513_settings__table', 11),
(50, '2023_07_28_060619_create_maintenances_table', 12),
(52, '2023_08_08_064511_create_absens_table', 14),
(53, '2023_08_08_065046_create_siswas_table', 14),
(54, '2023_08_14_014811_create_form_pembelians_table', 15),
(55, '2023_08_14_020556_create_gudangs_table', 16),
(57, '2023_08_14_023720_create_distribusis_table', 17),
(58, '2023_08_14_025400_create_ruangans_table', 18),
(59, '2023_08_14_081517_create_peminjaman_barangs_table', 19),
(60, '2023_08_15_093556_create_media_table', 20),
(61, '2023_08_18_075751_create_media_table', 21);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_permissions`
--

INSERT INTO `model_has_permissions` (`permission_id`, `model_type`, `model_id`) VALUES
(3, 'App\\Models\\Role', 3),
(4, 'App\\Models\\Role', 3),
(5, 'App\\Models\\Role', 3),
(6, 'App\\Models\\Role', 3),
(3, 'App\\Models\\Role', 4),
(4, 'App\\Models\\Role', 4),
(6, 'App\\Models\\Role', 4),
(3, 'App\\Models\\Role', 5);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(3, 'App\\Models\\User', 2),
(4, 'App\\Models\\User', 3),
(5, 'App\\Models\\User', 4),
(4, 'App\\Models\\User', 10),
(4, 'App\\Models\\User', 11),
(4, 'App\\Models\\User', 12),
(5, 'App\\Models\\User', 13),
(4, 'App\\Models\\User', 14),
(4, 'App\\Models\\User', 15),
(5, 'App\\Models\\User', 16),
(4, 'App\\Models\\User', 17),
(4, 'App\\Models\\User', 18),
(5, 'App\\Models\\User', 19),
(5, 'App\\Models\\User', 20),
(5, 'App\\Models\\User', 21),
(4, 'App\\Models\\User', 22),
(5, 'App\\Models\\User', 23),
(4, 'App\\Models\\User', 24),
(4, 'App\\Models\\User', 25),
(5, 'App\\Models\\User', 26),
(5, 'App\\Models\\User', 27),
(5, 'App\\Models\\User', 28),
(5, 'App\\Models\\User', 29),
(5, 'App\\Models\\User', 30),
(5, 'App\\Models\\User', 31),
(5, 'App\\Models\\User', 32),
(5, 'App\\Models\\User', 33),
(5, 'App\\Models\\User', 34),
(5, 'App\\Models\\User', 35),
(5, 'App\\Models\\User', 36),
(5, 'App\\Models\\User', 37),
(5, 'App\\Models\\User', 38),
(5, 'App\\Models\\User', 39),
(5, 'App\\Models\\User', 40),
(5, 'App\\Models\\User', 41),
(5, 'App\\Models\\User', 42),
(5, 'App\\Models\\User', 43),
(5, 'App\\Models\\User', 44),
(5, 'App\\Models\\User', 45),
(5, 'App\\Models\\User', 46),
(5, 'App\\Models\\User', 47),
(5, 'App\\Models\\User', 48),
(5, 'App\\Models\\User', 49),
(5, 'App\\Models\\User', 50),
(5, 'App\\Models\\User', 51),
(5, 'App\\Models\\User', 52),
(5, 'App\\Models\\User', 53),
(5, 'App\\Models\\User', 54),
(5, 'App\\Models\\User', 55),
(5, 'App\\Models\\User', 56),
(5, 'App\\Models\\User', 57),
(5, 'App\\Models\\User', 58),
(5, 'App\\Models\\User', 59),
(5, 'App\\Models\\User', 60),
(5, 'App\\Models\\User', 61),
(5, 'App\\Models\\User', 62),
(5, 'App\\Models\\User', 63),
(5, 'App\\Models\\User', 64),
(5, 'App\\Models\\User', 65),
(5, 'App\\Models\\User', 66),
(5, 'App\\Models\\User', 67),
(5, 'App\\Models\\User', 68),
(5, 'App\\Models\\User', 69),
(5, 'App\\Models\\User', 70),
(5, 'App\\Models\\User', 71),
(5, 'App\\Models\\User', 72),
(5, 'App\\Models\\User', 73),
(5, 'App\\Models\\User', 74),
(5, 'App\\Models\\User', 75),
(5, 'App\\Models\\User', 76),
(5, 'App\\Models\\User', 77),
(5, 'App\\Models\\User', 78),
(5, 'App\\Models\\User', 79),
(5, 'App\\Models\\User', 80),
(5, 'App\\Models\\User', 81),
(5, 'App\\Models\\User', 82),
(5, 'App\\Models\\User', 83),
(5, 'App\\Models\\User', 84),
(5, 'App\\Models\\User', 85),
(5, 'App\\Models\\User', 86),
(5, 'App\\Models\\User', 87),
(5, 'App\\Models\\User', 88),
(5, 'App\\Models\\User', 89),
(5, 'App\\Models\\User', 90),
(5, 'App\\Models\\User', 91),
(5, 'App\\Models\\User', 92),
(5, 'App\\Models\\User', 93),
(5, 'App\\Models\\User', 94),
(5, 'App\\Models\\User', 95),
(5, 'App\\Models\\User', 96),
(5, 'App\\Models\\User', 97),
(5, 'App\\Models\\User', 98),
(5, 'App\\Models\\User', 99),
(5, 'App\\Models\\User', 100),
(5, 'App\\Models\\User', 101),
(5, 'App\\Models\\User', 102),
(5, 'App\\Models\\User', 103),
(5, 'App\\Models\\User', 104),
(5, 'App\\Models\\User', 105),
(5, 'App\\Models\\User', 106),
(5, 'App\\Models\\User', 107),
(5, 'App\\Models\\User', 108),
(5, 'App\\Models\\User', 109),
(5, 'App\\Models\\User', 110),
(5, 'App\\Models\\User', 111),
(5, 'App\\Models\\User', 112),
(5, 'App\\Models\\User', 113),
(5, 'App\\Models\\User', 114),
(5, 'App\\Models\\User', 115),
(5, 'App\\Models\\User', 116),
(5, 'App\\Models\\User', 117),
(5, 'App\\Models\\User', 118),
(5, 'App\\Models\\User', 119),
(5, 'App\\Models\\User', 120),
(5, 'App\\Models\\User', 121),
(5, 'App\\Models\\User', 122),
(5, 'App\\Models\\User', 123),
(5, 'App\\Models\\User', 124),
(5, 'App\\Models\\User', 125),
(5, 'App\\Models\\User', 126),
(5, 'App\\Models\\User', 127),
(5, 'App\\Models\\User', 128),
(5, 'App\\Models\\User', 129),
(5, 'App\\Models\\User', 130),
(5, 'App\\Models\\User', 131),
(5, 'App\\Models\\User', 132),
(5, 'App\\Models\\User', 133),
(5, 'App\\Models\\User', 134),
(5, 'App\\Models\\User', 135),
(5, 'App\\Models\\User', 136),
(5, 'App\\Models\\User', 137),
(5, 'App\\Models\\User', 138),
(5, 'App\\Models\\User', 139),
(5, 'App\\Models\\User', 140),
(5, 'App\\Models\\User', 141),
(5, 'App\\Models\\User', 142);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `peminjaman_barangs`
--

CREATE TABLE `peminjaman_barangs` (
  `id` bigint UNSIGNED NOT NULL,
  `NamaPeminjam` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `KodeBarang` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `NamaBarang` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Merek` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Kategori` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `KondisiBarang` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `SumberDana` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Jumlah` int NOT NULL,
  `Unit` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Gedung` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Ruangan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Lantai` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Valuasi` int NOT NULL,
  `Status` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `peminjaman_barangs`
--

INSERT INTO `peminjaman_barangs` (`id`, `NamaPeminjam`, `KodeBarang`, `NamaBarang`, `Merek`, `Kategori`, `KondisiBarang`, `SumberDana`, `Jumlah`, `Unit`, `Gedung`, `Ruangan`, `Lantai`, `Valuasi`, `Status`, `created_at`, `updated_at`) VALUES
(1, 'syahid', 'AC0001', 'AC', 'GREE', 'Elektronik', 'Baik', 'Dana Bos', 10, 'SD', 'A', '7 A', '1', 0, 0, '2023-08-14 02:17:08', '2023-08-18 06:50:28');

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(3, 'Tambah', 'Tambah', '2023-07-23 20:37:16', '2023-07-23 20:37:16'),
(4, 'Edit', 'Edit', '2023-07-23 20:41:50', '2023-07-23 20:41:50'),
(5, 'User', 'User', '2023-07-23 20:42:10', '2023-07-23 20:42:10'),
(6, 'Master', 'Master', '2023-07-23 20:42:19', '2023-07-23 20:42:19');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(3, 'Admin', 'Admin', '2023-07-23 20:43:57', '2023-07-23 20:43:57'),
(4, 'Koordinator', 'Koordinator', '2023-07-23 20:44:20', '2023-07-23 20:44:20'),
(5, 'Guru', 'Guru', '2023-07-23 20:44:35', '2023-07-23 20:44:35');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED NOT NULL
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
(1, 'SD', 'A', '7 A FD', '1', '2023-08-13 20:31:06', '2023-08-13 20:31:06'),
(2, 'SMP Fullday', 'Gedung B', 'Kelas 7 B', '2', '2023-08-13 21:56:25', '2023-08-13 21:56:25');

-- --------------------------------------------------------

--
-- Table structure for table `siswas`
--

CREATE TABLE `siswas` (
  `id` bigint UNSIGNED NOT NULL,
  `nisn` int NOT NULL,
  `nama` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `siswas`
--

INSERT INTO `siswas` (`id`, `nisn`, `nama`, `created_at`, `updated_at`) VALUES
(1, 111, 'hisyam', NULL, NULL),
(2, 222, 'zubair', NULL, NULL);

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
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(2, 'Muhammad Syahid Abdillah', '1871102604950002', NULL, '$2y$10$/TWhi3lkX8C4fFqiDi4JD.iJm8PdakuJNKiMcwzo8KEAhkLipCAd6', NULL, '2023-07-20 21:06:49', '2023-07-23 20:56:31'),
(3, 'Aulia Rahmat, S.Pd.', '1806010507930001', NULL, '$2y$10$81XA9s/lOMmMjgILod7bge/fmBnWn2AaxI0nqzww7Rvh/WZz4CX9y', NULL, '2023-07-20 21:19:18', '2023-08-03 00:32:39'),
(4, 'Guru', 'guru@gmail.com', NULL, '$2y$10$k0Thd3V5uhX80MYgGP0xG.k2.JzjSE/WzXOOlQpwAtomIX9awgB..', NULL, '2023-07-22 06:51:46', '2023-07-23 21:06:17'),
(10, 'Ahmad Hadi Setiawan, M.Pd.I.', '1809070202880005', NULL, '$2y$10$KDl5if69P73aNd8Gw02aBO1oOV5SInFkn.hSkk5OKlkUBwEKir9Pm', NULL, '2023-08-03 00:35:55', '2023-08-03 00:35:55'),
(11, 'Agung Prayitno, S.Pd.I.', '1801133108840003', NULL, '$2y$10$97iopvL0Sr/.OPpUBAk7OuQIUp0gPmIV4YpkTNih0.L/ERpF0mAXK', NULL, '2023-08-03 00:35:55', '2023-08-03 00:35:55'),
(12, 'Fatkhur Rohman, S.Pd.I., Lc., M.Pd., Gr.', '1871101609850008', NULL, '$2y$10$HgO7YA2t8azhvtAd7/0pGO4txvHuXSKhSfmcuFlCzn9At0F3Btsmq', NULL, '2023-08-03 00:35:55', '2023-08-03 00:35:55'),
(13, 'Maryanti, S.Pd.I.', '1809015702910009', NULL, '$2y$10$0/K5zUseH2wGY1sGF7mlSuDx/HqlibyYOFBudgTH6HzFsu0iV8BZe', NULL, '2023-08-03 00:35:56', '2023-08-03 00:35:56'),
(14, 'Nur Indah Gunawati, S.Si., Gr.', '1871105508810001', NULL, '$2y$10$MmZpO3Id.AiCRnEiUPgUyOa4i/98WMgR0qAECwsthph2iziD37Q4u', NULL, '2023-08-03 00:35:56', '2023-08-03 00:35:56'),
(15, 'Hendra Kurniawan, S.Pd.', '1812010205910004', NULL, '$2y$10$YEvXAeeON2E28RBIQ/9L7ubLxiHjNTypAMaSinZTxMS6Eyl570JVC', NULL, '2023-08-03 00:35:56', '2023-08-03 00:35:56'),
(16, 'Mela Marzuki, S.Pd.', '1801045911910009', NULL, '$2y$10$QQqosap0XeXM0kgP9uMWP.6TeiZAeHNronVpq/CruZUkQd4DUgUT.', NULL, '2023-08-03 00:35:56', '2023-08-03 00:35:56'),
(17, 'Aria Safitri, S.Pd., Gr.', '1871026204920008', NULL, '$2y$10$HNhcvkTU3Ryuz7jZttrVEOaA75E90nRvf8EbeBKFkyrk9U3AgnvEy', NULL, '2023-08-03 00:35:56', '2023-08-03 00:35:56'),
(18, 'Uswatun Hasanah, S.Pd.', '1871037996860002', NULL, '$2y$10$hWe3i.WvIPbCz3fySjsl2uHKgzBf5OdbA/UjFWc.jzYhIOA2xcU/2', NULL, '2023-08-03 00:35:56', '2023-08-03 00:35:56'),
(19, 'Fitri Fita Sari, S.Pd.I.', '1809074602940005', NULL, '$2y$10$KwKCbU01HjIZNTurOPykcePIKF7njCAl7HAdqp3a3LbFvTJiGWuXa', NULL, '2023-08-03 00:35:56', '2023-08-03 00:35:56'),
(20, 'Miftahul Rohman, S.Pd.', '1803081710930003', NULL, '$2y$10$DvzKb0Egv4CbmId7YD8Cl.TlizeHIGH1cOAuaylBTCKJhV5/mDnFm', NULL, '2023-08-03 00:35:57', '2023-08-03 00:35:57'),
(21, 'Fitria Tiarani, S.Pd., M.Pd.', '1803036203930001', NULL, '$2y$10$6GXQE/Gu8JbzaPlknqsAX.hVG54igL9lkkkxDMRgRi8QhhahSjknC', NULL, '2023-08-03 00:35:57', '2023-08-03 00:35:57'),
(22, 'Kinasih Cahyono, S.Pd., M.Pd.', '1871010810950004', NULL, '$2y$10$FUHCJ2yzhJncy3gjoODtyOFQRQ4hUOHnIB8pXrTYsASN0gey3ScZ6', NULL, '2023-08-03 00:35:57', '2023-08-03 00:35:57'),
(23, 'A. Faqih \'Afina Nura, S.Pd.', '1801041502950005', NULL, '$2y$10$tgirgQk6vOKvtmkIKcho/erbNerid0oD.gGIri6nwOhUP7YnTsVNa', NULL, '2023-08-03 00:35:57', '2023-08-03 00:35:57'),
(24, 'Asep Mujahid, S.Pd.', '1808011206940006', NULL, '$2y$10$0cGyZvLSXkUhSPBOJ.TxnuNrvyuF8ZzIi2uTy8xncA7lKf7VnrEaG', NULL, '2023-08-03 00:35:57', '2023-08-03 00:35:57'),
(25, 'Hasyim As\'ari, S.Pd.', '1871130506930005', NULL, '$2y$10$IyOjfA.hrWx3RYPvgNDD..o13Kjv1vAeDXd87JkdRXBqycG.qMuBu', NULL, '2023-08-03 00:35:57', '2023-08-03 00:35:57'),
(26, 'Miftahul Awaludin, S.Pd.I.', '1802012005940007', NULL, '$2y$10$7DLN2ljVxzOe6yBYc2gXXuAqKfll6EIShZQ/DIV0Q9LknOYYwpsq.', NULL, '2023-08-03 00:35:58', '2023-08-03 00:35:58'),
(27, 'Restu Dwi Aprian, S.Pd., Gr.', '1806121404950005', NULL, '$2y$10$CrXU8AYXlVUPnMoZj7T/nO/GHz1ZLwRQw/9R.6K7XuxqEyOfa/1Q2', NULL, '2023-08-03 00:35:58', '2023-08-03 00:35:58'),
(28, 'Ridho Surya Ariska, S.Pd.', '1803231205940007', NULL, '$2y$10$dsn5ZchhO1HxX3z/kr3at.dhd.6k7e9O3jpZ2PJm/NoANLAK1Omy6', NULL, '2023-08-03 00:35:58', '2023-08-03 00:35:58'),
(29, 'Siti Fathonah, S.Pd.', '1809076808950003', NULL, '$2y$10$NOUjn7pOCXn9wWvduoi3k.HmyNmtS3qmH0TgtoMGTGO4kdIAM5p6i', NULL, '2023-08-03 00:35:58', '2023-08-03 00:35:58'),
(30, 'Toni Eriyanto, S.Pd.I.', '1802010201940004', NULL, '$2y$10$0qPf8yQKytYOC1SU2BfzSeOZZvoaAf5z1YQ.YrcP6la1DBFOJHm6.', NULL, '2023-08-03 00:35:58', '2023-08-03 00:35:58'),
(31, 'Reza Ayu Amelia, S.Pd.', '1871056206970002', NULL, '$2y$10$Vy30/mo8OP06ManHKXXLYO.WwC3x5DRwsNNrZOILYtKncMwKM6pJy', NULL, '2023-08-03 00:35:58', '2023-08-03 00:35:58'),
(32, 'Septian Akbar Maulana, S.Kom', '1871022309910006', NULL, '$2y$10$jPJ2RZ6X7Xsh2bMcZiaENekYoAjr2Z9SzuqLJO5XozoaaxyIjoazu', NULL, '2023-08-03 00:35:58', '2023-08-03 00:35:58'),
(33, 'Theo Tri Ramadhan, S.Pd.', '1871122702940001', NULL, '$2y$10$0a3/N3HYfiLHA0mtXQ.DzOgYtO8pFh4Fe0jgmQ798b2/dwtGRu1AK', NULL, '2023-08-03 00:35:59', '2023-08-03 00:35:59'),
(34, 'Ana Wahyu Nurrohmah, S.Pd.', '1802235704950003', NULL, '$2y$10$klkl1B6wedtmwxVqpptkDeM7cdO8fwB4iumdfMiMRkjOvCalfRxmq', NULL, '2023-08-03 00:35:59', '2023-08-03 00:35:59'),
(35, 'Hendri Syaiful Nugraha, S.H.', '1802192509910001', NULL, '$2y$10$rXeVqh5e1UOfNEQD26xgOupKFYT4JO29gdI5U1JSV2y/174GQy6Fe', NULL, '2023-08-03 00:35:59', '2023-08-03 00:35:59'),
(36, 'Muhermansyah, S.Pd.', '1804082407910004', NULL, '$2y$10$h21nP2dX5cH5hJzQcSZ7KOsS1F.TaBMVyg88DW/UY2erNIlDaNQPi', NULL, '2023-08-03 00:35:59', '2023-08-03 00:35:59'),
(37, 'Sumaliyo, M.Pd.', '1871101409810005', NULL, '$2y$10$dYpny9xIcvvpd4SzYbbzMO4Y0D97qeaVMdlB82SoA2MzUCOKeScZi', NULL, '2023-08-03 00:35:59', '2023-08-03 00:35:59'),
(38, 'Yunda Setyowati, S.Pd.', '1803074305960004', NULL, '$2y$10$tk3LfhAv7/dWouo6VF887eWdUhU2HCBrKi62f9rMB4/bq2nGXbL5C', NULL, '2023-08-03 00:35:59', '2023-08-03 00:35:59'),
(39, 'Asep Bambang Susanto,M.Pd.', '1803131808870008', NULL, '$2y$10$yzD/jZO3KykxOj1tE1wd6Oh3M3zL3h5rFNiZrf02.xU89VUGpOijS', NULL, '2023-08-03 00:36:00', '2023-08-03 00:36:00'),
(40, 'Diah Asih Nurhayati, S.Pd. ', '1810015510960005', NULL, '$2y$10$CGA/SWejF/ZriMEVkkAlxOmYvZVbdlls7g844OBepus87M/q6lY2m', NULL, '2023-08-03 00:36:00', '2023-08-03 00:36:00'),
(41, 'Farhatunnisa, S.Pd.', '1809076504980003', NULL, '$2y$10$EJHSvs/Q1fx6B1xx/UadMeZM9AJ7K4bJi3kfBVZjRPvpO9bIOAPXG', NULL, '2023-08-03 00:36:00', '2023-08-03 00:36:00'),
(42, 'Hafidz Munir Nasrullah, S.Pd. ', '1801042709970007', NULL, '$2y$10$UGJ4/DONugpJkT0raJa/Z.Psm2MFQAvEvpDgQzczbEf.tL1MTnikS', NULL, '2023-08-03 00:36:00', '2023-08-03 00:36:00'),
(43, 'Hendri Jaya, M.Pd.', '1871102108850007', NULL, '$2y$10$lRw3GL.In3ABjYkjdN28XeHdPB0tUdxRWYprtiVc0mWWa3upk4XtK', NULL, '2023-08-03 00:36:00', '2023-08-03 00:36:00'),
(44, 'Heriansah, S.Pd.I., M.Pd.', '1603012210840001', NULL, '$2y$10$gvrzFizgYghgSm9aS4C.xumvRlss7mtjK.LTiAfOtlHDHg5Tj6Z.i', NULL, '2023-08-03 00:36:00', '2023-08-03 00:36:00'),
(45, 'Laila Ulfa, S.Pd.', '1809075405970004', NULL, '$2y$10$J/SNC8U98CCpSCBtNxZ/rOofuDSeUNrMsKYBd0c3c.g/DoJxxiJuq', NULL, '2023-08-03 00:36:00', '2023-08-03 00:36:00'),
(46, 'M. Atshil Maulana Akbar, S.Sos.', '1871102303950007', NULL, '$2y$10$YK1tiOX.QLdP3FMmZIj.b.SH58kIVM.gtYvKYwLtooCvoM7R1awE2', NULL, '2023-08-03 00:36:01', '2023-08-03 00:36:01'),
(47, 'Nasrul Waton, S.Pd.', '1802190702950003', NULL, '$2y$10$jbEkn93i15zfh63igACPLu1WzHYeidk2Kax6vlDyoQcWO2XVyLnLS', NULL, '2023-08-03 00:36:01', '2023-08-03 00:36:01'),
(48, 'Okta Syafi\'i, M.Pd.', '1802012010980001', NULL, '$2y$10$JJ4D/l5a62cDsUXBk1cSPeup5tPjCP4I5mHJuwrc77vDuMqHFDVGa', NULL, '2023-08-03 00:36:01', '2023-08-03 00:36:01'),
(49, 'Riska Lestari, S.Pd.', '1871095501970002', NULL, '$2y$10$Jb2QJ0D/Kl1ASjk1BWwXtu5ZeutD3ZEAb2VMlzT6hqAQpLcQpZODG', NULL, '2023-08-03 00:36:01', '2023-08-03 00:36:01'),
(50, 'Adi Restiawan, S.Pd., M.pd.', '1801102601970003', NULL, '$2y$10$REjY.Pv5VeL8yddiovrGmewELHDHZ/NysLbuNr4rgmwS6p8hWohF6', NULL, '2023-08-03 00:36:01', '2023-08-03 00:36:01'),
(51, 'Apriansyah Tisarna, S.Pd.', '1804111404960007', NULL, '$2y$10$/svW2cu55jg7d6Cvz6fV1etGxNtiM23XMylTVG3CosZa0EccR18wO', NULL, '2023-08-03 00:36:01', '2023-08-03 00:36:01'),
(52, 'Arif Rahman Muhayat, S.Pd.', '1801080107870054', NULL, '$2y$10$EcfHeUkaqipyoT7XbmjvSeAe6qYPknxxS6zDSS0SIVmv5rWJzYtMS', NULL, '2023-08-03 00:36:02', '2023-08-03 00:36:02'),
(53, 'Eva Itma Anna, S.Kom,. M.T.I', '1871085908850001', NULL, '$2y$10$VDm94keXCZU311wbjZB3puLYxu.cQZzhYKLNFhr1quj8VyDEuFbGe', NULL, '2023-08-03 00:36:02', '2023-08-03 00:36:02'),
(54, 'Kartika Mei Linda, S.Pd., M.Pd.', '1803085005980001', NULL, '$2y$10$alqEKyzF8r8DnmAMB/3RcetklVI0YhtM2VrEqqqyQA6J6WDKZiz6a', NULL, '2023-08-03 00:36:02', '2023-08-03 00:36:02'),
(55, 'M. Hendrian Saputra, S.Pd.', '1871061602970001', NULL, '$2y$10$zar1RVHed0xlnDBiq5ibN..XO/QO.zfHFGIGYS/CVC/UN/fsycFdG', NULL, '2023-08-03 00:36:02', '2023-08-03 00:36:02'),
(56, 'Muhamad Soim, S.Pd.', '1810051011900005', NULL, '$2y$10$xSoNs.wLpEU2zt9WbdFtROjk2LrKz0fdFLIJnkA.iJwtInBhrd/bO', NULL, '2023-08-03 00:36:02', '2023-08-03 00:36:02'),
(57, 'Ridwan Saputra, S.Pd.', '1671101302980009', NULL, '$2y$10$OwTJf8Pht5ZWQGNovpvzHuvE1rfg/DKkSKWi8fv2E6GpXi4wyzRSO', NULL, '2023-08-03 00:36:02', '2023-08-03 00:36:02'),
(58, 'Sugeng Prayitno, S.Kom.', '1801041902890009', NULL, '$2y$10$d.4ksr6mKjeJCiMMu846zuFP/lYZrNIM2uv8TGFUqVf5w87vt7M8e', NULL, '2023-08-03 00:36:02', '2023-08-03 00:36:02'),
(59, 'Yulina Winda Rahma, S.Pd., M.Pd.', '1601215507980001', NULL, '$2y$10$XO1kKS03Q0PBsI7.bOMNMOpNlCvpVrW0gCT8zmpr3tN4WuaTm/wk2', NULL, '2023-08-03 00:36:03', '2023-08-03 00:36:03'),
(60, 'Zulkarnain, S.Pd.', '1812010807970001', NULL, '$2y$10$cjQfQ1brAbhSj2lSH4Io/OVY.pfGaYznYxPS8kQLwG3n2s1oqBzKS', NULL, '2023-08-03 00:36:03', '2023-08-03 00:36:03'),
(61, 'Ahmad Thohir, S.Pd.I.', '1812012510900005', NULL, '$2y$10$cXjS8.UpiDNPvm1yCI5OReRAKMwCf.b7Zg2HoMhdACsnVw5ZH4J0i', NULL, '2023-08-03 00:36:03', '2023-08-03 00:36:03'),
(62, 'Budy Saptono, S.Pd.', '1810081209950001', NULL, '$2y$10$jkkB6XTlpw5T4igjfe/9TOBWkNwYyzRBkWe.9pgJPeQpBKO.dULsW', NULL, '2023-08-03 00:36:03', '2023-08-03 00:36:03'),
(63, 'Desy Dwi Riyana, S.Pd.', '1809046612990003', NULL, '$2y$10$ktjUDJjpuhjGW6WXbKfyTO8QFPlAbd/qBlshAXcS5mRskAZW8KP1a', NULL, '2023-08-03 00:36:03', '2023-08-03 00:36:03'),
(64, 'Dewi Rahmawati, S.Pd.', '1802205103980001', NULL, '$2y$10$4c.ki9Zp6FYphCfxLQGcWe1h1zfiLv7CTxGrVCGaNIYHHr.WR4ebu', NULL, '2023-08-03 00:36:03', '2023-08-03 00:36:03'),
(65, 'Faruq Abdur Rasyid', '1803142009980003', NULL, '$2y$10$dDsRpmC8BvKu99o4D.FpuOIfwoksxlxd/jIm8NR2aGra2HlbM6vKK', NULL, '2023-08-03 00:36:04', '2023-08-03 00:36:04'),
(66, 'Firman Rudiansyah, S.Pd.I., Lc., M.Pd.', '1801182103850010', NULL, '$2y$10$v4sLiQxeMeVAd808E4FuHeYcuUPHtCDybuOhsOlMlp8xNhtijSH2K', NULL, '2023-08-03 00:36:04', '2023-08-03 00:36:04'),
(67, 'Iwan Ansori, S.Pd. ', '1801041306830008', NULL, '$2y$10$m4dr7NMRwn0BlrKtysPsdO3tFj1xi9lvFIPvuNP1nJ0r6sT4EfrMu', NULL, '2023-08-03 00:36:04', '2023-08-03 00:36:04'),
(68, 'Khoirul Ikhwan, S.Pd.', '1809072311980005', NULL, '$2y$10$fw0AXmYLUIGcbITqVieLOelNdwcRCKCLhaeZV0ntuwHa0.X4BGzTy', NULL, '2023-08-03 00:36:04', '2023-08-03 00:36:04'),
(69, 'Luthfi Nuraini, S.Pd.', '1808015512980001', NULL, '$2y$10$mL5p4SMmGz3IGvmon0O/R.DXEaRadufF.I76UUcGPe0GjEmPmZz3a', NULL, '2023-08-03 00:36:04', '2023-08-03 00:36:04'),
(70, 'M. Abdullah Hamid, S.Pd.', '1801082010940005', NULL, '$2y$10$VYYmPKJmPRtUDkb0s58Eq.Tnsro2XZz0xt8lbCOEZ2c0JIO1beXJW', NULL, '2023-08-03 00:36:04', '2023-08-03 00:36:04'),
(71, 'Mahmud Nurdiana, S.Pd.I.', '1871013011850004', NULL, '$2y$10$5S4Sfo90PsNScFV/QTdTKuyUcfFi7eqd4gkdefMtS2w8.i0dT1tUO', NULL, '2023-08-03 00:36:04', '2023-08-03 00:36:04'),
(72, 'Muhammad Hamim Fauzi, S.Pd.I.', '1803140803920001', NULL, '$2y$10$2a43AJuX80bpICWPjXRwRuSVtgW7DA4L6mWu2DDiFdnyHonXW0g.6', NULL, '2023-08-03 00:36:05', '2023-08-03 00:36:05'),
(73, 'Muhammad Ilal Akbar, S.Pd.I.', '1810010406930007', NULL, '$2y$10$z3rMgB8.32JjqWL0yaByIu4y81/71ApvvJidAQqU3K1.rGk5HjyHu', NULL, '2023-08-03 00:36:05', '2023-08-03 00:36:05'),
(74, 'Sabanul Yamin, M.Pd.', '1803142303910001', NULL, '$2y$10$r7Kg8uFyL4s7ObDicihc7edTwbWEhMfxysa2YjWdhiB7W49Jhxf0m', NULL, '2023-08-03 00:36:05', '2023-08-03 00:36:05'),
(75, 'Septian Pratama, S.Pd., S.E.', '1871021909920002', NULL, '$2y$10$PWbcSofHYeJ0O23cMdvdIeFIcryMRv/oLpgnkcqDHrlw.fGNEco1C', NULL, '2023-08-03 00:36:05', '2023-08-03 00:36:05'),
(76, 'Tsurayya Kamilah, S.Pd.', '1871104502990004', NULL, '$2y$10$txLjjqZHD3zbKJhYIkkCYOK0wYChXZBSfODXpA11tYYkzryrZ/Zw.', NULL, '2023-08-03 00:36:05', '2023-08-03 00:36:05'),
(77, 'Yayang Ratu Mega Putri, S.Pd.', '1802204609970001', NULL, '$2y$10$nrSwib/JNv.AROZKP2PAienLr9by9CeJNkg/ffI/otT5UrtdShe1e', NULL, '2023-08-03 00:36:05', '2023-08-03 00:36:05'),
(78, 'Dian Agus Setyaningsih, S.Pd.', '1807216808960004', NULL, '$2y$10$5EEIjPo18dGOuNWDH4e16ucZi5nwjycu7h/UDZ1P.hwcHQcEBKguG', NULL, '2023-08-03 00:36:06', '2023-08-03 00:36:06'),
(79, 'Ikhlasul Amalia Wardah', '1810016205020004', NULL, '$2y$10$r0huluhT0skpQzCBb1Jl/eRlf/KGkNaMRbhN0x6K0M8Gl3mBS6SFG', NULL, '2023-08-03 00:36:06', '2023-08-03 00:36:06'),
(80, 'M. Anhar Robbany', '1871101502020002', NULL, '$2y$10$11LlupbbV9WM19EfiAtAveN1eb8BWvXOlzzebBcJlfLhcu2Mtuita', NULL, '2023-08-03 00:36:06', '2023-08-03 00:36:06'),
(81, 'Ali Akbar, S.Pd.', '1602051903952000', NULL, '$2y$10$QPv.Ya/Q1Yhb87EEMzJ.GOQ/An6d87ACD19PxDXS42kTiDEhi.xEu', NULL, '2023-08-03 00:36:06', '2023-08-03 00:36:06'),
(82, 'Ayu Piatiwi, S.Pd.', '1805026008980000', NULL, '$2y$10$PTIiffmjvtapeHX23bDu1uf8AjOr4KalhpakMx3Jgnpn32a7lHGui', NULL, '2023-08-03 00:36:06', '2023-08-03 00:36:06'),
(83, 'Muhammad Ilham, S.S.', '1871120612940000', NULL, '$2y$10$YuisgQgRcxeru7bHMNLijewt032DFiarLUwrZp09dthlOOeSYzT0O', NULL, '2023-08-03 00:36:06', '2023-08-03 00:36:06'),
(84, 'Nurul Fadhillah, S.Pd.', '1802075006850000', NULL, '$2y$10$0ZaLuFgFOFnUMu0Mm6msgets7X1LYlPF8Y37LMcH96mN.XJfpWzxC', NULL, '2023-08-03 00:36:07', '2023-08-03 00:36:07'),
(85, 'Putri agustina, S.S.', '1802175408940000', NULL, '$2y$10$yaQLkWVmjWy3bkH74d8vx.p4YYpGMHCtwu5rvsab6eG7ZPMro7AQO', NULL, '2023-08-03 00:36:07', '2023-08-03 00:36:07'),
(86, 'Rifan Winarto, S. Pd.', '1802010410970000', NULL, '$2y$10$ymRj1koNY8mNsf1rD6GQq.XuTDplnh62le/OMkMa0hmKyj591JfEm', NULL, '2023-08-03 00:36:07', '2023-08-03 00:36:07'),
(87, 'Mukhlis Zainurrahman, S.Pd.', '1803081005000000', NULL, '$2y$10$y1.H6K4YmCUErUhmKR9TcOXex94wpSyRMlJXDx7pfZU8Au6ZdaybK', NULL, '2023-08-03 00:36:07', '2023-08-03 00:36:07'),
(88, 'Abidaturrohmah, S.Pd.', '1808142903000002', NULL, '$2y$10$RZHioCesrAtzGkzqUg7ZguVZiFf499VReiThmAw33mqnrV3rFOzIe', NULL, '2023-08-03 00:36:07', '2023-08-03 00:36:07'),
(89, 'Amarullah, S.Pd.', '1803081201970002', NULL, '$2y$10$21aaK/9RulJ51fVwhuS8pe/kCeWO9yGB2qrxwXHd5EExtS60xP6NS', NULL, '2023-08-03 00:36:07', '2023-08-03 00:36:07'),
(90, 'Arip Setia Budi, M. Pd', '1811030911930001', NULL, '$2y$10$KVlX26IRZku4G2JroB2IS.FiC86aKdvqLsUMDEEE6ESqpb2uvNTke', NULL, '2023-08-03 00:36:07', '2023-08-03 00:36:07'),
(91, 'Ar Rizki Prakasa Aslamsyah, S.Pd.', '1871032910980004', NULL, '$2y$10$0ld46joxpnSRkEx2P0qXUOBhqLYU01kgXmNvs1QMXe3YcG8kZNymG', NULL, '2023-08-03 00:36:08', '2023-08-03 00:36:08'),
(92, 'Cornelia Zahra, S.Pd.', '1871126211000004', NULL, '$2y$10$cdPcIENfTR8o9dxyqExe.e.s3er.E9lW1xe9s9BxY8KjE7mp2dCJm', NULL, '2023-08-03 00:36:08', '2023-08-03 00:36:08'),
(93, 'Darul Aman, S.Pd.', '1807022503960001', NULL, '$2y$10$hJQ97O6taN1Y7ZmmCo0A1OoWIj.nzZ4INwNsMaPws1h69rUADgRCe', NULL, '2023-08-03 00:36:08', '2023-08-03 00:36:08'),
(94, 'Dhika Ari Pratama, S.Pd. ', '1871011812970002', NULL, '$2y$10$VGw9xMAQgftJiRQdZDh7leaJlzSABW7AQHGfVrAT2f98tEoHaO8CC', NULL, '2023-08-03 00:36:08', '2023-08-03 00:36:08'),
(95, 'Ely Susanti, M.Pd.', '1803086611950001', NULL, '$2y$10$oiobDqjYc7JqJpdsqUHzcOvBmhZuaQ8sVVWieAQBuKwkP.0DLMqhi', NULL, '2023-08-03 00:36:08', '2023-08-03 00:36:08'),
(96, 'Era Sapitri, S.Pd.', '1804065312970002', NULL, '$2y$10$LoF0LMX2d/v7EHrggJwPeuvBb.zvRQhxQpbvh51i8hJ6jnkexIl7W', NULL, '2023-08-03 00:36:08', '2023-08-03 00:36:08'),
(97, 'Febian Rizaldi, S.Pd.', '1801040802990006', NULL, '$2y$10$pypc5UTzEeDsMeUPbcqKWuS.Qz./.QXOw5n.cUizYU0YwO.vtiM52', NULL, '2023-08-03 00:36:09', '2023-08-03 00:36:09'),
(98, 'Indra Mulya, S.Pd.', '1802090210850004', NULL, '$2y$10$VzkyRkKvXIbPotiOCNOlG.nnK5xwHyqUaP7kxLEnsyyCbv6DCMubK', NULL, '2023-08-03 00:36:09', '2023-08-03 00:36:09'),
(99, 'Latifatul Khasanah, S.Pd.', '1904066707000002', NULL, '$2y$10$ph/Q9BCIKvnvQJrrfSfRauyCBT3sBL2hmt8eJwTrrg.iLcMOpf9X.', NULL, '2023-08-03 00:36:09', '2023-08-03 00:36:09'),
(100, 'Mhd Ibnu Hanan Al Faruqi, S.Pd.', '1804042002000005', NULL, '$2y$10$aVARqY7w/0s9sjodPKPu2O6dbx.3FJ8D3Nbe26s02S45fsaBB87Tm', NULL, '2023-08-03 00:36:09', '2023-08-03 00:36:09'),
(101, 'Mar\'atus Sholehah, S.Pd.', '1871107108970004', NULL, '$2y$10$chnrdRo30FmfViilyzQNaeAHlMHZxBXoXJIoGkpchdVcpdNshdpLe', NULL, '2023-08-03 00:36:09', '2023-08-03 00:36:09'),
(102, 'Nina Heriyati, S.Pd', '1806175010970004', NULL, '$2y$10$SFIjqZfGkn6MKGaerPGkpucSLe1sXGGI/ELfSIdIV1B0gUbUXBkC2', NULL, '2023-08-03 00:36:09', '2023-08-03 00:36:09'),
(103, 'Nola Miranda, S.Pd.', '1871136011970001', NULL, '$2y$10$7EvmmNWMXZ4yVC6Q5Jtho.7.9oVyBR9cFVvw.a0V2P6Hk3Sl17/Si', NULL, '2023-08-03 00:36:09', '2023-08-03 00:36:09'),
(104, 'Nur Lailatul Bisriyah, S.Ag', '1810044606960004', NULL, '$2y$10$p7UMTTqZgJmIq0y88UOt2O0z6T2zH3Eb5oGeowr4GZw3fHbexOB7q', NULL, '2023-08-03 00:36:09', '2023-08-03 00:36:09'),
(105, 'Prasojo, S.M.', '1804120703980004', NULL, '$2y$10$yx7qne0MWXxISkVsBOsEqek6AVcT0qH2YJTALy/llsr1l00vKJbim', NULL, '2023-08-03 00:36:10', '2023-08-03 00:36:10'),
(106, 'Riko Pangestu, S.Pd.', '1871060609960001', NULL, '$2y$10$1uF9gpbUajifhFwe0Fw/zeLuRlrCB2YNSn5OKc.x1fqn/MTYO18kG', NULL, '2023-08-03 00:36:10', '2023-08-03 00:36:10'),
(107, 'Sestika Sari, M. Pd', '1803106407970001', NULL, '$2y$10$FegpF2gwGWhLRA4cBF6.E.WAZrfFmSIUgZiEe2GMNKPZ12UMKxZU.', NULL, '2023-08-03 00:36:10', '2023-08-03 00:36:10'),
(108, 'Siti Zainab, S.Pd.', '1810054202990002', NULL, '$2y$10$IgzmJ1kERnRkFBN6XsEsZOdC.StmVKRhxSviFk/pXucTKQN7T68W2', NULL, '2023-08-03 00:36:10', '2023-08-03 00:36:10'),
(109, 'Surya Hidayat, S.Pd.', '1801072811000002', NULL, '$2y$10$CmRuCffZR0lZKMxkawgTT.HL5kxT4.ebknhMwIjmK8.5Ghc7MnjR6', NULL, '2023-08-03 00:36:10', '2023-08-03 00:36:10'),
(110, 'Thesya Alda Nia, S.Pd.', '1871044503990005', NULL, '$2y$10$6l95DD6TRoRmr73Novc63.Xj.7WTcTuQ4mpag2M6VuoQxHNa9mmNu', NULL, '2023-08-03 00:36:10', '2023-08-03 00:36:10'),
(111, 'Umi Miftahul Aprilia, S.Pd.', '1802274204980001', NULL, '$2y$10$NhKCoUH8acvS6JY412AGGOkBEpRrEJAkSSvoMBNa2sJTL.9eZ/Kc6', NULL, '2023-08-03 00:36:10', '2023-08-03 00:36:10'),
(112, 'Zahrotul Jannah, S.Pd.', '1801175610970001', NULL, '$2y$10$Sn4fEA5FG18j3P.lhY2aN.diuplHGFJj2IIho2Ey6cSXuyXZHTan.', NULL, '2023-08-03 00:36:11', '2023-08-03 00:36:11'),
(113, 'Iid Nurul Abidah, S.Pd.', '1871105811930003', NULL, '$2y$10$9LCtv36v1kEChU.plSUS0O.JuojlOpM9lxsMr1vpxjnZ6HqS2Wq4q', NULL, '2023-08-03 00:36:11', '2023-08-03 00:36:11'),
(114, 'Via Nur \'Afifah, S.Pd.', ' 1802076604000003', NULL, '$2y$10$ow59d4XHAelWIdHUddw6Au81r0.sWftVqTIY6SOZ2ANve1.cEjmEq', NULL, '2023-08-03 00:36:11', '2023-08-03 00:36:11'),
(115, 'M. Rifki Haikal Adam, S.Pd.', '1809042401000003', NULL, '$2y$10$1pB67ZNIX8zN89XNuZBKdukm43XcES7BFPD6zi4K6Ko5SYTfCkOra', NULL, '2023-08-03 00:36:11', '2023-08-03 00:36:11'),
(116, 'Aziz Prayoga,S.Pd.', '1809011804980004', NULL, '$2y$10$qKg2B.dxcXGvA9dTPXb3j.dnEIHYTwi7nPLJOG.nio5df4pwr87/S', NULL, '2023-08-03 00:36:11', '2023-08-03 00:36:11'),
(117, 'Achmad Fatih Perdana', '1807021303000002', NULL, '$2y$10$eZedv1.8zSaFKVi1kug0w.cib1OuUTvyZTs0gfITlAvLBgJfgDUMG', NULL, '2023-08-03 00:36:11', '2023-08-03 00:36:11'),
(118, 'Al Mahdi', '1803080101000001', NULL, '$2y$10$vgP6S6P8rzJBesDCFxCCz.VuNhUhqWldiYC6Grh7HjxfjjmrVWli2', NULL, '2023-08-03 00:36:12', '2023-08-03 00:36:12'),
(119, 'Husnul Hotimah, M.Pd.', '1871104203950003', NULL, '$2y$10$EiCu/YzKogr9fYySWKex0uhjGrCii55.f9m8tOFZHExJw3XKMDIA.', NULL, '2023-08-03 00:36:12', '2023-08-03 00:36:12'),
(120, 'Jihadul Akbar', '1803211609990001', NULL, '$2y$10$ktGWWtqbdXgLJb3i6sGtkug309z9gcvNTaaSXcw/SpnrTYk3MpH46', NULL, '2023-08-03 00:36:12', '2023-08-03 00:36:12'),
(121, 'Masyrifah', '1803084910000003', NULL, '$2y$10$rS1ZNx8AX32ptM3x2XVIrOnnFfSvDywB8ap6OE7lQc3pwRQZZ0PPa', NULL, '2023-08-03 00:36:12', '2023-08-03 00:36:12'),
(122, 'Mayang Fajriana', '1801076606000001', NULL, '$2y$10$/B82xeCHb2f3O0yofQgdxeh1prt/KKbEpDPCG8T8Zx6wV6UC6lhBe', NULL, '2023-08-03 00:36:12', '2023-08-03 00:36:12'),
(123, 'Miftahun Nuri, S.Pd.', '1802082707950001', NULL, '$2y$10$MWRcgcAeAUd7SB.QmQzFx..B5RBnuvpLf4cgrOLJ.tWdE5V7JtHaG', NULL, '2023-08-03 00:36:12', '2023-08-03 00:36:12'),
(124, 'Muhammad Yani', '1602051408010007', NULL, '$2y$10$lr8fSUVTbPH64pUSd3lTVeKK2bOXn5TMRmdOwy6FZeT1MVQaH.yfK', NULL, '2023-08-03 00:36:12', '2023-08-03 00:36:12'),
(125, 'Muzandia Atma, S.Pd.', '1809071103990007', NULL, '$2y$10$iKB8566Rh7tX8a2Tjhe9IeefBa45.94CgjvviFkshVVFK2p915aH6', NULL, '2023-08-03 00:36:13', '2023-08-03 00:36:13'),
(126, 'Nanda Sukmana', '1871055610000003', NULL, '$2y$10$L65WV4FHKOb4.cH3kZSvZ.Z0INfDSc4lAAEOsw3hMdzyxIY9nb.Bq', NULL, '2023-08-03 00:36:13', '2023-08-03 00:36:13'),
(127, 'Raissa Aldora', '1871015704020004', NULL, '$2y$10$v4Ylq8V0MWfjBjizJYvP4u.qrGy14oUc0xwn8mCjud0ddafi4BevW', NULL, '2023-08-03 00:36:13', '2023-08-03 00:36:13'),
(128, 'Suyitno', '1803081512000001', NULL, '$2y$10$BxQDnn.NMQOQ6oFZAQsVC.s2wj4CTJYZEENsKaVkoE/0jOD7m/88y', NULL, '2023-08-03 00:36:13', '2023-08-03 00:36:13'),
(129, 'Zaenal Abidin, S,Pd.Si.', '3471031805840002', NULL, '$2y$10$qT1IgAvwFsBmV3pL8YwcFexOANh/0M91oyKScG5skH/781I1wRCua', NULL, '2023-08-03 00:36:13', '2023-08-03 00:36:13'),
(130, 'Zahro Nur Fidiniyah', '1810056602000005', NULL, '$2y$10$Haesq7z/GUiVMzsQeFDSdOa0Ys3oau3hXqt0c1nozcrURlogP7HNu', NULL, '2023-08-03 00:36:13', '2023-08-03 00:36:13'),
(131, 'Dewi Maryam Wulandari, S.Pd.', '1803136906940002', NULL, '$2y$10$ZLkAkaj.XWwPfLFfube4WeNAgK2e1IZ7si6CKHlr6jgua/SxJjMUm', NULL, '2023-08-03 00:36:14', '2023-08-03 00:36:14'),
(132, 'Farin Fatwa Sugesty, S.Pd.', '1871024904000005', NULL, '$2y$10$de85rljBg.r.GLMGeC5e6u7519zYDM98KULlRj8XisoBrgWmYxSXi', NULL, '2023-08-03 00:36:14', '2023-08-03 00:36:14'),
(133, 'Ziah Seli Utami, S.Pd.', '1871015105000003', NULL, '$2y$10$dOmvYt.jCUSHCHCedSZA0.CHfmcNTvRTD.WaMuSmHPPgaSA9Sp7jK', NULL, '2023-08-03 00:36:14', '2023-08-03 00:36:14'),
(134, 'Aan Gus\'ap Setiawan, S.Pd.', '1801041808990012', NULL, '$2y$10$0wjpQqCP2ASUKmInUB5OpOjRJ/ijk.tDD7KqUB.xV0.JnKQrnEM7S', NULL, '2023-08-03 00:36:14', '2023-08-03 00:36:14'),
(135, 'Afiani Subhan, S.Pd.', '1804115608000001', NULL, '$2y$10$3qQWJiKY0.X2tjB7cUPkEuvvOGq1q5LopFX96ejTuzx0hkEEIbMom', NULL, '2023-08-03 00:36:14', '2023-08-03 00:36:14'),
(136, 'Chandra Ramadan, S.Pd.', '1804042512990007', NULL, '$2y$10$RD5XndO1nDAhv1Fic0e8Lu8kKEoX/9WR5sz3S500bf2veMyOxUjmm', NULL, '2023-08-03 00:36:14', '2023-08-03 00:36:14'),
(137, 'Imroatus Sholikhah, S.Pd.', '1871085612990006', NULL, '$2y$10$gSGsBhhYUP2FYuMhPbD/5eF7kXU7B/7Ve7xkYG91FeMBOgJ8SC.3.', NULL, '2023-08-03 00:36:14', '2023-08-03 00:36:14'),
(138, 'Muhammad Fathan Syah, S.Pd.', '1871120902970003', NULL, '$2y$10$jf6DDJMzPcIJt90Tvohm..bAbfl6/vmrXAG2bVDXcYsq8VetsZJ9W', NULL, '2023-08-03 00:36:15', '2023-08-03 00:36:15'),
(139, 'Nurul Ikhsana Amalia, S.Pd.', '1803012310000001', NULL, '$2y$10$Wb9ZCeRuOHMYiNwWv35qveM4GqB1TOTcHJiH5L9.QXHySy4nX5b.y', NULL, '2023-08-03 00:36:15', '2023-08-03 00:36:15'),
(140, 'Prayoga Ramadhani, S.Pd.', '1802072612990006', NULL, '$2y$10$kDWspHVwnnz5vLWHV1iple3tWdZQeY2/t67uLAOThbLIBfxm4vW2.', NULL, '2023-08-03 00:36:15', '2023-08-03 00:36:15'),
(141, 'Rizky Setiawan, S.Pd.', '1806011603990003', NULL, '$2y$10$zhGi3U/y7ASkXSqSPvUjDOuj.jpSFxmGbYS7cV6pwwOQL.Fg.DQTS', NULL, '2023-08-03 00:36:15', '2023-08-03 00:36:15'),
(142, 'Sigit Waluto, S.Pd.', '1871061001000005', NULL, '$2y$10$Te0QTagYM/CCHxT96M2SL.pxetpv1204LIENj3oYO.pTjN1/o5Qg6', NULL, '2023-08-03 00:36:15', '2023-08-03 00:36:15');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `absens`
--
ALTER TABLE `absens`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `distribusis`
--
ALTER TABLE `distribusis`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `KodeBarang` (`KodeBarang`),
  ADD KEY `KodeBarang_2` (`KodeBarang`);

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
  ADD KEY `KodeBarang` (`KodeBarang`),
  ADD KEY `HargaPerUnit` (`HargaPerUnit`);

--
-- Indexes for table `gudangs`
--
ALTER TABLE `gudangs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `KodeBarang` (`KodeBarang`),
  ADD KEY `KodeBarang_2` (`KodeBarang`);

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
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

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
  ADD KEY `KodeBarang` (`KodeBarang`),
  ADD KEY `Unit` (`Unit`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `ruangans`
--
ALTER TABLE `ruangans`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `Ruangan` (`Ruangan`),
  ADD KEY `Unit` (`Unit`);

--
-- Indexes for table `siswas`
--
ALTER TABLE `siswas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `absens`
--
ALTER TABLE `absens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `distribusis`
--
ALTER TABLE `distribusis`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `form_pembelians`
--
ALTER TABLE `form_pembelians`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `gudangs`
--
ALTER TABLE `gudangs`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `media`
--
ALTER TABLE `media`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `peminjaman_barangs`
--
ALTER TABLE `peminjaman_barangs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `ruangans`
--
ALTER TABLE `ruangans`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `siswas`
--
ALTER TABLE `siswas`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=143;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `gudangs`
--
ALTER TABLE `gudangs`
  ADD CONSTRAINT `gudangs_ibfk_1` FOREIGN KEY (`KodeBarang`) REFERENCES `form_pembelians` (`KodeBarang`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
