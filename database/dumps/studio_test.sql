-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Feb 19, 2025 at 02:12 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `studio_test`
--

-- --------------------------------------------------------

--
-- Table structure for table `attributes`
--

CREATE TABLE `attributes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `type` enum('text','date','number','select') NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attributes`
--

INSERT INTO `attributes` (`id`, `name`, `type`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'department', 'text', '2025-02-18 21:49:22', '2025-02-18 21:49:22', NULL),
(2, 'start_date', 'date', '2025-02-18 21:49:22', '2025-02-18 21:49:22', NULL),
(3, 'end_date', 'date', '2025-02-18 21:49:22', '2025-02-18 21:49:22', NULL),
(4, 'Full Desc', 'text', '2025-02-18 21:52:16', '2025-02-19 01:02:46', NULL),
(5, 'image', 'text', '2025-02-18 22:05:07', '2025-02-18 22:05:07', NULL),
(6, 'project ID 20', 'text', '2025-02-19 01:12:06', '2025-02-19 01:41:17', NULL),
(7, 'quidem', 'select', '2025-02-19 11:19:15', '2025-02-19 11:19:15', NULL),
(8, 'quos', 'date', '2025-02-19 11:21:18', '2025-02-19 11:21:18', NULL),
(9, 'animi', 'number', '2025-02-19 11:22:21', '2025-02-19 11:22:21', NULL),
(10, 'in', 'number', '2025-02-19 11:24:06', '2025-02-19 11:24:06', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `attribute_values`
--

CREATE TABLE `attribute_values` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `attribute_id` bigint(20) UNSIGNED NOT NULL,
  `entity_id` bigint(20) UNSIGNED NOT NULL,
  `value` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attribute_values`
--

INSERT INTO `attribute_values` (`id`, `attribute_id`, `entity_id`, `value`, `created_at`, `updated_at`, `deleted_at`) VALUES
(4, 1, 18, 'IT Department', '2025-02-18 22:26:56', '2025-02-18 22:26:56', NULL),
(5, 2, 18, '2025-06-01', '2025-02-18 22:26:56', '2025-02-18 22:26:56', NULL),
(6, 3, 18, 'Updated Name', '2025-02-18 22:26:56', '2025-02-19 02:07:13', '2025-02-19 02:07:13'),
(7, 1, 19, 'IT Department', '2025-02-18 22:29:15', '2025-02-18 22:32:54', NULL),
(8, 1, 20, 'Sales Department', '2025-02-18 23:57:25', '2025-02-18 23:57:25', NULL),
(9, 1, 21, 'Sales Department', '2025-02-19 00:01:35', '2025-02-19 00:01:35', NULL),
(10, 1, 22, 'HR Department', '2025-02-19 00:03:48', '2025-02-19 00:03:48', NULL),
(11, 1, 23, 'outside Department', '2025-02-19 00:11:05', '2025-02-19 00:17:44', '2025-02-19 00:17:44'),
(12, 5, 22, 'core of the project', '2025-02-19 02:04:32', '2025-02-19 02:04:32', NULL);

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
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(4, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(5, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(6, '2016_06_01_000004_create_oauth_clients_table', 1),
(7, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(8, '2019_08_19_000000_create_failed_jobs_table', 1),
(9, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(10, '2025_02_18_111812_create_projects_table', 1),
(11, '2025_02_18_111823_create_timesheets_table', 1),
(12, '2025_02_18_112057_create_user_project_table', 1),
(13, '2025_02_18_135659_create_attributes_table', 1),
(14, '2025_02_18_141710_create_attribute_values_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `scopes` text DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('0462518f433f223e9e933720912a7b2f87e2fafec5bccc9e7be03f2f1235ef18009e996cf9a9c6a2', 1, 1, 'API Token', '[]', 0, '2025-02-18 21:43:47', '2025-02-18 21:43:47', '2026-02-18 22:43:47'),
('081a83ba116cde03e1d4c6e758294bafbcb59dc4e31c503869c5d26efbfcfaa9f5c657c4043480c9', 37, 1, 'API Token', '[]', 0, '2025-02-19 11:32:53', '2025-02-19 11:32:53', '2026-02-19 12:32:53'),
('09c452f71bf8aa95f2590911fbbb4bc1bb04440b1b5e581419da65cb98c4898767423e10e2abcc9b', 30, 1, 'API Token', '[]', 0, '2025-02-19 11:28:34', '2025-02-19 11:28:34', '2026-02-19 12:28:34'),
('0d4bd4a6bb14b7cc458e4e4d73aa4bdff3bb33776e40b2d01ec9c4dd6ab587ba2448ee55869a5802', 32, 1, 'API Token', '[]', 0, '2025-02-19 11:30:16', '2025-02-19 11:30:16', '2026-02-19 12:30:16'),
('93dc43828c0ffedb13118e3bbcfecc40ccdbef54a90418f4b64b8a30b53e0fde35a74175e98785af', 1, 1, 'API Token', '[]', 0, '2025-02-18 21:43:24', '2025-02-18 21:43:24', '2026-02-18 22:43:24'),
('941ee90a54cba6a8f2136127ff8c4862e4d2ad779103f0fcec20a1561c538990929756b34e2db0f7', 34, 1, 'API Token', '[]', 0, '2025-02-19 11:31:13', '2025-02-19 11:31:13', '2026-02-19 12:31:13'),
('a01da4570a152f2b757aba3b3caa128fae516a5acccd2e6e12184d614b487413e280ea36822d068f', 1, 1, 'API Token', '[]', 0, '2025-02-18 21:42:31', '2025-02-18 21:42:31', '2026-02-18 22:42:31'),
('a721172e0818e020213de3a31b3321732fab91bd9fc387ecb1e44e8b0f9555c83ee4c83bcd31ba29', 1, 1, 'API Token', '[]', 0, '2025-02-18 23:21:02', '2025-02-18 23:21:02', '2026-02-19 00:21:02'),
('a76ffb154a2889894701f588d2b4055d3e60d63a962d2cf653626f55904c4162924c31ed4c56f9ea', 39, 1, 'API Token', '[]', 0, '2025-02-19 11:33:49', '2025-02-19 11:33:49', '2026-02-19 12:33:49'),
('cef80c33ada138d2325da3cf629d57a44fb7f45d11ee79ead23116476d44725ce90920b6a74ae4ac', 1, 1, 'API Token', '[]', 0, '2025-02-18 21:43:04', '2025-02-18 21:43:04', '2026-02-18 22:43:04'),
('e13d1e322ded168f0aa3a5e030d5ee765125af577866aa2baf5b3097c75e8bf68030a35b699a03e7', 36, 1, 'API Token', '[]', 0, '2025-02-19 11:32:19', '2025-02-19 11:32:19', '2026-02-19 12:32:19'),
('e766be8d8b74aeaf0f3e1d8d8f4a6cc0511fe412262caea3690db3e6fa1463a803469d00b9c1531d', 1, 1, 'API Token', '[]', 1, '2025-02-18 22:06:41', '2025-02-18 22:39:14', '2026-02-18 23:06:41'),
('f153416c1ff3efe28b9cd9344e7bcb66df9af7fc9ef30faeab47bcb972eb131c903981aa9e515449', 3, 1, 'API Token', '[]', 0, '2025-02-18 21:56:01', '2025-02-18 21:56:01', '2026-02-18 22:56:01'),
('fe7ec417748a475a7f0aab7fda04c6b85d19b99e5a8a85babfefad1f3c0a9671ae7b5223ee699bef', 1, 1, 'API Token', '[]', 0, '2025-02-18 21:44:28', '2025-02-18 21:44:28', '2026-02-18 22:44:28');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `scopes` text DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `secret` varchar(100) DEFAULT NULL,
  `provider` varchar(255) DEFAULT NULL,
  `redirect` text NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', 'm9L7xQGFnWSX0zQCqXfNn073qmOVCYcaDOU4loIb', NULL, 'http://localhost', 1, 0, 0, '2025-02-18 20:43:57', '2025-02-18 20:43:57'),
(2, NULL, 'Laravel Password Grant Client', 'vVBFwgnEOVH1wCKOFhdCOB2tLp3a2m5ZEUIZLCQH', 'users', 'http://localhost', 0, 1, 0, '2025-02-18 20:43:57', '2025-02-18 20:43:57');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2025-02-18 20:43:57', '2025-02-18 20:43:57');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) NOT NULL,
  `access_token_id` varchar(100) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
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

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'API Token', 'b5192b7c4de4698f6322f99c9688fc9ae85ca7acf9c16f78bf7157556a9995e3', '[\"*\"]', NULL, NULL, '2025-02-18 20:46:08', '2025-02-18 20:46:08'),
(2, 'App\\Models\\User', 1, 'API Token', '7f814f877c32311dafaa86c6d519ab43938e2943c021a05fc6b69b24bd6b929c', '[\"*\"]', NULL, NULL, '2025-02-18 20:49:46', '2025-02-18 20:49:46'),
(3, 'App\\Models\\User', 1, 'Test Token', '91f2b37d1d2ed4e040feed51dd5dc0394b9473a9fe2a75a9ec45c783964e718b', '[\"*\"]', NULL, NULL, '2025-02-18 20:52:33', '2025-02-18 20:52:33'),
(4, 'App\\Models\\User', 1, 'Test Token', 'cc7ef559e12cdd9145150e736e70154c3c7f24e8b896e20fb3d0498198639061', '[\"*\"]', NULL, NULL, '2025-02-18 20:54:26', '2025-02-18 20:54:26'),
(5, 'App\\Models\\User', 1, 'API Token', 'eb1becb6f0c986bbcd36411426a897d4dcee70451af1d8346b04acd97a1f0093', '[\"*\"]', NULL, NULL, '2025-02-18 20:56:42', '2025-02-18 20:56:42'),
(6, 'App\\Models\\User', 1, 'API Token', '44e71f2fbc8812e5572686aca336dd1705fa0907ac61e3d626506949152616f5', '[\"*\"]', NULL, NULL, '2025-02-18 20:59:12', '2025-02-18 20:59:12'),
(7, 'App\\Models\\User', 1, 'API Token', 'f5ac012298723ed0ec401316a6ea3313c9eab969f278f104f99086cdca8179db', '[\"*\"]', NULL, NULL, '2025-02-18 21:05:16', '2025-02-18 21:05:16'),
(8, 'App\\Models\\User', 1, 'API Token', '8b3b4148ea35f343058f8b744a1c55e7b3bc848c932d30a379d8f58719d0afb4', '[\"*\"]', NULL, NULL, '2025-02-18 21:06:59', '2025-02-18 21:06:59'),
(9, 'App\\Models\\User', 1, 'API Token', '865183b65d376f467cc1c91402b7659f7c80a19e0240986d24db9fb5448f29a9', '[\"*\"]', NULL, NULL, '2025-02-18 21:07:27', '2025-02-18 21:07:27'),
(10, 'App\\Models\\User', 1, 'API Token', 'def2f1e58fd05661e216149480fcefeb81169e9d05d8adf893e51432eb179491', '[\"*\"]', NULL, NULL, '2025-02-18 21:13:08', '2025-02-18 21:13:08'),
(11, 'App\\Models\\User', 1, 'API Token', '6a07068e4db0f649802954ced551d75fc89260b92fc86ff4111ba7cfe1c13f8d', '[\"*\"]', NULL, NULL, '2025-02-18 21:15:19', '2025-02-18 21:15:19'),
(12, 'App\\Models\\User', 1, 'API Token', '48b9cb63f1440b9ae9f961220a82e5b7f09545f40c0a01c2c0007793ca86bdb6', '[\"*\"]', NULL, NULL, '2025-02-18 21:28:39', '2025-02-18 21:28:39'),
(13, 'App\\Models\\User', 1, 'API Token', 'f1c34763006a73d2792246f76e44059db8cf1ad64d0861904dadb0b3994fa1b1', '[\"*\"]', NULL, NULL, '2025-02-18 21:30:11', '2025-02-18 21:30:11');

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE `projects` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` enum('active','completed','archived') NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `projects`
--

INSERT INTO `projects` (`id`, `name`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Project 1', 'active', '2025-02-18 21:47:12', '2025-02-18 21:47:12', NULL),
(2, 'Project 2', 'completed', '2025-02-18 21:47:12', '2025-02-18 21:47:12', NULL),
(3, 'Dima Project', 'active', '2025-02-18 22:13:53', '2025-02-19 00:01:46', NULL),
(18, 'Dima', 'active', '2025-02-18 22:26:56', '2025-02-18 22:26:56', NULL),
(19, 'Taxi Project New', 'active', '2025-02-18 22:29:15', '2025-02-18 22:32:29', NULL),
(20, 'project ID 20', 'active', '2025-02-18 23:57:25', '2025-02-19 00:59:44', NULL),
(21, 'Sec Project Dima', 'active', '2025-02-19 00:01:35', '2025-02-19 00:01:35', NULL),
(22, 'New Project 10', 'active', '2025-02-19 00:03:48', '2025-02-19 00:03:48', NULL),
(23, 'outside1 project', 'active', '2025-02-19 00:11:05', '2025-02-19 00:17:44', '2025-02-19 01:51:14');

-- --------------------------------------------------------

--
-- Table structure for table `timesheets`
--

CREATE TABLE `timesheets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `task_name` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `hours` int(11) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `project_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `timesheets`
--

INSERT INTO `timesheets` (`id`, `task_name`, `date`, `hours`, `user_id`, `project_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Updated Design DB', '2025-06-20', 6, 1, 1, '2025-02-18 21:47:12', '2025-02-19 00:57:22', NULL),
(3, 'core of the project', '2025-03-01', 16, 5, 22, '2025-02-19 00:52:27', '2025-02-19 00:58:24', '2025-02-19 00:58:24');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `password`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'massa', 'bazrtwo', 'massa@gmail.com', '$2y$12$MfLYLpZ2FiCHJ56ohE7gf.QMOKt.8h2xysQjt9zkqhQo4e8DMCJLG', '2025-02-18 20:46:08', '2025-02-18 20:46:08', NULL),
(2, 'diima', 'Sharaf', 'dema.sharaf1@gmail.com', '$2y$12$PBs9JGoMv5nBxPKNDKqldevUB4XPgd/R0UYygOdJ0uHx1mJN0gtem', '2025-02-18 21:47:12', '2025-02-18 23:43:02', NULL),
(3, 'massa 1', 'bazrtwo 1', 'massa1@gmail.com', '$2y$12$9R0WSfCNmL8IRy6hs8owvuoW7sBXCrcsQegH02xYiE7JwPR87nxzq', '2025-02-18 21:56:01', '2025-02-18 23:38:20', '2025-02-18 23:38:20'),
(5, 'abdual', 'bazrtwo', 'abd@gmail.com', '$2y$12$0./ISKwWwhcefDwTvC8MV.qRVcjmMzxbbbT6AI/z2.ClFR8LXNSDa', '2025-02-18 23:43:21', '2025-02-18 23:43:21', NULL),
(6, 'Hanan', 'bazrtwo', 'abd1@gmail.com', '$2y$12$nEk0EvscVALXrI8Ze0a32eLcBnzRZNT6RA/XgpA4gUMXGwEMokALu', '2025-02-19 00:32:17', '2025-02-19 01:00:49', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_project`
--

CREATE TABLE `user_project` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `project_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_project`
--

INSERT INTO `user_project` (`id`, `user_id`, `project_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 1, '2025-02-18 21:47:12', '2025-02-18 21:47:12', NULL),
(2, 1, 2, '2025-02-18 21:47:12', '2025-02-18 21:47:12', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attributes`
--
ALTER TABLE `attributes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attribute_values`
--
ALTER TABLE `attribute_values`
  ADD PRIMARY KEY (`id`),
  ADD KEY `attribute_values_attribute_id_foreign` (`attribute_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_auth_codes_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `timesheets`
--
ALTER TABLE `timesheets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `timesheets_user_id_foreign` (`user_id`),
  ADD KEY `timesheets_project_id_foreign` (`project_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `user_project`
--
ALTER TABLE `user_project`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_project_user_id_foreign` (`user_id`),
  ADD KEY `user_project_project_id_foreign` (`project_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `attributes`
--
ALTER TABLE `attributes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `attribute_values`
--
ALTER TABLE `attribute_values`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `projects`
--
ALTER TABLE `projects`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `timesheets`
--
ALTER TABLE `timesheets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `user_project`
--
ALTER TABLE `user_project`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `attribute_values`
--
ALTER TABLE `attribute_values`
  ADD CONSTRAINT `attribute_values_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`);

--
-- Constraints for table `timesheets`
--
ALTER TABLE `timesheets`
  ADD CONSTRAINT `timesheets_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`),
  ADD CONSTRAINT `timesheets_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `user_project`
--
ALTER TABLE `user_project`
  ADD CONSTRAINT `user_project_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`),
  ADD CONSTRAINT `user_project_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
