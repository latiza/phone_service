-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2024. Feb 25. 15:42
-- Kiszolgáló verziója: 10.4.27-MariaDB
-- PHP verzió: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `phone_service`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `brand`
--

CREATE TABLE `brand` (
  `brand_id` bigint(20) UNSIGNED NOT NULL,
  `brand_name` varchar(20) DEFAULT NULL,
  `brand_image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `brand`
--

INSERT INTO `brand` (`brand_id`, `brand_name`, `brand_image`, `created_at`, `updated_at`) VALUES
(1, 'Apple', 'apple.jpg', NULL, NULL),
(2, 'Xiaomi', 'xiaomi.jpg', NULL, NULL),
(3, 'Samsung', 'samsung.jpg', NULL, NULL),
(4, 'Huawei', 'huawei.jpg', NULL, NULL),
(5, 'Nokia', 'nokia.jpg', NULL, NULL),
(6, 'OnePlus', 'oneplus.jpg', NULL, NULL),
(7, 'Sony', 'sony.jpg', NULL, NULL),
(8, 'LG', 'lg.jpg', NULL, NULL),
(9, 'Lenovo', 'lenovo.jpg', NULL, NULL),
(10, 'Pixel', 'pixel.jpg', NULL, NULL);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `failed_jobs`
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
-- Tábla szerkezet ehhez a táblához `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2024_02_23_171309_create_brands_table', 1),
(6, '2024_02_23_172712_create_phonemodel_table', 1),
(7, '2024_02_23_173529_create_parts_table', 1),
(8, '2024_02_23_174012_create_typepart_table', 1),
(9, '2024_02_23_181046_create_type_phone_table', 1),
(10, '2024_02_23_181946_create_phone_models_table', 1),
(11, '2024_02_23_184036_drop_phone_models_table', 1),
(12, '2024_02_24_175453_create_phone_models_table', 2),
(13, '2024_02_24_181816_create_typeparts_table', 3),
(14, '2024_02_24_185340_create_parts_table', 4);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `parts`
--

CREATE TABLE `parts` (
  `part_id` bigint(20) UNSIGNED NOT NULL,
  `part_name` varchar(35) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `parts`
--

INSERT INTO `parts` (`part_id`, `part_name`, `created_at`, `updated_at`) VALUES
(1, 'akkumulátor', NULL, NULL),
(2, 'kijelző', NULL, NULL),
(3, 'töltőcsatlakozó', NULL, NULL),
(4, 'bekapcsoló gomb', NULL, NULL),
(5, 'hangerő gomb', NULL, NULL),
(6, 'hátlapi kamera', NULL, NULL),
(7, 'kamera lencse', NULL, NULL),
(8, 'hangszóró', NULL, NULL),
(9, 'szoftveres javítás', NULL, NULL);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `personal_access_tokens`
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
-- Tábla szerkezet ehhez a táblához `phonemodel`
--

CREATE TABLE `phonemodel` (
  `phonemodel_id` bigint(20) UNSIGNED NOT NULL,
  `phonemodel_name` varchar(15) DEFAULT NULL,
  `brand_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `phonemodel`
--

INSERT INTO `phonemodel` (`phonemodel_id`, `phonemodel_name`, `brand_id`, `created_at`, `updated_at`) VALUES
(1, '14', 1, NULL, NULL),
(2, 'SE', 1, NULL, NULL),
(3, 'Redmi', 2, NULL, NULL),
(4, 'MI', 2, NULL, NULL),
(5, 'Galaxy A', 3, NULL, NULL),
(6, 'Galaxy S', 3, NULL, NULL),
(7, 'P', 4, NULL, NULL),
(8, 'Mate', 4, NULL, NULL),
(9, '5.1', 5, NULL, NULL),
(10, '6.1', 5, NULL, NULL),
(11, '10', 6, NULL, NULL),
(12, '9', 6, NULL, NULL),
(13, 'Xperia Z', 7, NULL, NULL),
(14, 'Xperia XA', 7, NULL, NULL),
(15, 'K50', 8, NULL, NULL),
(16, 'G', 8, NULL, NULL),
(17, 'Vibe', 9, NULL, NULL),
(18, 'A', 9, NULL, NULL),
(19, '3', 10, NULL, NULL),
(20, '4', 10, NULL, NULL);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `typepart`
--

CREATE TABLE `typepart` (
  `type_part_id` bigint(20) UNSIGNED NOT NULL,
  `type_part_name` varchar(255) DEFAULT NULL,
  `repair` time DEFAULT NULL,
  `type_id` int(11) DEFAULT NULL,
  `part_id` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `typepart`
--

INSERT INTO `typepart` (`type_part_id`, `type_part_name`, `repair`, `type_id`, `part_id`, `price`, `created_at`, `updated_at`) VALUES
(1, 'Iphone 14 plus akkumulátor', '01:00:00', 1, 1, 19990, NULL, NULL),
(2, 'Iphone 14 plus kijelző', '02:00:00', 1, 2, 24990, NULL, NULL),
(3, 'Iphone 14 plus töltőcsatlakozó', '01:00:00', 1, 3, 19990, NULL, NULL),
(4, 'Iphone 14 plus bekapcsoló gomb', '01:00:00', 1, 4, 14990, NULL, NULL),
(5, 'Iphone 14 plus hangerő gomb', '01:00:00', 1, 5, 14990, NULL, NULL),
(6, 'Iphone 14 plus hátlapi kamera', '02:00:00', 1, 6, 10990, NULL, NULL),
(7, 'Iphone 14 plus kamera lencse', '01:00:00', 1, 7, 14990, NULL, NULL),
(8, 'Iphone 14 plus hangszóró', '02:00:00', 1, 8, 12990, NULL, NULL),
(9, 'Iphone 14 plus szoftveres javí', '02:00:00', 1, 9, 5990, NULL, NULL),
(10, 'Iphone 14 pro akkumulátor', '01:00:00', 2, 1, 19990, NULL, NULL),
(11, 'Iphone 14 pro kijelző', '02:00:00', 2, 2, 24990, NULL, NULL),
(12, 'Iphone 14 pro töltőcsatlakozó', '01:00:00', 2, 3, 19990, NULL, NULL),
(13, 'Iphone 14 pro bekapcsoló gomb', '01:00:00', 2, 4, 14990, NULL, NULL),
(14, 'Iphone 14 pro hangerő gomb', '01:00:00', 2, 5, 14990, NULL, NULL),
(15, 'Iphone 14 pro hátlapi kamera', '02:00:00', 2, 6, 10990, NULL, NULL),
(16, 'Iphone 14 pro kamera lencse', '01:00:00', 2, 7, 14990, NULL, NULL),
(17, 'Iphone 14 pro hangszóró', '02:00:00', 2, 8, 12990, NULL, NULL),
(18, 'Iphone 14 pro szoftveres javít', '02:00:00', 2, 9, 5990, NULL, NULL),
(19, 'Iphone SE 2.gen akkumulátor', '01:00:00', 3, 1, 19990, NULL, NULL),
(20, 'Iphone SE 2.gen kijelző', '02:00:00', 3, 2, 24990, NULL, NULL),
(21, 'Iphone SE 2.gen töltőcsatlakoz', '01:00:00', 3, 3, 19990, NULL, NULL),
(22, 'Iphone SE 2.gen bekapcsoló gom', '01:00:00', 3, 4, 14990, NULL, NULL),
(23, 'Iphone SE 2.gen hangerő gomb', '01:00:00', 3, 5, 14990, NULL, NULL),
(24, 'Iphone SE 2.gen hátlapi kamera', '02:00:00', 3, 6, 10990, NULL, NULL),
(25, 'Iphone SE 2.gen kamera lencse', '01:00:00', 3, 7, 14990, NULL, NULL),
(26, 'Iphone SE 2.gen hangszóró', '02:00:00', 3, 8, 12990, NULL, NULL),
(27, 'Iphone SE 2.gen szoftveres jav', '02:00:00', 3, 9, 5990, NULL, NULL),
(28, 'Iphone SE 3.gen akkumulátor', '01:00:00', 4, 1, 19990, NULL, NULL),
(29, 'Iphone SE 3.gen kijelző', '02:00:00', 4, 2, 24990, NULL, NULL),
(30, 'Iphone SE 3.gen töltőcsatlakoz', '01:00:00', 4, 3, 19990, NULL, NULL),
(31, 'Iphone SE 3.gen bekapcsoló gom', '01:00:00', 4, 4, 14990, NULL, NULL),
(32, 'Iphone SE 3.gen hangerő gomb', '01:00:00', 4, 5, 14990, NULL, NULL),
(33, 'Iphone SE 3.gen hátlapi kamera', '02:00:00', 4, 6, 10990, NULL, NULL),
(34, 'Iphone SE 3.gen kamera lencse', '01:00:00', 4, 7, 14990, NULL, NULL),
(35, 'Iphone SE 3.gen hangszóró', '02:00:00', 4, 8, 12990, NULL, NULL),
(36, 'Iphone SE 3.gen szoftveres jav', '02:00:00', 4, 9, 5990, NULL, NULL),
(37, 'Xiaomi Redmi Note 9 akkumuláto', '01:00:00', 5, 1, 19990, NULL, NULL),
(38, 'Xiaomi Redmi Note 9 kijelző', '02:00:00', 5, 2, 24990, NULL, NULL),
(39, 'Xiaomi Redmi Note 9 töltőcsatl', '01:00:00', 5, 3, 19990, NULL, NULL),
(40, 'Xiaomi Redmi Note 9 bekapcsoló', '01:00:00', 5, 4, 14990, NULL, NULL),
(41, 'Xiaomi Redmi Note 9 hangerő go', '01:00:00', 5, 5, 14990, NULL, NULL),
(42, 'Xiaomi Redmi Note 9 hátlapi ka', '02:00:00', 5, 6, 10990, NULL, NULL),
(43, 'Xiaomi Redmi Note 9 kamera len', '01:00:00', 5, 7, 14990, NULL, NULL),
(44, 'Xiaomi Redmi Note 9 hangszóró', '02:00:00', 5, 8, 12990, NULL, NULL),
(45, 'Xiaomi Redmi Note 9 szoftveres', '02:00:00', 5, 9, 5990, NULL, NULL),
(46, 'Xiaomi Redmi Note 8 akkumuláto', '01:00:00', 6, 1, 19990, NULL, NULL),
(47, 'Xiaomi Redmi Note 8 kijelző', '02:00:00', 6, 2, 24990, NULL, NULL),
(48, 'Xiaomi Redmi Note 8 töltőcsatl', '01:00:00', 6, 3, 19990, NULL, NULL),
(49, 'Xiaomi Redmi Note 8 bekapcsoló', '01:00:00', 6, 4, 14990, NULL, NULL),
(50, 'Xiaomi Redmi Note 8 hangerő go', '01:00:00', 6, 5, 14990, NULL, NULL),
(51, 'Xiaomi Redmi Note 8 hátlapi ka', '02:00:00', 6, 6, 10990, NULL, NULL),
(52, 'Xiaomi Redmi Note 8 kamera len', '01:00:00', 6, 7, 14990, NULL, NULL),
(53, 'Xiaomi Redmi Note 8 hangszóró', '02:00:00', 6, 8, 12990, NULL, NULL),
(54, 'Xiaomi Redmi Note 8 szoftveres', '02:00:00', 6, 9, 5990, NULL, NULL),
(55, 'Xiaomi MI 10T akkumulátor', '01:00:00', 7, 1, 19990, NULL, NULL),
(56, 'Xiaomi MI 10T kijelző', '02:00:00', 7, 2, 24990, NULL, NULL),
(57, 'Xiaomi MI 10T töltőcsatlakozó', '01:00:00', 7, 3, 19990, NULL, NULL),
(58, 'Xiaomi MI 10T bekapcsoló gomb', '01:00:00', 7, 4, 14990, NULL, NULL),
(59, 'Xiaomi MI 10T hangerő gomb', '01:00:00', 7, 5, 14990, NULL, NULL),
(60, 'Xiaomi MI 10T hátlapi kamera', '02:00:00', 7, 6, 10990, NULL, NULL),
(61, 'Xiaomi MI 10T kamera lencse', '01:00:00', 7, 7, 14990, NULL, NULL),
(62, 'Xiaomi MI 10T  hangszóró', '02:00:00', 7, 8, 12990, NULL, NULL),
(63, 'Xiaomi MI 10T szoftveres javít', '02:00:00', 7, 9, 5990, NULL, NULL),
(64, 'Xiaomi MI 10T PRO akkumulátor', '01:00:00', 8, 1, 19990, NULL, NULL),
(65, 'Xiaomi MI 10T PRO kijelző', '02:00:00', 8, 2, 24990, NULL, NULL),
(66, 'Xiaomi MI 10T PRO töltőcsatlak', '01:00:00', 8, 3, 19990, NULL, NULL),
(67, 'Xiaomi MI 10T PRO bekapcsoló g', '01:00:00', 8, 4, 14990, NULL, NULL),
(68, 'Xiaomi MI 10T PRO hangerő gomb', '01:00:00', 8, 5, 14990, NULL, NULL),
(69, 'Xiaomi MI 10T PRO hátlapi kame', '02:00:00', 8, 6, 10990, NULL, NULL),
(70, 'Xiaomi MI 10T PRO kamera lencs', '01:00:00', 8, 7, 14990, NULL, NULL),
(71, 'Xiaomi MI 10T  PRO hangszóró', '02:00:00', 8, 8, 12990, NULL, NULL),
(72, 'Xiaomi MI 10T PRO szoftveres j', '02:00:00', 8, 9, 5990, NULL, NULL),
(73, 'Samsung Galaxy A 54 akkumuláto', '01:00:00', 9, 1, 19990, NULL, NULL),
(74, 'Samsung Galaxy A 54 kijelző', '02:00:00', 9, 2, 24990, NULL, NULL),
(75, 'Samsung Galaxy A 54 töltőcsatl', '01:00:00', 9, 3, 19990, NULL, NULL),
(76, 'Samsung Galaxy A 54 bekapcsoló', '01:00:00', 9, 4, 14990, NULL, NULL),
(77, 'Samsung Galaxy A 54 hangerő go', '01:00:00', 9, 5, 14990, NULL, NULL),
(78, 'Samsung Galaxy A 54 hátlapi ka', '02:00:00', 9, 6, 10990, NULL, NULL),
(79, 'Samsung Galaxy A 54 kamera len', '01:00:00', 9, 7, 14990, NULL, NULL),
(80, 'Samsung Galaxy A 54 hangszóró', '02:00:00', 9, 8, 12990, NULL, NULL),
(81, 'Samsung Galaxy A 54 szoftveres', '02:00:00', 9, 9, 5990, NULL, NULL),
(82, 'Samsung Galaxy A 34 akkumuláto', '01:00:00', 10, 1, 19990, NULL, NULL),
(83, 'Samsung Galaxy A 34 kijelző', '02:00:00', 10, 2, 24990, NULL, NULL),
(84, 'Samsung Galaxy A 34 töltőcsatl', '01:00:00', 10, 3, 19990, NULL, NULL),
(85, 'Samsung Galaxy A 34 bekapcsoló', '01:00:00', 10, 4, 14990, NULL, NULL),
(86, 'Samsung Galaxy A 34 hangerő go', '01:00:00', 10, 5, 14990, NULL, NULL),
(87, 'Samsung Galaxy A 34 hátlapi ka', '02:00:00', 10, 6, 10990, NULL, NULL),
(88, 'Samsung Galaxy A 34 kamera len', '01:00:00', 10, 7, 14990, NULL, NULL),
(89, 'Samsung Galaxy A 34 hangszóró', '02:00:00', 10, 8, 12990, NULL, NULL),
(90, 'Samsung Galaxy A 34 szoftveres', '02:00:00', 10, 9, 5990, NULL, NULL),
(91, 'Samsung Galaxy S 21 akkumuláto', '01:00:00', 11, 1, 19990, NULL, NULL),
(92, 'Samsung Galaxy S 21 kijelző', '02:00:00', 11, 2, 24990, NULL, NULL),
(93, 'Samsung Galaxy S 21 töltőcsatl', '01:00:00', 11, 3, 19990, NULL, NULL),
(94, 'Samsung Galaxy S 21 bekapcsoló', '01:00:00', 11, 4, 14990, NULL, NULL),
(95, 'Samsung Galaxy S 21 hangerő go', '01:00:00', 11, 5, 14990, NULL, NULL),
(96, 'Samsung Galaxy S 21 hátlapi ka', '02:00:00', 11, 6, 10990, NULL, NULL),
(97, 'Samsung Galaxy S 21 kamera len', '01:00:00', 11, 7, 14990, NULL, NULL),
(98, 'Samsung Galaxy S 21 hangszóró', '02:00:00', 11, 8, 12990, NULL, NULL),
(99, 'Samsung Galaxy S 21 szoftveres', '02:00:00', 11, 9, 5990, NULL, NULL),
(100, 'Samsung Galaxy S 21 Ultra akku', '01:00:00', 12, 1, 19990, NULL, NULL),
(101, 'Samsung Galaxy S 21 Ultra kije', '02:00:00', 12, 2, 24990, NULL, NULL),
(102, 'Samsung Galaxy S 21 Ultra tölt', '01:00:00', 12, 3, 19990, NULL, NULL),
(103, 'Samsung Galaxy S 21 Ultra beka', '01:00:00', 12, 4, 14990, NULL, NULL),
(104, 'Samsung Galaxy S 21 Ultra hang', '01:00:00', 12, 5, 14990, NULL, NULL),
(105, 'Samsung Galaxy S 21 Ultra hátl', '02:00:00', 12, 6, 10990, NULL, NULL),
(106, 'Samsung Galaxy S 21 Ultra kame', '01:00:00', 12, 7, 14990, NULL, NULL),
(107, 'Samsung Galaxy S 21 Ultra hang', '02:00:00', 12, 8, 12990, NULL, NULL),
(108, 'Samsung Galaxy S 21 Ultra szof', '02:00:00', 12, 9, 5990, NULL, NULL),
(109, 'Huawei P 20 akkumulátor', '01:00:00', 13, 1, 19990, NULL, NULL),
(110, 'Huawei P 20 kijelző', '02:00:00', 13, 2, 24990, NULL, NULL),
(111, 'Huawei P 20 töltőcsatlakozó', '01:00:00', 13, 3, 19990, NULL, NULL),
(112, 'Huawei P 20 bekapcsoló gomb', '01:00:00', 13, 4, 14990, NULL, NULL),
(113, 'Huawei P 20 hangerő gomb', '01:00:00', 13, 5, 14990, NULL, NULL),
(114, 'Huawei P 20 hátlapi kamera', '02:00:00', 13, 6, 10990, NULL, NULL),
(115, 'Huawei P 20 kamera lencse', '01:00:00', 13, 7, 14990, NULL, NULL),
(116, 'Huawei P 20 hangszóró', '02:00:00', 13, 8, 12990, NULL, NULL),
(117, 'Huawei P 20 szoftveres javítás', '02:00:00', 13, 9, 5990, NULL, NULL),
(118, 'Huawei P 20 Pro akkumulátor', '01:00:00', 14, 1, 19990, NULL, NULL),
(119, 'Huawei P 20 Pro kijelző', '02:00:00', 14, 2, 24990, NULL, NULL),
(120, 'Huawei P 20 Pro töltőcsatlakoz', '01:00:00', 14, 3, 19990, NULL, NULL),
(121, 'Huawei P 20 Pro bekapcsoló gom', '01:00:00', 14, 4, 14990, NULL, NULL),
(122, 'Huawei P 20 Pro hangerő gomb', '01:00:00', 14, 5, 14990, NULL, NULL),
(123, 'Huawei P 20 Pro hátlapi kamera', '02:00:00', 14, 6, 10990, NULL, NULL),
(124, 'Huawei P 20 Pro kamera lencse', '01:00:00', 14, 7, 14990, NULL, NULL),
(125, 'Huawei P 20 Pro hangszóró', '02:00:00', 14, 8, 12990, NULL, NULL),
(126, 'Huawei P 20 Pro szoftveres jav', '02:00:00', 14, 9, 5990, NULL, NULL),
(127, 'Huawei Mate 10 akkumulátor', '01:00:00', 15, 1, 19990, NULL, NULL),
(128, 'Huawei Mate 10 kijelző', '02:00:00', 15, 2, 24990, NULL, NULL),
(129, 'Huawei Mate 10 töltőcsatlakozó', '01:00:00', 15, 3, 19990, NULL, NULL),
(130, 'Huawei Mate 10 bekapcsoló gomb', '01:00:00', 15, 4, 14990, NULL, NULL),
(131, 'Huawei Mate 10 hangerő gomb', '01:00:00', 15, 5, 14990, NULL, NULL),
(132, 'Huawei Mate 10 hátlapi kamera', '02:00:00', 15, 6, 10990, NULL, NULL),
(133, 'Huawei Mate 10 kamera lencse', '01:00:00', 15, 7, 14990, NULL, NULL),
(134, 'Huawei Mate 10 hangszóró', '02:00:00', 15, 8, 12990, NULL, NULL),
(135, 'Huawei Mate 10 szoftveres javí', '02:00:00', 15, 9, 5990, NULL, NULL),
(136, 'Huawei Mate 10 Pro akkumulátor', '01:00:00', 16, 1, 19990, NULL, NULL),
(137, 'Huawei Mate 10 Pro kijelző', '02:00:00', 16, 2, 24990, NULL, NULL),
(138, 'Huawei Mate 10 Pro töltőcsatla', '01:00:00', 16, 3, 19990, NULL, NULL),
(139, 'Huawei Mate 10 Pro bekapcsoló ', '01:00:00', 16, 4, 14990, NULL, NULL),
(140, 'Huawei Mate 10 Pro hangerő gom', '01:00:00', 16, 5, 14990, NULL, NULL),
(141, 'Huawei Mate 10 Pro hátlapi kam', '02:00:00', 16, 6, 10990, NULL, NULL),
(142, 'Huawei Mate 10 Pro kamera lenc', '01:00:00', 16, 7, 14990, NULL, NULL),
(143, 'Huawei Mate 10 Pro hangszóró', '02:00:00', 16, 8, 12990, NULL, NULL),
(144, 'Huawei Mate 10 Pro szoftveres ', '02:00:00', 16, 9, 5990, NULL, NULL),
(145, 'Nokia 5.1 Plus akkumulátor', '01:00:00', 17, 1, 19990, NULL, NULL),
(146, 'Nokia 5.1 Plus kijelző', '02:00:00', 17, 2, 24990, NULL, NULL),
(147, 'Nokia 5.1 Plus töltőcsatlakozó', '01:00:00', 17, 3, 19990, NULL, NULL),
(148, 'Nokia 5.1 Plus bekapcsoló gomb', '01:00:00', 17, 4, 14990, NULL, NULL),
(149, 'Nokia 5.1 Plus hangerő gomb', '01:00:00', 17, 5, 14990, NULL, NULL),
(150, 'Nokia 5.1 Plus hátlapi kamera', '02:00:00', 17, 6, 10990, NULL, NULL),
(151, 'Nokia 5.1 Plus kamera lencse', '01:00:00', 17, 7, 14990, NULL, NULL),
(152, 'Nokia 5.1 Plus hangszóró', '02:00:00', 17, 8, 12990, NULL, NULL),
(153, 'Nokia 5.1 Plus szoftveres javí', '02:00:00', 17, 9, 5990, NULL, NULL),
(154, 'Nokia 6.1 Plus akkumulátor', '01:00:00', 18, 1, 19990, NULL, NULL),
(155, 'Nokia 6.1 Plus kijelző', '02:00:00', 18, 2, 24990, NULL, NULL),
(156, 'Nokia 6.1 Plus töltőcsatlakozó', '01:00:00', 18, 3, 19990, NULL, NULL),
(157, 'Nokia 6.1 Plus bekapcsoló gomb', '01:00:00', 18, 4, 14990, NULL, NULL),
(158, 'Nokia 6.1 Plus hangerő gomb', '01:00:00', 18, 5, 14990, NULL, NULL),
(159, 'Nokia 6.1 Plus hátlapi kamera', '02:00:00', 18, 6, 10990, NULL, NULL),
(160, 'Nokia 6.1 Plus kamera lencse', '01:00:00', 18, 7, 14990, NULL, NULL),
(161, 'Nokia 6.1 Plus hangszóró', '02:00:00', 18, 8, 12990, NULL, NULL),
(162, 'Nokia 6.1 Plus szoftveres javí', '02:00:00', 18, 9, 5990, NULL, NULL),
(163, 'OnePlus 10 Pro akkumulátor', '01:00:00', 19, 1, 19990, NULL, NULL),
(164, 'OnePlus 10 Pro kijelző', '02:00:00', 19, 2, 24990, NULL, NULL),
(165, 'OnePlus 10 Pro töltőcsatlakozó', '01:00:00', 19, 3, 19990, NULL, NULL),
(166, 'OnePlus 10 Pro bekapcsoló gomb', '01:00:00', 19, 4, 14990, NULL, NULL),
(167, 'OnePlus 10 Pro hangerő gomb', '01:00:00', 19, 5, 14990, NULL, NULL),
(168, 'OnePlus 10 Pro hátlapi kamera', '02:00:00', 19, 6, 10990, NULL, NULL),
(169, 'OnePlus 10 Pro kamera lencse', '01:00:00', 19, 7, 14990, NULL, NULL),
(170, 'OnePlus 10 Pro hangszóró', '02:00:00', 19, 8, 12990, NULL, NULL),
(171, 'OnePlus 10 Pro szoftveres javí', '02:00:00', 19, 9, 5990, NULL, NULL),
(172, 'OnePlus 10 T akkumulátor', '01:00:00', 20, 1, 19990, NULL, NULL),
(173, 'OnePlus 10 T kijelző', '02:00:00', 20, 2, 24990, NULL, NULL),
(174, 'OnePlus 10 T töltőcsatlakozó', '01:00:00', 20, 3, 19990, NULL, NULL),
(175, 'OnePlus 10 T bekapcsoló gomb', '01:00:00', 20, 4, 14990, NULL, NULL),
(176, 'OnePlus 10 T hangerő gomb', '01:00:00', 20, 5, 14990, NULL, NULL),
(177, 'OnePlus 10 T hátlapi kamera', '02:00:00', 20, 6, 10990, NULL, NULL),
(178, 'OnePlus 10 T kamera lencse', '01:00:00', 20, 7, 14990, NULL, NULL),
(179, 'OnePlus 10 T hangszóró', '02:00:00', 20, 8, 12990, NULL, NULL),
(180, 'OnePlus 10 T szoftveres javítá', '02:00:00', 20, 9, 5990, NULL, NULL),
(181, 'OnePlus 9 Pro akkumulátor', '01:00:00', 21, 1, 19990, NULL, NULL),
(182, 'OnePlus 9 Pro kijelző', '02:00:00', 21, 2, 24990, NULL, NULL),
(183, 'OnePlus 9 Pro töltőcsatlakozó', '01:00:00', 21, 3, 19990, NULL, NULL),
(184, 'OnePlus 9 Pro bekapcsoló gomb', '01:00:00', 21, 4, 14990, NULL, NULL),
(185, 'OnePlus 9 Pro hangerő gomb', '01:00:00', 21, 5, 14990, NULL, NULL),
(186, 'OnePlus 9 Pro hátlapi kamera', '02:00:00', 21, 6, 10990, NULL, NULL),
(187, 'OnePlus 9 Pro kamera lencse', '01:00:00', 21, 7, 14990, NULL, NULL),
(188, 'OnePlus 9 Pro hangszóró', '02:00:00', 21, 8, 12990, NULL, NULL),
(189, 'OnePlus 9 Pro szoftveres javít', '02:00:00', 21, 9, 5990, NULL, NULL),
(190, 'Sony Xperia Z 1 akkumulátor', '01:00:00', 22, 1, 19990, NULL, NULL),
(191, 'Sony Xperia Z 1 kijelző', '02:00:00', 22, 2, 24990, NULL, NULL),
(192, 'Sony Xperia Z 1 töltőcsatlakoz', '01:00:00', 22, 3, 19990, NULL, NULL),
(193, 'Sony Xperia Z 1 bekapcsoló gom', '01:00:00', 22, 4, 14990, NULL, NULL),
(194, 'Sony Xperia Z 1 hangerő gomb', '01:00:00', 22, 5, 14990, NULL, NULL),
(195, 'Sony Xperia Z 1 hátlapi kamera', '02:00:00', 22, 6, 10990, NULL, NULL),
(196, 'Sony Xperia Z 1 kamera lencse', '01:00:00', 22, 7, 14990, NULL, NULL),
(197, 'Sony Xperia Z 1 hangszóró', '02:00:00', 22, 8, 12990, NULL, NULL),
(198, 'Sony Xperia Z 1 szoftveres jav', '02:00:00', 22, 9, 5990, NULL, NULL),
(199, 'Sony Xperia XA 2 akkumulátor', '01:00:00', 23, 1, 19990, NULL, NULL),
(200, 'Sony Xperia XA 2 kijelző', '02:00:00', 23, 2, 24990, NULL, NULL),
(201, 'Sony Xperia XA 2 töltőcsatlako', '01:00:00', 23, 3, 19990, NULL, NULL),
(202, 'Sony Xperia XA 2 bekapcsoló go', '01:00:00', 23, 4, 14990, NULL, NULL),
(203, 'Sony Xperia XA 2 hangerő gomb', '01:00:00', 23, 5, 14990, NULL, NULL),
(204, 'Sony Xperia XA 2 hátlapi kamer', '02:00:00', 23, 6, 10990, NULL, NULL),
(205, 'Sony Xperia XA 2 kamera lencse', '01:00:00', 23, 7, 14990, NULL, NULL),
(206, 'Sony Xperia XA 2 hangszóró', '02:00:00', 23, 8, 12990, NULL, NULL),
(207, 'Sony Xperia XA 2 szoftveres ja', '02:00:00', 23, 9, 5990, NULL, NULL),
(208, 'Lg K50 S akkumulátor', '01:00:00', 24, 1, 19990, NULL, NULL),
(209, 'Lg K50 S kijelző', '02:00:00', 24, 2, 24990, NULL, NULL),
(210, 'Lg K50 S töltőcsatlakozó', '01:00:00', 24, 3, 19990, NULL, NULL),
(211, 'Lg K50 S bekapcsoló gomb', '01:00:00', 24, 4, 14990, NULL, NULL),
(212, 'Lg K50 S hangerő gomb', '01:00:00', 24, 5, 14990, NULL, NULL),
(213, 'Lg K50 S hátlapi kamera', '02:00:00', 24, 6, 10990, NULL, NULL),
(214, 'Lg K50 S kamera lencse', '01:00:00', 24, 7, 14990, NULL, NULL),
(215, 'Lg K50 S hangszóró', '02:00:00', 24, 8, 12990, NULL, NULL),
(216, 'Lg K50 S szoftveres javítás', '02:00:00', 24, 9, 5990, NULL, NULL),
(217, 'Lg G 5 akkumulátor', '01:00:00', 25, 1, 19990, NULL, NULL),
(218, 'Lg G 5 kijelző', '02:00:00', 25, 2, 24990, NULL, NULL),
(219, 'Lg G 5 töltőcsatlakozó', '01:00:00', 25, 3, 19990, NULL, NULL),
(220, 'Lg G 5 bekapcsoló gomb', '01:00:00', 25, 4, 14990, NULL, NULL),
(221, 'Lg G 5 hangerő gomb', '01:00:00', 25, 5, 14990, NULL, NULL),
(222, 'Lg G 5 hátlapi kamera', '02:00:00', 25, 6, 10990, NULL, NULL),
(223, 'Lg G 5 kamera lencse', '01:00:00', 25, 7, 14990, NULL, NULL),
(224, 'Lg G 5 hangszóró', '02:00:00', 25, 8, 12990, NULL, NULL),
(225, 'Lg G 5 szoftveres javítás', '02:00:00', 25, 9, 5990, NULL, NULL),
(226, 'Lg G 6 akkumulátor', '01:00:00', 26, 1, 19990, NULL, NULL),
(227, 'Lg G 6 kijelző', '02:00:00', 26, 2, 24990, NULL, NULL),
(228, 'Lg G 6 töltőcsatlakozó', '01:00:00', 26, 3, 19990, NULL, NULL),
(229, 'Lg G 6 bekapcsoló gomb', '01:00:00', 26, 4, 14990, NULL, NULL),
(230, 'Lg G 6 hangerő gomb', '01:00:00', 26, 5, 14990, NULL, NULL),
(231, 'Lg G 6 hátlapi kamera', '02:00:00', 26, 6, 10990, NULL, NULL),
(232, 'Lg G 6 kamera lencse', '01:00:00', 26, 7, 14990, NULL, NULL),
(233, 'Lg G 6 hangszóró', '02:00:00', 26, 8, 12990, NULL, NULL),
(234, 'Lg G 6 szoftveres javítás', '02:00:00', 26, 9, 5990, NULL, NULL),
(235, 'Lenovo Vibe K5 akkumulátor', '01:00:00', 27, 1, 19990, NULL, NULL),
(236, 'Lenovo Vibe K5 kijelző', '02:00:00', 27, 2, 24990, NULL, NULL),
(237, 'Lenovo Vibe K5 töltőcsatlakozó', '01:00:00', 27, 3, 19990, NULL, NULL),
(238, 'Lenovo Vibe K5 bekapcsoló gomb', '01:00:00', 27, 4, 14990, NULL, NULL),
(239, 'Lenovo Vibe K5 hangerő gomb', '01:00:00', 27, 5, 14990, NULL, NULL),
(240, 'Lenovo Vibe K5 hátlapi kamera', '02:00:00', 27, 6, 10990, NULL, NULL),
(241, 'Lenovo Vibe K5 kamera lencse', '01:00:00', 27, 7, 14990, NULL, NULL),
(242, 'Lenovo Vibe K5 hangszóró', '02:00:00', 27, 8, 12990, NULL, NULL),
(243, 'Lenovo Vibe K5 szoftveres javí', '02:00:00', 27, 9, 5990, NULL, NULL),
(244, 'Lenovo Vibe X akkumulátor', '01:00:00', 28, 1, 19990, NULL, NULL),
(245, 'Lenovo Vibe X kijelző', '02:00:00', 28, 2, 24990, NULL, NULL),
(246, 'Lenovo Vibe X töltőcsatlakozó', '01:00:00', 28, 3, 19990, NULL, NULL),
(247, 'Lenovo Vibe X bekapcsoló gomb', '01:00:00', 28, 4, 14990, NULL, NULL),
(248, 'Lenovo Vibe X hangerő gomb', '01:00:00', 28, 5, 14990, NULL, NULL),
(249, 'Lenovo Vibe X hátlapi kamera', '02:00:00', 28, 6, 10990, NULL, NULL),
(250, 'Lenovo Vibe X kamera lencse', '01:00:00', 28, 7, 14990, NULL, NULL),
(251, 'Lenovo Vibe X hangszóró', '02:00:00', 28, 8, 12990, NULL, NULL),
(252, 'Lenovo Vibe X szoftveres javít', '02:00:00', 28, 9, 5990, NULL, NULL),
(253, 'Lenovo A 7000 akkumulátor', '01:00:00', 29, 1, 19990, NULL, NULL),
(254, 'Lenovo A 7000 kijelző', '02:00:00', 29, 2, 24990, NULL, NULL),
(255, 'Lenovo A 7000 töltőcsatlakozó', '01:00:00', 29, 3, 19990, NULL, NULL),
(256, 'Lenovo A 7000 bekapcsoló gomb', '01:00:00', 29, 4, 14990, NULL, NULL),
(257, 'Lenovo A 7000 hangerő gomb', '01:00:00', 29, 5, 14990, NULL, NULL),
(258, 'Lenovo A 7000 hátlapi kamera', '02:00:00', 29, 6, 10990, NULL, NULL),
(259, 'Lenovo A 7000 kamera lencse', '01:00:00', 29, 7, 14990, NULL, NULL),
(260, 'Lenovo A 7000 hangszóró', '02:00:00', 29, 8, 12990, NULL, NULL),
(261, 'Lenovo A 7000 szoftveres javít', '02:00:00', 29, 9, 5990, NULL, NULL),
(262, 'Lenovo A 820 akkumulátor', '01:00:00', 30, 1, 19990, NULL, NULL),
(263, 'Lenovo A 820 kijelző', '02:00:00', 30, 2, 24990, NULL, NULL),
(264, 'Lenovo A 820 töltőcsatlakozó', '01:00:00', 30, 3, 19990, NULL, NULL),
(265, 'Lenovo A 820 bekapcsoló gomb', '01:00:00', 30, 4, 14990, NULL, NULL),
(266, 'Lenovo A 820 hangerő gomb', '01:00:00', 30, 5, 14990, NULL, NULL),
(267, 'Lenovo A 820 hátlapi kamera', '02:00:00', 30, 6, 10990, NULL, NULL),
(268, 'Lenovo A 820 kamera lencse', '01:00:00', 30, 7, 14990, NULL, NULL),
(269, 'Lenovo A 820 hangszóró', '02:00:00', 30, 8, 12990, NULL, NULL),
(270, 'Lenovo A 820 szoftveres javítá', '02:00:00', 30, 9, 5990, NULL, NULL),
(271, 'Pixel 3 XL akkumulátor', '01:00:00', 31, 1, 19990, NULL, NULL),
(272, 'Pixel 3 XL kijelző', '02:00:00', 31, 2, 24990, NULL, NULL),
(273, 'Pixel 3 XL töltőcsatlakozó', '01:00:00', 31, 3, 19990, NULL, NULL),
(274, 'Pixel 3 XL bekapcsoló gomb', '01:00:00', 31, 4, 14990, NULL, NULL),
(275, 'Pixel 3 XL hangerő gomb', '01:00:00', 31, 5, 14990, NULL, NULL),
(276, 'Pixel 3 XL hátlapi kamera', '02:00:00', 31, 6, 10990, NULL, NULL),
(277, 'Pixel 3 XL kamera lencse', '01:00:00', 31, 7, 14990, NULL, NULL),
(278, 'Pixel 3 XL hangszóró', '02:00:00', 31, 8, 12990, NULL, NULL),
(279, 'Pixel 3 XL szoftveres javítás', '02:00:00', 31, 9, 5990, NULL, NULL),
(280, 'Pixel 3 A akkumulátor', '01:00:00', 32, 1, 19990, NULL, NULL),
(281, 'Pixel 3 A kijelző', '02:00:00', 32, 2, 24990, NULL, NULL),
(282, 'Pixel 3 A töltőcsatlakozó', '01:00:00', 32, 3, 19990, NULL, NULL),
(283, 'Pixel 3 A bekapcsoló gomb', '01:00:00', 32, 4, 14990, NULL, NULL),
(284, 'Pixel 3 A hangerő gomb', '01:00:00', 32, 5, 14990, NULL, NULL),
(285, 'Pixel 3 A hátlapi kamera', '02:00:00', 32, 6, 10990, NULL, NULL),
(286, 'Pixel 3 A kamera lencse', '01:00:00', 32, 7, 14990, NULL, NULL),
(287, 'Pixel 3 A hangszóró', '02:00:00', 32, 8, 12990, NULL, NULL),
(288, 'Pixel 3 A szoftveres javítás', '02:00:00', 32, 9, 5990, NULL, NULL),
(289, 'Pixel 4 XL akkumulátor', '01:00:00', 33, 1, 19990, NULL, NULL),
(290, 'Pixel 4 XL kijelző', '02:00:00', 33, 2, 24990, NULL, NULL),
(291, 'Pixel 4 XL töltőcsatlakozó', '01:00:00', 33, 3, 19990, NULL, NULL),
(292, 'Pixel 4 XL bekapcsoló gomb', '01:00:00', 33, 4, 14990, NULL, NULL),
(293, 'Pixel 4 XL hangerő gomb', '01:00:00', 33, 5, 14990, NULL, NULL),
(294, 'Pixel 4 XL hátlapi kamera', '02:00:00', 33, 6, 10990, NULL, NULL),
(295, 'Pixel 4 XL kamera lencse', '01:00:00', 33, 7, 14990, NULL, NULL),
(296, 'Pixel 4 XL hangszóró', '02:00:00', 33, 8, 12990, NULL, NULL),
(297, 'Pixel 4 XL szoftveres javítás', '02:00:00', 33, 9, 5990, NULL, NULL),
(298, 'Pixel 4 A akkumulátor', '01:00:00', 34, 1, 19990, NULL, NULL),
(299, 'Pixel 4 A kijelző', '02:00:00', 34, 2, 24990, NULL, NULL),
(300, 'Pixel 4 A töltőcsatlakozó', '01:00:00', 34, 3, 19990, NULL, NULL),
(301, 'Pixel 4 A bekapcsoló gomb', '01:00:00', 34, 4, 14990, NULL, NULL),
(302, 'Pixel 4 A hangerő gomb', '01:00:00', 34, 5, 14990, NULL, NULL),
(303, 'Pixel 4 A hátlapi kamera', '02:00:00', 34, 6, 10990, NULL, NULL),
(304, 'Pixel 4 A kamera lencse', '01:00:00', 34, 7, 14990, NULL, NULL),
(305, 'Pixel 4 A hangszóró', '02:00:00', 34, 8, 12990, NULL, NULL),
(306, 'Pixel 4 A szoftveres javítás', '02:00:00', 34, 9, 5990, NULL, NULL);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `type_phone`
--

CREATE TABLE `type_phone` (
  `type_id` int(11) NOT NULL,
  `type_name` varchar(15) DEFAULT NULL,
  `phonemodel_id` int(11) DEFAULT NULL,
  `type_image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `type_phone`
--

INSERT INTO `type_phone` (`type_id`, `type_name`, `phonemodel_id`, `type_image`, `created_at`, `updated_at`) VALUES
(1, 'plus', 1, 'phone1.jpg', NULL, NULL),
(2, 'pro', 1, 'phone1.jpg\r\n', NULL, NULL),
(3, '2.gen', 2, 'phone2.jpg', NULL, NULL),
(4, '3.gen', 2, 'phone1.jpg', NULL, NULL),
(5, 'Note 9', 3, 'phone3.jpg', NULL, NULL),
(6, 'Note 8', 3, 'phone2.jpg', NULL, NULL),
(7, '10T', 4, 'phone1.jpg', NULL, NULL),
(8, '10T Pro', 4, 'phone3.jpg', NULL, NULL),
(9, '54', 5, 'phone2.jpg', NULL, NULL),
(10, '34', 5, 'phone2.jpg', NULL, NULL),
(11, '21', 6, 'phone1.jpg', NULL, NULL),
(12, '21 Ultra', 6, 'phone1.jpg', NULL, NULL),
(13, '20', 7, 'phone2.jpg', NULL, NULL),
(14, '20 Pro', 7, 'phone3.jpg', NULL, NULL),
(15, '10', 8, 'phone1.jpg', NULL, NULL),
(16, '10 Pro', 8, 'phone2.jpg', NULL, NULL),
(17, 'Plus', 9, 'phone3.jpg', NULL, NULL),
(18, 'Plus', 10, 'phone1.jpg', NULL, NULL),
(19, 'Pro', 11, 'phone2.jpg', NULL, NULL),
(20, 'T', 11, 'phone2.jpg', NULL, NULL),
(21, 'Pro', 12, 'phone3.jpg', NULL, NULL),
(22, '1', 13, 'phone3.jpg', NULL, NULL),
(23, '2', 14, 'phone1.jpg', NULL, NULL),
(24, 's', 15, 'phone2.jpg', NULL, NULL),
(25, '5', 16, 'phone3.jpg', NULL, NULL),
(26, '6', 16, 'phone2.jpg', NULL, NULL),
(27, 'K5', 17, 'phone3.jpg', NULL, NULL),
(28, 'X', 17, 'phone1.jpg', NULL, NULL),
(29, '7000', 18, 'phone3.jpg', NULL, NULL),
(30, '820', 18, 'phone3.jpg', NULL, NULL),
(31, 'XL', 19, 'phone2.jpg', NULL, NULL),
(32, 'a', 19, 'phone1.jpg', NULL, NULL),
(33, 'XL', 20, 'phone2.jpg', NULL, NULL),
(34, 'a', 20, 'phone1.jpg', NULL, NULL);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Zita Ruzsinszki', 'zita.ruzsinszki@gmail.com', NULL, '$2y$12$9YxT5STs86k48PKElRKIp.uDuze9gy2dn1vc0gRwkXIPKshKa2ZvW', NULL, '2024-02-23 19:16:32', '2024-02-23 19:16:32'),
(2, 'Zita', 'zita@gmail.com', NULL, '$2y$12$aSjKtdvfVDGIbyPIuV.7zu7SbaavJc9Qk1gX0bb/DCgxuJCsXIFNu', NULL, '2024-02-24 19:52:53', '2024-02-24 19:52:53');

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `brand`
--
ALTER TABLE `brand`
  ADD PRIMARY KEY (`brand_id`);

--
-- A tábla indexei `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- A tábla indexei `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `parts`
--
ALTER TABLE `parts`
  ADD PRIMARY KEY (`part_id`);

--
-- A tábla indexei `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- A tábla indexei `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- A tábla indexei `phonemodel`
--
ALTER TABLE `phonemodel`
  ADD PRIMARY KEY (`phonemodel_id`),
  ADD KEY `phonemodel_brand_id_foreign` (`brand_id`);

--
-- A tábla indexei `typepart`
--
ALTER TABLE `typepart`
  ADD PRIMARY KEY (`type_part_id`),
  ADD KEY `typepart_type_id_index` (`type_id`),
  ADD KEY `typepart_part_id_index` (`part_id`);

--
-- A tábla indexei `type_phone`
--
ALTER TABLE `type_phone`
  ADD PRIMARY KEY (`type_id`);

--
-- A tábla indexei `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `brand`
--
ALTER TABLE `brand`
  MODIFY `brand_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT a táblához `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT a táblához `parts`
--
ALTER TABLE `parts`
  MODIFY `part_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT a táblához `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `phonemodel`
--
ALTER TABLE `phonemodel`
  MODIFY `phonemodel_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT a táblához `typepart`
--
ALTER TABLE `typepart`
  MODIFY `type_part_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=307;

--
-- AUTO_INCREMENT a táblához `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `phonemodel`
--
ALTER TABLE `phonemodel`
  ADD CONSTRAINT `phonemodel_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `brand` (`brand_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
