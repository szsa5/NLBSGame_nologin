-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: db:3306
-- Generation Time: Mar 17, 2023 at 05:48 AM
-- Server version: 5.7.41
-- PHP Version: 8.1.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `grinch`
--

-- --------------------------------------------------------

--
-- Table structure for table `certificates`
--

CREATE TABLE `certificates` (
  `id` int(11) NOT NULL,
  `name` varchar(1000) NOT NULL,
  `email` varchar(1000) NOT NULL,
  `sessionName` varchar(1000) NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `image` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `certificates`
--

INSERT INTO `certificates` (`id`, `name`, `email`, `sessionName`, `date`, `image`) VALUES
(52, 'Laiba', 'laibaqazzafi09@gmail.com', 'Bitlogicx', '2023-03-06 11:10:25', 'y8cmv.static_Layer0.png'),
(53, 'Aqib', 'aqib@bitlogicx.com', 'Bitlogicx', '2023-03-06 11:10:25', 'eglmn.static_Layer0.png'),
(54, 'Muneeb', 'muneebwaseem40@gmail.com', 'Bitlogicx', '2023-03-06 11:10:25', 'cg7l3.static_Layer0.png'),
(55, 'Laiba', 'laibaqazzafi09@gmail.com', 'Laiba', '2023-03-06 11:11:49', 'j0qab.static_Layer0.png'),
(56, 'Aqib', 'aqib@bitlogicx.com', 'Laiba', '2023-03-06 11:11:49', '8yf0r.static_Layer0.png'),
(57, 'Muneeb', 'muneebwaseem40@gmail.com', 'Laiba', '2023-03-06 11:11:49', 'y2zr2.static_Layer0.png'),
(58, 'Laiba', 'laibaqazzafi09@gmail.com', 'Laiba', '2023-03-06 11:11:49', 'msnbw.static_Layer0.png'),
(59, 'Aqib', 'aqib@bitlogicx.com', 'Laiba', '2023-03-06 11:11:49', 'mbndd.static_Layer0.png'),
(60, 'Muneeb', 'muneebwaseem40@gmail.com', 'Laiba', '2023-03-06 11:11:49', '0xjai.static_Layer0.png'),
(61, 'Laiba', 'laibaqazzafi09@gmail.com', '', '2023-03-08 13:06:58', 'aphgd.static_Layer1.png'),
(62, 'Laiba', 'laibaqazzafi09@gmail.com', '', '2023-03-08 13:12:08', 'ed4so.static_Layer1.png'),
(63, 'Laiba', 'laibaqazzafi09@gmail.com', '', '2023-03-08 13:13:58', 'gqpz2.static_Layer1.png'),
(64, 'Laiba', 'laibaqazzafi09@gmail.com', '', '2023-03-08 13:15:57', 'o1dnk.static_Layer1.png'),
(65, 'Laiba', 'laibaqazzafi09@gmail.com', '', '2023-03-08 13:42:06', 'lj0n8.static_Layer1.png'),
(66, 'Laiba', 'laibaqazzafi09@gmail.com', '', '2023-03-08 13:42:27', 'z7l6b.static_Layer1.png'),
(67, 'Laiba', 'laibaqazzafi09@gmail.com', '', '2023-03-08 13:43:32', 'hizui.static_Layer1.png'),
(68, 'Laiba', 'laibaqazzafi09@gmail.com', '', '2023-03-08 13:44:37', 'dmmcm.static_Layer1.png'),
(69, 'Laiba', 'laibaqazzafi09@gmail.com', '', '2023-03-17 05:18:25', '2zy51.static_Layer0.png');

-- --------------------------------------------------------

--
-- Table structure for table `data`
--

CREATE TABLE `data` (
  `id` int(11) NOT NULL,
  `filename` varchar(1000) NOT NULL,
  `name` varchar(1000) NOT NULL,
  `email` varchar(1000) NOT NULL,
  `player_id` int(11) NOT NULL,
  `fileData` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `data`
--

INSERT INTO `data` (`id`, `filename`, `name`, `email`, `player_id`, `fileData`) VALUES
(37, '755a1cb065016de5936fcb107a5e4351.json', 'Ali Khan', 'hamza@gmail.com', 25, '{\"adminoffice_loggedin\": \"false\", \"adminoffice_password\": \"admin\", \"date_created\": \"2023-02-22 11:24:07\", \"email\": \"hamza@gmail.com\", \"email_decided\": \"false\", \"location\": \"gate\", \"facing\": \"otp\", \"name\": \"Ali Khan\", \"pile_on_desk\": \"true\", \"player_id\": 25, \"session_id\": 17, \"tracking\": {\"adminoffice\": {\"changepassword\": {\"fail\": 0, \"name\": \"Replace simple passwords\", \"success\": true}, \"regex\": {\"fail\": 0, \"name\": \"Comply with password complexity\", \"success\": false}}, \"gate\": {\"enterbank\": {\"fail\": 0, \"name\": \"Use access badge for entry\", \"success\": false}}, \"home\": {\"printornot\": {\"fail\": 0, \"name\": \"Appropriate devices for remote access\", \"success\": false}}, \"newsroom\": {\"internet\": {\"fail\": 0, \"name\": \"Connect to the disaster communication system\", \"success\": false}}, \"openoffice\": {\"pile\": {\"fail\": 1, \"name\": \"Remove confidential data\", \"success\": true}}, \"trainstation\": {\"checkreport\": {\"fail\": 0, \"name\": \"Access confidential data in public\", \"success\": false}}, \"youroffice\": {\"email\": {\"fail\": 0, \"name\": \"Respond to phishing email\", \"success\": false}}}, \"username\": \"greenmeanmachine\", \"visitcount\": [[\"gate\", 1], [\"skr\", 0], [\"adminoffice\", 0], [\"newsroom\", 0], [\"openoffice\", 0], [\"trainstation\", 0], [\"home\", 0], [\"reception\", 0], [\"trading\", 1], [\"youroffice\", 2], [\"it\", 0]], \"visited\": [[\"gate\", false], [\"skr\", false], [\"adminoffice\", false], [\"newsroom\", false], [\"openoffice\", true], [\"trainstation\", false], [\"home\", false], [\"reception\", true], [\"trading\", false], [\"youroffice\", true], [\"it\", false]]}'),
(38, 'c7c6e190d2197689249479a9e6951812.json', 'Ali Khan', 'hamza@gmail.com', 9, '{\"adminoffice_loggedin\": \"false\", \"adminoffice_password\": \"admin\", \"date_created\": \"2023-02-21 06:41:16\", \"email\": \"hamza@gmail.com\", \"email_decided\": \"false\", \"location\": \"gate\", \"facing\": \"otp\", \"name\": \"Ali Khan\", \"pile_on_desk\": \"true\", \"player_id\": 9, \"session_id\": 17, \"tracking\": {\"adminoffice\": {\"changepassword\": {\"fail\": 1, \"name\": \"Replace simple passwords\", \"success\": false}, \"regex\": {\"fail\": 0, \"name\": \"Comply with password complexity\", \"success\": false}}, \"gate\": {\"enterbank\": {\"fail\": 0, \"name\": \"Use access badge for entry\", \"success\": true}}, \"home\": {\"printornot\": {\"fail\": 2, \"name\": \"Appropriate devices for remote access\", \"success\": false}}, \"newsroom\": {\"internet\": {\"fail\": 0, \"name\": \"Connect to the disaster communication system\", \"success\": false}}, \"openoffice\": {\"pile\": {\"fail\": 1, \"name\": \"Remove confidential data\", \"success\": false}}, \"trainstation\": {\"checkreport\": {\"fail\": 1, \"name\": \"Access confidential data in public\", \"success\": true}}, \"youroffice\": {\"email\": {\"fail\": 0, \"name\": \"Respond to phishing email\", \"success\": false}}}, \"username\": \"greenmeanmachine\", \"visitcount\": [[\"gate\", 1], [\"skr\", 0], [\"adminoffice\", 0], [\"newsroom\", 0], [\"openoffice\", 1], [\"trainstation\", 0], [\"home\", 0], [\"reception\", 1], [\"trading\", 0], [\"youroffice\", 1], [\"it\", 0]], \"visited\": [[\"gate\", false], [\"skr\", false], [\"adminoffice\", false], [\"newsroom\", false], [\"openoffice\", true], [\"trainstation\", false], [\"home\", false], [\"reception\", false], [\"trading\", false], [\"youroffice\", true], [\"it\", false]]}'),
(39, 'd1f4c4a13cb1369716205b47ea9bc24b.json', 'Ali Khan', 'hamza@gmail.com', 10, '{\"adminoffice_loggedin\": \"false\", \"adminoffice_password\": \"admin\", \"date_created\": \"2023-02-22 11:35:38\", \"email\": \"hamza@gmail.com\", \"email_decided\": \"false\", \"location\": \"gate\", \"facing\": \"otp\", \"name\": \"Ali Khan\", \"pile_on_desk\": \"true\", \"player_id\": 10, \"session_id\": 18, \"tracking\": {\"adminoffice\": {\"changepassword\": {\"fail\": 0, \"name\": \"Replace simple passwords\", \"success\": false}, \"regex\": {\"fail\": 0, \"name\": \"Comply with password complexity\", \"success\": false}}, \"gate\": {\"enterbank\": {\"fail\": 0, \"name\": \"Use access badge for entry\", \"success\": false}}, \"home\": {\"printornot\": {\"fail\": 0, \"name\": \"Appropriate devices for remote access\", \"success\": false}}, \"newsroom\": {\"internet\": {\"fail\": 0, \"name\": \"Connect to the disaster communication system\", \"success\": false}}, \"openoffice\": {\"pile\": {\"fail\": 0, \"name\": \"Remove confidential data\", \"success\": false}}, \"trainstation\": {\"checkreport\": {\"fail\": 0, \"name\": \"Access confidential data in public\", \"success\": false}}, \"youroffice\": {\"email\": {\"fail\": 0, \"name\": \"Respond to phishing email\", \"success\": false}}}, \"username\": \"greenmeanmachine\", \"visitcount\": [[\"gate\", 1], [\"skr\", 0], [\"adminoffice\", 0], [\"newsroom\", 0], [\"openoffice\", 0], [\"trainstation\", 0], [\"home\", 0], [\"reception\", 0], [\"trading\", 0], [\"youroffice\", 0], [\"it\", 0]], \"visited\": [[\"gate\", false], [\"skr\", false], [\"adminoffice\", false], [\"newsroom\", false], [\"openoffice\", false], [\"trainstation\", false], [\"home\", false], [\"reception\", false], [\"trading\", false], [\"youroffice\", false], [\"it\", false]]}'),
(40, 'f55ad440b5ae71897c7c7f77f1b3c8a1.json', 'Ali Khan', 'hamza@gmail.com', 11, '{\"adminoffice_loggedin\": \"false\", \"adminoffice_password\": \"admin\", \"date_created\": \"2023-02-22 10:47:27\", \"email\": \"hamza@gmail.com\", \"email_decided\": \"false\", \"location\": \"gate\", \"facing\": \"otp\", \"name\": \"Ali Khan\", \"pile_on_desk\": \"true\", \"player_id\": 11, \"session_id\": 18, \"tracking\": {\"adminoffice\": {\"changepassword\": {\"fail\": 0, \"name\": \"Replace simple passwords\", \"success\": false}, \"regex\": {\"fail\": 0, \"name\": \"Comply with password complexity\", \"success\": false}}, \"gate\": {\"enterbank\": {\"fail\": 0, \"name\": \"Use access badge for entry\", \"success\": false}}, \"home\": {\"printornot\": {\"fail\": 1, \"name\": \"Appropriate devices for remote access\", \"success\": true}}, \"newsroom\": {\"internet\": {\"fail\": 0, \"name\": \"Connect to the disaster communication system\", \"success\": true}}, \"openoffice\": {\"pile\": {\"fail\": 2, \"name\": \"Remove confidential data\", \"success\": true}}, \"trainstation\": {\"checkreport\": {\"fail\": 0, \"name\": \"Access confidential data in public\", \"success\": false}}, \"youroffice\": {\"email\": {\"fail\": 0, \"name\": \"Respond to phishing email\", \"success\": false}}}, \"username\": \"greenmeanmachine\", \"visitcount\": [[\"gate\", 1], [\"skr\", 0], [\"adminoffice\", 0], [\"newsroom\", 0], [\"openoffice\", 2], [\"trainstation\", 0], [\"home\", 0], [\"reception\", 1], [\"trading\", 0], [\"youroffice\", 0], [\"it\", 0]], \"visited\": [[\"gate\", false], [\"skr\", false], [\"adminoffice\", false], [\"newsroom\", false], [\"openoffice\", true], [\"trainstation\", false], [\"home\", false], [\"reception\", true], [\"trading\", false], [\"youroffice\", false], [\"it\", false]]}'),
(41, 'fa677ebfd4652b76f10d86a272ff79e2.json', 'Laiba Khan', 'hamza@gmail.com', 12, '{\"adminoffice_loggedin\": \"false\", \"adminoffice_password\": \"admin\", \"date_created\": \"2023-02-22 15:21:59\", \"email\": \"hamza@gmail.com\", \"email_decided\": \"false\", \"location\": \"gate\", \"facing\": \"otp\", \"name\": \"Laiba Khan\", \"pile_on_desk\": \"true\", \"player_id\": 12, \"session_id\": 17, \"tracking\": {\"adminoffice\": {\"changepassword\": {\"fail\": 0, \"name\": \"Replace simple passwords\", \"success\": false}, \"regex\": {\"fail\": 0, \"name\": \"Comply with password complexity\", \"success\": false}}, \"gate\": {\"enterbank\": {\"fail\": 0, \"name\": \"Use access badge for entry\", \"success\": false}}, \"home\": {\"printornot\": {\"fail\": 1, \"name\": \"Appropriate devices for remote access\", \"success\": true}}, \"newsroom\": {\"internet\": {\"fail\": 0, \"name\": \"Connect to the disaster communication system\", \"success\": false}}, \"openoffice\": {\"pile\": {\"fail\": 0, \"name\": \"Remove confidential data\", \"success\": false}}, \"trainstation\": {\"checkreport\": {\"fail\": 0, \"name\": \"Access confidential data in public\", \"success\": false}}, \"youroffice\": {\"email\": {\"fail\": 0, \"name\": \"Respond to phishing email\", \"success\": false}}}, \"username\": \"greenmeanmachine\", \"visitcount\": [[\"gate\", 1], [\"skr\", 0], [\"adminoffice\", 0], [\"newsroom\", 0], [\"openoffice\", 0], [\"trainstation\", 0], [\"home\", 1], [\"reception\", 0], [\"trading\", 0], [\"youroffice\", 0], [\"it\", 0]], \"visited\": [[\"gate\", false], [\"skr\", false], [\"adminoffice\", false], [\"newsroom\", false], [\"openoffice\", false], [\"trainstation\", false], [\"home\", false], [\"reception\", false], [\"trading\", false], [\"youroffice\", false], [\"it\", false]]}'),
(42, 'c536783e96f1aea2e5b33a78f164b5c2.json', 'Muneeb Waseem', 'iop@gmail.com', 3, '{\"adminoffice_loggedin\": \"false\", \"adminoffice_password\": \"admin\", \"date_created\": \"2023-02-17 10:08:15\", \"email\": \"iop@gmail.com\", \"email_decided\": \"false\", \"facing\": \"otp\", \"location\": \"gate\", \"name\": \"Muneeb Waseem\", \"pile_on_desk\": \"true\", \"player_id\": 3, \"session_id\": 17, \"tracking\": {\"adminoffice\": {\"changepassword\": {\"fail\": 0, \"name\": \"Replace simple passwords\", \"success\": false}, \"regex\": {\"fail\": 0, \"name\": \"Comply with password complexity\", \"success\": false}}, \"gate\": {\"enterbank\": {\"fail\": 0, \"name\": \"Use access badge for entry\", \"success\": false}}, \"home\": {\"printornot\": {\"fail\": 0, \"name\": \"Appropriate devices for remote access\", \"success\": false}}, \"newsroom\": {\"internet\": {\"fail\": 0, \"name\": \"Connect to the disaster communication system\", \"success\": false}}, \"openoffice\": {\"pile\": {\"fail\": 0, \"name\": \"Remove confidential data\", \"success\": true}}, \"trainstation\": {\"checkreport\": {\"fail\": 0, \"name\": \"Access confidential data in public\", \"success\": false}}, \"youroffice\": {\"email\": {\"fail\": 0, \"name\": \"Respond to phishing email\", \"success\": false}}}, \"username\": \"greenmeanmachine\", \"visitcount\": [[\"gate\", 2], [\"skr\", 2], [\"adminoffice\", 0], [\"newsroom\", 0], [\"openoffice\", 0], [\"trainstation\", 0], [\"home\", 0], [\"reception\", 0], [\"trading\", 1], [\"youroffice\", 0], [\"it\", 0]], \"visited\": [[\"gate\", \"current\"], [\"skr\", true], [\"adminoffice\", false], [\"newsroom\", false], [\"openoffice\", false], [\"trainstation\", false], [\"home\", false], [\"reception\", false], [\"trading\", true], [\"youroffice\", false], [\"it\", false]]}'),
(46, 'c8e56d9ea2e2d643be2c7c4f99b2e87f.json', 'Laiba Qazzafi', 'laibaqazzafi09@gmail.com', 6, '{\"adminoffice_loggedin\": \"false\", \"adminoffice_password\": \"admin\", \"date_created\": \"2023-02-23 09:32:28\", \"email\": \"laibaqazzafi09@gmail.com\", \"email_decided\": \"true\", \"facing\": \"otp\", \"inventory\": {\"badge\": \"Your badge.\"}, \"location\": \"reset\", \"name\": \"Laiba Qazzafi\", \"pile_on_desk\": \"true\", \"player_id\": 6, \"session_id\": 15, \"tracking\": {\"adminoffice\": {\"changepassword\": {\"fail\": 0, \"name\": \"Replace simple passwords\", \"success\": false}, \"regex\": {\"fail\": 2, \"name\": \"Comply with password complexity\", \"success\": true}}, \"gate\": {\"enterbank\": {\"fail\": 0, \"name\": \"Use access badge for entry\", \"success\": true}}, \"home\": {\"printornot\": {\"fail\": 0, \"name\": \"Appropriate devices for remote access\", \"success\": false}}, \"newsroom\": {\"internet\": {\"fail\": 1, \"name\": \"Connect to the disaster communication system\", \"success\": true}}, \"openoffice\": {\"pile\": {\"fail\": 0, \"name\": \"Remove confidential data\", \"success\": false}}, \"trainstation\": {\"checkreport\": {\"fail\": 0, \"name\": \"Access confidential data in public\", \"success\": false}}, \"youroffice\": {\"email\": {\"fail\": 1, \"name\": \"Respond to phishing email\", \"success\": false}}}, \"username\": \"greenmeanmachine\", \"visitcount\": [[\"gate\", 11], [\"skr\", 0], [\"adminoffice\", 1], [\"newsroom\", 0], [\"openoffice\", 1], [\"trainstation\", 0], [\"home\", 0], [\"reception\", 1], [\"trading\", 3], [\"youroffice\", 4], [\"it\", 1]], \"visited\": [[\"gate\", true], [\"skr\", false], [\"adminoffice\", true], [\"newsroom\", false], [\"openoffice\", true], [\"trainstation\", false], [\"home\", false], [\"reception\", true], [\"trading\", true], [\"youroffice\", true], [\"it\", true]]}'),
(48, 'd0dfac6189d9d0fc4acbb9fd1399cdeb.json', 'Laiba', 'laibaqazzafi09@gmail.com', 6, '{\"adminoffice_loggedin\": \"false\", \"adminoffice_password\": \"admin\", \"date_created\": \"2023-02-28 07:54:52\", \"email\": \"laibaqazzafi09@gmail.com\", \"email_decided\": \"true\", \"facing\": null, \"inventory\": {\"badge\": \"Your badge.\"}, \"location\": \"home\", \"name\": \"Laiba\", \"pile_on_desk\": \"true\", \"player_id\": 6, \"session_id\": 2, \"tracking\": {\"adminoffice\": {\"changepassword\": {\"fail\": 0, \"name\": \"Replace simple passwords\", \"success\": false}, \"regex\": {\"fail\": 0, \"name\": \"Comply with password complexity\", \"success\": false}}, \"gate\": {\"enterbank\": {\"fail\": 0, \"name\": \"Use access badge for entry\", \"success\": true}}, \"home\": {\"printornot\": {\"fail\": 0, \"name\": \"Appropriate devices for remote access\", \"success\": false}}, \"newsroom\": {\"internet\": {\"fail\": 0, \"name\": \"Connect to the disaster communication system\", \"success\": true}}, \"openoffice\": {\"pile\": {\"fail\": 0, \"name\": \"Remove confidential data\", \"success\": false}}, \"trainstation\": {\"checkreport\": {\"fail\": 1, \"name\": \"Access confidential data in public\", \"success\": false}}, \"youroffice\": {\"email\": {\"fail\": 1, \"name\": \"Respond to phishing email\", \"success\": false}}}, \"username\": \"greenmeanmachine\", \"visitcount\": [[\"gate\", 2], [\"skr\", 0], [\"adminoffice\", 1], [\"newsroom\", 1], [\"openoffice\", 1], [\"trainstation\", 1], [\"home\", 1], [\"reception\", 2], [\"trading\", 0], [\"youroffice\", 2], [\"it\", 1]], \"visited\": [[\"gate\", true], [\"skr\", false], [\"adminoffice\", true], [\"newsroom\", true], [\"openoffice\", true], [\"trainstation\", true], [\"home\", \"current\"], [\"reception\", true], [\"trading\", true], [\"youroffice\", true], [\"it\", true]]}'),
(51, 'ac69d493769142add9a244982142096e.json', 'Laiba Qazzafi', 'laibaqazzafi09@gmail.com', 6, '{\"adminoffice_loggedin\": \"false\", \"adminoffice_password\": \"admin\", \"date_created\": \"2023-02-28 11:44:59\", \"email\": \"laibaqazzafi09@gmail.com\", \"email_decided\": \"false\", \"facing\": \"otp\", \"location\": \"gate\", \"name\": \"Laiba Qazzafi\", \"pile_on_desk\": \"true\", \"player_id\": 6, \"session_id\": 2, \"tracking\": {\"adminoffice\": {\"changepassword\": {\"fail\": 0, \"name\": \"Replace simple passwords\", \"success\": false}, \"regex\": {\"fail\": 0, \"name\": \"Comply with password complexity\", \"success\": false}}, \"gate\": {\"enterbank\": {\"fail\": 0, \"name\": \"Use access badge for entry\", \"success\": false}}, \"home\": {\"printornot\": {\"fail\": 0, \"name\": \"Appropriate devices for remote access\", \"success\": false}}, \"newsroom\": {\"internet\": {\"fail\": 0, \"name\": \"Connect to the disaster communication system\", \"success\": false}}, \"openoffice\": {\"pile\": {\"fail\": 0, \"name\": \"Remove confidential data\", \"success\": false}}, \"trainstation\": {\"checkreport\": {\"fail\": 0, \"name\": \"Access confidential data in public\", \"success\": false}}, \"youroffice\": {\"email\": {\"fail\": 0, \"name\": \"Respond to phishing email\", \"success\": false}}}, \"username\": \"greenmeanmachine\", \"visitcount\": [[\"gate\", 2], [\"skr\", 0], [\"adminoffice\", 0], [\"newsroom\", 0], [\"openoffice\", 0], [\"trainstation\", 0], [\"home\", 0], [\"reception\", 0], [\"trading\", 0], [\"youroffice\", 0], [\"it\", 0]], \"visited\": [[\"gate\", \"current\"], [\"skr\", false], [\"adminoffice\", false], [\"newsroom\", false], [\"openoffice\", false], [\"trainstation\", false], [\"home\", false], [\"reception\", false], [\"trading\", false], [\"youroffice\", false], [\"it\", false]]}'),
(52, '0c1e995826bc9e60e40c923bdb9e0e7b.json', 'Dummy', 'dummy@example.com', 1, '{\"adminoffice_loggedin\": \"false\", \"adminoffice_password\": \"admin\", \"date_created\": \"2023-02-28 12:22:42\", \"email\": \"dummy@example.com\", \"email_decided\": \"false\", \"facing\": null, \"location\": \"gate\", \"name\": \"Dummy\", \"pile_on_desk\": \"true\", \"player_id\": 1, \"session_id\": 1, \"tracking\": {\"adminoffice\": {\"changepassword\": {\"fail\": 0, \"name\": \"Replace simple passwords\", \"success\": false}, \"regex\": {\"fail\": 0, \"name\": \"Comply with password complexity\", \"success\": false}}, \"gate\": {\"enterbank\": {\"fail\": 0, \"name\": \"Use access badge for entry\", \"success\": false}}, \"home\": {\"printornot\": {\"fail\": 0, \"name\": \"Appropriate devices for remote access\", \"success\": false}}, \"newsroom\": {\"internet\": {\"fail\": 0, \"name\": \"Connect to the disaster communication system\", \"success\": false}}, \"openoffice\": {\"pile\": {\"fail\": 0, \"name\": \"Remove confidential data\", \"success\": false}}, \"trainstation\": {\"checkreport\": {\"fail\": 0, \"name\": \"Access confidential data in public\", \"success\": false}}, \"youroffice\": {\"email\": {\"fail\": 0, \"name\": \"Respond to phishing email\", \"success\": false}}}, \"username\": \"greenmeanmachine\", \"visitcount\": [[\"gate\", 1], [\"skr\", 0], [\"adminoffice\", 0], [\"newsroom\", 0], [\"openoffice\", 0], [\"trainstation\", 0], [\"home\", 0], [\"reception\", 0], [\"trading\", 0], [\"youroffice\", 0], [\"it\", 0]], \"visited\": [[\"gate\", false], [\"skr\", false], [\"adminoffice\", false], [\"newsroom\", false], [\"openoffice\", false], [\"trainstation\", false], [\"home\", false], [\"reception\", false], [\"trading\", false], [\"youroffice\", false], [\"it\", false]]}'),
(53, '0c6e27e89dec008abe759d24be76858d.json', 'Muneeb Waseem', 'muneebwaseem40@gmail.com', 26, '{\"adminoffice_loggedin\": \"false\", \"adminoffice_password\": \"admin\", \"date_created\": \"2023-02-24 10:40:56\", \"email\": \"muneebwaseem40@gmail.com\", \"email_decided\": \"false\", \"facing\": \"otp\", \"location\": \"gate\", \"name\": \"Muneeb Waseem\", \"pile_on_desk\": \"true\", \"player_id\": 26, \"session_id\": 2, \"tracking\": {\"adminoffice\": {\"changepassword\": {\"fail\": 0, \"name\": \"Replace simple passwords\", \"success\": false}, \"regex\": {\"fail\": 2, \"name\": \"Comply with password complexity\", \"success\": false}}, \"gate\": {\"enterbank\": {\"fail\": 0, \"name\": \"Use access badge for entry\", \"success\": true}}, \"home\": {\"printornot\": {\"fail\": 1, \"name\": \"Appropriate devices for remote access\", \"success\": true}}, \"newsroom\": {\"internet\": {\"fail\": 0, \"name\": \"Connect to the disaster communication system\", \"success\": false}}, \"openoffice\": {\"pile\": {\"fail\": 0, \"name\": \"Remove confidential data\", \"success\": false}}, \"trainstation\": {\"checkreport\": {\"fail\": 0, \"name\": \"Access confidential data in public\", \"success\": false}}, \"youroffice\": {\"email\": {\"fail\": 0, \"name\": \"Respond to phishing email\", \"success\": false}}}, \"username\": \"greenmeanmachine\", \"visitcount\": [[\"gate\", 2], [\"skr\", 0], [\"adminoffice\", 1], [\"newsroom\", 0], [\"openoffice\", 2], [\"trainstation\", 0], [\"home\", 0], [\"reception\", 0], [\"trading\", 0], [\"youroffice\", 0], [\"it\", 1]], \"visited\": [[\"gate\", \"current\"], [\"skr\", false], [\"adminoffice\", false], [\"newsroom\", false], [\"openoffice\", false], [\"trainstation\", true], [\"home\", false], [\"reception\", false], [\"trading\", false], [\"youroffice\", false], [\"it\", false]]}'),
(54, '0d8c1fe3d2b5a6a8cf8c450b30ad8809.json', 'm', 'laibaqazzafi09@gmail.com', 6, '{\"adminoffice_loggedin\": \"false\", \"adminoffice_password\": \"admin\", \"date_created\": \"2023-03-02 09:35:19\", \"email\": \"laibaqazzafi09@gmail.com\", \"email_decided\": \"false\", \"facing\": null, \"inventory\": {\"badge\": \"Your badge.\"}, \"location\": \"trading\", \"name\": \"m\", \"pile_on_desk\": \"true\", \"player_id\": 6, \"session_id\": 2, \"tracking\": {\"adminoffice\": {\"changepassword\": {\"fail\": 0, \"name\": \"Replace simple passwords\", \"success\": false}, \"regex\": {\"fail\": 0, \"name\": \"Comply with password complexity\", \"success\": false}}, \"gate\": {\"enterbank\": {\"fail\": 0, \"name\": \"Use access badge for entry\", \"success\": true}}, \"home\": {\"printornot\": {\"fail\": 0, \"name\": \"Appropriate devices for remote access\", \"success\": false}}, \"newsroom\": {\"internet\": {\"fail\": 0, \"name\": \"Connect to the disaster communication system\", \"success\": false}}, \"openoffice\": {\"pile\": {\"fail\": 0, \"name\": \"Remove confidential data\", \"success\": false}}, \"trainstation\": {\"checkreport\": {\"fail\": 0, \"name\": \"Access confidential data in public\", \"success\": false}}, \"youroffice\": {\"email\": {\"fail\": 0, \"name\": \"Respond to phishing email\", \"success\": false}}}, \"username\": \"greenmeanmachine\", \"visitcount\": [[\"gate\", 2], [\"skr\", 0], [\"adminoffice\", 0], [\"newsroom\", 0], [\"openoffice\", 0], [\"trainstation\", 0], [\"home\", 0], [\"reception\", 1], [\"trading\", 1], [\"youroffice\", 0], [\"it\", 1]], \"visited\": [[\"gate\", true], [\"skr\", false], [\"adminoffice\", false], [\"newsroom\", false], [\"openoffice\", false], [\"trainstation\", false], [\"home\", false], [\"reception\", true], [\"trading\", \"current\"], [\"youroffice\", false], [\"it\", true]]}'),
(55, '1f89c05337fc714ebcaa6649c1ac92af.json', 'Laiba Qazzafi', 'laibaqazzafi09@gmail.com', 6, '{\"adminoffice_loggedin\": \"false\", \"adminoffice_password\": \"admin\", \"date_created\": \"2023-03-02 11:30:59\", \"email\": \"laibaqazzafi09@gmail.com\", \"email_decided\": \"false\", \"facing\": \"otp\", \"location\": \"reset\", \"name\": \"Laiba Qazzafi\", \"pile_on_desk\": \"true\", \"player_id\": 6, \"session_id\": 2, \"tracking\": {\"adminoffice\": {\"changepassword\": {\"fail\": 0, \"name\": \"Replace simple passwords\", \"success\": false}, \"regex\": {\"fail\": 0, \"name\": \"Comply with password complexity\", \"success\": false}}, \"gate\": {\"enterbank\": {\"fail\": 0, \"name\": \"Use access badge for entry\", \"success\": false}}, \"home\": {\"printornot\": {\"fail\": 0, \"name\": \"Appropriate devices for remote access\", \"success\": false}}, \"newsroom\": {\"internet\": {\"fail\": 0, \"name\": \"Connect to the disaster communication system\", \"success\": false}}, \"openoffice\": {\"pile\": {\"fail\": 0, \"name\": \"Remove confidential data\", \"success\": false}}, \"trainstation\": {\"checkreport\": {\"fail\": 0, \"name\": \"Access confidential data in public\", \"success\": false}}, \"youroffice\": {\"email\": {\"fail\": 0, \"name\": \"Respond to phishing email\", \"success\": false}}}, \"username\": \"greenmeanmachine\", \"visitcount\": [[\"gate\", 2], [\"skr\", 0], [\"adminoffice\", 0], [\"newsroom\", 0], [\"openoffice\", 0], [\"trainstation\", 0], [\"home\", 0], [\"reception\", 0], [\"trading\", 0], [\"youroffice\", 0], [\"it\", 0]], \"visited\": [[\"gate\", true], [\"skr\", false], [\"adminoffice\", false], [\"newsroom\", false], [\"openoffice\", false], [\"trainstation\", false], [\"home\", false], [\"reception\", false], [\"trading\", false], [\"youroffice\", false], [\"it\", false]]}'),
(56, '3278340b306642ed90dd83ef1e30f2bb.json', 'm', 'laibaqazzafi09@gmail.com', 6, '{\"adminoffice_loggedin\": \"false\", \"adminoffice_password\": \"admin\", \"date_created\": \"2023-03-02 09:49:59\", \"email\": \"laibaqazzafi09@gmail.com\", \"email_decided\": \"false\", \"facing\": null, \"inventory\": {\"temporary badge\": \"A temporary badge with your name: m\"}, \"location\": \"home\", \"name\": \"m\", \"pile_on_desk\": \"true\", \"player_id\": 6, \"session_id\": 2, \"tracking\": {\"adminoffice\": {\"changepassword\": {\"fail\": 0, \"name\": \"Replace simple passwords\", \"success\": false}, \"regex\": {\"fail\": 0, \"name\": \"Comply with password complexity\", \"success\": false}}, \"gate\": {\"enterbank\": {\"fail\": 0, \"name\": \"Use access badge for entry\", \"success\": true}}, \"home\": {\"printornot\": {\"fail\": 6, \"name\": \"Appropriate devices for remote access\", \"success\": true}}, \"newsroom\": {\"internet\": {\"fail\": 0, \"name\": \"Connect to the disaster communication system\", \"success\": false}}, \"openoffice\": {\"pile\": {\"fail\": 0, \"name\": \"Remove confidential data\", \"success\": false}}, \"trainstation\": {\"checkreport\": {\"fail\": 0, \"name\": \"Access confidential data in public\", \"success\": false}}, \"youroffice\": {\"email\": {\"fail\": 0, \"name\": \"Respond to phishing email\", \"success\": false}}}, \"username\": \"greenmeanmachine\", \"visitcount\": [[\"gate\", 2], [\"skr\", 0], [\"adminoffice\", 0], [\"newsroom\", 0], [\"openoffice\", 0], [\"trainstation\", 0], [\"home\", 1], [\"reception\", 1], [\"trading\", 0], [\"youroffice\", 0], [\"it\", 0]], \"visited\": [[\"gate\", true], [\"skr\", false], [\"adminoffice\", false], [\"newsroom\", false], [\"openoffice\", false], [\"trainstation\", false], [\"home\", \"current\"], [\"reception\", true], [\"trading\", false], [\"youroffice\", false], [\"it\", false]]}'),
(57, '4c5ba86fb758003ea2964765c69cadce.json', 'Laiba Qazzafi', 'laibaqazzafi09@gmail.com', 6, '{\"adminoffice_loggedin\": \"false\", \"adminoffice_password\": \"admin\", \"date_created\": \"2023-02-27 06:53:30\", \"email\": \"laibaqazzafi09@gmail.com\", \"email_decided\": \"false\", \"facing\": \"otp\", \"location\": \"gate\", \"name\": \"Laiba Qazzafi\", \"pile_on_desk\": \"true\", \"player_id\": 6, \"session_id\": 2, \"tracking\": {\"adminoffice\": {\"changepassword\": {\"fail\": 0, \"name\": \"Replace simple passwords\", \"success\": false}, \"regex\": {\"fail\": 0, \"name\": \"Comply with password complexity\", \"success\": false}}, \"gate\": {\"enterbank\": {\"fail\": 0, \"name\": \"Use access badge for entry\", \"success\": false}}, \"home\": {\"printornot\": {\"fail\": 0, \"name\": \"Appropriate devices for remote access\", \"success\": false}}, \"newsroom\": {\"internet\": {\"fail\": 0, \"name\": \"Connect to the disaster communication system\", \"success\": false}}, \"openoffice\": {\"pile\": {\"fail\": 0, \"name\": \"Remove confidential data\", \"success\": false}}, \"trainstation\": {\"checkreport\": {\"fail\": 0, \"name\": \"Access confidential data in public\", \"success\": false}}, \"youroffice\": {\"email\": {\"fail\": 0, \"name\": \"Respond to phishing email\", \"success\": false}}}, \"username\": \"greenmeanmachine\", \"visitcount\": [[\"gate\", 2], [\"skr\", 0], [\"adminoffice\", 0], [\"newsroom\", 0], [\"openoffice\", 0], [\"trainstation\", 0], [\"home\", 0], [\"reception\", 0], [\"trading\", 0], [\"youroffice\", 0], [\"it\", 0]], \"visited\": [[\"gate\", \"current\"], [\"skr\", false], [\"adminoffice\", false], [\"newsroom\", false], [\"openoffice\", false], [\"trainstation\", false], [\"home\", false], [\"reception\", false], [\"trading\", false], [\"youroffice\", false], [\"it\", false]]}'),
(58, '5877defa568d6d2b45d08e3858b16b1c.json', 'Laiba Qazzafi', 'laibaqazzafi09@gmail.com', 6, '{\"adminoffice_loggedin\": \"false\", \"adminoffice_password\": \"admin\", \"date_created\": \"2023-03-02 10:24:26\", \"email\": \"laibaqazzafi09@gmail.com\", \"email_decided\": \"false\", \"facing\": null, \"location\": \"home\", \"name\": \"Laiba Qazzafi\", \"pile_on_desk\": \"true\", \"player_id\": 6, \"session_id\": 2, \"tracking\": {\"adminoffice\": {\"changepassword\": {\"fail\": 0, \"name\": \"Replace simple passwords\", \"success\": false}, \"regex\": {\"fail\": 0, \"name\": \"Comply with password complexity\", \"success\": false}}, \"gate\": {\"enterbank\": {\"fail\": 0, \"name\": \"Use access badge for entry\", \"success\": false}}, \"home\": {\"printornot\": {\"fail\": 4, \"name\": \"Appropriate devices for remote access\", \"success\": true}}, \"newsroom\": {\"internet\": {\"fail\": 0, \"name\": \"Connect to the disaster communication system\", \"success\": false}}, \"openoffice\": {\"pile\": {\"fail\": 0, \"name\": \"Remove confidential data\", \"success\": false}}, \"trainstation\": {\"checkreport\": {\"fail\": 0, \"name\": \"Access confidential data in public\", \"success\": false}}, \"youroffice\": {\"email\": {\"fail\": 0, \"name\": \"Respond to phishing email\", \"success\": false}}}, \"username\": \"greenmeanmachine\", \"visitcount\": [[\"gate\", 2], [\"skr\", 0], [\"adminoffice\", 0], [\"newsroom\", 0], [\"openoffice\", 0], [\"trainstation\", 0], [\"home\", 1], [\"reception\", 0], [\"trading\", 0], [\"youroffice\", 0], [\"it\", 0]], \"visited\": [[\"gate\", true], [\"skr\", false], [\"adminoffice\", false], [\"newsroom\", false], [\"openoffice\", false], [\"trainstation\", false], [\"home\", \"current\"], [\"reception\", false], [\"trading\", false], [\"youroffice\", false], [\"it\", false]]}'),
(59, '5bafadb4380d3bea4c511ec6562588ab.json', 'Laiba Qazzafi', 'laibaqazzafi09@gmail.com', 6, '{\"adminoffice_loggedin\": \"false\", \"adminoffice_password\": \"admin\", \"date_created\": \"2023-03-02 10:58:15\", \"email\": \"laibaqazzafi09@gmail.com\", \"email_decided\": \"false\", \"facing\": null, \"location\": \"reset\", \"name\": \"Laiba Qazzafi\", \"pile_on_desk\": \"true\", \"player_id\": 6, \"session_id\": 2, \"tracking\": {\"adminoffice\": {\"changepassword\": {\"fail\": 0, \"name\": \"Replace simple passwords\", \"success\": false}, \"regex\": {\"fail\": 0, \"name\": \"Comply with password complexity\", \"success\": false}}, \"gate\": {\"enterbank\": {\"fail\": 0, \"name\": \"Use access badge for entry\", \"success\": false}}, \"home\": {\"printornot\": {\"fail\": 0, \"name\": \"Appropriate devices for remote access\", \"success\": false}}, \"newsroom\": {\"internet\": {\"fail\": 0, \"name\": \"Connect to the disaster communication system\", \"success\": false}}, \"openoffice\": {\"pile\": {\"fail\": 0, \"name\": \"Remove confidential data\", \"success\": false}}, \"trainstation\": {\"checkreport\": {\"fail\": 0, \"name\": \"Access confidential data in public\", \"success\": false}}, \"youroffice\": {\"email\": {\"fail\": 0, \"name\": \"Respond to phishing email\", \"success\": false}}}, \"username\": \"greenmeanmachine\", \"visitcount\": [[\"gate\", 2], [\"skr\", 0], [\"adminoffice\", 0], [\"newsroom\", 0], [\"openoffice\", 0], [\"trainstation\", 0], [\"home\", 0], [\"reception\", 0], [\"trading\", 0], [\"youroffice\", 0], [\"it\", 0]], \"visited\": [[\"gate\", true], [\"skr\", false], [\"adminoffice\", false], [\"newsroom\", false], [\"openoffice\", false], [\"trainstation\", false], [\"home\", false], [\"reception\", false], [\"trading\", false], [\"youroffice\", false], [\"it\", false]]}'),
(60, '68aae0ffc3014ef6744520d617f92e2e.json', 'xyz', 'laibaqazzafi09@gmail.com', 6, '{\"adminoffice_loggedin\": \"false\", \"adminoffice_password\": \"admin\", \"date_created\": \"2023-03-02 08:46:32\", \"email\": \"laibaqazzafi09@gmail.com\", \"email_decided\": \"false\", \"facing\": \"guard\", \"inventory\": {\"temporary badge\": \"A temporary badge with your name: xyz\"}, \"location\": \"gate\", \"name\": \"xyz\", \"pile_on_desk\": \"true\", \"player_id\": 6, \"session_id\": 2, \"tracking\": {\"adminoffice\": {\"changepassword\": {\"fail\": 0, \"name\": \"Replace simple passwords\", \"success\": false}, \"regex\": {\"fail\": 0, \"name\": \"Comply with password complexity\", \"success\": false}}, \"gate\": {\"enterbank\": {\"fail\": 0, \"name\": \"Use access badge for entry\", \"success\": true}}, \"home\": {\"printornot\": {\"fail\": 0, \"name\": \"Appropriate devices for remote access\", \"success\": false}}, \"newsroom\": {\"internet\": {\"fail\": 0, \"name\": \"Connect to the disaster communication system\", \"success\": false}}, \"openoffice\": {\"pile\": {\"fail\": 0, \"name\": \"Remove confidential data\", \"success\": false}}, \"trainstation\": {\"checkreport\": {\"fail\": 0, \"name\": \"Access confidential data in public\", \"success\": false}}, \"youroffice\": {\"email\": {\"fail\": 0, \"name\": \"Respond to phishing email\", \"success\": false}}}, \"username\": \"greenmeanmachine\", \"visitcount\": [[\"gate\", 2], [\"skr\", 0], [\"adminoffice\", 0], [\"newsroom\", 0], [\"openoffice\", 0], [\"trainstation\", 0], [\"home\", 0], [\"reception\", 0], [\"trading\", 0], [\"youroffice\", 0], [\"it\", 0]], \"visited\": [[\"gate\", \"current\"], [\"skr\", false], [\"adminoffice\", false], [\"newsroom\", false], [\"openoffice\", false], [\"trainstation\", false], [\"home\", false], [\"reception\", false], [\"trading\", false], [\"youroffice\", false], [\"it\", false]]}'),
(61, '887875670037a5026a358ad5a661160f.json', 'Laiba Qazzafi', 'laibaqazzafi09@gmail.com', 6, '{\"adminoffice_loggedin\": \"false\", \"adminoffice_password\": \"admin\", \"date_created\": \"2023-02-20 09:03:07\", \"email\": \"laibaqazzafi09@gmail.com\", \"email_decided\": \"false\", \"facing\": null, \"location\": \"gate\", \"name\": \"Laiba Qazzafi\", \"pile_on_desk\": \"true\", \"player_id\": 6, \"session_id\": 17, \"tracking\": {\"adminoffice\": {\"changepassword\": {\"fail\": 0, \"name\": \"Replace simple passwords\", \"success\": false}, \"regex\": {\"fail\": 0, \"name\": \"Comply with password complexity\", \"success\": false}}, \"gate\": {\"enterbank\": {\"fail\": 0, \"name\": \"Use access badge for entry\", \"success\": false}}, \"home\": {\"printornot\": {\"fail\": 0, \"name\": \"Appropriate devices for remote access\", \"success\": true}}, \"newsroom\": {\"internet\": {\"fail\": 0, \"name\": \"Connect to the disaster communication system\", \"success\": false}}, \"openoffice\": {\"pile\": {\"fail\": 2, \"name\": \"Remove confidential data\", \"success\": true}}, \"trainstation\": {\"checkreport\": {\"fail\": 0, \"name\": \"Access confidential data in public\", \"success\": false}}, \"youroffice\": {\"email\": {\"fail\": 1, \"name\": \"Respond to phishing email\", \"success\": false}}}, \"username\": \"greenmeanmachine\", \"visitcount\": [[\"gate\", 2], [\"skr\", 1], [\"adminoffice\", 0], [\"newsroom\", 1], [\"openoffice\", 0], [\"trainstation\", 0], [\"home\", 0], [\"reception\", 0], [\"trading\", 0], [\"youroffice\", 1], [\"it\", 0]], \"visited\": [[\"gate\", \"current\"], [\"skr\", false], [\"adminoffice\", false], [\"newsroom\", true], [\"openoffice\", false], [\"trainstation\", true], [\"home\", false], [\"reception\", false], [\"trading\", false], [\"youroffice\", false], [\"it\", false]]}'),
(62, 'bd88ed80607be4a7c5210a6b78fe7e6a.json', 'Aqib Chaudhary', 'aqib@bitlogicx.com', 25, '{\"adminoffice_loggedin\": \"false\", \"adminoffice_password\": \"admin\", \"date_created\": \"2023-02-24 10:39:57\", \"email\": \"aqib@bitlogicx.com\", \"email_decided\": \"false\", \"facing\": \"otp\", \"location\": \"gate\", \"name\": \"Aqib Chaudhary\", \"pile_on_desk\": \"true\", \"player_id\": 25, \"session_id\": 17, \"tracking\": {\"adminoffice\": {\"changepassword\": {\"fail\": 0, \"name\": \"Replace simple passwords\", \"success\": false}, \"regex\": {\"fail\": 0, \"name\": \"Comply with password complexity\", \"success\": false}}, \"gate\": {\"enterbank\": {\"fail\": 0, \"name\": \"Use access badge for entry\", \"success\": false}}, \"home\": {\"printornot\": {\"fail\": 0, \"name\": \"Appropriate devices for remote access\", \"success\": false}}, \"newsroom\": {\"internet\": {\"fail\": 0, \"name\": \"Connect to the disaster communication system\", \"success\": false}}, \"openoffice\": {\"pile\": {\"fail\": 0, \"name\": \"Remove confidential data\", \"success\": false}}, \"trainstation\": {\"checkreport\": {\"fail\": 0, \"name\": \"Access confidential data in public\", \"success\": false}}, \"youroffice\": {\"email\": {\"fail\": 0, \"name\": \"Respond to phishing email\", \"success\": false}}}, \"username\": \"greenmeanmachine\", \"visitcount\": [[\"gate\", 2], [\"skr\", 0], [\"adminoffice\", 0], [\"newsroom\", 0], [\"openoffice\", 0], [\"trainstation\", 0], [\"home\", 0], [\"reception\", 0], [\"trading\", 0], [\"youroffice\", 0], [\"it\", 0]], \"visited\": [[\"gate\", \"current\"], [\"skr\", false], [\"adminoffice\", false], [\"newsroom\", false], [\"openoffice\", false], [\"trainstation\", false], [\"home\", false], [\"reception\", false], [\"trading\", false], [\"youroffice\", false], [\"it\", false]]}'),
(63, 'd9fcc8f6e14a7712d43f848a52eca66e.json', 'abcd efgh', 'bsem-f19-200@superior.edu.pk', 27, '{\"adminoffice_loggedin\": \"false\", \"adminoffice_password\": \"admin\", \"date_created\": \"2023-02-24 10:41:54\", \"email\": \"bsem-f19-200@superior.edu.pk\", \"email_decided\": \"false\", \"facing\": \"otp\", \"location\": \"gate\", \"name\": \"abcd efgh\", \"pile_on_desk\": \"true\", \"player_id\": 27, \"session_id\": 18, \"tracking\": {\"adminoffice\": {\"changepassword\": {\"fail\": 0, \"name\": \"Replace simple passwords\", \"success\": false}, \"regex\": {\"fail\": 0, \"name\": \"Comply with password complexity\", \"success\": false}}, \"gate\": {\"enterbank\": {\"fail\": 0, \"name\": \"Use access badge for entry\", \"success\": false}}, \"home\": {\"printornot\": {\"fail\": 0, \"name\": \"Appropriate devices for remote access\", \"success\": false}}, \"newsroom\": {\"internet\": {\"fail\": 0, \"name\": \"Connect to the disaster communication system\", \"success\": false}}, \"openoffice\": {\"pile\": {\"fail\": 0, \"name\": \"Remove confidential data\", \"success\": false}}, \"trainstation\": {\"checkreport\": {\"fail\": 0, \"name\": \"Access confidential data in public\", \"success\": false}}, \"youroffice\": {\"email\": {\"fail\": 0, \"name\": \"Respond to phishing email\", \"success\": false}}}, \"username\": \"greenmeanmachine\", \"visitcount\": [[\"gate\", 2], [\"skr\", 0], [\"adminoffice\", 0], [\"newsroom\", 0], [\"openoffice\", 0], [\"trainstation\", 0], [\"home\", 0], [\"reception\", 0], [\"trading\", 0], [\"youroffice\", 0], [\"it\", 0]], \"visited\": [[\"gate\", \"current\"], [\"skr\", false], [\"adminoffice\", false], [\"newsroom\", false], [\"openoffice\", false], [\"trainstation\", false], [\"home\", false], [\"reception\", false], [\"trading\", false], [\"youroffice\", false], [\"it\", false]]}'),
(64, '7e071df606e3348f51957c564074bafb.json', 'Muneeb Waseem', 'muneebwaseem40@gmail.com', 26, '{\"adminoffice_loggedin\": \"false\", \"adminoffice_password\": \"admin\", \"date_created\": \"2023-02-20 09:08:51\", \"email\": \"muneebwaseem40@gmail.com\", \"email_decided\": \"false\", \"facing\": \"otp\", \"location\": \"gate\", \"name\": \"Muneeb Waseem\", \"pile_on_desk\": \"true\", \"player_id\": 26, \"session_id\": 2, \"tracking\": {\"adminoffice\": {\"changepassword\": {\"fail\": 0, \"name\": \"Replace simple passwords\", \"success\": true}, \"regex\": {\"fail\": 0, \"name\": \"Comply with password complexity\", \"success\": true}}, \"gate\": {\"enterbank\": {\"fail\": 0, \"name\": \"Use access badge for entry\", \"success\": true}}, \"home\": {\"printornot\": {\"fail\": 0, \"name\": \"Appropriate devices for remote access\", \"success\": true}}, \"newsroom\": {\"internet\": {\"fail\": 0, \"name\": \"Connect to the disaster communication system\", \"success\": false}}, \"openoffice\": {\"pile\": {\"fail\": 0, \"name\": \"Remove confidential data\", \"success\": true}}, \"trainstation\": {\"checkreport\": {\"fail\": 0, \"name\": \"Access confidential data in public\", \"success\": false}}, \"youroffice\": {\"email\": {\"fail\": 0, \"name\": \"Respond to phishing email\", \"success\": false}}}, \"username\": \"greenmeanmachine\", \"visitcount\": [[\"gate\", 2], [\"skr\", 0], [\"adminoffice\", 0], [\"newsroom\", 0], [\"openoffice\", 1], [\"trainstation\", 0], [\"home\", 0], [\"reception\", 1], [\"trading\", 0], [\"youroffice\", 0], [\"it\", 0]], \"visited\": [[\"gate\", \"current\"], [\"skr\", false], [\"adminoffice\", false], [\"newsroom\", false], [\"openoffice\", false], [\"trainstation\", false], [\"home\", false], [\"reception\", false], [\"trading\", false], [\"youroffice\", false], [\"it\", false]]}'),
(65, '496cf30961f3416b1766d873489ce12c.json', 'Dummy', 'dummy@example.com', 1, '{\"adminoffice_loggedin\": \"false\", \"adminoffice_password\": \"admin\", \"date_created\": \"2023-03-03 10:49:31\", \"email\": \"dummy@example.com\", \"email_decided\": \"false\", \"facing\": null, \"location\": \"gate\", \"name\": \"Dummy\", \"pile_on_desk\": \"true\", \"player_id\": 1, \"session_id\": 1, \"tracking\": {\"adminoffice\": {\"changepassword\": {\"fail\": 0, \"name\": \"Replace simple passwords\", \"success\": false}, \"regex\": {\"fail\": 0, \"name\": \"Comply with password complexity\", \"success\": false}}, \"gate\": {\"enterbank\": {\"fail\": 0, \"name\": \"Use access badge for entry\", \"success\": false}}, \"home\": {\"printornot\": {\"fail\": 0, \"name\": \"Appropriate devices for remote access\", \"success\": false}}, \"newsroom\": {\"internet\": {\"fail\": 0, \"name\": \"Connect to the disaster communication system\", \"success\": false}}, \"openoffice\": {\"pile\": {\"fail\": 0, \"name\": \"Remove confidential data\", \"success\": false}}, \"trainstation\": {\"checkreport\": {\"fail\": 0, \"name\": \"Access confidential data in public\", \"success\": false}}, \"youroffice\": {\"email\": {\"fail\": 0, \"name\": \"Respond to phishing email\", \"success\": false}}}, \"username\": \"greenmeanmachine\", \"visitcount\": [[\"gate\", 1], [\"skr\", 0], [\"adminoffice\", 0], [\"newsroom\", 0], [\"openoffice\", 0], [\"trainstation\", 0], [\"home\", 0], [\"reception\", 0], [\"trading\", 0], [\"youroffice\", 0], [\"it\", 0]], \"visited\": [[\"gate\", false], [\"skr\", false], [\"adminoffice\", false], [\"newsroom\", false], [\"openoffice\", false], [\"trainstation\", false], [\"home\", false], [\"reception\", false], [\"trading\", false], [\"youroffice\", false], [\"it\", false]]}'),
(66, 'e6729b0fc8318def5389fb935708f6eb.json', 'Dummy', 'dummy@example.com', 1, '{\"adminoffice_loggedin\": \"false\", \"adminoffice_password\": \"admin\", \"date_created\": \"2023-03-03 09:54:49\", \"email\": \"dummy@example.com\", \"email_decided\": \"false\", \"facing\": null, \"location\": \"reset\", \"name\": \"Dummy\", \"pile_on_desk\": \"true\", \"player_id\": 1, \"session_id\": 1, \"tracking\": {\"adminoffice\": {\"changepassword\": {\"fail\": 0, \"name\": \"Replace simple passwords\", \"success\": false}, \"regex\": {\"fail\": 0, \"name\": \"Comply with password complexity\", \"success\": false}}, \"gate\": {\"enterbank\": {\"fail\": 0, \"name\": \"Use access badge for entry\", \"success\": false}}, \"home\": {\"printornot\": {\"fail\": 0, \"name\": \"Appropriate devices for remote access\", \"success\": false}}, \"newsroom\": {\"internet\": {\"fail\": 0, \"name\": \"Connect to the disaster communication system\", \"success\": false}}, \"openoffice\": {\"pile\": {\"fail\": 0, \"name\": \"Remove confidential data\", \"success\": false}}, \"trainstation\": {\"checkreport\": {\"fail\": 0, \"name\": \"Access confidential data in public\", \"success\": false}}, \"youroffice\": {\"email\": {\"fail\": 0, \"name\": \"Respond to phishing email\", \"success\": false}}}, \"username\": \"greenmeanmachine\", \"visitcount\": [[\"gate\", 1], [\"skr\", 0], [\"adminoffice\", 0], [\"newsroom\", 0], [\"openoffice\", 0], [\"trainstation\", 0], [\"home\", 0], [\"reception\", 0], [\"trading\", 0], [\"youroffice\", 0], [\"it\", 0]], \"visited\": [[\"gate\", false], [\"skr\", false], [\"adminoffice\", false], [\"newsroom\", false], [\"openoffice\", false], [\"trainstation\", false], [\"home\", false], [\"reception\", false], [\"trading\", false], [\"youroffice\", false], [\"it\", false]]}');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `startingDate` datetime NOT NULL,
  `endingDate` datetime NOT NULL,
  `playerEmail` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `name`, `startingDate`, `endingDate`, `playerEmail`) VALUES
(2, 'TestingEdit', '2024-03-16 04:28:00', '2024-03-16 04:28:00', '0'),
(15, 'Bitlogicx', '2024-03-21 01:59:00', '2024-05-22 01:59:00', '0'),
(18, 'Muneeb', '2024-03-24 15:29:00', '2024-03-25 15:29:00', 'laibaqazzafi09@gmail.com,aqib@bitlogicx.com,muneebwaseem40@gmail.com'),
(21, 'Laiba', '2023-01-04 02:04:00', '2025-04-04 14:01:00', 'laibaqazzafi09@gmail.com,aqib@bitlogicx.com,muneebwaseem40@gmail.com'),
(22, 'Demo', '2023-02-17 02:57:00', '2024-04-17 01:57:00', 'laibaqazzafi09@gmail.com,aqib@bitlogicx.com,muneebwaseem40@gmail.com'),
(23, 'laiba1234', '2023-02-17 05:23:00', '2024-04-17 06:23:00', 'laibaqazzafi09@gmail.com,aqib@bitlogicx.com,muneebwaseem40@gmail.com'),
(27, 'min', '2024-05-17 07:11:00', '2024-04-18 07:11:00', 'laibaqazzafi09@gmail.com,laibaqazzafi09@gmail.com,muneebwaseem40@gmail.com'),
(28, 'd', '2024-04-18 11:22:00', '2025-04-18 12:22:00', 'laibaqazzafi09@gmail.com,aqib@bitlogicx.com,muneebwaseem40@gmail.com,laibaqazzafi09@gmail.com,muneebwaseem40@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `users2`
--

CREATE TABLE `users2` (
  `id` int(11) NOT NULL,
  `name` varchar(1000) NOT NULL,
  `lname` varchar(1000) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(1000) NOT NULL,
  `department` varchar(1000) NOT NULL,
  `company` varchar(1000) NOT NULL,
  `isRegistered` tinyint(1) NOT NULL,
  `emailConfirm` tinyint(1) NOT NULL,
  `otp` int(11) NOT NULL,
  `USid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users2`
--

INSERT INTO `users2` (`id`, `name`, `lname`, `email`, `password`, `department`, `company`, `isRegistered`, `emailConfirm`, `otp`, `USid`) VALUES
(6, 'Laiba', 'Qazzafi', 'laibaqazzafi09@gmail.com', 'pbkdf2:sha256:150000$5XWRznM8$a05a2a1c9df3d8696f56ebc2282ccbeb2e69a5ba5ff4208999217929e724f818', 'SE', 'Bit', 1, 1, 123456, 21),
(20, 'Admin', 'Admin', 'admin@example.org', 'pbkdf2:sha256:150000$kA5aS6MW$29d6df02339f4207fe8a2fca5709171349ce970fef55f324d78e4eb04a3c5014', 'Admin', 'Admin', 1, 1, 842386, 0),
(25, 'Aqib', 'Chaudhary', 'aqib@bitlogicx.com', 'pbkdf2:sha256:150000$Ae5Zr4MG$6ed7a1483cd3f9ef9f3c7384d5d7d524dd385bdaf2ad1a7bfbbdd1d62fbf7275', 'Management', 'Bit', 0, 0, 1234, 0),
(26, 'Muneeb', 'Waseem', 'muneebwaseem40@gmail.com', 'pbkdf2:sha256:150000$ES01wEiH$2283ee8db70ba7848ec16d2b1e490eeac191f6c84c38b8ef91e0e4e54eefb81e', 'Data', 'Bit', 0, 0, 732974, 0),
(27, 'Waseem', 'Shahzad', 'bsem-f19-200@superior.edu.pk', 'pbkdf2:sha256:150000$OodvitgE$09f85dd39210e7b72971f03abdd0854d0362e1929756c37cbe2a1836171cbeff', 'SE', 'Bit', 0, 0, 1234, 0),
(35, 'laiba', 'superior', 'bsem-f19-172@superior.edu.pk', 'pbkdf2:sha256:150000$J3Z3cxQx$49c15b104156148f00a625d7bee15e336d2636ce5e203cc03792a74667ed6524', 'SE', 'Superior', 1, 1, 333052, 2),
(36, 'ABC', 'ABC', 'abc@gmail.com', 'pbkdf2:sha256:150000$Zy7iwYej$9d86663a38c348f498e779c9ab83aad9435b0f503c9b83f456feed7371ec3df2', 'AB', 'AB', 0, 0, 1234, 0);

-- --------------------------------------------------------

--
-- Table structure for table `user_session`
--

CREATE TABLE `user_session` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `session_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_session`
--

INSERT INTO `user_session` (`id`, `user_id`, `session_id`) VALUES
(6, 6, 2),
(51, 6, 15),
(52, 25, 15),
(53, 26, 15),
(66, 6, 18),
(67, 25, 18),
(68, 26, 18),
(69, 27, 18),
(73, 6, 21),
(74, 25, 21),
(75, 26, 21),
(84, 6, 21),
(85, 25, 21),
(86, 26, 21),
(87, 26, 2),
(101, 35, 2),
(106, 36, 2),
(107, 6, 22),
(108, 25, 22),
(109, 26, 22),
(110, 36, 22),
(111, 6, 23),
(112, 25, 23),
(113, 26, 23),
(124, 6, 27),
(125, 26, 27),
(126, 6, 28),
(127, 25, 28),
(128, 26, 28);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `certificates`
--
ALTER TABLE `certificates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `data`
--
ALTER TABLE `data`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `users2`
--
ALTER TABLE `users2`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `user_session`
--
ALTER TABLE `user_session`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `session_id` (`session_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `certificates`
--
ALTER TABLE `certificates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT for table `data`
--
ALTER TABLE `data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT for table `sessions`
--
ALTER TABLE `sessions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `users2`
--
ALTER TABLE `users2`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `user_session`
--
ALTER TABLE `user_session`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=130;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `user_session`
--
ALTER TABLE `user_session`
  ADD CONSTRAINT `user_session_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users2` (`id`),
  ADD CONSTRAINT `user_session_ibfk_2` FOREIGN KEY (`session_id`) REFERENCES `sessions` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
