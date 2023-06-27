-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 28, 2022 at 09:45 PM
-- Server version: 8.0.28
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `grupo`
--

-- --------------------------------------------------------

--
-- Table structure for table `gr_audio_player`
--

CREATE TABLE `gr_audio_player` (
  `audio_content_id` bigint NOT NULL,
  `audio_title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `audio_description` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `audio_type` int NOT NULL DEFAULT '1' COMMENT '1 = Radio 2 = Playlist',
  `radio_stream_url` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `disabled` int NOT NULL DEFAULT '0',
  `updated_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gr_badges`
--

CREATE TABLE `gr_badges` (
  `badge_id` bigint NOT NULL,
  `string_constant` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `badge_category` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'profile',
  `disabled` int NOT NULL DEFAULT '0',
  `created_on` datetime NOT NULL,
  `updated_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gr_badges_assigned`
--

CREATE TABLE `gr_badges_assigned` (
  `badge_assigned_id` bigint NOT NULL,
  `badge_id` bigint NOT NULL,
  `user_id` bigint DEFAULT NULL,
  `group_id` bigint DEFAULT NULL,
  `assigned_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gr_complaints`
--

CREATE TABLE `gr_complaints` (
  `complaint_id` bigint NOT NULL,
  `reason` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `group_id` bigint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  `group_message_id` bigint DEFAULT NULL,
  `private_chat_message_id` bigint DEFAULT NULL,
  `comments_by_complainant` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `complainant_user_id` bigint DEFAULT NULL,
  `complaint_status` int NOT NULL DEFAULT '0' COMMENT '0 = Under Review\r\n1 = Action Taken\r\n2 = Rejected',
  `reviewer_user_id` bigint DEFAULT NULL,
  `comments_by_reviewer` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_on` datetime NOT NULL,
  `updated_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gr_cron_jobs`
--

CREATE TABLE `gr_cron_jobs` (
  `cron_job_id` bigint NOT NULL,
  `cron_job` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `cron_job_access_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `cron_job_parameters` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_on` datetime NOT NULL,
  `updated_on` datetime NOT NULL,
  `last_run_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gr_css_variables`
--

CREATE TABLE `gr_css_variables` (
  `css_variable_id` bigint NOT NULL,
  `css_variable` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `css_variable_value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `color_scheme` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'light_mode',
  `updated_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `gr_css_variables`
--

INSERT INTO `gr_css_variables` (`css_variable_id`, `css_variable`, `css_variable_value`, `color_scheme`, `updated_on`) VALUES
(1, 'chat-page-primary-bg-color', '#F7F9FB', 'light_mode', '2022-10-28 01:49:05'),
(2, 'chat-page-primary-font-size', '14px', 'light_mode', '2022-10-28 01:49:05'),
(3, 'side-navigation-primary-bg-color', '#F7F9FB', 'light_mode', '2022-10-28 01:49:05'),
(4, 'side-navigation-secondary-bg-color', '#FFFFFF', 'light_mode', '2022-10-28 01:49:05'),
(5, 'side-navigation-tertiary-bg-color', '#EFF1F3', 'light_mode', '2022-10-28 01:49:05'),
(6, 'side-navigation-quaternary-bg-color', '#E91E63', 'light_mode', '2022-10-28 01:49:05'),
(7, 'side-navigation-primary-text-color', '#828282', 'light_mode', '2022-10-28 01:49:05'),
(8, 'side-navigation-secondary-text-color', '#E91E63', 'light_mode', '2022-10-28 01:49:05'),
(9, 'side-navigation-tertiary-text-color', '#9C27B0', 'light_mode', '2022-10-28 01:49:05'),
(10, 'side-navigation-quaternary-text-color', '#FFFFFF', 'light_mode', '2022-10-28 01:49:05'),
(11, 'side-navigation-primary-border-color', '#DFE7EF', 'light_mode', '2022-10-28 01:49:05'),
(12, 'side-navigation-primary-font-size', '14px', 'light_mode', '2022-10-28 01:49:05'),
(13, 'side-navigation-secondary-font-size', '13px', 'light_mode', '2022-10-28 01:49:05'),
(14, 'side-navigation-tertiary-font-size', '20px', 'light_mode', '2022-10-28 01:49:05'),
(15, 'left-side-content-primary-bg-color', '#FFFFFF', 'light_mode', '2022-10-28 01:49:05'),
(16, 'left-side-content-secondary-bg-color', '#F7F9FB', 'light_mode', '2022-10-28 01:49:05'),
(17, 'left-side-content-tertiary-bg-color', '#FFFFFF', 'light_mode', '2022-10-28 01:49:05'),
(18, 'left-side-content-quaternary-bg-color', '#E91E63', 'light_mode', '2022-10-28 01:49:05'),
(19, 'left-side-content-quinary-bg-color', '#9C27B0', 'light_mode', '2022-10-28 01:49:05'),
(20, 'left-side-content-senary-bg-color', '#F8D7DA', 'light_mode', '2022-10-28 01:49:05'),
(21, 'left-side-content-septenary-bg-color', '#FFC107', 'light_mode', '2022-10-28 01:49:05'),
(22, 'left-side-content-octonary-bg-color', '#FF5722', 'light_mode', '2022-10-28 01:49:05'),
(23, 'left-side-content-nonary-bg-color', '#F48FB1', 'light_mode', '2022-10-28 01:49:05'),
(24, 'left-side-content-denary-bg-color', '#F06292', 'light_mode', '2022-10-28 01:49:05'),
(25, 'left-side-content-primary-text-color', '#696767', 'light_mode', '2022-10-28 01:49:05'),
(26, 'left-side-content-secondary-text-color', '#828588', 'light_mode', '2022-10-28 01:49:05'),
(27, 'left-side-content-tertiary-text-color', '#E91E63', 'light_mode', '2022-10-28 01:49:05'),
(28, 'left-side-content-quaternary-text-color', '#9C27B0', 'light_mode', '2022-10-28 01:49:05'),
(29, 'left-side-content-quinary-text-color', '#721C24', 'light_mode', '2022-10-28 01:49:05'),
(30, 'left-side-content-senary-text-color', '#FFFFFF', 'light_mode', '2022-10-28 01:49:05'),
(31, 'left-side-content-primary-border-color', '#DFE7EF', 'light_mode', '2022-10-28 01:49:05'),
(32, 'left-side-content-secondary-border-color', '#E88A93', 'light_mode', '2022-10-28 01:49:05'),
(33, 'left-side-content-tertiary-border-color', '#EC407A', 'light_mode', '2022-10-28 01:49:05'),
(34, 'left-side-content-quaternary-border-color', '#D7DDE3', 'light_mode', '2022-10-28 01:49:05'),
(35, 'left-side-content-primary-font-size', '13px', 'light_mode', '2022-10-28 01:49:05'),
(36, 'left-side-content-secondary-font-size', '12px', 'light_mode', '2022-10-28 01:49:05'),
(37, 'left-side-content-tertiary-font-size', '15px', 'light_mode', '2022-10-28 01:49:05'),
(38, 'left-side-content-quaternary-font-size', '14px', 'light_mode', '2022-10-28 01:49:05'),
(39, 'left-side-content-quinary-font-size', '11px', 'light_mode', '2022-10-28 01:49:05'),
(40, 'left-side-content-senary-font-size', '25px', 'light_mode', '2022-10-28 01:49:05'),
(41, 'left-side-content-septenary-font-size', '20px', 'light_mode', '2022-10-28 01:49:05'),
(42, 'audio-player-primary-bg-color', '#050517', 'light_mode', '2022-10-28 01:49:05'),
(43, 'audio-player-secondary-bg-color', '#FFFFFF', 'light_mode', '2022-10-28 01:49:05'),
(44, 'audio-player-tertiary-bg-color', '#FF4E8A', 'light_mode', '2022-10-28 01:49:05'),
(45, 'audio-player-quaternary-bg-color', '#202030', 'light_mode', '2022-10-28 01:49:05'),
(46, 'audio-player-quinary-bg-color', '#EFF1F3', 'light_mode', '2022-10-28 01:49:05'),
(47, 'audio-player-senary-bg-color', '#E45E8C', 'light_mode', '2022-10-28 01:49:05'),
(48, 'audio-player-primary-text-color', '#FFFFFF', 'light_mode', '2022-10-28 01:49:05'),
(49, 'audio-player-secondary-text-color', '#696969', 'light_mode', '2022-10-28 01:49:05'),
(50, 'audio-player-tertiary-text-color', '#97A1A9', 'light_mode', '2022-10-28 01:49:05'),
(51, 'audio-player-quaternary-text-color', '#FFFFFF', 'light_mode', '2022-10-28 01:49:05'),
(52, 'audio-player-quinary-text-color', '#959595', 'light_mode', '2022-10-28 01:49:05'),
(53, 'audio-player-senary-text-color', '#FF6D9F', 'light_mode', '2022-10-28 01:49:05'),
(54, 'audio-player-primary-border-color', '#DFE7EF', 'light_mode', '2022-10-28 01:49:05'),
(55, 'audio-player-primary-font-size', '20px', 'light_mode', '2022-10-28 01:49:05'),
(56, 'audio-player-secondary-font-size', '15px', 'light_mode', '2022-10-28 01:49:05'),
(57, 'audio-player-tertiary-font-size', '14px', 'light_mode', '2022-10-28 01:49:05'),
(58, 'audio-player-quaternary-font-size', '13px', 'light_mode', '2022-10-28 01:49:05'),
(59, 'audio-player-quinary-font-size', '27px', 'light_mode', '2022-10-28 01:49:05'),
(60, 'audio-player-senary-font-size', '11px', 'light_mode', '2022-10-28 01:49:05'),
(61, 'form-primary-bg-color', '#FFFFFF', 'light_mode', '2022-10-28 01:49:05'),
(62, 'form-secondary-bg-color', '#F7F9FB', 'light_mode', '2022-10-28 01:49:05'),
(63, 'form-tertiary-bg-color', '#E91E63', 'light_mode', '2022-10-28 01:49:05'),
(64, 'form-quaternary-bg-color', '#9C27B0', 'light_mode', '2022-10-28 01:49:05'),
(65, 'form-quinary-bg-color', '#000000', 'light_mode', '2022-10-28 01:49:05'),
(66, 'form-senary-bg-color', '#F8D7DA', 'light_mode', '2022-10-28 01:49:05'),
(67, 'form-septenary-bg-color', '#E8EBEF', 'light_mode', '2022-10-28 01:49:05'),
(68, 'form-octonary-bg-color', '#F06292', 'light_mode', '2022-10-28 01:49:05'),
(69, 'form-primary-text-color', '#808080', 'light_mode', '2022-10-28 01:49:05'),
(70, 'form-secondary-text-color', '#FFFFFF', 'light_mode', '2022-10-28 01:49:05'),
(71, 'form-tertiary-text-color', '#E91E63', 'light_mode', '2022-10-28 01:49:05'),
(72, 'form-quaternary-text-color', '#9C27B0', 'light_mode', '2022-10-28 01:49:05'),
(73, 'form-quinary-text-color', '#721C24', 'light_mode', '2022-10-28 01:49:05'),
(74, 'form-primary-border-color', '#DFE7EF', 'light_mode', '2022-10-28 01:49:05'),
(75, 'form-secondary-border-color', '#E88A93', 'light_mode', '2022-10-28 01:49:05'),
(76, 'form-tertiary-border-color', '#EC407A', 'light_mode', '2022-10-28 01:49:05'),
(77, 'form-primary-font-size', '14px', 'light_mode', '2022-10-28 01:49:05'),
(78, 'form-secondary-font-size', '15px', 'light_mode', '2022-10-28 01:49:05'),
(79, 'form-tertiary-font-size', '18px', 'light_mode', '2022-10-28 01:49:05'),
(80, 'info-panel-primary-bg-color', '#FFFFFF', 'light_mode', '2022-10-28 01:49:05'),
(81, 'info-panel-secondary-bg-color', '#F7F9FB', 'light_mode', '2022-10-28 01:49:05'),
(82, 'info-panel-tertiary-bg-color', '#E91E63', 'light_mode', '2022-10-28 01:49:05'),
(83, 'info-panel-quaternary-bg-color', '#9C27B0', 'light_mode', '2022-10-28 01:49:05'),
(84, 'info-panel-quinary-bg-color', '#FDFEFE', 'light_mode', '2022-10-28 01:49:05'),
(85, 'info-panel-senary-bg-color', '#BFBDBD', 'light_mode', '2022-10-28 01:49:05'),
(86, 'info-panel-primary-text-color', '#565656', 'light_mode', '2022-10-28 01:49:05'),
(87, 'info-panel-secondary-text-color', '#878688', 'light_mode', '2022-10-28 01:49:05'),
(88, 'info-panel-tertiary-text-color', '#E91E63', 'light_mode', '2022-10-28 01:49:05'),
(89, 'info-panel-quaternary-text-color', '#9C27B0', 'light_mode', '2022-10-28 01:49:05'),
(90, 'info-panel-quinary-text-color', '#FFFFFF', 'light_mode', '2022-10-28 01:49:05'),
(91, 'info-panel-primary-border-color', '#DFE7EF', 'light_mode', '2022-10-28 01:49:05'),
(92, 'info-panel-secondary-border-color', '#E88A93', 'light_mode', '2022-10-28 01:49:05'),
(93, 'info-panel-tertiary-border-color', '#EC407A', 'light_mode', '2022-10-28 01:49:05'),
(94, 'info-panel-primary-font-size', '16px', 'light_mode', '2022-10-28 01:49:05'),
(95, 'info-panel-secondary-font-size', '14px', 'light_mode', '2022-10-28 01:49:05'),
(96, 'info-panel-tertiary-font-size', '15px', 'light_mode', '2022-10-28 01:49:05'),
(97, 'info-panel-quaternary-font-size', '13px', 'light_mode', '2022-10-28 01:49:05'),
(98, 'welcome-screen-primary-bg-color', '#F7F9FB', 'light_mode', '2022-10-28 01:49:05'),
(99, 'welcome-screen-primary-text-color', '#696767', 'light_mode', '2022-10-28 01:49:05'),
(100, 'welcome-screen-secondary-text-color', '#828588', 'light_mode', '2022-10-28 01:49:05'),
(101, 'welcome-screen-primary-border-color', '#DFE7EF', 'light_mode', '2022-10-28 01:49:05'),
(102, 'welcome-screen-primary-font-size', '19px', 'light_mode', '2022-10-28 01:49:05'),
(103, 'welcome-screen-secondary-font-size', '14px', 'light_mode', '2022-10-28 01:49:05'),
(104, 'welcome-screen-tertiary-font-size', '13px', 'light_mode', '2022-10-28 01:49:05'),
(105, 'custom-page-primary-bg-color', '#F7F9FB', 'light_mode', '2022-10-28 01:49:05'),
(106, 'custom-page-secondary-bg-color', '#FFFFFF', 'light_mode', '2022-10-28 01:49:05'),
(107, 'custom-page-primary-text-color', '#8F8F8F', 'light_mode', '2022-10-28 01:49:05'),
(108, 'custom-page-secondary-text-color', '#E91E63', 'light_mode', '2022-10-28 01:49:05'),
(109, 'custom-page-tertiary-text-color', '#9C27B0', 'light_mode', '2022-10-28 01:49:05'),
(110, 'custom-page-primary-border-color', '#DFE7EF', 'light_mode', '2022-10-28 01:49:05'),
(111, 'custom-page-primary-font-size', '15px', 'light_mode', '2022-10-28 01:49:05'),
(112, 'custom-page-secondary-font-size', '14px', 'light_mode', '2022-10-28 01:49:05'),
(113, 'statistics-primary-bg-color', '#F7F9FB', 'light_mode', '2022-10-28 01:49:05'),
(114, 'statistics-secondary-bg-color', '#FFFFFF', 'light_mode', '2022-10-28 01:49:05'),
(115, 'statistics-tertiary-bg-color', '#050517', 'light_mode', '2022-10-28 01:49:05'),
(116, 'statistics-quaternary-bg-color', '#262630', 'light_mode', '2022-10-28 01:49:05'),
(117, 'statistics-quinary-bg-color', '#E91E63', 'light_mode', '2022-10-28 01:49:05'),
(118, 'statistics-senary-bg-color', '#A5A5A5', 'light_mode', '2022-10-28 01:49:05'),
(119, 'statistics-primary-text-color', '#4A4A49', 'light_mode', '2022-10-28 01:49:05'),
(120, 'statistics-secondary-text-color', '#808080', 'light_mode', '2022-10-28 01:49:05'),
(121, 'statistics-tertiary-text-color', '#FFFFFF', 'light_mode', '2022-10-28 01:49:05'),
(122, 'statistics-quaternary-text-color', '#C7C7C7', 'light_mode', '2022-10-28 01:49:05'),
(123, 'statistics-quinary-text-color', '#E91E63', 'light_mode', '2022-10-28 01:49:05'),
(124, 'statistics-senary-text-color', '#9C27B0', 'light_mode', '2022-10-28 01:49:05'),
(125, 'statistics-primary-border-color', '#DFE7EF', 'light_mode', '2022-10-28 01:49:05'),
(126, 'statistics-primary-font-size', '14px', 'light_mode', '2022-10-28 01:49:05'),
(127, 'statistics-secondary-font-size', '17px', 'light_mode', '2022-10-28 01:49:05'),
(128, 'statistics-tertiary-font-size', '15px', 'light_mode', '2022-10-28 01:49:05'),
(129, 'statistics-quaternary-font-size', '19px', 'light_mode', '2022-10-28 01:49:05'),
(130, 'chat-window-primary-bg-color', '#FAFBFC', 'light_mode', '2022-10-28 01:49:05'),
(131, 'chat-window-secondary-bg-color', '#FFFFFF', 'light_mode', '2022-10-28 01:49:05'),
(132, 'chat-window-tertiary-bg-color', '#F7F9FB', 'light_mode', '2022-10-28 01:49:05'),
(133, 'chat-window-quaternary-bg-color', '#F06292', 'light_mode', '2022-10-28 01:49:05'),
(134, 'chat-window-quinary-bg-color', '#FFFFFF', 'light_mode', '2022-10-28 01:49:05'),
(135, 'chat-window-senary-bg-color', '#FFF3CD', 'light_mode', '2022-10-28 01:49:05'),
(136, 'chat-window-septenary-bg-color', '#ECEFF1', 'light_mode', '2022-10-28 01:49:05'),
(137, 'chat-window-octonary-bg-color', '#E91E63', 'light_mode', '2022-10-28 01:49:05'),
(138, 'chat-window-nonary-bg-color', '#F06292', 'light_mode', '2022-10-28 01:49:05'),
(139, 'chat-window-denary-bg-color', '#9E9E9E', 'light_mode', '2022-10-28 01:49:05'),
(140, 'chat-window-primary-text-color', '#808080', 'light_mode', '2022-10-28 01:49:05'),
(141, 'chat-window-secondary-text-color', '#FFFFFF', 'light_mode', '2022-10-28 01:49:05'),
(142, 'chat-window-tertiary-text-color', '#FFFFFF', 'light_mode', '2022-10-28 01:49:05'),
(143, 'chat-window-quaternary-text-color', '#808080', 'light_mode', '2022-10-28 01:49:05'),
(144, 'chat-window-quinary-text-color', '#E91E63', 'light_mode', '2022-10-28 01:49:05'),
(145, 'chat-window-senary-text-color', '#9C27B0', 'light_mode', '2022-10-28 01:49:05'),
(146, 'chat-window-septenary-text-color', '#856404', 'light_mode', '2022-10-28 01:49:05'),
(147, 'chat-window-octonary-text-color', '#565656', 'light_mode', '2022-10-28 01:49:05'),
(148, 'chat-window-nonary-text-color', '#E45E8C', 'light_mode', '2022-10-28 01:49:05'),
(149, 'chat-window-denary-text-color', '#B1B1B1', 'light_mode', '2022-10-28 01:49:05'),
(150, 'chat-window-primary-border-color', '#DFE7EF', 'light_mode', '2022-10-28 01:49:05'),
(151, 'chat-window-secondary-border-color', '#FFFFFF', 'light_mode', '2022-10-28 01:49:05'),
(152, 'chat-window-tertiary-border-color', '#F7E2A0', 'light_mode', '2022-10-28 01:49:05'),
(153, 'chat-window-quaternary-border-color', '#607D8B', 'light_mode', '2022-10-28 01:49:05'),
(154, 'chat-window-quinary-border-color', '#EC407A', 'light_mode', '2022-10-28 01:49:05'),
(155, 'chat-window-senary-border-color', '#FFC107', 'light_mode', '2022-10-28 01:49:05'),
(156, 'chat-window-septenary-border-color', '#D7DDE3', 'light_mode', '2022-10-28 01:49:05'),
(157, 'chat-window-primary-font-size', '14px', 'light_mode', '2022-10-28 01:49:05'),
(158, 'chat-window-secondary-font-size', '15px', 'light_mode', '2022-10-28 01:49:05'),
(159, 'chat-window-tertiary-font-size', '13px', 'light_mode', '2022-10-28 01:49:05'),
(160, 'chat-window-quaternary-font-size', '12px', 'light_mode', '2022-10-28 01:49:05'),
(161, 'chat-window-quinary-font-size', '19px', 'light_mode', '2022-10-28 01:49:05'),
(162, 'chat-window-senary-font-size', '27px', 'light_mode', '2022-10-28 01:49:05'),
(163, 'chat-window-septenary-font-size', '30px', 'light_mode', '2022-10-28 01:49:05'),
(164, 'chat-window-octonary-font-size', '34px', 'light_mode', '2022-10-28 01:49:05'),
(165, 'entry-page-primary-bg-color', '#FFFFFF', 'light_mode', '2022-10-28 01:49:05'),
(166, 'entry-page-secondary-bg-color', '#F7F9FB', 'light_mode', '2022-10-28 01:49:05'),
(167, 'entry-page-tertiary-bg-color', '#E91E63', 'light_mode', '2022-10-28 01:49:05'),
(168, 'entry-page-quaternary-bg-color', '#9C27B0', 'light_mode', '2022-10-28 01:49:05'),
(169, 'entry-page-quinary-bg-color', '#9E9E9E', 'light_mode', '2022-10-28 01:49:05'),
(170, 'entry-page-senary-bg-color', '#F06292', 'light_mode', '2022-10-28 01:49:05'),
(171, 'entry-page-primary-text-color', '#808080', 'light_mode', '2022-10-28 01:49:05'),
(172, 'entry-page-secondary-text-color', '#919191', 'light_mode', '2022-10-28 01:49:05'),
(173, 'entry-page-tertiary-text-color', '#23576A', 'light_mode', '2022-10-28 01:49:05'),
(174, 'entry-page-quaternary-text-color', '#FFFFFF', 'light_mode', '2022-10-28 01:49:05'),
(175, 'entry-page-quinary-text-color', '#E91E63', 'light_mode', '2022-10-28 01:49:05'),
(176, 'entry-page-senary-text-color', '#333333', 'light_mode', '2022-10-28 01:49:05'),
(177, 'entry-page-primary-border-color', '#DFE7EF', 'light_mode', '2022-10-28 01:49:05'),
(178, 'entry-page-secondary-border-color', '#A9A9A9', 'light_mode', '2022-10-28 01:49:05'),
(179, 'entry-page-tertiary-border-color', '#DC1F6F', 'light_mode', '2022-10-28 01:49:05'),
(180, 'entry-page-quaternary-border-color', '#D7DDE3', 'light_mode', '2022-10-28 01:49:05'),
(181, 'entry-page-primary-font-size', '14px', 'light_mode', '2022-10-28 01:49:05'),
(182, 'entry-page-secondary-font-size', '15px', 'light_mode', '2022-10-28 01:49:05'),
(183, 'entry-page-tertiary-font-size', '18px', 'light_mode', '2022-10-28 01:49:05'),
(184, 'entry-page-quaternary-font-size', '20px', 'light_mode', '2022-10-28 01:49:05'),
(185, 'entry-page-quinary-font-size', '16px', 'light_mode', '2022-10-28 01:49:05'),
(186, 'entry-page-senary-font-size', '13px', 'light_mode', '2022-10-28 01:49:05'),
(187, 'chat-page-primary-bg-color', '#0F0F0F', 'dark_mode', '2022-10-28 01:49:05'),
(188, 'chat-page-primary-font-size', '14px', 'dark_mode', '2022-10-28 01:49:05'),
(189, 'side-navigation-primary-bg-color', '#1E1D1D', 'dark_mode', '2022-10-28 01:49:05'),
(190, 'side-navigation-secondary-bg-color', '#1E1D1D', 'dark_mode', '2022-10-28 01:49:05'),
(191, 'side-navigation-tertiary-bg-color', '#242424', 'dark_mode', '2022-10-28 01:49:05'),
(192, 'side-navigation-quaternary-bg-color', '#E91E63', 'dark_mode', '2022-10-28 01:49:05'),
(193, 'side-navigation-primary-text-color', '#9D9D9D', 'dark_mode', '2022-10-28 01:49:05'),
(194, 'side-navigation-secondary-text-color', '#E91E63', 'dark_mode', '2022-10-28 01:49:05'),
(195, 'side-navigation-tertiary-text-color', '#9C27B0', 'dark_mode', '2022-10-28 01:49:05'),
(196, 'side-navigation-quaternary-text-color', '#FFFFFF', 'dark_mode', '2022-10-28 01:49:05'),
(197, 'side-navigation-primary-border-color', '#060606', 'dark_mode', '2022-10-28 01:49:05'),
(198, 'side-navigation-primary-font-size', '14px', 'dark_mode', '2022-10-28 01:49:05'),
(199, 'side-navigation-secondary-font-size', '13px', 'dark_mode', '2022-10-28 01:49:05'),
(200, 'side-navigation-tertiary-font-size', '20px', 'dark_mode', '2022-10-28 01:49:05'),
(201, 'left-side-content-primary-bg-color', '#1E1D1D', 'dark_mode', '2022-10-28 01:49:05'),
(202, 'left-side-content-secondary-bg-color', '#292929', 'dark_mode', '2022-10-28 01:49:05'),
(203, 'left-side-content-tertiary-bg-color', '#292929', 'dark_mode', '2022-10-28 01:49:05'),
(204, 'left-side-content-quaternary-bg-color', '#E91E63', 'dark_mode', '2022-10-28 01:49:05'),
(205, 'left-side-content-quinary-bg-color', '#9C27B0', 'dark_mode', '2022-10-28 01:49:05'),
(206, 'left-side-content-senary-bg-color', '#F8D7DA', 'dark_mode', '2022-10-28 01:49:05'),
(207, 'left-side-content-septenary-bg-color', '#FFC107', 'dark_mode', '2022-10-28 01:49:05'),
(208, 'left-side-content-octonary-bg-color', '#FF5722', 'dark_mode', '2022-10-28 01:49:05'),
(209, 'left-side-content-nonary-bg-color', '#F48FB1', 'dark_mode', '2022-10-28 01:49:05'),
(210, 'left-side-content-denary-bg-color', '#F06292', 'dark_mode', '2022-10-28 01:49:05'),
(211, 'left-side-content-primary-text-color', '#B6B6B6', 'dark_mode', '2022-10-28 01:49:05'),
(212, 'left-side-content-secondary-text-color', '#767676', 'dark_mode', '2022-10-28 01:49:05'),
(213, 'left-side-content-tertiary-text-color', '#E91E63', 'dark_mode', '2022-10-28 01:49:05'),
(214, 'left-side-content-quaternary-text-color', '#9C27B0', 'dark_mode', '2022-10-28 01:49:05'),
(215, 'left-side-content-quinary-text-color', '#721C24', 'dark_mode', '2022-10-28 01:49:05'),
(216, 'left-side-content-senary-text-color', '#FFFFFF', 'dark_mode', '2022-10-28 01:49:05'),
(217, 'left-side-content-primary-border-color', '#000000', 'dark_mode', '2022-10-28 01:49:05'),
(218, 'left-side-content-secondary-border-color', '#E88A93', 'dark_mode', '2022-10-28 01:49:05'),
(219, 'left-side-content-tertiary-border-color', '#EC407A', 'dark_mode', '2022-10-28 01:49:05'),
(220, 'left-side-content-quaternary-border-color', '#474747', 'dark_mode', '2022-10-28 01:49:05'),
(221, 'left-side-content-primary-font-size', '13px', 'dark_mode', '2022-10-28 01:49:05'),
(222, 'left-side-content-secondary-font-size', '12px', 'dark_mode', '2022-10-28 01:49:05'),
(223, 'left-side-content-tertiary-font-size', '15px', 'dark_mode', '2022-10-28 01:49:05'),
(224, 'left-side-content-quaternary-font-size', '14px', 'dark_mode', '2022-10-28 01:49:05'),
(225, 'left-side-content-quinary-font-size', '11px', 'dark_mode', '2022-10-28 01:49:05'),
(226, 'left-side-content-senary-font-size', '25px', 'dark_mode', '2022-10-28 01:49:05'),
(227, 'left-side-content-septenary-font-size', '20px', 'dark_mode', '2022-10-28 01:49:05'),
(228, 'audio-player-primary-bg-color', '#000000', 'dark_mode', '2022-10-28 01:49:05'),
(229, 'audio-player-secondary-bg-color', '#FFFFFF', 'dark_mode', '2022-10-28 01:49:05'),
(230, 'audio-player-tertiary-bg-color', '#FF4E8A', 'dark_mode', '2022-10-28 01:49:05'),
(231, 'audio-player-quaternary-bg-color', '#1E1D1D', 'dark_mode', '2022-10-28 01:49:05'),
(232, 'audio-player-quinary-bg-color', '#EFF1F3', 'dark_mode', '2022-10-28 01:49:05'),
(233, 'audio-player-senary-bg-color', '#E45E8C', 'dark_mode', '2022-10-28 01:49:05'),
(234, 'audio-player-primary-text-color', '#FFFFFF', 'dark_mode', '2022-10-28 01:49:05'),
(235, 'audio-player-secondary-text-color', '#AAA7A7', 'dark_mode', '2022-10-28 01:49:05'),
(236, 'audio-player-tertiary-text-color', '#818589', 'dark_mode', '2022-10-28 01:49:05'),
(237, 'audio-player-quaternary-text-color', '#FFFFFF', 'dark_mode', '2022-10-28 01:49:05'),
(238, 'audio-player-quinary-text-color', '#666666', 'dark_mode', '2022-10-28 01:49:05'),
(239, 'audio-player-senary-text-color', '#FF6D9F', 'dark_mode', '2022-10-28 01:49:05'),
(240, 'audio-player-primary-border-color', '#383838', 'dark_mode', '2022-10-28 01:49:05'),
(241, 'audio-player-primary-font-size', '20px', 'dark_mode', '2022-10-28 01:49:05'),
(242, 'audio-player-secondary-font-size', '15px', 'dark_mode', '2022-10-28 01:49:05'),
(243, 'audio-player-tertiary-font-size', '14px', 'dark_mode', '2022-10-28 01:49:05'),
(244, 'audio-player-quaternary-font-size', '13px', 'dark_mode', '2022-10-28 01:49:05'),
(245, 'audio-player-quinary-font-size', '27px', 'dark_mode', '2022-10-28 01:49:05'),
(246, 'audio-player-senary-font-size', '11px', 'dark_mode', '2022-10-28 01:49:05'),
(247, 'form-primary-bg-color', '#1E1D1D', 'dark_mode', '2022-10-28 01:49:05'),
(248, 'form-secondary-bg-color', '#040404', 'dark_mode', '2022-10-28 01:49:05'),
(249, 'form-tertiary-bg-color', '#E91E63', 'dark_mode', '2022-10-28 01:49:05'),
(250, 'form-quaternary-bg-color', '#9C27B0', 'dark_mode', '2022-10-28 01:49:05'),
(251, 'form-quinary-bg-color', '#000000', 'dark_mode', '2022-10-28 01:49:05'),
(252, 'form-senary-bg-color', '#F8D7DA', 'dark_mode', '2022-10-28 01:49:05'),
(253, 'form-septenary-bg-color', '#000000', 'dark_mode', '2022-10-28 01:49:05'),
(254, 'form-octonary-bg-color', '#F06292', 'dark_mode', '2022-10-28 01:49:05'),
(255, 'form-primary-text-color', '#A1A1A1', 'dark_mode', '2022-10-28 01:49:05'),
(256, 'form-secondary-text-color', '#FFFFFF', 'dark_mode', '2022-10-28 01:49:05'),
(257, 'form-tertiary-text-color', '#E91E63', 'dark_mode', '2022-10-28 01:49:05'),
(258, 'form-quaternary-text-color', '#9C27B0', 'dark_mode', '2022-10-28 01:49:05'),
(259, 'form-quinary-text-color', '#721C24', 'dark_mode', '2022-10-28 01:49:05'),
(260, 'form-primary-border-color', '#383838', 'dark_mode', '2022-10-28 01:49:05'),
(261, 'form-secondary-border-color', '#E88A93', 'dark_mode', '2022-10-28 01:49:05'),
(262, 'form-tertiary-border-color', '#EC407A', 'dark_mode', '2022-10-28 01:49:05'),
(263, 'form-primary-font-size', '14px', 'dark_mode', '2022-10-28 01:49:05'),
(264, 'form-secondary-font-size', '15px', 'dark_mode', '2022-10-28 01:49:05'),
(265, 'form-tertiary-font-size', '18px', 'dark_mode', '2022-10-28 01:49:05'),
(266, 'info-panel-primary-bg-color', '#1E1D1D', 'dark_mode', '2022-10-28 01:49:05'),
(267, 'info-panel-secondary-bg-color', '#2E2E2E', 'dark_mode', '2022-10-28 01:49:05'),
(268, 'info-panel-tertiary-bg-color', '#E91E63', 'dark_mode', '2022-10-28 01:49:05'),
(269, 'info-panel-quaternary-bg-color', '#9C27B0', 'dark_mode', '2022-10-28 01:49:05'),
(270, 'info-panel-quinary-bg-color', '#242424', 'dark_mode', '2022-10-28 01:49:05'),
(271, 'info-panel-senary-bg-color', '#454545', 'dark_mode', '2022-10-28 01:49:05'),
(272, 'info-panel-primary-text-color', '#B2B1B1', 'dark_mode', '2022-10-28 01:49:05'),
(273, 'info-panel-secondary-text-color', '#959595', 'dark_mode', '2022-10-28 01:49:05'),
(274, 'info-panel-tertiary-text-color', '#E91E63', 'dark_mode', '2022-10-28 01:49:05'),
(275, 'info-panel-quaternary-text-color', '#9C27B0', 'dark_mode', '2022-10-28 01:49:05'),
(276, 'info-panel-quinary-text-color', '#FFFFFF', 'dark_mode', '2022-10-28 01:49:05'),
(277, 'info-panel-primary-border-color', '#000000', 'dark_mode', '2022-10-28 01:49:05'),
(278, 'info-panel-secondary-border-color', '#E88A93', 'dark_mode', '2022-10-28 01:49:05'),
(279, 'info-panel-tertiary-border-color', '#EC407A', 'dark_mode', '2022-10-28 01:49:05'),
(280, 'info-panel-primary-font-size', '16px', 'dark_mode', '2022-10-28 01:49:05'),
(281, 'info-panel-secondary-font-size', '14px', 'dark_mode', '2022-10-28 01:49:05'),
(282, 'info-panel-tertiary-font-size', '15px', 'dark_mode', '2022-10-28 01:49:05'),
(283, 'info-panel-quaternary-font-size', '13px', 'dark_mode', '2022-10-28 01:49:05'),
(284, 'welcome-screen-primary-bg-color', '#2E2E2E', 'dark_mode', '2022-10-28 01:49:05'),
(285, 'welcome-screen-primary-text-color', '#A4A4A4', 'dark_mode', '2022-10-28 01:49:05'),
(286, 'welcome-screen-secondary-text-color', '#7E7F81', 'dark_mode', '2022-10-28 01:49:05'),
(287, 'welcome-screen-primary-border-color', '#383838', 'dark_mode', '2022-10-28 01:49:05'),
(288, 'welcome-screen-primary-font-size', '19px', 'dark_mode', '2022-10-28 01:49:05'),
(289, 'welcome-screen-secondary-font-size', '14px', 'dark_mode', '2022-10-28 01:49:05'),
(290, 'welcome-screen-tertiary-font-size', '13px', 'dark_mode', '2022-10-28 01:49:05'),
(291, 'custom-page-primary-bg-color', '#2E2E2E', 'dark_mode', '2022-10-28 01:49:05'),
(292, 'custom-page-secondary-bg-color', '#1E1D1D', 'dark_mode', '2022-10-28 01:49:05'),
(293, 'custom-page-primary-text-color', '#8A8A8A', 'dark_mode', '2022-10-28 01:49:05'),
(294, 'custom-page-secondary-text-color', '#E91E63', 'dark_mode', '2022-10-28 01:49:05'),
(295, 'custom-page-tertiary-text-color', '#9C27B0', 'dark_mode', '2022-10-28 01:49:05'),
(296, 'custom-page-primary-border-color', '#383838', 'dark_mode', '2022-10-28 01:49:05'),
(297, 'custom-page-primary-font-size', '15px', 'dark_mode', '2022-10-28 01:49:05'),
(298, 'custom-page-secondary-font-size', '14px', 'dark_mode', '2022-10-28 01:49:05'),
(299, 'statistics-primary-bg-color', '#2E2E2E', 'dark_mode', '2022-10-28 01:49:05'),
(300, 'statistics-secondary-bg-color', '#1E1D1D', 'dark_mode', '2022-10-28 01:49:05'),
(301, 'statistics-tertiary-bg-color', '#232323', 'dark_mode', '2022-10-28 01:49:05'),
(302, 'statistics-quaternary-bg-color', '#191919', 'dark_mode', '2022-10-28 01:49:05'),
(303, 'statistics-quinary-bg-color', '#E91E63', 'dark_mode', '2022-10-28 01:49:05'),
(304, 'statistics-senary-bg-color', '#1B1B1B', 'dark_mode', '2022-10-28 01:49:05'),
(305, 'statistics-primary-text-color', '#B4B4B4', 'dark_mode', '2022-10-28 01:49:05'),
(306, 'statistics-secondary-text-color', '#818181', 'dark_mode', '2022-10-28 01:49:05'),
(307, 'statistics-tertiary-text-color', '#FFFFFF', 'dark_mode', '2022-10-28 01:49:05'),
(308, 'statistics-quaternary-text-color', '#8B8B8B', 'dark_mode', '2022-10-28 01:49:05'),
(309, 'statistics-quinary-text-color', '#E91E63', 'dark_mode', '2022-10-28 01:49:05'),
(310, 'statistics-senary-text-color', '#9C27B0', 'dark_mode', '2022-10-28 01:49:05'),
(311, 'statistics-primary-border-color', '#060606', 'dark_mode', '2022-10-28 01:49:05'),
(312, 'statistics-primary-font-size', '14px', 'dark_mode', '2022-10-28 01:49:05'),
(313, 'statistics-secondary-font-size', '17px', 'dark_mode', '2022-10-28 01:49:05'),
(314, 'statistics-tertiary-font-size', '15px', 'dark_mode', '2022-10-28 01:49:05'),
(315, 'statistics-quaternary-font-size', '19px', 'dark_mode', '2022-10-28 01:49:05'),
(316, 'chat-window-primary-bg-color', '#070707', 'dark_mode', '2022-10-28 01:49:05'),
(317, 'chat-window-secondary-bg-color', '#1E1D1D', 'dark_mode', '2022-10-28 01:49:05'),
(318, 'chat-window-tertiary-bg-color', '#040404', 'dark_mode', '2022-10-28 01:49:05'),
(319, 'chat-window-quaternary-bg-color', '#F06292', 'dark_mode', '2022-10-28 01:49:05'),
(320, 'chat-window-quinary-bg-color', '#292929', 'dark_mode', '2022-10-28 01:49:05'),
(321, 'chat-window-senary-bg-color', '#1F1D1D', 'dark_mode', '2022-10-28 01:49:05'),
(322, 'chat-window-septenary-bg-color', '#292929', 'dark_mode', '2022-10-28 01:49:05'),
(323, 'chat-window-octonary-bg-color', '#E91E63', 'dark_mode', '2022-10-28 01:49:05'),
(324, 'chat-window-nonary-bg-color', '#F06292', 'dark_mode', '2022-10-28 01:49:05'),
(325, 'chat-window-denary-bg-color', '#312F2F', 'dark_mode', '2022-10-28 01:49:05'),
(326, 'chat-window-primary-text-color', '#8D8D8D', 'dark_mode', '2022-10-28 01:49:05'),
(327, 'chat-window-secondary-text-color', '#FFFFFF', 'dark_mode', '2022-10-28 01:49:05'),
(328, 'chat-window-tertiary-text-color', '#FFFFFF', 'dark_mode', '2022-10-28 01:49:05'),
(329, 'chat-window-quaternary-text-color', '#989898', 'dark_mode', '2022-10-28 01:49:05'),
(330, 'chat-window-quinary-text-color', '#E91E63', 'dark_mode', '2022-10-28 01:49:05'),
(331, 'chat-window-senary-text-color', '#9C27B0', 'dark_mode', '2022-10-28 01:49:05'),
(332, 'chat-window-septenary-text-color', '#666664', 'dark_mode', '2022-10-28 01:49:05'),
(333, 'chat-window-octonary-text-color', '#565656', 'dark_mode', '2022-10-28 01:49:05'),
(334, 'chat-window-nonary-text-color', '#E45E8C', 'dark_mode', '2022-10-28 01:49:05'),
(335, 'chat-window-denary-text-color', '#B1B1B1', 'dark_mode', '2022-10-28 01:49:05'),
(336, 'chat-window-primary-border-color', '#000000', 'dark_mode', '2022-10-28 01:49:05'),
(337, 'chat-window-secondary-border-color', '#FFFFFF', 'dark_mode', '2022-10-28 01:49:05'),
(338, 'chat-window-tertiary-border-color', '#0A0A0A', 'dark_mode', '2022-10-28 01:49:05'),
(339, 'chat-window-quaternary-border-color', '#607D8B', 'dark_mode', '2022-10-28 01:49:05'),
(340, 'chat-window-quinary-border-color', '#EC407A', 'dark_mode', '2022-10-28 01:49:05'),
(341, 'chat-window-senary-border-color', '#FFC107', 'dark_mode', '2022-10-28 01:49:05'),
(342, 'chat-window-septenary-border-color', '#474747', 'dark_mode', '2022-10-28 01:49:05'),
(343, 'chat-window-primary-font-size', '14px', 'dark_mode', '2022-10-28 01:49:05'),
(344, 'chat-window-secondary-font-size', '15px', 'dark_mode', '2022-10-28 01:49:05'),
(345, 'chat-window-tertiary-font-size', '13px', 'dark_mode', '2022-10-28 01:49:05'),
(346, 'chat-window-quaternary-font-size', '12px', 'dark_mode', '2022-10-28 01:49:05'),
(347, 'chat-window-quinary-font-size', '19px', 'dark_mode', '2022-10-28 01:49:05'),
(348, 'chat-window-senary-font-size', '27px', 'dark_mode', '2022-10-28 01:49:05'),
(349, 'chat-window-septenary-font-size', '30px', 'dark_mode', '2022-10-28 01:49:05'),
(350, 'chat-window-octonary-font-size', '34px', 'dark_mode', '2022-10-28 01:49:05'),
(351, 'entry-page-primary-bg-color', '#1E1D1D', 'dark_mode', '2022-10-28 01:49:05'),
(352, 'entry-page-secondary-bg-color', '#292929', 'dark_mode', '2022-10-28 01:49:05'),
(353, 'entry-page-tertiary-bg-color', '#E91E63', 'dark_mode', '2022-10-28 01:49:05'),
(354, 'entry-page-quaternary-bg-color', '#9C27B0', 'dark_mode', '2022-10-28 01:49:05'),
(355, 'entry-page-quinary-bg-color', '#353333', 'dark_mode', '2022-10-28 01:49:05'),
(356, 'entry-page-senary-bg-color', '#F06292', 'dark_mode', '2022-10-28 01:49:05'),
(357, 'entry-page-primary-text-color', '#858585', 'dark_mode', '2022-10-28 01:49:05'),
(358, 'entry-page-secondary-text-color', '#929292', 'dark_mode', '2022-10-28 01:49:05'),
(359, 'entry-page-tertiary-text-color', '#CDCDCD', 'dark_mode', '2022-10-28 01:49:05'),
(360, 'entry-page-quaternary-text-color', '#FFFFFF', 'dark_mode', '2022-10-28 01:49:05'),
(361, 'entry-page-quinary-text-color', '#E91E63', 'dark_mode', '2022-10-28 01:49:05'),
(362, 'entry-page-senary-text-color', '#808080', 'dark_mode', '2022-10-28 01:49:05'),
(363, 'entry-page-primary-border-color', '#101010', 'dark_mode', '2022-10-28 01:49:05'),
(364, 'entry-page-secondary-border-color', '#A9A9A9', 'dark_mode', '2022-10-28 01:49:05'),
(365, 'entry-page-tertiary-border-color', '#DC1F6F', 'dark_mode', '2022-10-28 01:49:05'),
(366, 'entry-page-quaternary-border-color', '#474747', 'dark_mode', '2022-10-28 01:49:05'),
(367, 'entry-page-primary-font-size', '14px', 'dark_mode', '2022-10-28 01:49:05'),
(368, 'entry-page-secondary-font-size', '15px', 'dark_mode', '2022-10-28 01:49:05'),
(369, 'entry-page-tertiary-font-size', '18px', 'dark_mode', '2022-10-28 01:49:05'),
(370, 'entry-page-quaternary-font-size', '20px', 'dark_mode', '2022-10-28 01:49:05'),
(371, 'entry-page-quinary-font-size', '16px', 'dark_mode', '2022-10-28 01:49:05'),
(372, 'entry-page-senary-font-size', '13px', 'dark_mode', '2022-10-28 01:49:05'),
(373, 'chat-page-secondary-bg-color', '#F06292', 'light_mode', '2022-10-28 01:49:05'),
(374, 'chat-page-tertiary-bg-color', '#DBE1E7', 'light_mode', '2022-10-28 01:49:05'),
(375, 'chat-page-secondary-bg-color', '#F06292', 'dark_mode', '2022-10-28 01:49:05'),
(376, 'chat-page-tertiary-bg-color', '#292929', 'dark_mode', '2022-10-28 01:49:05'),
(377, 'landing-page-primary-bg-color', '#FFFFFF', 'light_mode', '2022-10-28 01:49:05'),
(378, 'landing-page-secondary-bg-color', '#F1F5F9', 'light_mode', '2022-10-28 01:49:05'),
(379, 'landing-page-tertiary-bg-color', '#CED6DF', 'light_mode', '2022-10-28 01:49:05'),
(380, 'landing-page-quaternary-bg-color', '#E91E63', 'light_mode', '2022-10-28 01:49:05'),
(381, 'landing-page-quinary-bg-color', '#FFF497', 'light_mode', '2022-10-28 01:49:05'),
(382, 'landing-page-senary-bg-color', '#000000', 'light_mode', '2022-10-28 01:49:05'),
(383, 'landing-page-septenary-bg-color', '#9C27B0', 'light_mode', '2022-10-28 01:49:05'),
(384, 'landing-page-primary-text-color', '#1B1E60', 'light_mode', '2022-10-28 01:49:05'),
(385, 'landing-page-secondary-text-color', '#7F8097', 'light_mode', '2022-10-28 01:49:05'),
(386, 'landing-page-tertiary-text-color', '#CFCFCF', 'light_mode', '2022-10-28 01:49:05'),
(387, 'landing-page-quaternary-text-color', '#FFFFFF', 'light_mode', '2022-10-28 01:49:05'),
(388, 'landing-page-quinary-text-color', '#FFEB3B', 'light_mode', '2022-10-28 01:49:05'),
(389, 'landing-page-senary-text-color', '#E91E63', 'light_mode', '2022-10-28 01:49:05'),
(390, 'landing-page-septenary-text-color', '#3F3F3F', 'light_mode', '2022-10-28 01:49:05'),
(391, 'landing-page-octonary-text-color', '#797F85', 'light_mode', '2022-10-28 01:49:05'),
(392, 'landing-page-primary-border-color', '#B9BFC6', 'light_mode', '2022-10-28 01:49:05'),
(393, 'landing-page-primary-font-size', '25px', 'light_mode', '2022-10-28 01:49:05'),
(394, 'landing-page-secondary-font-size', '17px', 'light_mode', '2022-10-28 01:49:05'),
(395, 'landing-page-tertiary-font-size', '16px', 'light_mode', '2022-10-28 01:49:05'),
(396, 'landing-page-quaternary-font-size', '16px', 'light_mode', '2022-10-28 01:49:05'),
(397, 'landing-page-quinary-font-size', '15px', 'light_mode', '2022-10-28 01:49:05'),
(398, 'landing-page-senary-font-size', '14px', 'light_mode', '2022-10-28 01:49:05'),
(399, 'landing-page-primary-bg-color', '#1D1D1D', 'dark_mode', '2022-10-28 01:49:05'),
(400, 'landing-page-secondary-bg-color', '#131313', 'dark_mode', '2022-10-28 01:49:05'),
(401, 'landing-page-tertiary-bg-color', '#000000', 'dark_mode', '2022-10-28 01:49:05'),
(402, 'landing-page-quaternary-bg-color', '#E91E63', 'dark_mode', '2022-10-28 01:49:05'),
(403, 'landing-page-quinary-bg-color', '#FFF497', 'dark_mode', '2022-10-28 01:49:05'),
(404, 'landing-page-senary-bg-color', '#000000', 'dark_mode', '2022-10-28 01:49:05'),
(405, 'landing-page-septenary-bg-color', '#9C27B0', 'dark_mode', '2022-10-28 01:49:05'),
(406, 'landing-page-primary-text-color', '#FFFFFF', 'dark_mode', '2022-10-28 01:49:05'),
(407, 'landing-page-secondary-text-color', '#AFAFAF', 'dark_mode', '2022-10-28 01:49:05'),
(408, 'landing-page-tertiary-text-color', '#CFCFCF', 'dark_mode', '2022-10-28 01:49:05'),
(409, 'landing-page-quaternary-text-color', '#FFFFFF', 'dark_mode', '2022-10-28 01:49:05'),
(410, 'landing-page-quinary-text-color', '#FFEB3B', 'dark_mode', '2022-10-28 01:49:05'),
(411, 'landing-page-senary-text-color', '#E91E63', 'dark_mode', '2022-10-28 01:49:05'),
(412, 'landing-page-septenary-text-color', '#3F3F3F', 'dark_mode', '2022-10-28 01:49:05'),
(413, 'landing-page-octonary-text-color', '#727272', 'dark_mode', '2022-10-28 01:49:05'),
(414, 'landing-page-primary-border-color', '#222222', 'dark_mode', '2022-10-28 01:49:05'),
(415, 'landing-page-primary-font-size', '25px', 'dark_mode', '2022-10-28 01:49:05'),
(416, 'landing-page-secondary-font-size', '17px', 'dark_mode', '2022-10-28 01:49:05'),
(417, 'landing-page-tertiary-font-size', '16px', 'dark_mode', '2022-10-28 01:49:05'),
(418, 'landing-page-quaternary-font-size', '16px', 'dark_mode', '2022-10-28 01:49:05'),
(419, 'landing-page-quinary-font-size', '15px', 'dark_mode', '2022-10-28 01:49:05'),
(420, 'landing-page-senary-font-size', '14px', 'dark_mode', '2022-10-28 01:49:05'),
(421, 'chat-window-undenary-text-color', '#FF9800', 'light_mode', '2022-10-28 01:49:05'),
(422, 'chat-window-duodenary-text-color', '#FFEB3B', 'light_mode', '2022-10-28 01:49:05'),
(423, 'chat-window-undenary-text-color', '#FF9800', 'dark_mode', '2022-10-28 01:49:05'),
(424, 'chat-window-duodenary-text-color', '#FFEB3B', 'dark_mode', '2022-10-28 01:49:05'),
(425, 'chat-window-nonary-font-size', '22px', 'light_mode', '2022-10-28 01:49:05'),
(426, 'chat-window-nonary-font-size', '22px', 'dark_mode', '2022-10-28 01:49:05');

-- --------------------------------------------------------

--
-- Table structure for table `gr_custom_fields`
--

CREATE TABLE `gr_custom_fields` (
  `field_id` bigint NOT NULL,
  `string_constant` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `field_category` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'profile',
  `field_type` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `show_on_signup` int NOT NULL DEFAULT '0',
  `required` int NOT NULL DEFAULT '0',
  `minimum_length` int NOT NULL DEFAULT '0',
  `maximum_length` int NOT NULL DEFAULT '250',
  `show_on_info_page` int NOT NULL DEFAULT '1',
  `editable_only_once` int NOT NULL DEFAULT '0',
  `disabled` int NOT NULL DEFAULT '0',
  `order_by` bigint NOT NULL DEFAULT '0',
  `updated_on` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `gr_custom_fields`
--

INSERT INTO `gr_custom_fields` (`field_id`, `string_constant`, `field_category`, `field_type`, `show_on_signup`, `required`, `minimum_length`, `maximum_length`, `show_on_info_page`, `editable_only_once`, `disabled`, `order_by`, `updated_on`) VALUES
(1, 'custom_field_1', 'profile', 'long_text', 1, 1, 0, 250, 1, 0, 0, 0, '2022-09-29 18:19:00'),
(2, 'custom_field_2', 'profile', 'date', 0, 0, 0, 0, 1, 0, 0, 0, '2022-03-06 13:33:47'),
(3, 'custom_field_3', 'profile', 'dropdown', 0, 0, 0, 0, 1, 0, 0, 0, '2022-03-12 04:28:29'),
(4, 'custom_field_4', 'profile', 'number', 0, 0, 0, 0, 0, 0, 0, 0, '2022-03-06 13:33:42'),
(5, 'custom_field_5', 'profile', 'short_text', 0, 0, 0, 0, 1, 0, 0, 0, '2022-03-06 13:33:36'),
(6, 'custom_field_6', 'profile', 'dropdown', 0, 0, 0, 0, 1, 0, 0, 0, '2022-05-11 07:20:04');

-- --------------------------------------------------------

--
-- Table structure for table `gr_custom_fields_values`
--

CREATE TABLE `gr_custom_fields_values` (
  `field_value_id` bigint NOT NULL,
  `field_id` bigint NOT NULL,
  `group_id` bigint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  `field_value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `gr_custom_fields_values`
--

INSERT INTO `gr_custom_fields_values` (`field_value_id`, `field_id`, `group_id`, `user_id`, `field_value`, `updated_on`) VALUES
(1, 6, NULL, 1, 'US', '2022-10-29 00:50:11');

-- --------------------------------------------------------

--
-- Table structure for table `gr_custom_menu_items`
--

CREATE TABLE `gr_custom_menu_items` (
  `menu_item_id` bigint NOT NULL,
  `string_constant` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `menu_icon_class` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `page_id` bigint DEFAULT NULL,
  `web_address` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link_target` int NOT NULL DEFAULT '0' COMMENT '0 = Open URL in same window\r\n1 = Open URL in New tab',
  `show_on_landing_page_header` int NOT NULL DEFAULT '0',
  `show_on_landing_page_footer` int NOT NULL DEFAULT '0',
  `show_on_entry_page` int NOT NULL DEFAULT '0',
  `show_on_chat_page` int NOT NULL DEFAULT '0',
  `show_on_chat_page_top` int NOT NULL DEFAULT '0',
  `menu_item_order` int NOT NULL DEFAULT '0',
  `menu_item_visibility` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'all',
  `disabled` int NOT NULL DEFAULT '0',
  `created_on` datetime NOT NULL,
  `updated_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `gr_custom_menu_items`
--

INSERT INTO `gr_custom_menu_items` (`menu_item_id`, `string_constant`, `menu_icon_class`, `page_id`, `web_address`, `link_target`, `show_on_landing_page_header`, `show_on_landing_page_footer`, `show_on_entry_page`, `show_on_chat_page`, `show_on_chat_page_top`, `menu_item_order`, `menu_item_visibility`, `disabled`, `created_on`, `updated_on`) VALUES
(1, 'custom_menu_item_1', 'bi-card-text', 2, '#', 0, 1, 1, 1, 0, 0, 3, '[\"1\",\"2\",\"3\",\"5\"]', 0, '2022-01-20 19:10:31', '2022-10-27 22:31:13'),
(2, 'custom_menu_item_2', 'bi-card-text', 3, '#', 0, 1, 1, 1, 0, 0, 2, 'all', 0, '2022-01-20 19:10:48', '2022-03-19 22:14:00'),
(3, 'custom_menu_item_3', 'bi-card-text', 1, '#', 0, 1, 0, 0, 0, 0, 1, '[\"1\",\"2\",\"3\",\"5\"]', 0, '2022-03-19 22:13:42', '2022-10-21 02:41:02'),
(4, 'custom_menu_item_4', 'bi-card-text', NULL, 'sitemap/', 0, 0, 1, 0, 0, 0, 4, '[\"1\",\"2\",\"3\",\"5\"]', 0, '2022-03-19 22:14:47', '2022-10-21 02:41:08');

-- --------------------------------------------------------

--
-- Table structure for table `gr_custom_pages`
--

CREATE TABLE `gr_custom_pages` (
  `page_id` bigint NOT NULL,
  `string_constant` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_title` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_description` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `disabled` int NOT NULL DEFAULT '0',
  `who_all_can_view_page` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'all',
  `created_on` datetime NOT NULL,
  `updated_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `gr_custom_pages`
--

INSERT INTO `gr_custom_pages` (`page_id`, `string_constant`, `slug`, `meta_title`, `meta_description`, `disabled`, `who_all_can_view_page`, `created_on`, `updated_on`) VALUES
(1, 'custom_page_1', 'about', '', '', 0, '[\"1\",\"2\",\"3\",\"5\"]', '2021-09-26 18:44:30', '2022-09-29 18:11:20'),
(2, 'custom_page_2', 'terms', '', '', 0, '[\"1\",\"2\",\"3\",\"5\"]', '2021-09-26 18:44:03', '2022-06-14 10:06:37'),
(3, 'custom_page_3', 'privacy', '', '', 0, '[\"1\",\"2\",\"3\",\"5\"]', '2021-12-08 22:05:49', '2022-06-14 10:24:05');

-- --------------------------------------------------------

--
-- Table structure for table `gr_friends`
--

CREATE TABLE `gr_friends` (
  `friendship_id` bigint NOT NULL,
  `from_user_id` bigint NOT NULL,
  `to_user_id` bigint NOT NULL,
  `relation_status` int NOT NULL DEFAULT '0' COMMENT '0 = Pending 1 = Friends',
  `created_on` datetime NOT NULL,
  `updated_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gr_groups`
--

CREATE TABLE `gr_groups` (
  `group_id` bigint NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `meta_title` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_description` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `secret_group` int NOT NULL DEFAULT '0',
  `secret_code` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unleavable` int NOT NULL DEFAULT '0',
  `who_all_can_send_messages` varchar(199) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pin_group` int NOT NULL DEFAULT '0',
  `auto_join_group` int NOT NULL DEFAULT '0',
  `total_members` bigint NOT NULL DEFAULT '0',
  `suspended` int NOT NULL DEFAULT '0',
  `group_header_status` int NOT NULL DEFAULT '0' COMMENT '0 = Disabled\r\n1 = Enabled',
  `created_by` bigint NOT NULL DEFAULT '0',
  `created_on` datetime DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gr_group_invitations`
--

CREATE TABLE `gr_group_invitations` (
  `group_invitation_id` bigint NOT NULL,
  `user_id` bigint DEFAULT NULL,
  `group_id` bigint DEFAULT NULL,
  `referrer_user_id` bigint DEFAULT NULL,
  `related_email_address` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invitation_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expired` int NOT NULL DEFAULT '0' COMMENT '0 = No\r\n1 = Yes',
  `created_on` datetime NOT NULL,
  `updated_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gr_group_members`
--

CREATE TABLE `gr_group_members` (
  `group_member_id` bigint NOT NULL,
  `group_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `group_role_id` bigint NOT NULL DEFAULT '4',
  `referrer_user_id` bigint DEFAULT '0',
  `last_read_message_id` bigint DEFAULT '0',
  `load_message_id_from` bigint DEFAULT NULL,
  `currently_browsing` int NOT NULL DEFAULT '0',
  `previous_group_role_id` bigint NOT NULL DEFAULT '4',
  `banned_till` datetime DEFAULT NULL,
  `joined_on` datetime DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gr_group_messages`
--

CREATE TABLE `gr_group_messages` (
  `group_message_id` bigint NOT NULL,
  `group_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `original_message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `filtered_message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `system_message` int NOT NULL DEFAULT '0',
  `parent_message_id` bigint DEFAULT NULL,
  `attachment_type` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attachments` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `link_preview` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_reactions` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_on` datetime NOT NULL,
  `updated_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gr_group_messages_reactions`
--

CREATE TABLE `gr_group_messages_reactions` (
  `group_message_reaction_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `group_message_id` bigint NOT NULL,
  `reaction_id` int NOT NULL COMMENT '1 = Like\r\n2 = Love\r\n3 = Haha\r\n4 = Wow\r\n5 = Sad\r\n6 = Angry',
  `updated_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gr_group_roles`
--

CREATE TABLE `gr_group_roles` (
  `group_role_id` bigint NOT NULL,
  `string_constant` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `permissions` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `group_role_attribute` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'group_role',
  `disabled` int NOT NULL DEFAULT '0',
  `updated_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `gr_group_roles`
--

INSERT INTO `gr_group_roles` (`group_role_id`, `string_constant`, `permissions`, `group_role_attribute`, `disabled`, `updated_on`) VALUES
(1, 'group_role_1', '{\"update\":\"group_roles\",\"show_label\":\"\",\"label_background_color\":\"#7b0909\",\"label_text_color\":\"#ff0a0a\",\"attribute\":\"banned_users\",\"disabled\":\"no\"}', 'banned_users', 0, '2022-02-09 08:15:00'),
(2, 'group_role_2', '{\"update\":\"group_roles\",\"language_id\":\"\",\"show_label\":\"no\",\"label_background_color\":\"#FF61BB\",\"label_text_color\":\"#FFFFFF\",\"attribute\":\"administrators\",\"disabled\":\"\",\"group\":[\"edit_group\",\"view_shared_files\",\"view_shared_links\",\"delete_group\"],\"group_members\":[\"view_group_members\",\"view_currently_online\",\"ban_users_from_group\",\"unban_users_from_group\",\"manage_user_roles\",\"remove_group_members\"],\"messages\":[\"send_message\",\"send_audio_message\",\"attach_files\",\"attach_from_storage\",\"attach_gifs\",\"attach_stickers\",\"check_read_receipts\",\"share_screenshot\",\"allow_sharing_links\",\"allow_sharing_email_addresses\",\"generate_link_preview\",\"download_attachments\",\"delete_own_message\",\"delete_messages\",\"view_reactions\",\"react_messages\",\"reply_messages\",\"forward_messages\",\"mention_users\"]}', 'administrators', 0, '2022-10-27 17:51:20'),
(3, 'group_role_3', '{\"update\":\"group_roles\",\"language_id\":\"\",\"show_label\":\"no\",\"label_background_color\":\"#9EFF00\",\"label_text_color\":\"#FFFFFF\",\"attribute\":\"moderators\",\"disabled\":\"\",\"group\":[\"view_shared_files\",\"view_shared_links\"],\"group_members\":[\"view_group_members\",\"view_currently_online\",\"ban_users_from_group\",\"unban_users_from_group\"],\"messages\":[\"send_message\",\"send_audio_message\",\"attach_files\",\"attach_from_storage\",\"attach_gifs\",\"attach_stickers\",\"check_read_receipts\",\"share_screenshot\",\"allow_sharing_links\",\"allow_sharing_email_addresses\",\"generate_link_preview\",\"download_attachments\",\"delete_own_message\",\"delete_messages\",\"view_reactions\",\"react_messages\",\"reply_messages\",\"forward_messages\",\"mention_users\"]}', 'moderators', 0, '2022-10-27 17:51:15'),
(4, 'group_role_4', '{\"update\":\"group_roles\",\"language_id\":\"\",\"show_label\":\"no\",\"label_background_color\":\"#FF4D55\",\"label_text_color\":\"#FFFFFF\",\"attribute\":\"default_group_role\",\"disabled\":\"\",\"group\":[\"view_shared_files\",\"view_shared_links\"],\"group_members\":[\"view_group_members\",\"view_currently_online\"],\"messages\":[\"send_message\",\"send_audio_message\",\"attach_files\",\"attach_from_storage\",\"attach_gifs\",\"attach_stickers\",\"check_read_receipts\",\"share_screenshot\",\"allow_sharing_links\",\"allow_sharing_email_addresses\",\"generate_link_preview\",\"download_attachments\",\"delete_own_message\",\"view_reactions\",\"react_messages\",\"reply_messages\",\"forward_messages\",\"mention_users\"]}', 'default_group_role', 0, '2022-10-28 22:35:00');

-- --------------------------------------------------------

--
-- Table structure for table `gr_languages`
--

CREATE TABLE `gr_languages` (
  `language_id` bigint NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `iso_code` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'en',
  `text_direction` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'ltr',
  `disabled` int NOT NULL DEFAULT '0',
  `updated_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `gr_languages`
--

INSERT INTO `gr_languages` (`language_id`, `name`, `iso_code`, `text_direction`, `disabled`, `updated_on`) VALUES
(1, 'English', 'en', 'ltr', 0, '2022-08-30 16:24:30');

-- --------------------------------------------------------

--
-- Table structure for table `gr_language_strings`
--

CREATE TABLE `gr_language_strings` (
  `string_id` bigint NOT NULL,
  `string_constant` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `string_value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `string_type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'one-line',
  `skip_update` int NOT NULL DEFAULT '0',
  `skip_cache` int NOT NULL DEFAULT '0',
  `language_id` bigint NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `gr_language_strings`
--

INSERT INTO `gr_language_strings` (`string_id`, `string_constant`, `string_value`, `string_type`, `skip_update`, `skip_cache`, `language_id`) VALUES
(1, 'site_name', 'Site Name', 'one-line', 0, 0, 1),
(2, 'invited', 'Invited', 'one-line', 0, 0, 1),
(3, 'edit_profile', 'Edit Profile', 'one-line', 0, 0, 1),
(4, 'login', 'Login', 'one-line', 0, 0, 1),
(5, 'new_password', 'New Password', 'one-line', 0, 0, 1),
(6, 'update', 'Update', 'one-line', 0, 0, 1),
(7, 'upload_avatar', 'Upload Avatar', 'one-line', 0, 0, 1),
(8, 'create_user_if_not_exists', 'Create User if not exists', 'one-line', 0, 0, 1),
(9, 'mail_login_info', 'Mail Login Info', 'one-line', 0, 0, 1),
(10, 'icon', 'Icon', 'one-line', 0, 0, 1),
(11, 'cookie_consent_modal_title', 'Cookie Consent', 'one-line', 0, 0, 1),
(12, 'advert_name', 'Advert Name', 'one-line', 0, 0, 1),
(13, 'add_to_group', 'Add to Group', 'one-line', 0, 0, 1),
(14, 'other', 'Other', 'one-line', 0, 0, 1),
(15, 'requires_minimum_username_length', 'Requires Minimum Username Length', 'one-line', 0, 0, 1),
(16, 'banned_till', 'Banned Till', 'one-line', 0, 0, 1),
(17, 'visit', 'Visit', 'one-line', 0, 0, 1),
(18, 'site_description', 'Site Description', 'one-line', 0, 0, 1),
(19, 'smtp_username', 'SMTP Username', 'one-line', 0, 0, 1),
(20, 'unban_from_site_confirmation', 'Are you sure you want to allow this user from accessing site ?', 'one-line', 0, 0, 1),
(21, 'appearance', 'Appearance', 'one-line', 0, 0, 1),
(22, 'language', 'Language', 'one-line', 0, 0, 1),
(23, 'open', 'Open', 'one-line', 0, 0, 1),
(24, 'import_json', 'Select JSON File', 'one-line', 0, 0, 1),
(25, 'inbox', 'Inbox', 'one-line', 0, 0, 1),
(26, 'advert_placement', 'Ad Placement', 'one-line', 0, 0, 1),
(27, 'password_protect', 'Password Protect', 'one-line', 0, 0, 1),
(28, 'rejected', 'Rejected', 'one-line', 0, 0, 1),
(29, 'download', 'Download', 'one-line', 0, 0, 1),
(30, 'sender_name', 'Sender Name', 'one-line', 0, 0, 1),
(31, 'view_message', 'View Message', 'one-line', 0, 0, 1),
(32, 'smtp_password', 'SMTP Password', 'one-line', 0, 0, 1),
(33, 'add', 'Add', 'one-line', 0, 0, 1),
(34, 'exceeds_username_length', 'Exceeds Maximum Username Length', 'one-line', 0, 0, 1),
(35, 'supported_image_formats', 'Supported Image Formats', 'one-line', 0, 0, 1),
(36, 'blacklist', 'Blacklist', 'one-line', 0, 0, 1),
(37, 'users', 'Users', 'one-line', 0, 0, 1),
(38, 'info', 'Info', 'one-line', 0, 0, 1),
(39, 'smtp_authentication', 'SMTP Authentication', 'one-line', 0, 0, 1),
(40, 'group_icon', 'Group Icon', 'one-line', 0, 0, 1),
(41, 'user_registration', 'User Registration', 'one-line', 0, 0, 1),
(42, 'edit_own_group', 'Edit own Group', 'one-line', 0, 0, 1),
(43, 'ignored', 'Ignored', 'one-line', 0, 0, 1),
(44, 'view', 'View', 'one-line', 0, 0, 1),
(45, 'not_found_page_expression', 'Oops!', 'one-line', 0, 0, 1),
(46, 'deactivate_account', 'Deactivate Account', 'one-line', 0, 0, 1),
(47, 'login_text', 'Sign In to Your Account', 'one-line', 0, 0, 1),
(48, 'send_as_user', 'Send as another User', 'one-line', 0, 0, 1),
(49, 'last_login', 'Last Login', 'one-line', 0, 0, 1),
(50, 'custom_field_6_options', '{\"DZ\":\"Algeria\",\"AO\":\"Angola\",\"BJ\":\"Benin\",\"BW\":\"Botswana\",\"BF\":\"Burkina Faso\",\"BI\":\"Burundi\",\"CM\":\"Cameroon\",\"CV\":\"Cape Verde\",\"CF\":\"Central African Republic\",\"TD\":\"Chad\",\"KM\":\"Comoros\",\"CD\":\"Congo [DRC]\",\"CG\":\"Congo [Republic]\",\"DJ\":\"Djibouti\",\"EG\":\"Egypt\",\"GQ\":\"Equatorial Guinea\",\"ER\":\"Eritrea\",\"ET\":\"Ethiopia\",\"GA\":\"Gabon\",\"GM\":\"Gambia\",\"GH\":\"Ghana\",\"GN\":\"Guinea\",\"GW\":\"Guinea-Bissau\",\"CI\":\"Ivory Coast\",\"KE\":\"Kenya\",\"LS\":\"Lesotho\",\"LR\":\"Liberia\",\"LY\":\"Libya\",\"MG\":\"Madagascar\",\"MW\":\"Malawi\",\"ML\":\"Mali\",\"MR\":\"Mauritania\",\"MU\":\"Mauritius\",\"YT\":\"Mayotte\",\"MA\":\"Morocco\",\"MZ\":\"Mozambique\",\"NA\":\"Namibia\",\"NE\":\"Niger\",\"NG\":\"Nigeria\",\"RW\":\"Rwanda\",\"RE\":\"R\\u00e9union\",\"SH\":\"Saint Helena\",\"SN\":\"Senegal\",\"SC\":\"Seychelles\",\"SL\":\"Sierra Leone\",\"SO\":\"Somalia\",\"ZA\":\"South Africa\",\"SD\":\"Sudan\",\"SZ\":\"Swaziland\",\"ST\":\"S\\u00e3o Tom\\u00e9 and Pr\\u00edncipe\",\"TZ\":\"Tanzania\",\"TG\":\"Togo\",\"TN\":\"Tunisia\",\"UG\":\"Uganda\",\"EH\":\"Western Sahara\",\"ZM\":\"Zambia\",\"ZW\":\"Zimbabwe\",\"AQ\":\"Antarctica\",\"BV\":\"Bouvet Island\",\"TF\":\"French Southern Territories\",\"HM\":\"Heard Island and McDonald Island\",\"GS\":\"South Georgia and the South Sandwich Islands\",\"AF\":\"Afghanistan\",\"AM\":\"Armenia\",\"AZ\":\"Azerbaijan\",\"BH\":\"Bahrain\",\"BD\":\"Bangladesh\",\"BT\":\"Bhutan\",\"IO\":\"British Indian Ocean Territory\",\"BN\":\"Brunei\",\"KH\":\"Cambodia\",\"CN\":\"China\",\"CX\":\"Christmas Island\",\"CC\":\"Cocos [Keeling] Islands\",\"GE\":\"Georgia\",\"HK\":\"Hong Kong\",\"IN\":\"India\",\"ID\":\"Indonesia\",\"IR\":\"Iran\",\"IQ\":\"Iraq\",\"IL\":\"Israel\",\"JP\":\"Japan\",\"JO\":\"Jordan\",\"KZ\":\"Kazakhstan\",\"KW\":\"Kuwait\",\"KG\":\"Kyrgyzstan\",\"LA\":\"Laos\",\"LB\":\"Lebanon\",\"MO\":\"Macau\",\"MY\":\"Malaysia\",\"MV\":\"Maldives\",\"MN\":\"Mongolia\",\"MM\":\"Myanmar [Burma]\",\"NP\":\"Nepal\",\"KP\":\"North Korea\",\"OM\":\"Oman\",\"PK\":\"Pakistan\",\"PS\":\"Palestinian Territories\",\"PH\":\"Philippines\",\"QA\":\"Qatar\",\"SA\":\"Saudi Arabia\",\"SG\":\"Singapore\",\"KR\":\"South Korea\",\"LK\":\"Sri Lanka\",\"SY\":\"Syria\",\"TW\":\"Taiwan\",\"TJ\":\"Tajikistan\",\"TH\":\"Thailand\",\"TR\":\"Turkey\",\"TM\":\"Turkmenistan\",\"AE\":\"United Arab Emirates\",\"UZ\":\"Uzbekistan\",\"VN\":\"Vietnam\",\"YE\":\"Yemen\",\"AL\":\"Albania\",\"AD\":\"Andorra\",\"AT\":\"Austria\",\"BY\":\"Belarus\",\"BE\":\"Belgium\",\"BA\":\"Bosnia and Herzegovina\",\"BG\":\"Bulgaria\",\"HR\":\"Croatia\",\"CY\":\"Cyprus\",\"CZ\":\"Czech Republic\",\"DK\":\"Denmark\",\"EE\":\"Estonia\",\"FO\":\"Faroe Islands\",\"FI\":\"Finland\",\"FR\":\"France\",\"DE\":\"Germany\",\"GI\":\"Gibraltar\",\"GR\":\"Greece\",\"GG\":\"Guernsey\",\"HU\":\"Hungary\",\"IS\":\"Iceland\",\"IE\":\"Ireland\",\"IM\":\"Isle of Man\",\"IT\":\"Italy\",\"JE\":\"Jersey\",\"XK\":\"Kosovo\",\"LV\":\"Latvia\",\"LI\":\"Liechtenstein\",\"LT\":\"Lithuania\",\"LU\":\"Luxembourg\",\"MK\":\"Macedonia\",\"MT\":\"Malta\",\"MD\":\"Moldova\",\"MC\":\"Monaco\",\"ME\":\"Montenegro\",\"NL\":\"Netherlands\",\"NO\":\"Norway\",\"PL\":\"Poland\",\"PT\":\"Portugal\",\"RO\":\"Romania\",\"RU\":\"Russia\",\"SM\":\"San Marino\",\"RS\":\"Serbia\",\"CS\":\"Serbia and Montenegro\",\"SK\":\"Slovakia\",\"SI\":\"Slovenia\",\"ES\":\"Spain\",\"SJ\":\"Svalbard and Jan Mayen\",\"SE\":\"Sweden\",\"CH\":\"Switzerland\",\"UA\":\"Ukraine\",\"GB\":\"United Kingdom\",\"VA\":\"Vatican City\",\"AX\":\"\\u00c5land Islands\",\"AI\":\"Anguilla\",\"AG\":\"Antigua and Barbuda\",\"AW\":\"Aruba\",\"BS\":\"Bahamas\",\"BB\":\"Barbados\",\"BZ\":\"Belize\",\"BM\":\"Bermuda\",\"BQ\":\"Bonaire\",\"VG\":\"British Virgin Islands\",\"CA\":\"Canada\",\"KY\":\"Cayman Islands\",\"CR\":\"Costa Rica\",\"CU\":\"Cuba\",\"CW\":\"Curacao\",\"DM\":\"Dominica\",\"DO\":\"Dominican Republic\",\"SV\":\"El Salvador\",\"GL\":\"Greenland\",\"GD\":\"Grenada\",\"GP\":\"Guadeloupe\",\"GT\":\"Guatemala\",\"HT\":\"Haiti\",\"HN\":\"Honduras\",\"JM\":\"Jamaica\",\"MQ\":\"Martinique\",\"MX\":\"Mexico\",\"MS\":\"Montserrat\",\"AN\":\"Netherlands Antilles\",\"NI\":\"Nicaragua\",\"PA\":\"Panama\",\"PR\":\"Puerto Rico\",\"BL\":\"Saint Barth\\u00e9lemy\",\"KN\":\"Saint Kitts and Nevis\",\"LC\":\"Saint Lucia\",\"MF\":\"Saint Martin\",\"PM\":\"Saint Pierre and Miquelon\",\"VC\":\"Saint Vincent and the Grenadines\",\"SX\":\"Sint Maarten\",\"TT\":\"Trinidad and Tobago\",\"TC\":\"Turks and Caicos Islands\",\"VI\":\"U.S. Virgin Islands\",\"US\":\"United States\",\"AR\":\"Argentina\",\"BO\":\"Bolivia\",\"BR\":\"Brazil\",\"CL\":\"Chile\",\"CO\":\"Colombia\",\"EC\":\"Ecuador\",\"FK\":\"Falkland Islands\",\"GF\":\"French Guiana\",\"GY\":\"Guyana\",\"PY\":\"Paraguay\",\"PE\":\"Peru\",\"SR\":\"Suriname\",\"UY\":\"Uruguay\",\"VE\":\"Venezuela\",\"AS\":\"American Samoa\",\"AU\":\"Australia\",\"CK\":\"Cook Islands\",\"TL\":\"East Timor\",\"FJ\":\"Fiji\",\"PF\":\"French Polynesia\",\"GU\":\"Guam\",\"KI\":\"Kiribati\",\"MH\":\"Marshall Islands\",\"FM\":\"Micronesia\",\"NR\":\"Nauru\",\"NC\":\"New Caledonia\",\"NZ\":\"New Zealand\",\"NU\":\"Niue\",\"NF\":\"Norfolk Island\",\"MP\":\"Northern Mariana Islands\",\"PW\":\"Palau\",\"PG\":\"Papua New Guinea\",\"PN\":\"Pitcairn Islands\",\"WS\":\"Samoa\",\"SB\":\"Solomon Islands\",\"TK\":\"Tokelau\",\"TO\":\"Tonga\",\"TV\":\"Tuvalu\",\"UM\":\"U.S. Minor Outlying Islands\",\"VU\":\"Vanuatu\",\"WF\":\"Wallis and Futuna\"}', 'multi_line', 1, 0, 1),
(51, 'smtp_protocol', 'SMTP (SSL/TLS)', 'one-line', 0, 0, 1),
(52, 'create_advert', 'Create Advert', 'one-line', 0, 0, 1),
(53, 'not_found_page_description', 'The resource you are looking for might have been removed, had its name changed, or is temporarily unavailable.', 'multi-line', 0, 0, 1),
(54, 'guest_login_text', 'Create a Guest User account', 'one-line', 0, 0, 1),
(55, 'edit_role', 'Edit Role', 'one-line', 0, 0, 1),
(56, 'temporarily_banned_from_group', 'Temporarily Banned from Group', 'one-line', 0, 0, 1),
(57, 'message', 'Message', 'one-line', 0, 0, 1),
(58, 'empty_profile', 'Empty Profile', 'one-line', 0, 0, 1),
(59, 'ban_ip_addresses', 'Ban IP addresses', 'one-line', 0, 0, 1),
(60, 'default_font', 'Default Font', 'one-line', 0, 0, 1),
(61, 'whitelist', 'Whitelist', 'one-line', 0, 0, 1),
(62, 'signup', 'Signup', 'one-line', 0, 0, 1),
(63, 'avatars', 'Avatars', 'one-line', 0, 0, 1),
(64, 'smtp_host', 'SMTP Host', 'one-line', 0, 0, 1),
(65, 'title', 'Title', 'one-line', 0, 0, 1),
(66, 'updated_group_info', 'Updated Group Info', 'one-line', 0, 0, 1),
(67, 'ban_from_group', 'Ban From Group', 'one-line', 0, 0, 1),
(68, 'role_name', 'Role Name', 'one-line', 0, 0, 1),
(69, 'pin_group', 'Pin Group', 'one-line', 0, 0, 1),
(70, 'delete_own_group', 'Delete their own Group', 'one-line', 0, 0, 1),
(71, 'delete', 'Delete', 'one-line', 0, 0, 1),
(72, 'manage_avatars', 'Manage Avatars', 'one-line', 0, 0, 1),
(73, 'appid', 'APP/Client ID', 'one-line', 0, 0, 1),
(74, 'temporarily_banned', 'Temporarily Banned', 'one-line', 0, 0, 1),
(75, 'not_found_page_button', 'Go To Homepage', 'one-line', 0, 0, 1),
(76, 'action_taken', 'Action Taken', 'one-line', 0, 0, 1),
(77, 'choose_avatar', 'Choose an Avatar', 'one-line', 0, 0, 1),
(78, 'edit_menu_item', 'Edit Menu Item', 'one-line', 0, 0, 1),
(79, 'unban_ip_addresses', 'Unban IP addresses', 'one-line', 0, 0, 1),
(80, 'signup_text', 'Create a new Account', 'one-line', 0, 0, 1),
(81, 'search_here', 'Search here', 'one-line', 0, 0, 1),
(82, 'enable', 'Enable', 'one-line', 0, 0, 1),
(83, 'deactivated', 'Deactivated', 'one-line', 0, 0, 1),
(84, 'radio_station', 'Radio Station', 'one-line', 0, 0, 1),
(85, 'system_variables', 'System Variables', 'one-line', 0, 0, 1),
(86, 'logout', 'Logout', 'one-line', 0, 0, 1),
(87, 'stickers', 'Stickers', 'one-line', 0, 0, 1),
(88, 'forgot_password_text', 'We will send you password recovery instruction to the email address associated with your account.', 'one-line', 0, 0, 1),
(89, 'report', 'Report', 'one-line', 0, 0, 1),
(90, 'agree', 'Agree', 'one-line', 0, 0, 1),
(91, 'attach_from_storage', 'Attach from Storage', 'one-line', 0, 0, 1),
(92, 'screenshot', 'Screenshot', 'one-line', 0, 0, 1),
(93, 'disable', 'Disable', 'one-line', 0, 0, 1),
(94, 'reload', 'Reload', 'one-line', 0, 0, 1),
(95, 'mentioned_group_chat', 'Mentioned you in group chat', 'one-line', 0, 0, 1),
(96, 'send_mail', 'Send Mail', 'one-line', 0, 0, 1),
(97, 'general_settings', 'General Settings', 'one-line', 0, 0, 1),
(98, 'strict_mode', 'Strict Mode', 'one-line', 0, 0, 1),
(99, 'block_user', 'Block User', 'one-line', 0, 0, 1),
(100, 'options', 'Options', 'one-line', 0, 0, 1),
(101, 'audio_player', 'Audio Player', 'one-line', 0, 0, 1),
(102, 'who_all_can_send_messages', 'Who all can Send Messages', 'one-line', 0, 0, 1),
(103, 'gravatar', 'Gravatar', 'one-line', 0, 0, 1),
(104, 'onesignal', 'OneSignal', 'one-line', 0, 0, 1),
(105, 'ban_ip_addresses_confirmation', 'Are you sure you want to block user IP addresses ?', 'one-line', 0, 0, 1),
(106, 'switch', 'Switch', 'one-line', 0, 0, 1),
(107, 'name_color', 'Name Color', 'one-line', 0, 0, 1),
(108, 'minimum_username_length', 'Minimum Username Length', 'one-line', 0, 0, 1),
(109, 'onesignal_app_id', 'OneSignal APP ID', 'one-line', 0, 0, 1),
(110, 'confirm_delete', 'Are you sure you want to delete the selected item(s) ?', 'one-line', 0, 0, 1),
(111, 'onesignal_rest_api_key', 'OneSignal REST API Key', 'one-line', 0, 0, 1),
(112, 'audio_files', 'Audio Files', 'one-line', 0, 0, 1),
(113, 'logo', 'Logo', 'one-line', 0, 0, 1),
(114, 'ban', 'Ban', 'one-line', 0, 0, 1),
(115, 'smtp_port', 'SMTP Port', 'one-line', 0, 0, 1),
(116, 'group_role', 'Group Role', 'one-line', 0, 0, 1),
(117, 'back_to_login', 'Back to Login', 'one-line', 0, 0, 1),
(118, 'confirm_join', 'Are you sure you would like to be part of this group?', 'one-line', 0, 0, 1),
(119, 'invalid_email_address', 'Invalid Email Address', 'one-line', 0, 0, 1),
(120, 'left_group', 'Left the Group Chat', 'one-line', 0, 0, 1),
(121, 'device_blocked', 'Your Device had been Blocked. Maximum Login Attempts Exceeded. Try again in one hour.', 'one-line', 0, 0, 1),
(122, 'unban_ip_addresses_confirmation', 'Are you sure you want to allow user IP addresses ?', 'one-line', 0, 0, 1),
(123, 'replied_group_message', 'Posted a response to your group chat message', 'one-line', 0, 0, 1),
(124, 'playlist', 'Playlist', 'one-line', 0, 0, 1),
(125, 'onesignal_safari_web_id', 'OneSignal Safari Web ID', 'one-line', 0, 0, 1),
(126, 'favicon', 'Favicon', 'one-line', 0, 0, 1),
(127, 'view_group_members', 'View Group Members', 'one-line', 0, 0, 1),
(128, 'attribute', 'Attribute', 'one-line', 0, 0, 1),
(129, 'ip_address', 'IP address', 'one-line', 0, 0, 1),
(130, 'system_default', 'Default', 'one-line', 0, 0, 1),
(131, 'new', 'New', 'one-line', 0, 0, 1),
(132, 'site_role', 'Site Role', 'one-line', 0, 0, 1),
(133, 'view_profile', 'View Profile', 'one-line', 0, 0, 1),
(134, 'default_site_role', 'Default Site Role', 'one-line', 0, 0, 1),
(135, 'edit_group', 'Edit Group', 'one-line', 0, 0, 1),
(136, 'view_currently_online', 'View Currently Online', 'one-line', 0, 0, 1),
(137, 'reply', 'Reply', 'one-line', 0, 0, 1),
(138, 'guest_users', 'Guest Users', 'one-line', 0, 0, 1),
(139, 'protected_group', 'Protected Group', 'one-line', 0, 0, 1),
(140, 'minutes', 'Minutes', 'one-line', 0, 0, 1),
(141, 'roles', 'Site Roles', 'one-line', 0, 0, 1),
(142, 'push_notification_icon', 'Push Notification Icon', 'one-line', 0, 0, 1),
(143, 'group_url', 'Group URL', 'one-line', 0, 0, 1),
(144, 'offline_page_description', 'It looks like you have lost your internet connection. Perhaps you went into a tunnel or turned on airplane mode on your phone.', 'one-line', 0, 0, 1),
(145, 'add_audio', 'Add Audio', 'one-line', 0, 0, 1),
(146, 'providers', 'Providers', 'one-line', 0, 0, 1),
(147, 'current_role', 'Current Role', 'one-line', 0, 0, 1),
(148, 'custom_menu_item_1', 'Terms', 'one-line', 0, 0, 1),
(149, 'non_latin_usernames', 'Non Latin Usernames', 'one-line', 0, 0, 1),
(150, 'add_members', 'Add Members', 'one-line', 0, 0, 1),
(151, 'invalid_login', 'Invalid Login Credentials', 'one-line', 0, 0, 1),
(152, 'members', 'Members', 'one-line', 0, 0, 1),
(153, 'timestamp', 'Timestamp', 'one-line', 0, 0, 1),
(154, 'unverified_users', 'Unverified Users', 'one-line', 0, 0, 1),
(155, 'image', 'Image', 'one-line', 0, 0, 1),
(156, 'disagree', 'Disagree', 'one-line', 0, 0, 1),
(157, 'full_name', 'Full Name', 'one-line', 0, 0, 1),
(158, 'onesignal_prompt_message', 'We would like to send you Push Notifications for the latest Updates.', 'one-line', 0, 0, 1),
(159, 'typing_indicator', 'Typing Indicator', 'one-line', 0, 0, 1),
(160, 'headers_footers', 'Headers &amp; Footers', 'one-line', 0, 0, 1),
(161, 'content', 'Content', 'one-line', 0, 0, 1),
(162, 'platform', 'Platform', 'one-line', 0, 0, 1),
(163, 'ban_from_group_confirmation', 'Are you sure you want to ban this user from Group ?', 'one-line', 0, 0, 1),
(164, 'denied', 'Permission Denied', 'one-line', 0, 0, 1),
(165, 'now_playing', 'Now Playing', 'one-line', 0, 0, 1),
(166, 'offline_page_button', 'Refresh', 'one-line', 0, 0, 1),
(167, 'sending_limit', 'Sending Limit (Per Minute)', 'one-line', 0, 0, 1),
(168, 'dateformat', 'Date Format', 'one-line', 0, 0, 1),
(169, 'banned_users', 'Banned Users', 'one-line', 0, 0, 1),
(170, 'share', 'Share', 'one-line', 0, 0, 1),
(171, 'onesignal_prompt_accept_button', 'Allow', 'one-line', 0, 0, 1),
(172, 'view_public_groups', 'View Public Groups', 'one-line', 0, 0, 1),
(173, 'confirm_your_email_address', 'You are required to verify your email address. We have sent an email with a confirmation link to your email address. In order to complete the sign-up process, please click the confirmation link.', 'one-line', 0, 0, 1),
(174, 'search', 'Search', 'one-line', 0, 0, 1),
(175, 'join_group', 'Join Group', 'one-line', 0, 0, 1),
(176, 'dark_mode', 'Dark Mode', 'one-line', 0, 0, 1),
(177, 'account_banned', 'Your account has been banned for violating the Terms of Service.', 'one-line', 0, 0, 1),
(178, 'badge', 'Badge', 'one-line', 0, 0, 1),
(179, 'onesignal_prompt_cancel_button', 'Cancel', 'one-line', 0, 0, 1),
(180, 'view_secret_groups', 'View Secret Groups', 'one-line', 0, 0, 1),
(181, 'slideshows', 'Slideshows', 'one-line', 0, 0, 1),
(182, 'reply_to', 'Reply To', 'one-line', 0, 0, 1),
(183, 'join', 'Join', 'one-line', 0, 0, 1),
(184, 'edit_site_role', 'Edit Site Role', 'one-line', 0, 0, 1),
(185, 'add_images', 'Add Images', 'one-line', 0, 0, 1),
(186, 'unknown', 'Unknown', 'one-line', 0, 0, 1),
(187, 'sending_limit_reached', 'Sending Limit Reached. Please wait : ', 'one-line', 0, 0, 1),
(188, 'slideshow', 'Slideshow', 'one-line', 0, 0, 1),
(189, 'go_offline', 'Go Offline', 'one-line', 0, 0, 1),
(190, 'not_found_page_title', '404 - Page not found', 'one-line', 0, 0, 1),
(191, 'non_member', 'Non Member', 'one-line', 0, 0, 1),
(192, 'languages', 'Languages', 'one-line', 0, 0, 1),
(193, 'custom_menu_item_2', 'Privacy Policy', 'one-line', 0, 0, 1),
(194, 'edit_audio', 'Edit Audio', 'one-line', 0, 0, 1),
(195, 'all_group_members', 'All Group Members', 'one-line', 0, 0, 1),
(196, 'maximum_username_length', 'Maximum Username Length', 'one-line', 0, 0, 1),
(197, 'export_chat', 'Export Chat', 'one-line', 0, 0, 1),
(198, 'confirm_password', 'Confirm Password', 'one-line', 0, 0, 1),
(199, 'report_group', 'Report Group', 'one-line', 0, 0, 1),
(200, 'cookie_consent_modal_content', 'We may use cookies, web beacons, tracking pixels, and other tracking technologies when you visit our website, including any other media form, media channel, mobile website, or mobile application related or connected thereto (collectively, the &quot;Site&quot;) to help customize the Site and improve your experience. We reserve the right to make changes to this Cookie Policy at any time and for any reason. Any changes or modifications will be effective immediately upon posting the updated Cookie Policy on the Site, and you waive the right to receive specific notice of each such change or modification. You are encouraged to periodically review this Cookie Policy to stay informed of updates. You will be deemed to have been made aware of, will be subject to, and will be deemed to have accepted the changes in any revised Cookie Policy by your continued use of the Site after the date such revised Cookie Policy is posted.', 'one-line', 0, 0, 1),
(201, 'slug', 'Slug', 'one-line', 0, 0, 1),
(202, 'web_push_new_pm_message', 'Sent you a private message.', 'one-line', 0, 0, 1),
(203, 'secret_group', 'Secret Group', 'one-line', 0, 0, 1),
(204, 'maximum_storage_space', 'Maximum Storage Space (MB)', 'one-line', 0, 0, 1),
(205, 'system_email_address', 'System Email Address', 'one-line', 0, 0, 1),
(206, 'confirm_leave', ' Are you sure you want to leave this group?', 'one-line', 0, 0, 1),
(207, 'web_push_sent_reply_message', 'Replied to Your Message', 'one-line', 0, 0, 1),
(208, 'view_password_protected_groups', 'View Password Protected Groups', 'one-line', 0, 0, 1),
(209, 'category', 'Category', 'one-line', 0, 0, 1),
(210, 'light_mode', 'Light Mode', 'one-line', 0, 0, 1),
(211, 'seconds', 'Seconds', 'one-line', 0, 0, 1),
(212, 'joined_group', 'Joined the Group Chat', 'one-line', 0, 0, 1),
(213, 'mail_footer_text', 'If you have any questions or concerns, \\n please feel free to email us at', 'one-line', 0, 0, 1),
(214, 'version', 'Version', 'one-line', 0, 0, 1),
(215, 'custom_page_3_content', '<p>This Privacy Policy governs the manner in which we collects, uses, maintains and discloses information collected from users (each, a \"User\") of our website (\"Site\"). This privacy policy applies to the Site and all products and services offered by us.</p><p><b>1) Personal identification information</b></p><p>We may collect personal identification information from Users in a variety of ways, including, but not limited to, when Users visit our site, subscribe to the newsletter, fill out a form, and in connection with other activities, services, features or resources we make available on our Site.. Users may visit our Site anonymously. We will collect personal identification information from Users only if they voluntarily submit such information to us. Users can always refuse to supply personally identification information, except that it may prevent them from engaging in certain Site related activities.</p><p><b>2) Non-personal identification information</b></p><p>We may collect non-personal identification information about Users whenever they interact with our Site. Non-personal identification information may include the browser name, the type of computer and technical information about Users means of connection to our Site, such as the operating system and the Internet service providers utilized and other similar information.</p><p><b>3) Chat Room Privacy</b></p><p>Administrators and Moderators of the Chat Rooms can see the I.P. of the Users who are chatting. We do not save I.P. addresses of the Users, neither do we share I.P addresses with others. As long as you do not provide (not recommended) your real name, address, Email ID and any other personal information in the chat room, you are completely anonymous to other users.</p><p><b>4) How we use collected information</b></p><p>We may collect and use Users personal information for the following purposes:</p><p>– To improve customer service Information you provide helps us respond to your customer service requests and support needs more efficiently.</p><p>– To improve our Site We may use feedback you provide to improve our products and services.</p><p>– To run a promotion, contest, survey or other Site feature. To send Users information they agreed to receive about topics we think will be of interest to them.</p><p>– To send periodic emails We may use the email address to respond to their inquiries, questions, and/or other requests.</p><p><b>5) How we protect your information</b></p><p>We adopt appropriate data collection, storage and processing practices and security measures to protect against unauthorized access, alteration, disclosure or destruction of your personal information, username, password, transaction information and data stored on our Site.</p><p><b>6) Sharing your personal information</b></p><p>We do not sell, trade, or rent Users personal identification information to others. We may share generic aggregated demographic information not linked to any personal identification information regarding visitors and users with our business partners, trusted affiliates and advertisers for the purposes outlined above.</p><p><b>7) Third party websites</b></p><p>Users may find advertising or other content on our Site that link to the sites and services of our partners, suppliers, advertisers, sponsors, licensors and other third parties. We do not control the content or links that appear on these sites and are not responsible for the practices employed by websites linked to or from our Site. In addition, these sites or services, including their content and links, may be constantly changing. These sites and services may have their own privacy policies and customer service policies. Browsing and interaction on any other website, including websites which have a link to our Site, is subject to that website’s own terms and policies.</p><p><b>8) Advertising</b></p><p>Ads appearing on our site may be delivered to Users by advertising partners, who may set cookies. These cookies allow the ad server to recognize your computer each time they send you an online advertisement to compile non personal identification information about you or others who use your computer. This information allows ad networks to, among other things, deliver targeted advertisements that they believe will be of most interest to you. This privacy policy does not cover the use of cookies by any advertisers.</p><p><b>9) Log Files</b></p><p>As with most other websites, we collect and use the data contained in log files. The information in the log files include your IP (internet protocol) address, your ISP (internet service provider, such as AOL or Shaw Cable), the browser you used to visit our site (such as Internet Explorer or Firefox), the time you visited our site and which pages you visited throughout our site.</p><p><b>10) Cookies and Web Beacons</b></p><p>We do use cookies to store information, such as your personal preferences when you visit our site. This could include only showing you a popup once in your visit, or the ability to login to some of our features, such as forums.</p><p>We also use third party advertisements to support our site. Some of these advertisers may use technology such as cookies and web beacons when they advertise on our site, which will also send these advertisers (such as Google through the Google AdSense program) information including your IP address, your ISP , the browser you used to visit our site, and in some cases, whether you have Flash installed. This is generally used for geotargeting purposes (showing New York real estate ads to someone in New York, for example) or showing certain ads based on specific sites visited (such as showing cooking ads to someone who frequents cooking sites).</p><p><b>11) Compliance with children’s online privacy protection act</b></p><p>Protecting the privacy of the very young is especially important. For that reason, we never collect or maintain information at our Site from those we actually know are under 13, and no part of our website is structured to attract anyone under 13.</p><p><b>12) Changes to this privacy policy</b></p><p>We has the discretion to update this privacy policy at any time. When we do, we will revise the updated date at the bottom of this page. We encourage Users to frequently check this page for any changes to stay informed about how we are helping to protect the personal information we collect. You acknowledge and agree that it is your responsibility to review this privacy policy periodically and become aware of modifications.</p><p><b>13) Your acceptance of these terms</b></p><p>By using this Site, you signify your acceptance of this policy and terms of service. If you do not agree to this policy, please do not use our Site. Your continued use of the Site following the posting of changes to this policy will be deemed your acceptance of those changes.</p>', 'multi_line', 1, 1, 1),
(216, 'ffmpeg_binaries_path', 'FFmpeg Binaries Path', 'one-line', 0, 0, 1),
(217, 'shared_file', 'Shared a File', 'one-line', 0, 0, 1),
(218, 'chat', 'Chat', 'one-line', 0, 0, 1),
(219, 'user_email_verification', 'User Email Verification', 'one-line', 0, 0, 1),
(220, 'file_name', 'File Name', 'one-line', 0, 0, 1),
(221, 'banned', 'Banned', 'one-line', 0, 0, 1),
(222, 'core_settings', 'Core Settings', 'one-line', 0, 0, 1),
(223, 'short_text_field', 'Short Text', 'one-line', 0, 0, 1),
(224, 'member', 'Member', 'one-line', 0, 0, 1),
(225, 'allowed_file_formats', 'Allowed File Formats', 'one-line', 0, 0, 1),
(226, 'edit_provider', 'Edit Provider', 'one-line', 0, 0, 1),
(227, 'idle', 'Idle', 'one-line', 0, 0, 1),
(228, 'reset_password_email_subject', 'Recover your Account', 'one-line', 0, 0, 1),
(229, 'unban_from_group', 'Unban from Group', 'one-line', 0, 0, 1),
(230, 'edit', 'Edit', 'one-line', 0, 0, 1),
(231, 'unblocked', 'Unblocked', 'one-line', 0, 0, 1),
(232, 'unban', 'Unban', 'one-line', 0, 0, 1),
(233, 'send_message', 'Send Message', 'one-line', 0, 0, 1),
(234, 'group', 'Group', 'one-line', 0, 0, 1),
(235, 'inappropriate', 'Inappropriate', 'one-line', 0, 0, 1),
(236, 'user_agent', 'User Agent', 'one-line', 0, 0, 1),
(237, 'denary_border_color', 'Denary Border Color', 'one-line', 0, 0, 1),
(238, 'unban_from_group_confirmation', 'Are you sure you want to unban this user from Group ?', 'one-line', 0, 0, 1),
(239, 'someone', 'Someone', 'one-line', 0, 0, 1),
(240, 'secondary_border_color', 'Secondary Border Color', 'one-line', 0, 0, 1),
(241, 'invite_users', 'Invite Users', 'one-line', 0, 0, 1),
(242, 'created_group', 'Created Group', 'one-line', 0, 0, 1),
(243, 'cover_pic', 'Cover Pic', 'one-line', 0, 0, 1),
(244, 'today', 'Today', 'one-line', 0, 0, 1),
(245, 'default_skin_mode', 'Default Color Scheme', 'one-line', 0, 0, 1),
(246, 'reset_password_email_heading', 'Trouble signing in?', 'one-line', 0, 0, 1),
(247, 'create_sticker_pack', 'Create Sticker Pack', 'one-line', 0, 0, 1),
(248, 'ffprobe_binaries_path', 'FFProbe Binaries Path', 'one-line', 0, 0, 1),
(249, 'all', 'All', 'one-line', 0, 0, 1),
(250, 'reset_password_email_content', 'Resetting your password is easy. Just press the button below and you will be auto logged in to your account. If you did not make this request then please ignore this email.', 'one-line', 0, 0, 1),
(251, 'exceeded_max_msg_length', 'Exceeded Maximum Message Length', 'one-line', 0, 0, 1),
(252, 'create_unleavable_group', 'Create Unleavable Group', 'one-line', 0, 0, 1),
(253, 'reset_password_email_button_label', 'Reset Password', 'one-line', 0, 0, 1),
(254, 'create_site_role', 'Create Site Role', 'one-line', 0, 0, 1),
(255, 'sending', 'Sending', 'one-line', 0, 0, 1),
(256, 'gif_search_engine', 'GIF Search Engine', 'one-line', 0, 0, 1),
(257, 'complaints', 'Complaints', 'one-line', 0, 0, 1),
(258, 'yesterday', 'Yesterday', 'one-line', 0, 0, 1),
(259, 'account_not_found', 'Account Does Not Exist', 'one-line', 0, 0, 1),
(260, 'callback_url', 'Callback URL', 'one-line', 0, 0, 1),
(261, 'identifier', 'Identifier', 'one-line', 0, 0, 1),
(262, 'reset_password_success_message', 'We have sent you an e-mail containing your password reset link. Click the link in the email to create a new password. ', 'one-line', 0, 0, 1),
(263, 'control_storage', 'Full Control Access to User&#039;s Storage', 'one-line', 0, 0, 1),
(264, 'send_audio_message', 'Send Audio Message', 'one-line', 0, 0, 1),
(265, 'access_token_expired', 'Access Token is not valid or has expired', 'one-line', 0, 0, 1),
(266, 'edit_sticker_pack', 'Edit Sticker Pack', 'one-line', 0, 0, 1),
(267, 'remove_from_group', 'Remove from Group', 'one-line', 0, 0, 1),
(268, 'tertiary_border_color', 'Tertiary Border Color', 'one-line', 0, 0, 1),
(269, 'verification_email_subject', 'Confirm your email address', 'one-line', 0, 0, 1),
(270, 'max_file_upload_size', 'Max File Upload Size (MB)', 'one-line', 0, 0, 1),
(271, 'create_secret_group', 'Create Secret Group', 'one-line', 0, 0, 1),
(272, 'link_type', 'Link Type', 'one-line', 0, 0, 1),
(273, 'verification_email_heading', 'Email Confirmation', 'one-line', 0, 0, 1),
(274, 'settings', 'Settings', 'one-line', 0, 0, 1),
(275, 'download_file', 'Download File', 'one-line', 0, 0, 1),
(276, 'attach_gifs', 'Attach GIFs', 'one-line', 0, 0, 1),
(277, 'verification_email_content', 'Before you get started, we need to validate your email address. Please click on the button below to verify your email address. If you did not make this request then please ignore this email.', 'one-line', 0, 0, 1),
(278, 'browser', 'Browser', 'one-line', 0, 0, 1),
(279, 'remove_from_group_confirmation', 'Are you sure you want to remove this user from Group ?', 'one-line', 0, 0, 1),
(280, 'delete_account', 'Delete Account', 'one-line', 0, 0, 1),
(281, 'primary_font_size', 'Primary Font Size', 'one-line', 0, 0, 1),
(282, 'image_files', 'Image Files', 'one-line', 0, 0, 1),
(283, 'role', 'Role', 'one-line', 0, 0, 1),
(284, 'minimum_message_length', 'Minimum Message Length', 'one-line', 0, 0, 1),
(285, 'on_user_mention_group_chat', 'Someone mentions user in Group Chat', 'one-line', 0, 0, 1),
(286, 'joined', 'Joined', 'one-line', 0, 0, 1),
(287, 'datetime', 'Date &amp; Time', 'one-line', 0, 0, 1),
(288, 'quaternary_border_color', 'Quaternary Border Color', 'one-line', 0, 0, 1),
(289, 'none', 'None', 'one-line', 0, 0, 1),
(290, 'verification_email_button_label', 'Verify your email', 'one-line', 0, 0, 1),
(291, 'string_constant', 'String Constant', 'one-line', 0, 0, 1),
(292, 'other_features', 'Other Features', 'one-line', 0, 0, 1),
(293, 'block_user_confirmation', 'Are you sure you want to block this user ?', 'one-line', 0, 0, 1),
(294, 'web_push_mentioned_user_message', 'Mentioned you in Group Chat', 'one-line', 0, 0, 1),
(295, 'share_screenshot', 'Share Screenshot', 'one-line', 0, 0, 1),
(296, 'add_site_members', 'Add Site Members', 'one-line', 0, 0, 1),
(297, 'create_protected_group', 'Create Protected Group', 'one-line', 0, 0, 1),
(298, 'upload_file', 'Upload File', 'one-line', 0, 0, 1),
(299, 'search_messages', 'Search messages', 'one-line', 0, 0, 1),
(300, 'report_message', 'Report Message', 'one-line', 0, 0, 1),
(301, 'notification_tone', 'Notification Tone', 'one-line', 0, 0, 1),
(302, 'on_group_invitation', 'Someone send an invitation to join a group', 'one-line', 0, 0, 1),
(303, 'set_as_default', 'Set as Default', 'one-line', 0, 0, 1),
(304, 'go_online', 'Go Online', 'one-line', 0, 0, 1),
(305, 'long_text_field', 'Long Text', 'one-line', 0, 0, 1),
(306, 'secondary_font_size', 'Secondary Font Size', 'one-line', 0, 0, 1),
(307, 'email_verified', 'You&#039;ve successfully verified your email', 'one-line', 0, 0, 1),
(308, 'preview_attachments', 'Preview Attachments', 'one-line', 0, 0, 1),
(309, 'custom_page', 'Custom Page', 'one-line', 0, 0, 1),
(310, 'play_music', 'Play Music', 'one-line', 0, 0, 1),
(311, 'ignore_user_confirmation', 'Are you sure you want to ignore this user ?', 'one-line', 0, 0, 1),
(312, 'email_settings', 'Email Settings', 'one-line', 0, 0, 1),
(313, 'reported', 'Reported', 'one-line', 0, 0, 1),
(314, 'link_target', 'Link Target', 'one-line', 0, 0, 1),
(315, 'leave_group', 'Leave Group', 'one-line', 0, 0, 1),
(316, 'video_files', 'Video Files', 'one-line', 0, 0, 1),
(317, 'social_login_providers', 'Social Login Providers', 'one-line', 0, 0, 1),
(318, 'slug_already_exists', 'Slug Already Exists', 'one-line', 0, 0, 1),
(319, 'on_private_message', 'Someone send a Private Message', 'one-line', 0, 0, 1),
(320, 'quinary_border_color', 'Quinary Border Color', 'one-line', 0, 0, 1),
(321, 'upload', 'Upload', 'one-line', 0, 0, 1),
(322, 'remove_user', 'Remove User', 'one-line', 0, 0, 1),
(323, 'tertiary_font_size', 'Tertiary Font Size', 'one-line', 0, 0, 1),
(324, 'nickname', 'Nickname', 'one-line', 0, 0, 1),
(325, 'pwa_settings', 'PWA Settings', 'one-line', 0, 0, 1),
(326, 'cancel', 'Cancel', 'one-line', 0, 0, 1),
(327, 'access_time', 'Access Time', 'one-line', 0, 0, 1),
(328, 'on_new_site_badges', 'User awarded with new badge', 'one-line', 0, 0, 1),
(329, 'shortcodes', 'Shortcodes', 'one-line', 0, 0, 1),
(330, 'verification_code_expired', 'Verification code is not valid or has expired', 'one-line', 0, 0, 1),
(331, 'exceeded_max_file_upload_size', 'Exceeded Maximum File Upload Size Limit', 'one-line', 0, 0, 1),
(332, 'ignore_user', 'Ignore User', 'one-line', 0, 0, 1),
(333, 'progressive_web_application', 'Progressive Web Application', 'one-line', 0, 0, 1),
(334, 'unjoined', 'Unjoined', 'one-line', 0, 0, 1),
(335, 'go_back', 'Go Back', 'one-line', 0, 0, 1),
(336, 'login_as_guest', 'Login as Guest', 'one-line', 0, 0, 1),
(337, 'pwa_icon', 'PWA icon', 'one-line', 0, 0, 1),
(338, 'sender', 'Sender', 'one-line', 0, 0, 1),
(339, 'on_reply_group_messages', 'Someone replies to the user messages (Group Chat)', 'one-line', 0, 0, 1),
(340, 'default_notification_tone', 'Default Notification Tone', 'one-line', 0, 0, 1),
(341, 'pwa_name', 'Application Name', 'one-line', 0, 0, 1),
(342, 'show_only_on', 'Show Only On', 'one-line', 0, 0, 1),
(343, 'or_login_using', 'or login using', 'one-line', 0, 0, 1),
(344, 'date_field', 'Date', 'one-line', 0, 0, 1),
(345, 'pwa_short_name', 'Application Short Name', 'one-line', 0, 0, 1),
(346, 'attach', 'Share Files', 'one-line', 0, 0, 1),
(347, 'group_info', 'Group Info', 'one-line', 0, 0, 1),
(348, 'you', 'You', 'one-line', 0, 0, 1),
(349, 'create_group', 'Create Group', 'one-line', 0, 0, 1),
(350, 'site_records', 'Site Records', 'one-line', 0, 0, 1),
(351, 'admin', 'Admin', 'one-line', 0, 0, 1),
(352, 'allow_sharing_links', 'Allow Sharing Links', 'one-line', 0, 0, 1),
(353, 'delete_access_log_confirmation', 'Are you sure you want to remove this Access Log ?', 'one-line', 0, 0, 1),
(354, 'show_on_chat_page', 'Show on Chat Page', 'one-line', 0, 0, 1),
(355, 'radio_stations', 'Radio Stations', 'one-line', 0, 0, 1),
(356, 'spam', 'Spam', 'one-line', 0, 0, 1),
(357, 'login_as_user', 'Login as User', 'one-line', 0, 0, 1),
(358, 'guest_login', 'Guest Login', 'one-line', 0, 0, 1),
(359, 'change_to_idle_status_after', 'Change to Idle Status After (Minutes)', 'one-line', 0, 0, 1),
(360, 'unignore_user', 'Unignore User', 'one-line', 0, 0, 1),
(361, 'firewall', 'Firewall', 'one-line', 0, 0, 1),
(362, 'pwa_background_color', 'Background Color', 'one-line', 0, 0, 1),
(363, 'senary_border_color', 'Senary Border Color', 'one-line', 0, 0, 1),
(364, 'documents', 'Documents', 'one-line', 0, 0, 1),
(365, 'chat_message', 'Chat Message', 'one-line', 0, 0, 1),
(366, 'created_on', 'Created On', 'one-line', 0, 0, 1),
(367, 'open_in_same_window', 'Open in Same Window', 'one-line', 0, 0, 1),
(368, 'mobile_page_transition', 'Mobile Page Transition', 'one-line', 0, 0, 1),
(369, 'exporting', 'Exporting', 'one-line', 0, 0, 1),
(370, 'infotip_footer_tag', 'This will be printed before the &lt;/body&gt; closing tag', 'one-line', 0, 0, 1),
(371, 'add_audio_files', 'Add Audio Files', 'one-line', 0, 0, 1),
(372, 'unignore_user_confirmation', 'Are you sure you want to remove this user from Ignore list ?', 'one-line', 0, 0, 1),
(373, 'moderator', 'Moderator', 'one-line', 0, 0, 1),
(374, 'messages_per_call', 'Messages per Call', 'one-line', 0, 0, 1),
(375, 'delete_shared_files', 'Delete Shared Files', 'one-line', 0, 0, 1),
(376, 'all_file_formats', 'All File Formats', 'one-line', 0, 0, 1),
(377, 'invite', 'Invite', 'one-line', 0, 0, 1),
(378, 'username_already_exists', 'Username Already Exists', 'one-line', 0, 0, 1),
(379, 'generate_link_preview', 'Generate Link Preview', 'one-line', 0, 0, 1),
(380, 'uploading', 'Uploading', 'one-line', 0, 0, 1),
(381, 'pwa_theme_color', 'Theme Color', 'one-line', 0, 0, 1),
(382, 'files', 'Files', 'one-line', 0, 0, 1),
(383, 'unignore', 'Unignore', 'one-line', 0, 0, 1),
(384, 'tertiary_text_color', 'Tertiary Text Color', 'one-line', 0, 0, 1),
(385, 'profile', 'Profile', 'one-line', 0, 0, 1),
(386, 'dropdown_field', 'Dropdown', 'one-line', 0, 0, 1),
(387, 'manage_user_access_logs', 'Manage User Access Logs', 'one-line', 0, 0, 1),
(388, 'select_a_page', 'Select a Page', 'one-line', 0, 0, 1),
(389, 'group_join_limit', 'Maximum Number of Groups a User can Join', 'one-line', 0, 0, 1),
(390, 'blocked', 'Blocked', 'one-line', 0, 0, 1),
(391, 'unblock_user_confirmation', 'Are you sure you want to unblock this user ?', 'one-line', 0, 0, 1),
(392, 'confirm_export', 'Do You Want to Export?', 'one-line', 0, 0, 1),
(393, 'pwa_description', 'Description', 'one-line', 0, 0, 1),
(394, 'super_privileges', 'Super Privileges', 'one-line', 0, 0, 1),
(395, 'description', 'Description', 'one-line', 0, 0, 1),
(396, 'login_settings', 'Login Settings', 'one-line', 0, 0, 1),
(397, 'disable_private_messages', 'Disable Private Messages', 'one-line', 0, 0, 1),
(398, 'pwa_display', 'Display Mode', 'one-line', 0, 0, 1),
(399, 'upload_files', 'Upload Files', 'one-line', 0, 0, 1),
(400, 'delete_own_message', 'Delete their own Message', 'one-line', 0, 0, 1),
(401, 'confirm', 'Confirm', 'one-line', 0, 0, 1),
(402, 'quaternary_font_size', 'Quaternary Font Size', 'one-line', 0, 0, 1),
(403, 'header', 'Header', 'one-line', 0, 0, 1),
(404, 'standalone', 'Standalone', 'one-line', 0, 0, 1),
(405, 'remove_custom_bg', 'Remove Custom BG', 'one-line', 0, 0, 1),
(406, 'open_in_new_tab', 'Open in New Tab', 'one-line', 0, 0, 1),
(407, 'google_analytics_id', 'Google Analytics ID', 'one-line', 0, 0, 1),
(408, 'change_full_name', 'Change Full Name', 'one-line', 0, 0, 1),
(409, 'label_background_color', 'Label Background Color', 'one-line', 0, 0, 1),
(410, 'create_role', 'Create Role', 'one-line', 0, 0, 1),
(411, 'create_user', 'Create User', 'one-line', 0, 0, 1),
(412, 'septenary_border_color', 'Septenary Border Color', 'one-line', 0, 0, 1),
(413, 'chat_page', 'Chat Page', 'one-line', 0, 0, 1),
(414, 'change_to_offline_status_after', 'Change to Offline Status After (Minutes)', 'one-line', 0, 0, 1),
(415, 'delete_all_messages', 'Delete All Messages', 'one-line', 0, 0, 1),
(416, 'menu_order', 'Menu Order', 'one-line', 0, 0, 1),
(417, 'message_settings', 'Message Settings', 'one-line', 0, 0, 1),
(418, 'groups', 'Groups', 'one-line', 0, 0, 1),
(419, 'invite_link', 'Invite Link', 'one-line', 0, 0, 1),
(420, 'custom_pages', 'Custom Pages', 'one-line', 0, 0, 1),
(421, 'login_cookie_validity', 'Login Cookie Validity (Days)', 'one-line', 0, 0, 1),
(422, 'invalid_captcha', 'Invalid Captcha', 'one-line', 0, 0, 1),
(423, 'ignore_users', 'Ignore Users', 'one-line', 0, 0, 1),
(424, 'fields', 'Fields', 'one-line', 0, 0, 1),
(425, 'private_conversations', 'Private Conversations', 'one-line', 0, 0, 1),
(426, 'conversation', 'Conversation', 'one-line', 0, 0, 1),
(427, 'number_field', 'Number', 'one-line', 0, 0, 1),
(428, 'gif_search_engine_api', 'GIF Search Engine API', 'one-line', 0, 0, 1),
(429, 'fullscreen', 'Fullscreen', 'one-line', 0, 0, 1),
(430, 'quaternary_text_color', 'Quaternary Text Color', 'one-line', 0, 0, 1),
(431, 'web_address', 'Web Address', 'one-line', 0, 0, 1),
(432, 'ban_from_site', 'Ban from Site', 'one-line', 0, 0, 1),
(433, 'download_files', 'Download Files', 'one-line', 0, 0, 1),
(434, 'delete_all', 'Delete All', 'one-line', 0, 0, 1),
(435, 'request_timeout', 'Timeout Seconds (Long Polling)', 'one-line', 0, 0, 1),
(436, 'notification_settings', 'Notifications', 'one-line', 0, 0, 1),
(437, 'change_username', 'Change Username', 'one-line', 0, 0, 1),
(438, 'footer', 'Footer', 'one-line', 0, 0, 1),
(439, 'read_more', 'Read More', 'one-line', 0, 0, 1),
(440, 'abuse', 'Abuse', 'one-line', 0, 0, 1),
(441, 'delete_older_than', 'Delete older than (Minutes)', 'one-line', 0, 0, 1),
(442, 'delete_file_confirmation', 'Are you sure you want to delete this file ?', 'one-line', 0, 0, 1),
(443, 'change_avatar', 'Change Avatar', 'one-line', 0, 0, 1),
(444, 'octonary_border_color', 'Octonary Border Color', 'one-line', 0, 0, 1),
(445, 'delete_files', 'Delete Files', 'one-line', 0, 0, 1),
(446, 'view_reactions', 'View Reactions', 'one-line', 0, 0, 1),
(447, 'quinary_font_size', 'Quinary Font Size', 'one-line', 0, 0, 1),
(448, 'realtime_settings', 'Realtime Settings', 'one-line', 0, 0, 1),
(449, 'pages', 'Pages', 'one-line', 0, 0, 1),
(450, 'attach_files', 'Attach Files', 'one-line', 0, 0, 1),
(451, 'unblock_user', 'Unblock User', 'one-line', 0, 0, 1),
(452, 'menu_items', 'Menu Items', 'one-line', 0, 0, 1),
(453, 'entry_page_footer_text', 'Ⓒ 2021. All Rights Reserved. Group Chat', 'one-line', 0, 0, 1),
(454, 'ltr', 'Left to Right', 'one-line', 0, 0, 1),
(455, 'exceeded_group_join_limit', 'Exceeded Maximum Number of Groups You can Join', 'one-line', 0, 0, 1),
(456, 'minimal-ui', 'Minimal UI', 'one-line', 0, 0, 1),
(457, 'senary_text_color', 'Senary Text Color', 'one-line', 0, 0, 1),
(458, 'confirm_delete_all_messages', 'Are you sure you want to delete all chat messages?', 'one-line', 0, 0, 1),
(459, 'ban_from_site_confirmation', 'Are you sure you want to ban this user from accessing site ?', 'one-line', 0, 0, 1),
(460, 'giphy', 'GIPHY', 'one-line', 0, 0, 1),
(461, 'manage_user_roles', 'Manage User Roles', 'one-line', 0, 0, 1),
(462, 'offline_page_expression', 'Oops!', 'one-line', 0, 0, 1),
(463, 'manage_custom_pages', 'Manage Custom Pages', 'one-line', 0, 0, 1),
(464, 'deleted', 'Deleted', 'one-line', 0, 0, 1),
(465, 'upload_custom_avatar', 'Upload Custom Avatar', 'one-line', 0, 0, 1),
(466, 'block_users', 'Block Users', 'one-line', 0, 0, 1),
(467, 'react_messages', 'React to Messages', 'one-line', 0, 0, 1),
(468, 'gifs_per_load', 'GIFs Per Load', 'one-line', 0, 0, 1),
(469, 'septenary_text_color', 'Septenary Text Color', 'one-line', 0, 0, 1),
(470, 'social_login', 'Social Login', 'one-line', 0, 0, 1),
(471, 'offline_page_title', 'You are Offline', 'one-line', 0, 0, 1),
(472, 'initiate_private_chat', 'Initiate Private Chat', 'one-line', 0, 0, 1),
(473, 'set_custom_background', 'Set Custom background', 'one-line', 0, 0, 1),
(474, 'req_min_msg_length', 'Required Minimum number of characters', 'one-line', 0, 0, 1),
(475, 'system_messages_groups', 'System Messages (Groups)', 'one-line', 0, 0, 1),
(476, 'add_custom_field', 'Add Field', 'one-line', 0, 0, 1),
(477, 'download_attachments', 'Download Attachments', 'one-line', 0, 0, 1),
(478, 'senary_font_size', 'Senary Font Size', 'one-line', 0, 0, 1),
(479, 'delete_all_files_confirmation', 'Are you sure you want to delete all files ?', 'one-line', 0, 0, 1),
(480, 'set_cover_pic', 'Set Cover Pic', 'one-line', 0, 0, 1),
(481, 'ffmpeg', 'FFmpeg', 'one-line', 0, 0, 1),
(482, 'site_role_1', 'Unverified', 'one-line', 0, 0, 1),
(483, 'unblock', 'Unblock', 'one-line', 0, 0, 1),
(484, 'records_per_call', 'Site Records per Call', 'one-line', 0, 0, 1),
(485, 'banned_from_group', 'Banned from Group', 'one-line', 0, 0, 1),
(486, 'access_storage', 'Access Storage', 'one-line', 0, 0, 1),
(487, 'octonary_text_color', 'Octonary Text Color', 'one-line', 0, 0, 1),
(488, 'entries_per_call', 'Entries per call', 'one-line', 0, 0, 1),
(489, 'custom_field_1', 'About Me', 'one-line', 1, 0, 1),
(490, 'send_on_behalf', 'Send Messages on Behalf', 'one-line', 0, 0, 1),
(491, 'ban_users_from_site', 'Ban Users from Site', 'one-line', 0, 0, 1),
(492, 'online', 'Online', 'one-line', 0, 0, 1),
(493, 'storage_limit_exceeded', 'Storage Limit Exceeded', 'one-line', 0, 0, 1),
(494, 'custom_site_role', 'Custom Site Role', 'one-line', 0, 0, 1),
(495, 'unbanned_from_group', 'Unbanned From Group', 'one-line', 0, 0, 1),
(496, 'meta_description', 'Meta Description', 'one-line', 0, 0, 1),
(497, 'adverts', 'Adverts', 'one-line', 0, 0, 1),
(498, 'delete_users', 'Delete Users', 'one-line', 0, 0, 1),
(499, 'remember_me', 'Remember Me', 'one-line', 0, 0, 1),
(500, 'view_private_chats', 'View Private Chats', 'one-line', 0, 0, 1),
(501, 'monitor_group_chats', 'Monitor Group Chats', 'one-line', 0, 0, 1),
(502, 'show_on_info_page', 'Show on Info Page', 'one-line', 0, 0, 1),
(503, 'api_secret_key', 'API Secret Key', 'one-line', 0, 0, 1),
(504, 'nonary_text_color', 'Nonary Text Color', 'one-line', 0, 0, 1),
(505, 'delete_group', 'Delete Group', 'one-line', 0, 0, 1),
(506, 'read_more_criteria', 'Add Read More button if height greater than (px)', 'one-line', 0, 0, 1),
(507, 'deleting', 'Deleting', 'one-line', 0, 0, 1),
(508, 'exceeded_maxgroupjoin', 'Exceeded Maximum Number of Groups You can Join', 'one-line', 0, 0, 1),
(509, 'ban_users_from_group', 'Ban Users from Group', 'one-line', 0, 0, 1),
(510, 'edit_custom_field_value', 'Edit Custom Field Value', 'one-line', 0, 0, 1),
(511, 'banned_page_title', 'You Are Banned', 'one-line', 0, 0, 1),
(512, 'uploading_files', 'Uploading File(s)', 'one-line', 0, 0, 1),
(513, 'nonary_border_color', 'Nonary Border Color', 'one-line', 0, 0, 1),
(514, 'editable_only_once', 'Editable Only Once', 'one-line', 0, 0, 1),
(515, 'offline', 'Offline', 'one-line', 0, 0, 1),
(516, 'unban_users_from_site', 'Unban Users from Site', 'one-line', 0, 0, 1),
(517, 'refresh_rate', 'Chat Refresh Rate (Seconds)', 'one-line', 0, 0, 1),
(518, 'delete_messages', 'Delete Msgs', 'one-line', 0, 0, 1),
(519, 'badge_title', 'Badge Title', 'one-line', 0, 0, 1),
(520, 'click_to_view_info', 'Click here to view info', 'one-line', 0, 0, 1),
(521, 'add_menu_item', 'Add Menu Item', 'one-line', 0, 0, 1),
(522, 'chat_page_boxed_layout', 'Boxed Layout [Chat Page]', 'one-line', 0, 0, 1),
(523, 'body', 'Body', 'one-line', 0, 0, 1),
(524, 'gif_content_filtering', 'GIF Content Filtering', 'one-line', 0, 0, 1),
(525, 'username_condition', 'Your username must contain at least one letter', 'one-line', 0, 0, 1),
(526, 'entry_page', 'Entry Page', 'one-line', 0, 0, 1),
(527, 'infotip_header_tag', 'This will be printed in the &lt;head&gt; section', 'one-line', 0, 0, 1),
(528, 'high', 'High', 'one-line', 0, 0, 1),
(529, 'infotip_body_tag', 'This will be printed after the &lt;body&gt; opening tag', 'one-line', 0, 0, 1),
(530, 'link_text', 'Link Text', 'one-line', 0, 0, 1),
(531, 'maximum_login_attempts', 'Maximum Login Attempts', 'one-line', 0, 0, 1),
(532, 'banned_page_expression', 'Ouch!', 'one-line', 0, 0, 1),
(533, 'site_notifications', 'Site Notifications', 'one-line', 0, 0, 1),
(534, 'view_site_users', 'View Site Users', 'one-line', 0, 0, 1),
(535, 'rtl', 'Right to Left', 'one-line', 0, 0, 1),
(536, 'time_format', 'Time Format', 'one-line', 0, 0, 1),
(537, 'push_notifications', 'Push Notifications', 'one-line', 0, 0, 1),
(538, 'delete_only_offline_users', 'Delete only Offline Users', 'one-line', 0, 0, 1),
(539, 'administrators', 'Administrators', 'one-line', 0, 0, 1),
(540, 'medium', 'Medium', 'one-line', 0, 0, 1),
(541, 'profile_url', 'Profile URL', 'one-line', 0, 0, 1),
(542, 'meta_title', 'Meta Title', 'one-line', 0, 0, 1),
(543, 'invalid_group_password', 'Invalid Group Password', 'one-line', 0, 0, 1),
(544, 'google_recaptcha_v2', 'Google reCAPTCHA v2', 'one-line', 0, 0, 1),
(545, 'site_role_2', 'Web Admin', 'one-line', 0, 0, 1),
(546, 'sticker_packs', 'Sticker Packs', 'one-line', 0, 0, 1),
(547, 'assign_badges', 'Assign Badges', 'one-line', 0, 0, 1),
(548, 'language_text_direction', 'Text direction', 'one-line', 0, 0, 1),
(549, 'send_push_notification', 'Send Push Notification', 'one-line', 0, 0, 1),
(550, 'embed_code', 'Embed Code', 'one-line', 0, 0, 1),
(551, 'on_join_group_chat', 'Someone joins Group Chat', 'one-line', 0, 0, 1),
(552, 'is_typing', 'is typing', 'one-line', 0, 0, 1),
(553, 'no_results_found', 'No Results Found', 'one-line', 0, 0, 1),
(554, 'view_group', 'View Group', 'one-line', 0, 0, 1);
INSERT INTO `gr_language_strings` (`string_id`, `string_constant`, `string_value`, `string_type`, `skip_update`, `skip_cache`, `language_id`) VALUES
(555, 'switch_languages', 'Switch Languages', 'one-line', 0, 0, 1),
(556, 'url', 'URL', 'one-line', 0, 0, 1),
(557, 'add_language', 'Add Language', 'one-line', 0, 0, 1),
(558, 'comments_if_any', 'Comments (If Any)', 'one-line', 0, 0, 1),
(559, 'monitor_private_chats', 'Monitor Private Chats', 'one-line', 0, 0, 1),
(560, 'denary_text_color', 'Denary Text Color', 'one-line', 0, 0, 1),
(561, 'low', 'Low', 'one-line', 0, 0, 1),
(562, 'maximum_message_length', 'Maximum Message Length', 'one-line', 0, 0, 1),
(563, 'no_results_found_subtitle', 'Try changing the filters or search term', 'one-line', 0, 0, 1),
(564, 'set_default_language', 'Set as Default Language', 'one-line', 0, 0, 1),
(565, 'view_online_users', 'View Online Users', 'one-line', 0, 0, 1),
(566, 'banned_page_description', 'Your have been banned from using this website. If you think your account was banned by mistake, please email us and we&#039;ll look into your case.', 'one-line', 0, 0, 1),
(567, 'posted_by', 'Posted by', 'one-line', 0, 0, 1),
(568, 'edit_custom_field', 'Edit Custom Field', 'one-line', 0, 0, 1),
(569, 'cookie_consent', 'Cookie Consent', 'one-line', 0, 0, 1),
(570, 'on_load_guest_login_window', 'Open Guest Login Window on Load (Login Page)', 'one-line', 0, 0, 1),
(571, 'listen_music', 'Listen Music', 'one-line', 0, 0, 1),
(572, 'message_id', 'Message ID', 'one-line', 0, 0, 1),
(573, 'location', 'Location', 'one-line', 0, 0, 1),
(574, 'edit_users', 'Edit Users', 'one-line', 0, 0, 1),
(575, 'view_full_name', 'View Full Name', 'one-line', 0, 0, 1),
(576, 'on_removal_from_group', 'Someone removed from Group', 'one-line', 0, 0, 1),
(577, 'unban_from_site', 'Unban from Site', 'one-line', 0, 0, 1),
(578, 'unban_users_from_group', 'Unban Users from Group', 'one-line', 0, 0, 1),
(579, 'force_https', 'Force HTTPS', 'one-line', 0, 0, 1),
(580, 'primary_border_color', 'Primary Border Color', 'one-line', 0, 0, 1),
(581, 'already_exists', 'Already Exists', 'one-line', 0, 0, 1),
(582, 'email_username', 'Email/Username', 'one-line', 0, 0, 1),
(583, 'create', 'Create', 'one-line', 0, 0, 1),
(584, 'icon_class', 'Icon Class', 'one-line', 0, 0, 1),
(585, 'forms', 'Forms', 'one-line', 0, 0, 1),
(586, 'site_adverts', 'Site Adverts', 'one-line', 0, 0, 1),
(587, 'yes', 'Yes', 'one-line', 0, 0, 1),
(588, 'info_panel', 'Info Panel', 'one-line', 0, 0, 1),
(589, 'on_leaving_group_chat', 'Someone leaves Group Chat', 'one-line', 0, 0, 1),
(590, 'welcome_screen', 'Welcome Screen', 'one-line', 0, 0, 1),
(591, 'forgot_password', 'Forgot Password', 'one-line', 0, 0, 1),
(592, 'no', 'No', 'one-line', 0, 0, 1),
(593, 'whats_wrong', 'What&#039;s Wrong with this', 'one-line', 0, 0, 1),
(594, 'rename', 'Rename', 'one-line', 0, 0, 1),
(595, 'open_in_new_window', 'Open Link in New Window', 'one-line', 0, 0, 1),
(596, 'advert_max_height', 'Maximum Height (px)', 'one-line', 0, 0, 1),
(597, 'banned_page_button', 'Contact Support', 'one-line', 0, 0, 1),
(598, 'rename_audio_file', 'Rename Audio File', 'one-line', 0, 0, 1),
(599, 'hcaptcha', 'hCaptcha', 'one-line', 0, 0, 1),
(600, 'landing_page', 'Landing Page', 'one-line', 0, 0, 1),
(601, 'set_participant_settings', 'Set Participant Settings', 'one-line', 0, 0, 1),
(602, 'site_role_3', 'Registered', 'one-line', 0, 0, 1),
(603, 'attachments', 'Attachment(s)', 'one-line', 0, 0, 1),
(604, 'add_cron_job', 'Add Cron Job', 'one-line', 0, 0, 1),
(605, 'login_as_another_user', 'Login as Another User', 'one-line', 0, 0, 1),
(606, 'slug_condition', 'Slug must contain at least one letter', 'one-line', 0, 0, 1),
(607, 'private_chats', 'Private Chats', 'one-line', 0, 0, 1),
(608, 'gif', 'GIF', 'one-line', 0, 0, 1),
(609, 'badge_image', 'Badge Image', 'one-line', 0, 0, 1),
(610, 'register', 'Register', 'one-line', 0, 0, 1),
(611, 'conversation_with', 'Conversation With', 'one-line', 0, 0, 1),
(612, 'ssl', 'SSL', 'one-line', 0, 0, 1),
(613, 'stream_url', 'Stream URL', 'one-line', 0, 0, 1),
(614, 'remove_password', 'Remove Password', 'one-line', 0, 0, 1),
(615, 'css_code', 'CSS Code', 'one-line', 0, 0, 1),
(616, 'sticker', 'Sticker', 'one-line', 0, 0, 1),
(617, 'site_role_4', 'Banned', 'one-line', 0, 0, 1),
(618, 'account_reactivated', 'Account Reactivated. Welcome Back', 'one-line', 0, 0, 1),
(619, 'clear_realtime_activity_logs', 'Clear Activity Logs', 'one-line', 0, 0, 1),
(620, 'sort', 'Sort', 'one-line', 0, 0, 1),
(621, 'group_roles', 'Group Roles', 'one-line', 0, 0, 1),
(622, 'reset', 'Reset', 'one-line', 0, 0, 1),
(623, 'default', 'Default', 'one-line', 0, 0, 1),
(624, 'footer_block_description', 'Footer Block [Description]', 'one-line', 0, 0, 1),
(625, 'off', 'Off', 'one-line', 0, 0, 1),
(626, 'edit_language', 'Edit Language', 'one-line', 0, 0, 1),
(627, 'delete_message_time_limit', 'Time Limit to Delete their own Messages (Minutes)', 'one-line', 0, 0, 1),
(628, 'denary_font_size', 'Denary Font Size', 'one-line', 0, 0, 1),
(629, 'audio_message', 'Audio Message', 'one-line', 0, 0, 1),
(630, 'advert_content', 'Advert Content', 'one-line', 0, 0, 1),
(631, 'edit_advert', 'Edit Advert', 'one-line', 0, 0, 1),
(632, 'manage_audio_player', 'Manage Audio Player', 'one-line', 0, 0, 1),
(633, 'group_invitation_email_button_label', 'Join Group', 'one-line', 0, 0, 1),
(634, 'messages', 'Messages', 'one-line', 0, 0, 1),
(635, 'create_group_role', 'Create Group Role', 'one-line', 0, 0, 1),
(636, 'flood_control_error_message', 'You are submitting too quickly. Please wait', 'one-line', 0, 0, 1),
(637, 'removed_from_group', 'Got removed from Group', 'one-line', 0, 0, 1),
(638, 'unbanned', 'Unbanned', 'one-line', 0, 0, 1),
(639, 'manage_social_login', 'Manage Social Login', 'one-line', 0, 0, 1),
(640, 'order', 'Order', 'one-line', 0, 0, 1),
(641, 'hide_language', 'Hide Language', 'one-line', 0, 0, 1),
(642, 'invalid_value', 'Invalid Input or Field Empty', 'one-line', 0, 0, 1),
(643, 'on_awarding_group_badges', 'Group awarded with new badge', 'one-line', 0, 0, 1),
(644, 'custom_field_3', 'Gender', 'one-line', 1, 0, 1),
(645, 'site_slogan', 'Site Slogan', 'one-line', 0, 0, 1),
(646, 'tls', 'TLS', 'one-line', 0, 0, 1),
(647, 'name', 'Name', 'one-line', 0, 0, 1),
(648, 'temporary_ban_from_group', 'Temporary Ban', 'one-line', 0, 0, 1),
(649, 'separate_commas', 'Separate with commas', 'one-line', 0, 0, 1),
(650, 'flood_control_time_difference', 'Required time difference between each message (seconds)', 'one-line', 0, 0, 1),
(651, 'site_role_5', 'Guest', 'one-line', 0, 0, 1),
(652, 'edit_group_role', 'Edit Group Role', 'one-line', 0, 0, 1),
(653, 'facebook_url', 'Facebook URL', 'one-line', 0, 0, 1),
(654, 'attach_stickers', 'Attach Stickers', 'one-line', 0, 0, 1),
(655, 'pinned_group', 'Pinned', 'one-line', 0, 0, 1),
(656, 'user_does_not_exist', 'User Does not Exist', 'one-line', 0, 0, 1),
(657, 'view_all', 'View All', 'one-line', 0, 0, 1),
(658, 'create_badge', 'Create Badge', 'one-line', 0, 0, 1),
(659, 'add_provider', 'Add Provider', 'one-line', 0, 0, 1),
(660, 'message_alignment', 'Message Alignment', 'one-line', 0, 0, 1),
(661, 'on_getting_banned_from_group', 'Someone banned from Group', 'one-line', 0, 0, 1),
(662, 'edit_cron_job', 'Edit Cron Job', 'one-line', 0, 0, 1),
(663, 'done', 'Done', 'one-line', 0, 0, 1),
(664, 'rebuild_cache', 'Rebuild Cache', 'one-line', 0, 0, 1),
(665, 'custom_field_4', 'Phone', 'one-line', 1, 0, 1),
(666, 'cron_jobs', 'Cron Jobs', 'one-line', 0, 0, 1),
(667, 'statistics', 'Statistics', 'one-line', 0, 0, 1),
(668, 'appkey', 'APP Key', 'one-line', 0, 0, 1),
(669, 'own_message_alignment', 'Message Alignment [Own]', 'one-line', 0, 0, 1),
(670, 'banned_from_group_message', 'You are Banned from accessing the Group', 'one-line', 0, 0, 1),
(671, 'instagram_url', 'Instagram URL', 'one-line', 0, 0, 1),
(672, 'images', 'Images', 'one-line', 0, 0, 1),
(673, 'site_roles', 'Site Roles', 'one-line', 0, 0, 1),
(674, 'mention', '@Mention', 'one-line', 0, 0, 1),
(675, 'manage_group_roles', 'Manage Group Roles', 'one-line', 0, 0, 1),
(676, 'custom_field_5', 'Location', 'one-line', 1, 0, 1),
(677, 'tenor', 'Tenor', 'one-line', 0, 0, 1),
(678, 'reactions', 'Reactions', 'one-line', 0, 0, 1),
(679, 'timezone', 'TimeZone', 'one-line', 0, 0, 1),
(680, 'file_expired', 'File Expired or Doesn&#039;t exist', 'one-line', 0, 0, 1),
(681, 'edit_badge', 'Edit Badge', 'one-line', 0, 0, 1),
(682, 'manage_site_roles', 'Manage Site Roles', 'one-line', 0, 0, 1),
(683, 'identity_provider', 'Identity Provider', 'one-line', 0, 0, 1),
(684, 'went_wrong', 'Something Went Wrong', 'one-line', 0, 0, 1),
(685, 'welcome_screen_heading', 'Hello, and a warm welcome to you', 'one-line', 0, 0, 1),
(686, 'load_more', 'Load More', 'one-line', 0, 0, 1),
(687, 'unleavable', 'Unleavable', 'one-line', 0, 0, 1),
(688, 'newest', 'Newest', 'one-line', 0, 0, 1),
(689, 'show', 'Show', 'one-line', 0, 0, 1),
(690, 'no_group_selected', 'Empty Inbox', 'one-line', 0, 0, 1),
(691, 'group_role_1', 'Banned', 'one-line', 0, 0, 1),
(692, 'twitter_url', 'Twitter URL', 'one-line', 0, 0, 1),
(693, 'on_getting_unbanned_from_group', 'Someone unbanned from Group', 'one-line', 0, 0, 1),
(694, 'web_app_manifest', 'Web App Manifest', 'one-line', 0, 0, 1),
(695, 'group_role_2', 'Group Admin', 'one-line', 0, 0, 1),
(696, 'custom_menu', 'Custom Menu', 'one-line', 0, 0, 1),
(697, 'recently_joined', 'Recently Joined', 'one-line', 0, 0, 1),
(698, 'on_getting_temporarily_banned_from_group', 'Someone temporarily banned from Group', 'one-line', 0, 0, 1),
(699, 'manage_adverts', 'Manage Adverts', 'one-line', 0, 0, 1),
(700, 'custom_field_3_options', '{\"male\":\"Male\",\"female\":\"Female\",\"non_binary\":\"Non-binary\"}', 'multi_line', 1, 0, 1),
(701, 'boxed', 'Boxed Layout', 'one-line', 0, 0, 1),
(702, 'set_group_slug', 'Set Group Slug', 'one-line', 0, 0, 1),
(703, 'blacklist_user_permission_denied', 'Permission Denied : You are not allowed to block/ignore Site Administrators', 'one-line', 0, 0, 1),
(704, 'create_public_group', 'Create Public Group', 'one-line', 0, 0, 1),
(705, 'group_role_3', 'Group Moderator', 'one-line', 0, 0, 1),
(706, 'welcome_screen_message', 'Share what&#039;s on your mind with other people from all around the world to find new friends', 'one-line', 0, 0, 1),
(707, 'site_users', 'Site Users', 'one-line', 0, 0, 1),
(708, 'custom_avatar', 'Custom Avatar', 'one-line', 0, 0, 1),
(709, 'custom_fields', 'Custom Fields', 'one-line', 0, 0, 1),
(710, 'line_break_delimiter', 'Use line break as the delimiter', 'one-line', 0, 0, 1),
(711, 'unleavable_group', 'Unleavable Group', 'one-line', 0, 0, 1),
(712, 'quinary_text_color', 'Quinary Text Color', 'one-line', 0, 0, 1),
(713, 'select_option', 'Select Option from Dropdown', 'one-line', 0, 0, 1),
(714, 'loading_image', 'Loading Image', 'one-line', 0, 0, 1),
(715, 'on_updating_group_info', 'Updating Group Information', 'one-line', 0, 0, 1),
(716, 'welcome_screen_footer_text', 'By accessing this website, you are agreeing to be bound by the Terms and Conditions of Use', 'one-line', 0, 0, 1),
(717, 'group_role_4', 'Member', 'one-line', 0, 0, 1),
(718, 'change_email_address', 'Change Email Address', 'one-line', 0, 0, 1),
(719, 'custom_background', 'Custom Background', 'one-line', 0, 0, 1),
(720, 'linkedin_url', 'LinkedIn URL', 'one-line', 0, 0, 1),
(721, 'left', 'Left', 'one-line', 0, 0, 1),
(722, 'create_groups', 'Create Groups', 'one-line', 0, 0, 1),
(723, 'forward', 'Forward', 'one-line', 0, 0, 1),
(724, 'values', 'Values', 'one-line', 0, 0, 1),
(725, 'choose_file', 'Choose a file', 'one-line', 0, 0, 1),
(726, 'background', 'Background', 'one-line', 0, 0, 1),
(727, 'access_logs', 'Access Logs', 'one-line', 0, 0, 1),
(728, 'videos', 'Videos', 'one-line', 0, 0, 1),
(729, 'clear_chat_history', 'Clear Chat History', 'one-line', 0, 0, 1),
(730, 'welcome_message', 'Welcome Message', 'one-line', 0, 0, 1),
(731, 'refresh', 'Refresh', 'one-line', 0, 0, 1),
(732, 'septenary_font_size', 'Septenary Font Size', 'one-line', 0, 0, 1),
(733, 'select_group', 'Select a Group or Chat', 'one-line', 0, 0, 1),
(734, 'cron_job_url', 'Cron Job URL', 'one-line', 0, 0, 1),
(735, 'twitch_url', 'Twitch URL', 'one-line', 0, 0, 1),
(736, 'switch_color_scheme', 'Switch Color Scheme', 'one-line', 0, 0, 1),
(737, 'show_language', 'Show Language', 'one-line', 0, 0, 1),
(738, 'gfycat', 'Gfycat', 'one-line', 0, 0, 1),
(739, 'confirm_action', 'Are you sure you want to continue ?', 'one-line', 0, 0, 1),
(740, 'menu_item', 'Menu Item', 'one-line', 0, 0, 1),
(741, 'created', 'Created', 'one-line', 0, 0, 1),
(742, 'total_users', 'Total Users', 'one-line', 0, 0, 1),
(743, 'check_inbox', 'We have sent an email to your email address. Please check your Inbox.', 'one-line', 0, 0, 1),
(744, 'temporarily_banned_from_group_message', 'You are Temporarily Banned from accessing the Group', 'one-line', 0, 0, 1),
(745, 'custom_page_2_content', '<div>1. Terms</div><div>By accessing this website, you are agreeing to be bound by the Terms and Conditions of Use, all applicable laws and regulations, and agree that you are responsible for compliance with any applicable local laws. If you do not agree with any of these terms, you are prohibited from using or accessing this website. The content contained here are protected by applicable copyright and trade mark laws. Please take the time to review our privacy policy.</div><div><br /></div><div>2. Use License</div><div>Permission is granted for the temporary use of the group chat, filemanager on web site for personal, non-commercial use only. This is the grant of the services, not a transfer of title, and under this license you may not: modify or copy the materials; use the materials for any commercial purpose, or for any public display (commercial or non-commercial); attempt to decompile or reverse engineer any software contained on the website; remove any copyright or other proprietary notations from the materials; or transfer the materials to another person or \"mirror\" the materials on any other website or server. This license shall automatically terminate if you violate any of these restrictions and may be terminated by the website at any time.</div><div><br /></div><div>3. Disclaimer</div><div>The content on the website are provided \"as is\". We makes no warranties, expressed or implied, and hereby disclaims and negates all other warranties, including without limitation, implied warranties or conditions of merchantability, fitness for a particular purpose, or non-infringement of intellectual property or other violation of rights. Furthermore, We does not warrant or make any representations concerning the accuracy, likely results, or reliability of the use of the content on its website or otherwise relating to such content or on any sites linked to this site.</div><div><br /></div><div>4. Limitations</div><div>In no event shall we be liable for any damages (including, without limitation, damages for loss of data or profit, due to business interruption, or criminal charges filed against you) arising out of the use or inability to use the content on the website, even if we or a authorized representative has been notified orally or in writing of the possibility of such damage. This applies to the use of our chat rooms and filemanager. Because some jurisdictions do not allow limitations on implied warranties, or limitations of liability for consequential or incidental damages, these limitations may not apply to you.</div><div><br /></div><div>5. Revisions and Errata</div><div>The materials appearing on the website could include technical, typos, or image errors. We does not warrant that any of the content on its website are accurate, complete, or current. We may make changes to the content on its website at any time without any noticeWe does not, however, make any commitment to update the content.</div><div><br /></div><div>6. Links</div><div>We has not reviewed all of the sites linked from its website and is not responsible for the contents contained within. The inclusion of any link does not imply endorsement by us. Use of any such linked web site is at the user\'s own risk.</div><div><br /></div><div>7. Age Limitations</div><div>In general, the age minimum for this webs site is 13. This website will not be held responsible for users who do not comply with the given age range as this information is not verifiable.</div><div><br /></div><div>8. Hateful Content</div><div>We does not tolerate any form of hateful or violent content in our chat rooms or on our forums. This includes threats, promotion of violence or direct attacks towards other users based upon ethnicity, race, religion, sexual orientation, religion affiliation, age, disability, serious diseases and gender. Users also are prohibited from using hateful images for their profile pictures/avatars. This includes usernames. All such comment will be removed when noticed or reported to our staff.</div><div><br /></div><div>9. Illegal Content</div><div>We does not tolerate any form of illegal content in our chat rooms or on our forums. Users also are prohibited from using or uploading illegal images including child pornography or other illegal content. This includes, but not limited to, profile pictures/avatars and any image transfers or uploads. This includes usernames. If you do so, you will be subject to being kicked, banned and, in some cases, reported to law enforcement. We will, to its highest ability, remove all illegal content when it is discovered or reported to us. We will not be held responsible for such content unless it is noticed and reported to our staff.</div><div><br /></div><div>10. Terms of Use Changes</div><div>We may revise these terms of use for its web site at any time without notice. By using this web site you are agreeing to be bound by the then current version of these Terms and Conditions of Use. If you cannot agree to this, please do not use this website.</div>', 'multi_line', 1, 1, 1),
(746, 'public_group', 'Public Group', 'one-line', 0, 0, 1),
(747, 'view_groups_without_login', 'View Public Groups without Login', 'one-line', 0, 0, 1),
(748, 'heading', 'Heading', 'one-line', 0, 0, 1),
(749, 'view_joined_groups', 'View Joined Groups', 'one-line', 0, 0, 1),
(750, 'not_a_group_member_message', 'You are not a member of this Group. Click here to Join.', 'one-line', 0, 0, 1),
(751, 'reply_messages', 'Reply Messages', 'one-line', 0, 0, 1),
(752, 'cron_job', 'Cron Job', 'one-line', 0, 0, 1),
(753, 'minimum_score_required_wad_content', 'Minimum Score Required [Weapons, Alcohol &amp; Drugs] %', 'one-line', 0, 0, 1),
(754, 'other_files', 'Other Files', 'one-line', 0, 0, 1),
(755, 'landing_page_footer_block_two_heading', 'Contact', 'one-line', 0, 0, 1),
(756, 'online_users', 'Online Users', 'one-line', 0, 0, 1),
(757, 'login_link_email_heading', 'Welcome To The Community', 'one-line', 0, 0, 1),
(758, 'landing_page_hero_section_heading', 'Much more than just another chat site', 'one-line', 0, 0, 1),
(759, 'email_address', 'Email Address', 'one-line', 0, 0, 1),
(760, 'default_group_role', 'Default Group Role', 'one-line', 0, 0, 1),
(761, 'webpushr_rest_api_key', 'Webpushr REST API Key', 'one-line', 0, 0, 1),
(762, 'clear_chat', 'Clear Chat', 'one-line', 0, 0, 1),
(763, 'badges', 'Badges', 'one-line', 0, 0, 1),
(764, 'icon_img', 'Icon', 'one-line', 0, 0, 1),
(765, 'command', 'Command', 'one-line', 0, 0, 1),
(766, 'external_link', 'External Link', 'one-line', 0, 0, 1),
(767, 'dmy_format', 'Day Month Year', 'one-line', 0, 0, 1),
(768, 'type', 'Type', 'one-line', 0, 0, 1),
(769, 'sort_by_default', 'Default', 'one-line', 0, 0, 1),
(770, 'delete_group_messages', 'Delete Group Messages', 'one-line', 0, 0, 1),
(771, 'on_group_creation', 'On Group Creation', 'one-line', 0, 0, 1),
(772, 'links', 'Links', 'one-line', 0, 0, 1),
(773, 'notifications', 'Notifications', 'one-line', 0, 0, 1),
(774, 'fake_online_users', 'Fake Online Users', 'one-line', 0, 0, 1),
(775, 'octonary_font_size', 'Octonary Font Size', 'one-line', 0, 0, 1),
(776, 'footer_text', 'Footer Text', 'one-line', 0, 0, 1),
(777, 'landing_page_faq_question_10_answer', '', 'one-line', 0, 0, 1),
(778, 'results_found', 'Results Found', 'one-line', 0, 0, 1),
(779, 'entry_page_background', 'Entry Page Background', 'one-line', 0, 0, 1),
(780, 'fake_users', 'Fake Users', 'one-line', 0, 0, 1),
(781, 'export', 'Export', 'one-line', 0, 0, 1),
(782, 'page_content', 'Page Content', 'one-line', 0, 0, 1),
(783, 'home', 'Home', 'one-line', 0, 0, 1),
(784, 'app_id', 'APP ID or Client ID', 'one-line', 0, 0, 1),
(785, 'landing_page_hero_section_description', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud.', 'one-line', 0, 0, 1),
(786, 'read_status', 'Read Status', 'one-line', 0, 0, 1),
(787, 'faq', 'FAQ', 'one-line', 0, 0, 1),
(788, 'custom_group_role', 'Custom Group Role', 'one-line', 0, 0, 1),
(789, 'right', 'Right', 'one-line', 0, 0, 1),
(790, 'new_message_notification', 'You have a new message', 'one-line', 0, 0, 1),
(791, 'add_users', 'Add Users', 'one-line', 0, 0, 1),
(792, 'view_shared_files', 'View Shared Files', 'one-line', 0, 0, 1),
(793, 'no_conversation_found', 'No Conversation Found', 'one-line', 0, 0, 1),
(794, 'switch_user', 'Switch User', 'one-line', 0, 0, 1),
(795, 'show_on_landing_page_footer', 'Show on Landing Page [Footer]', 'one-line', 0, 0, 1),
(796, 'disabled', 'Disabled', 'one-line', 0, 0, 1),
(797, 'remove_group_members', 'Remove Group Members', 'one-line', 0, 0, 1),
(798, 'login_link_email_content', 'A warm welcome to our website. You&#039;re now part of our website. We&#039;re excited to have you on board. Meet new friends. Share your experiences.', 'one-line', 0, 0, 1),
(799, 'default_group_visibility', 'Default Group Visibility', 'one-line', 0, 0, 1),
(800, 'add_fake_users', 'Add Fake Users', 'one-line', 0, 0, 1),
(801, 'mdy_format', 'Month Day Year', 'one-line', 0, 0, 1),
(802, 'landing_page_footer_block_two_description', '+44 1632 960811\r\nhello@yourdomain.com', 'one-line', 0, 0, 1),
(803, 'delete_private_messages', 'Delete Private Messages', 'one-line', 0, 0, 1),
(804, 'show_on_landing_page_header', 'Show on Landing Page [Header]', 'one-line', 0, 0, 1),
(805, 'default_txt', 'Default', 'one-line', 0, 0, 1),
(806, 'filter', 'Filter', 'one-line', 0, 0, 1),
(807, 'not_found', 'Not Found', 'one-line', 0, 0, 1),
(808, 'resend_email', 'Resend Email', 'one-line', 0, 0, 1),
(809, 'site_controls', 'Site Controls', 'one-line', 0, 0, 1),
(810, 'play_notification_sound', 'Play a Notification Sound', 'one-line', 0, 0, 1),
(811, 'custom_menu_item_3', 'About', 'one-line', 0, 0, 1),
(812, 'resend_email_on_error', 'Account already verified or account does not exist', 'one-line', 0, 0, 1),
(813, 'login_link_email_button_label', 'Login Now', 'one-line', 0, 0, 1),
(814, 'custom_menu_item_4', 'Sitemap', 'one-line', 0, 0, 1),
(815, 'disallowed_slugs', 'Disallowed Slugs', 'one-line', 0, 0, 1),
(816, 'email_successfully_sent', 'Email successfully sent', 'one-line', 0, 0, 1),
(817, 'landing_page_copyright_notice', '© 2021 Company, Inc. All rights reserved.', 'one-line', 0, 0, 1),
(818, 'featured_image', 'Featured Image', 'one-line', 0, 0, 1),
(819, 'custom_page_3', 'Privacy Policy', 'multi_line', 1, 1, 1),
(820, 'custom_css', 'Custom CSS', 'one-line', 0, 0, 1),
(821, 'minimum_full_name_length', 'Minimum Full Name Length', 'one-line', 0, 0, 1),
(822, 'on_new_message', 'On New Message', 'one-line', 0, 0, 1),
(823, 'landing_page_groups_section', 'Groups Section (Landing Page)', 'one-line', 0, 0, 1),
(824, 'mini_audio_player', 'Mini Audio Player', 'one-line', 0, 0, 1),
(825, 'approve', 'Approve', 'one-line', 0, 0, 1),
(826, 'moderators', 'Moderators', 'one-line', 0, 0, 1),
(827, 'hero_section_heading', 'Hero Section [Heading]', 'one-line', 0, 0, 1),
(828, 'faq_section_heading', 'FAQ Section [Heading]', 'one-line', 0, 0, 1),
(829, 'maximum_full_name_length', 'Maximum Full Name Length', 'one-line', 0, 0, 1),
(830, 'no_conversation_found_subtitle', 'Try changing the filters or search term', 'one-line', 0, 0, 1),
(831, 'on_new_site_notification', 'On New Site Notification', 'one-line', 0, 0, 1),
(832, 'disapprove', 'Disapprove', 'one-line', 0, 0, 1),
(833, 'nonary_font_size', 'Nonary Font Size', 'one-line', 0, 0, 1),
(834, 'requires_minimum_full_name_length', 'Require Minimum Length for Full Name', 'one-line', 0, 0, 1),
(835, 'minimum_score_required_offensive', 'Minimum Score Required [Offensive Signs &amp; Gestures] %', 'one-line', 0, 0, 1),
(836, 'please_wait', 'Please Wait', 'one-line', 0, 0, 1),
(837, 'disapprove_user_confirmation', 'Are you sure you want to disapprove this user ?', 'one-line', 0, 0, 1),
(838, 'suspended', 'Suspended', 'one-line', 0, 0, 1),
(839, 'dashboard', 'Dashboard', 'one-line', 0, 0, 1),
(840, 'approve_user_confirmation', 'Are you sure you want to approve this user ?', 'one-line', 0, 0, 1),
(841, 'landing_page_faq_section_heading', 'Frequently Asked Questions', 'one-line', 0, 0, 1),
(842, 'send_as_another_user', 'Send Messages as Another Site User', 'one-line', 0, 0, 1),
(843, 'custom_login_url', 'Custom Login URL', 'one-line', 0, 0, 1),
(844, 'minimum_score_required_graphic_violence_gore', 'Minimum Score Required [Graphic Violence &amp; Gore] %', 'one-line', 0, 0, 1),
(845, 'custom_url_on_logout', 'Custom URL on Logout', 'one-line', 0, 0, 1),
(846, 'hero_section_animation', 'Hero Section [Animation]', 'one-line', 0, 0, 1),
(847, 'infotip_select_multiple_files', 'To select multiple files, hold the Ctrl (PC) or Command (Mac) key and using your trackpad or external mouse, click on all the other files you wish to select one by one.', 'one-line', 0, 0, 1),
(848, 'track_status', 'Track Status', 'one-line', 0, 0, 1),
(849, 'group_members', 'Group Members', 'one-line', 0, 0, 1),
(850, 'hide_group_member_list_from_non_members', 'Hide Group Member list from Non members', 'one-line', 0, 0, 1),
(851, 'on_group_unread_count_change', 'On Group Unread Count Change', 'one-line', 0, 0, 1),
(852, 'display_full_file_name_of_attachments', 'Display full file name of Attachment(s)', 'one-line', 0, 0, 1),
(853, 'landing_page_groups_section_heading', 'Trending Groups', 'one-line', 0, 0, 1),
(854, 'assign', 'Assign', 'one-line', 0, 0, 1),
(855, 'moderation', 'Moderation', 'one-line', 0, 0, 1),
(856, 'link_field', 'Link', 'one-line', 0, 0, 1),
(857, 'enabled', 'Enabled', 'one-line', 0, 0, 1),
(858, 'import', 'Import', 'one-line', 0, 0, 1),
(859, 'daily_send_limit_group_messages', 'Daily Send Limit [Group Messages]', 'one-line', 0, 0, 1),
(860, 'load_group_info_on_group_load', 'Load Group Info on Group Load', 'one-line', 0, 0, 1),
(861, 'total_groups', 'Total Groups', 'one-line', 0, 0, 1),
(862, 'secret_key', 'Secret Key', 'one-line', 0, 0, 1),
(863, 'answer', 'Answer', 'one-line', 0, 0, 1),
(864, 'visible', 'Visible', 'one-line', 0, 0, 1),
(865, 'zero_equals_unlimited', '(0 = Unlimited)', 'one-line', 0, 0, 1),
(866, 'permission_denied', 'Permission Denied', 'one-line', 0, 0, 1),
(867, 'moderation_settings', 'Moderation', 'one-line', 0, 0, 1),
(868, 'delete_site_users', 'Delete Site Users', 'one-line', 0, 0, 1),
(869, 'daily_send_limit_private_messages', 'Daily Send Limit [Private Messages]', 'one-line', 0, 0, 1),
(870, 'ymd_format', 'Year Month Day', 'one-line', 0, 0, 1),
(871, 'landing_page_faq_question_1', 'How to create an account ?', 'one-line', 0, 0, 1),
(872, 'manage_custom_fields', 'Manage Custom Fields', 'one-line', 0, 0, 1),
(873, 'updated', 'Updated', 'one-line', 0, 0, 1),
(874, 'undenary_text_color', 'Undenary Text Color', 'one-line', 0, 0, 1),
(875, 'group_name', 'Group Name', 'one-line', 0, 0, 1),
(876, 'maximum_sending_rate_exceeded', 'Maximum Sending Rate Exceeded', 'one-line', 0, 0, 1),
(877, 'unsuspend', 'Unsuspend', 'one-line', 0, 0, 1),
(878, 'show_group_label', 'Show Group Role Next to Chat Message', 'one-line', 0, 0, 1),
(879, 'exceeds_full_name_length', 'Full Name character length limit exceeded', 'one-line', 0, 0, 1),
(880, 'on_private_conversation_unread_count_change', 'On Private Conversation Unread Count Change', 'one-line', 0, 0, 1),
(881, 'landing_page_faq_section', 'FAQ Section (Landing Page)', 'one-line', 0, 0, 1),
(882, 'groups_section_status', 'Groups Section [Status]', 'one-line', 0, 0, 1),
(883, 'duodenary_text_color', 'Duodenary Text Color', 'one-line', 0, 0, 1),
(884, 'delete_user_files', 'Delete User Files', 'one-line', 0, 0, 1),
(885, 'friend_system', 'Friend System', 'one-line', 0, 0, 1),
(886, 'system_info', 'System Info', 'one-line', 0, 0, 1),
(887, 'admins_moderators', 'Admins &amp; Moderators', 'one-line', 0, 0, 1),
(888, 'faq_section_status', 'FAQ Section [Status]', 'one-line', 0, 0, 1),
(889, 'import_users', 'Import Users', 'one-line', 0, 0, 1),
(890, 'hero_section_image', 'Hero Section [Image]', 'one-line', 0, 0, 1),
(891, 'hidden', 'Hidden', 'one-line', 0, 0, 1),
(892, 'ip_blacklist', 'IP Blacklist', 'one-line', 0, 0, 1),
(893, 'status', 'Status', 'one-line', 0, 0, 1),
(894, 'under_review', 'Under Review', 'one-line', 0, 0, 1),
(895, 'storage_usage', 'Storage Usage', 'one-line', 0, 0, 1),
(896, 'iso_language_code', 'ISO Language Code', 'one-line', 0, 0, 1),
(897, 'loading', 'Loading', 'one-line', 0, 0, 1),
(898, 'menu_title', 'Menu Title', 'one-line', 0, 0, 1),
(899, 'hero_section_description', 'Hero Section [Description]', 'one-line', 0, 0, 1),
(900, 'landing_page_groups_section_description', 'Where Good conversation become great experiences', 'one-line', 0, 0, 1),
(901, 'select_an_option', 'Select an Option', 'one-line', 0, 0, 1),
(902, 'add_friend', 'Add Friend', 'one-line', 0, 0, 1),
(903, 'seen_by', 'Seen By', 'one-line', 0, 0, 1),
(904, 'view_public_group_messages_non_member', 'View Public Group Messages without being Group Member [Logged in Users]', 'one-line', 0, 0, 1),
(905, 'access_denied_message', '403 Forbidden You don&#039;t have permission to access.', 'one-line', 0, 0, 1),
(906, 'footer_logo', 'Footer Logo', 'one-line', 0, 0, 1),
(907, 'cancel_request', 'Cancel Request', 'one-line', 0, 0, 1),
(908, 'remove', 'Remove', 'one-line', 0, 0, 1),
(909, 'view_shared_links', 'View Shared Links', 'one-line', 0, 0, 1),
(910, 'access_denied_non_member_message', 'You are not part of this Group. Join Group to View Messages.', 'one-line', 0, 0, 1),
(911, 'open_in_popup', 'Open in Popup', 'one-line', 0, 0, 1),
(912, 'landing_page_faq_question_1_answer', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ', 'one-line', 0, 0, 1),
(913, 'username', 'Username', 'one-line', 0, 0, 1),
(914, 'accept_friend', 'Accept Friend', 'one-line', 0, 0, 1),
(915, 'view_complaint', 'View Complaint', 'one-line', 0, 0, 1),
(916, 'supported_file_formats', 'Supported File Formats', 'one-line', 0, 0, 1),
(917, 'read_receipts', 'Read Receipts', 'one-line', 0, 0, 1),
(918, 'ad_free_account', 'Ad-Free Account', 'one-line', 0, 0, 1),
(919, 'customizer', 'Customizer', 'one-line', 0, 0, 1),
(920, 'suspend', 'Suspend', 'one-line', 0, 0, 1),
(921, 'social_share_image', 'Default Social Share Image', 'one-line', 0, 0, 1),
(922, 'unfriend', 'Unfriend', 'one-line', 0, 0, 1),
(923, 'username_exists', 'Username Already Taken', 'one-line', 0, 0, 1),
(924, 'modules', 'Modules', 'one-line', 0, 0, 1),
(925, 'landing_page_footer_text', 'All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet.', 'one-line', 0, 0, 1),
(926, 'who_all_can_view_page', 'Who all can View Page', 'one-line', 0, 0, 1),
(927, 'mention_users', 'Mention Users', 'one-line', 0, 0, 1),
(928, 'csv_file', 'CSV File', 'one-line', 0, 0, 1),
(929, 'others', 'Others', 'one-line', 0, 0, 1),
(930, 'reject_request', 'Reject Request', 'one-line', 0, 0, 1),
(931, '24_format', '24-hour clock', 'one-line', 0, 0, 1),
(932, 'load_profile_on_page_load', 'Load Profile on Page Load', 'one-line', 0, 0, 1),
(933, 'friends', 'Friends', 'one-line', 0, 0, 1),
(934, 'autoplay_audio_player', 'Autoplay Audio Player', 'one-line', 0, 0, 1),
(935, 'users_banned', 'Users Banned', 'one-line', 0, 0, 1),
(936, 'not_assigned', 'Not Assigned', 'one-line', 0, 0, 1),
(937, 'enter_is_send', 'Send message with Enter key', 'one-line', 0, 0, 1),
(938, 'question', 'Question', 'one-line', 0, 0, 1),
(939, 'profanity_filter', 'Profanity Filter', 'one-line', 0, 0, 1),
(940, 'total_members', 'Total Members', 'one-line', 0, 0, 1),
(941, 'sample_reference_file', 'Sample Reference File', 'one-line', 0, 0, 1),
(942, 'pending', 'Pending', 'one-line', 0, 0, 1),
(943, 'password', 'Password', 'one-line', 0, 0, 1),
(944, 'review_complaints', 'Review Complaints', 'one-line', 0, 0, 1),
(945, 'new_user_approval', 'New User Approval', 'one-line', 0, 0, 1),
(946, 'webpushr_authentication_token', 'Webpushr Authentication Token', 'one-line', 0, 0, 1),
(947, 'menu_item_visibility', 'Menu Item Visibility', 'one-line', 0, 0, 1),
(948, 'group_join_confirmation', 'Group Join Confirmation', 'one-line', 0, 0, 1),
(949, 'group_suspended', 'Sorry, this group has been Suspended.', 'one-line', 0, 0, 1),
(950, 'label_text_color', 'Label Text Color', 'one-line', 0, 0, 1),
(951, 'emojis', 'Emojis', 'one-line', 0, 0, 1),
(952, 'time_am', 'AM', 'one-line', 0, 0, 1),
(953, 'show_only_on_specific_language', 'Show only on Specific Language', 'one-line', 0, 0, 1),
(954, 'review', 'Review', 'one-line', 0, 0, 1),
(955, 'group_chats', 'Group Chats', 'one-line', 0, 0, 1),
(956, 'landing_page_footer_block_one_heading', 'Address', 'one-line', 0, 0, 1),
(957, 'view_statistics', 'View Statistics', 'one-line', 0, 0, 1),
(958, 'password_doesnt_match', 'Password doesn&#039;t match the Confirm password', 'one-line', 0, 0, 1),
(959, 'storage', 'Storage', 'one-line', 0, 0, 1),
(960, 'email_exists', 'Email Already Exists', 'one-line', 0, 0, 1),
(961, 'time_pm', 'PM', 'one-line', 0, 0, 1),
(962, 'recording', 'Recording', 'one-line', 0, 0, 1),
(963, 'something_went_wrong', 'Something Went Wrong', 'one-line', 0, 0, 1),
(964, 'email_logo', 'Logo (Email Template)', 'one-line', 0, 0, 1),
(965, 'signup_agreement', 'I agree to the Terms of Service and Privacy Policy', 'one-line', 0, 0, 1),
(966, '12_format', '12-hour clock', 'one-line', 0, 0, 1),
(967, 'show_on_signup', 'Show on Signup Page', 'one-line', 0, 0, 1),
(968, 'default_timezone', 'Default Timezone', 'one-line', 0, 0, 1),
(969, 'sent', 'Sent', 'one-line', 0, 0, 1),
(970, 'show_on_front_page', 'Show on Frontpage', 'one-line', 0, 0, 1),
(971, 'assigned', 'Assigned', 'one-line', 0, 0, 1),
(972, 'hide_name_field_in_registration_page', 'Hide Name Field in Registration Page', 'one-line', 0, 0, 1),
(973, 'comments_by_complainant', 'Comments by Complainant', 'one-line', 0, 0, 1),
(974, 'webpushr', 'Webpushr', 'one-line', 0, 0, 1),
(975, 'message_non_friends', 'Message Non-Friends', 'one-line', 0, 0, 1),
(976, 'field_type', 'Field Type', 'one-line', 0, 0, 1),
(977, 'unverified_email_address', 'Unverified Email Address', 'one-line', 0, 0, 1),
(978, 'hide_email_address_field_in_registration_page', 'Hide Email Address Field in Registration Page', 'one-line', 0, 0, 1),
(979, 'gifs', 'GIFs', 'one-line', 0, 0, 1),
(980, 'landing_page_footer_block_one_description', '3 Burthong Road, Eremerang, New South Wales, 2877 Australia', 'one-line', 0, 0, 1),
(981, 'send_requests', 'Send Requests', 'one-line', 0, 0, 1),
(982, 'email', 'Email', 'one-line', 0, 0, 1),
(983, 'landing_page_faq_question_2', 'How to Delete an account ?', 'one-line', 0, 0, 1),
(984, 'play', 'Play', 'one-line', 0, 0, 1),
(985, 'hide_username_field_in_registration_page', 'Hide Username Field In Registration Page', 'one-line', 0, 0, 1),
(986, 'captcha', 'Captcha', 'one-line', 0, 0, 1),
(987, 'copyright_notice', 'Copyright Notice', 'one-line', 0, 0, 1),
(988, 'receive_requests', 'Receive Requests', 'one-line', 0, 0, 1),
(989, 'new_badge_awarded', 'New Badge Awarded', 'one-line', 0, 0, 1),
(990, 'left_content_block', 'Left Content Block', 'one-line', 0, 0, 1),
(991, 'advert_min_height', 'Minimum Height (px)', 'one-line', 0, 0, 1),
(992, 'wait_for_profile_approval', 'Your Account is currently pending approval. Once your profile has been approved you can login.', 'one-line', 0, 0, 1),
(993, 'static_image', 'Static Image', 'one-line', 0, 0, 1),
(994, 'id', 'ID', 'one-line', 0, 0, 1),
(995, 'field_options', 'Field Options', 'one-line', 0, 0, 1),
(996, 'left_panel_content_on_page_load', 'Content to Show on Page Load [Left Panel]', 'one-line', 0, 0, 1),
(997, 'view_friends', 'View Friends', 'one-line', 0, 0, 1),
(998, 'side_navigation', 'Side Navigation', 'one-line', 0, 0, 1),
(999, 'image_moderation', 'Image Moderation', 'one-line', 0, 0, 1),
(1000, 'confirm_email_address', 'You are required to verify your email address. We have sent an email with a confirmation link to your email address.', 'one-line', 0, 0, 1),
(1001, 'monitor', 'Monitor', 'one-line', 0, 0, 1),
(1002, 'your_friend_since', 'Your Friend Since', 'one-line', 0, 0, 1),
(1003, 'show_on_entry_page', 'Show on Entry Page', 'one-line', 0, 0, 1),
(1004, 'left_side_content', 'Left Side Content', 'one-line', 0, 0, 1),
(1005, 'sightengine_api_user', 'Sightengine API user', 'one-line', 0, 0, 1),
(1006, 'audio', 'Audio', 'one-line', 0, 0, 1),
(1007, 'comments_by_reviewer', 'Comments by Reviewer', 'one-line', 0, 0, 1),
(1008, 'custom_page_2', 'Terms of Service', 'multi_line', 1, 1, 1),
(1009, 'remove_cover_pic', 'Remove Cover Pic', 'one-line', 0, 0, 1),
(1010, 'display_username_group_chats', 'Display Username instead of Full Name in Group Chats', 'one-line', 0, 0, 1),
(1011, 'files_uploaded', 'Files Uploaded', 'one-line', 0, 0, 1),
(1012, 'display_username_private_chats', 'Display Username instead of Full Name in Private Chats', 'one-line', 0, 0, 1),
(1013, 'landing_page_faq_question_2_answer', '02 Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ', 'one-line', 0, 0, 1),
(1014, 'captcha_secret_key', 'Captcha Secret Key', 'one-line', 0, 0, 1),
(1015, 'sightengine_api_secret', 'Sightengine API Secret', 'one-line', 0, 0, 1),
(1016, 'form', 'Form', 'one-line', 0, 0, 1),
(1017, 'groups_section_description', 'Groups Section [Description]', 'one-line', 0, 0, 1),
(1018, 'compress_video_files', 'Compress Video Files', 'one-line', 0, 0, 1),
(1019, 'pending_approval', 'Pending Approval', 'one-line', 0, 0, 1),
(1020, 'image_removal_criteria', 'Delete Images that contain', 'one-line', 0, 0, 1),
(1021, 'compress_image_files', 'Compress Image Files', 'one-line', 0, 0, 1),
(1022, 'chat_window', 'Chat Window', 'one-line', 0, 0, 1),
(1023, 'partial_nudity', 'Partial Nudity', 'one-line', 0, 0, 1),
(1024, 'primary_bg_color', 'Primary Background Color', 'one-line', 0, 0, 1),
(1025, 'compress_audio_files', 'Compress Audio Files', 'one-line', 0, 0, 1),
(1026, 'requires_consent', 'Your consent is required.', 'one-line', 0, 0, 1),
(1027, 'not_logged_in', 'Not Logged In', 'one-line', 0, 0, 1),
(1028, 'explicit_nudity', 'Explicit Nudity', 'one-line', 0, 0, 1),
(1029, 'email_login_link', 'Email Login Link', 'one-line', 0, 0, 1),
(1030, 'secondary_bg_color', 'Secondary Background Color', 'one-line', 0, 0, 1),
(1031, 'edit_custom_page', 'Edit Custom Page', 'one-line', 0, 0, 1),
(1032, 'unverified', 'Unverified', 'one-line', 0, 0, 1),
(1033, 'webpushr_public_key', 'Webpushr Public Key', 'one-line', 0, 0, 1),
(1034, 'tertiary_bg_color', 'Tertiary Background Color', 'one-line', 0, 0, 1),
(1035, 'nearby_users', 'Nearby Users', 'one-line', 0, 0, 1),
(1036, 'login_link_email_subject', 'Your Login Link', 'one-line', 0, 0, 1),
(1037, 'not_logged_in_message', 'You are not logged in. Click here to log in.', 'one-line', 0, 0, 1),
(1038, 'wad_content', 'Weapons, Alcohol &amp; Drugs', 'one-line', 0, 0, 1),
(1039, 'quaternary_bg_color', 'Quaternary Background Color', 'one-line', 0, 0, 1),
(1040, 'rebuild', 'Rebuild', 'one-line', 0, 0, 1),
(1041, 'people_nearby_feature', 'People Nearby Feature', 'one-line', 0, 0, 1),
(1042, 'landing_page_faq_question_3', '', 'one-line', 0, 0, 1),
(1043, 'custom_field_6', 'Country', 'one-line', 1, 0, 1),
(1044, 'offensive_signs_gestures', 'Offensive Signs &amp; Gestures', 'one-line', 0, 0, 1),
(1045, 'group_invitation', 'Invited you to Join the Group', 'one-line', 0, 0, 1),
(1046, 'quinary_bg_color', 'Quinary Background Color', 'one-line', 0, 0, 1),
(1047, 'view_nearby_users', 'View Nearby Users', 'one-line', 0, 0, 1),
(1048, 'required_field', 'Required Field', 'one-line', 0, 0, 1),
(1049, 'embed', 'Embed', 'one-line', 0, 0, 1),
(1050, 'graphic_violence_gore', 'Graphic Violence &amp; Gore', 'one-line', 0, 0, 1),
(1051, 'last_visit', 'Last Visit', 'one-line', 0, 0, 1),
(1052, 'people_nearby_max_distance', 'People Nearby - Maximum Distance (km)', 'one-line', 0, 0, 1),
(1053, 'add_custom_page', 'Add Custom Page', 'one-line', 0, 0, 1),
(1054, 'senary_bg_color', 'Senary Background Color', 'one-line', 0, 0, 1),
(1055, 'captcha_site_key', 'Captcha Site Key', 'one-line', 0, 0, 1),
(1056, 'approve_users', 'Approve Users', 'one-line', 0, 0, 1),
(1057, 'group_invitation_email_subject', 'You&#039;ve Got an Invitation', 'one-line', 0, 0, 1),
(1058, 'top', 'Top', 'one-line', 0, 0, 1),
(1059, 'septenary_bg_color', 'Septenary Background Color', 'one-line', 0, 0, 1),
(1060, 'complaint_status', 'Complaint Status', 'one-line', 0, 0, 1),
(1061, 'minimum_score_required_partial_nudity', 'Minimum Score Required [Partial Nudity] %', 'one-line', 0, 0, 1),
(1062, 'embed_group', 'Embed Group', 'one-line', 0, 0, 1),
(1063, 'auto_join_group', 'Auto Add Users on Signup', 'one-line', 0, 0, 1),
(1064, 'bottom', 'Bottom', 'one-line', 0, 0, 1),
(1065, 'check_read_receipts', 'Check Read Receipts', 'one-line', 0, 0, 1),
(1066, 'minimum_score_required_explicit_nudity', 'Minimum Score Required [Explicit Nudity] %', 'one-line', 0, 0, 1),
(1067, 'style_sheets', 'Style Sheets', 'one-line', 0, 0, 1),
(1068, 'octonary_bg_color', 'Octonary Background Color', 'one-line', 0, 0, 1),
(1069, 'error_uploading', 'Error Uploading Files', 'one-line', 0, 0, 1),
(1070, 'create_account', 'Create Account', 'one-line', 0, 0, 1),
(1071, 'landing_page_faq_question_3_answer', '', 'one-line', 0, 0, 1),
(1072, 'default_language', 'Default Language', 'one-line', 0, 0, 1),
(1073, 'allow_guest_users_create_accounts', 'Allow Guest Users to Create Accounts', 'one-line', 0, 0, 1),
(1074, 'custom_page_1', 'About', 'multi_line', 1, 1, 1),
(1075, 'email_validator', 'Email Validator', 'one-line', 0, 0, 1),
(1076, 'nonary_bg_color', 'Nonary Background Color', 'one-line', 0, 0, 1),
(1077, 'email_domain_not_allowed', 'Not allowed to use an email address from this domain ', 'one-line', 0, 0, 1),
(1078, 'data_unavailable', 'Data Unavailable', 'one-line', 0, 0, 1),
(1079, 'denary_bg_color', 'Denary Background Color', 'one-line', 0, 0, 1),
(1080, 'group_headers', 'Group Headers', 'one-line', 0, 0, 1),
(1081, 'voice_message', 'Voice Message', 'one-line', 0, 0, 1),
(1082, 'edit_group_header', 'Edit Group Header', 'one-line', 0, 0, 1),
(1083, 'entry_page_form_header', 'Form Header (Entry Page)', 'one-line', 0, 0, 1),
(1084, 'group_header', 'Group Header', 'one-line', 0, 0, 1),
(1085, 'add_meta_tags', 'Add Meta Tags', 'one-line', 0, 0, 1),
(1086, 'primary_text_color', 'Primary Text Color', 'one-line', 0, 0, 1),
(1087, 'header_content', 'Header Content', 'one-line', 0, 0, 1),
(1088, 'global_css', 'Global CSS', 'one-line', 0, 0, 1),
(1089, 'groups_section_heading', 'Groups Section [Heading]', 'one-line', 0, 0, 1),
(1090, 'landing_page_faq_question_4', '', 'one-line', 0, 0, 1),
(1091, 'custom_js', 'Custom JS', 'one-line', 0, 0, 1),
(1092, 'javascript', 'JavaScript', 'one-line', 0, 0, 1),
(1093, 'secondary_text_color', 'Secondary Text Color', 'one-line', 0, 0, 1),
(1094, 'error', 'Error', 'one-line', 0, 0, 1),
(1095, 'global_js', 'Global Custom JS', 'one-line', 0, 0, 1),
(1096, 'pin_groups', 'Pin Groups', 'one-line', 0, 0, 1),
(1097, 'forward_message', 'Forward Message', 'one-line', 0, 0, 1),
(1098, 'forward_messages', 'Forward Messages', 'one-line', 0, 0, 1),
(1099, 'color_scheme', 'Color Scheme', 'one-line', 0, 0, 1),
(1100, 'react', 'React', 'one-line', 0, 0, 1),
(1101, 'page_title', 'Page Title', 'one-line', 0, 0, 1),
(1102, 'samesite_cookies', 'SameSite Cookies', 'one-line', 0, 0, 1),
(1103, 'show_timestamp_on_mouseover', 'Show Timestamp on Mouseover', 'one-line', 0, 0, 1),
(1104, 'group_invitation_email_heading', 'You&#039;ve Got an invitation', 'one-line', 0, 0, 1),
(1105, 'csrf_token', 'CSRF Token', 'one-line', 0, 0, 1),
(1106, 'javascript_files', 'Javascript Files', 'one-line', 0, 0, 1),
(1107, 'complainant', 'Complainant', 'one-line', 0, 0, 1),
(1108, 'delete_complaints', 'Delete Complaints', 'one-line', 0, 0, 1),
(1109, 'main_panel_content_on_page_load', 'Content to Show on Page Load [Main Panel]', 'one-line', 0, 0, 1),
(1110, 'login_as_admin', 'Login as Admin', 'one-line', 0, 0, 1),
(1111, 'media', 'Media', 'one-line', 0, 0, 1),
(1112, 'chats', 'Chats', 'one-line', 0, 0, 1),
(1113, 'set_auto_join_groups', 'Set Auto Join Groups', 'one-line', 0, 0, 1),
(1114, 'message_textarea_placeholder', 'Write Here…', 'one-line', 0, 0, 1),
(1115, 'entry_page_form_footer', 'Form Footer (Entry Page)', 'one-line', 0, 0, 1),
(1116, 'footer_block_heading', 'Footer Block [Heading]', 'one-line', 0, 0, 1),
(1117, 'allow_sharing_email_addresses', 'Allow Sharing Email Addresses', 'one-line', 0, 0, 1),
(1118, 'landing_page_faq_question_4_answer', '', 'one-line', 0, 0, 1),
(1119, 'search_on_change_of_input', 'Search on Change of Input', 'one-line', 0, 0, 1),
(1120, 'hide', 'Hide', 'one-line', 0, 0, 1),
(1121, 'show_side_navigation_on_load', 'Show Side Navigation On Load', 'one-line', 0, 0, 1),
(1122, 'landing_page_faq_question_5', '', 'one-line', 0, 0, 1),
(1123, 'hide_groups_on_group_url', 'Hide groups when a user visits through the group URL', 'one-line', 0, 0, 1),
(1124, 'sitemap', 'Sitemap', 'one-line', 0, 0, 1),
(1125, 'group_chat', 'Group Chat', 'one-line', 0, 0, 1),
(1126, 'landing_page_faq_question_5_answer', '', 'one-line', 0, 0, 1),
(1127, 'external_page', 'External Page', 'one-line', 0, 0, 1),
(1128, 'landing_page_faq_question_6', '', 'one-line', 0, 0, 1),
(1129, 'custom_field_2', 'Birth Date', 'one-line', 1, 0, 1),
(1130, 'recipient', 'Recipient', 'one-line', 0, 0, 1),
(1131, 'group_invitation_email_content', 'Come join our community where you can share, learn, and discover amazing resources, ask questions, engage in conversations.', 'one-line', 0, 0, 1),
(1132, 'landing_page_faq_question_6_answer', '', 'one-line', 0, 0, 1),
(1133, 'view_invisible_users', 'View Invisible Users (Offline Mode)', 'one-line', 0, 0, 1),
(1134, 'invalid_pwa_icon_dimensions', 'Use an image that is at least 512X512 pixels', 'one-line', 0, 0, 1),
(1135, 'custom_page_1_content', '<p>This is a simple and easy to use chatroom. Join us now and talk to people from all over the world.\r\n\r\nOur mission is to share and grow the world’s knowledge. </p><p>A vast amount of the knowledge that would be valuable to many people is currently only available to a few — either locked in people’s heads, or only accessible to select groups. We want to connect the people who have knowledge to the people who need it, to bring together people with different perspectives so they can understand each other better, and to empower everyone to share their knowledge for the benefit of the rest of the world.</p><p>A chat room is a Web site, part of a Web site, or part of an online service, that provides a venue for communities of users with a common interest to communicate in real time. Forums and discussion groups, in comparison, allow users to post messages but don\'t have the capacity for interactive messaging. Most chat rooms don\'t require users to have any special software; those that do, such as Internet Relay Chat (IRC) allow users to download it from the Internet.</p><p>Chat room users register for the chat room of their choice, choose a user name and password, and log into a particular room (most sites have multiple chat rooms). Inside the chat room, generally there is a list of the people currently online, who also are alerted that another person has entered the chat room. To chat, users type a message into a text box. The message is almost immediately visible in the larger communal message area and other users respond. Users can enter chat rooms and read messages without sending any, a practice known as lurking.</p><p>Because chat room messages are spontaneous and instantly visible, there is a potential for abuse, which may or may not be intentional. Site hosts typically post a frequently asked questions (FAQ) list to guide users to appropriate chat room behavior, such as introducing yourself when you enter a room, making it clear when you are directing a question or response to a specific user, and reporting disruptive users, for example. Disruptive users may verbally abuse other chatters, monopolize the conversation, or even just disable it by repeatedly typing the same word or phrase into the conversation, a practice (much frowned upon) known as scrolling.</p><p>Chat rooms can be found that focus on virtually any aspect of human endeavor or interest: there are current communities based on classic movies, Irish ancestry, baton twirling, and psychic readings, for example. Various sites, such as Yahoo, provide a directory of chat sites. Others, such as MSN Web Communities, guide users through the steps required to create their own chat room.</p><p>\r\n</p>\r\n\r\n', 'multi_line', 1, 1, 1),
(1136, 'landing_page_faq_question_7', '', 'one-line', 0, 0, 1),
(1137, 'error_message', 'Something went wrong, try refreshing.', 'one-line', 0, 0, 1),
(1138, 'landing_page_faq_question_7_answer', '', 'one-line', 0, 0, 1),
(1139, 'landing_page_faq_question_8', '', 'one-line', 0, 0, 1),
(1140, 'landing_page_faq_question_8_answer', '', 'one-line', 0, 0, 1),
(1141, 'landing_page_faq_question_9', '', 'one-line', 0, 0, 1),
(1142, 'landing_page_faq_question_9_answer', '', 'one-line', 0, 0, 1),
(1143, 'set_fake_online_users', 'Set Fake Online Users', 'one-line', 0, 0, 1),
(1144, 'landing_page_faq_question_10', '', 'one-line', 0, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `gr_login_sessions`
--

CREATE TABLE `gr_login_sessions` (
  `login_session_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `initiated_ip_address` varchar(90) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_code` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `csrf_token` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `csrf_token_generated_on` datetime NOT NULL,
  `log_device` int NOT NULL DEFAULT '1',
  `login_from_user_id` bigint DEFAULT NULL,
  `status` int NOT NULL DEFAULT '0' COMMENT '0 = Inactive\r\n1 = Active\r\n2 = Expired',
  `failed_attempts` int NOT NULL,
  `time_stamp` int NOT NULL,
  `last_access` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gr_mailbox`
--

CREATE TABLE `gr_mailbox` (
  `mail_id` bigint NOT NULL,
  `email_addresses` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_category` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint DEFAULT NULL,
  `email_parameters` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `send_status` int NOT NULL DEFAULT '0' COMMENT '0 = Pending\r\n1 = Send\r\n2 = Failed',
  `mail_error_log` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_on` datetime NOT NULL,
  `updated_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gr_private_chat_messages`
--

CREATE TABLE `gr_private_chat_messages` (
  `private_chat_message_id` bigint NOT NULL,
  `private_conversation_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `original_message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `filtered_message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `system_message` int NOT NULL DEFAULT '0',
  `parent_message_id` bigint DEFAULT NULL,
  `attachment_type` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attachments` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `link_preview` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `read_status` int NOT NULL DEFAULT '0' COMMENT '0 = Unread\r\n1 = Read',
  `created_on` datetime NOT NULL,
  `updated_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gr_private_conversations`
--

CREATE TABLE `gr_private_conversations` (
  `private_conversation_id` bigint NOT NULL,
  `initiator_user_id` bigint NOT NULL,
  `recipient_user_id` bigint NOT NULL,
  `initiator_load_message_id_from` bigint DEFAULT NULL,
  `recipient_load_message_id_from` bigint DEFAULT NULL,
  `created_on` datetime NOT NULL,
  `updated_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gr_push_subscriptions`
--

CREATE TABLE `gr_push_subscriptions` (
  `push_subscriber_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `device_token` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `push_notification_service` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_on` datetime NOT NULL,
  `updated_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gr_realtime_logs`
--

CREATE TABLE `gr_realtime_logs` (
  `realtime_log_id` bigint NOT NULL,
  `log_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `related_parameters` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gr_settings`
--

CREATE TABLE `gr_settings` (
  `setting_id` bigint NOT NULL,
  `setting` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` int NOT NULL DEFAULT '0',
  `category` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'other_settings',
  `field_attributes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `settings_order` int NOT NULL DEFAULT '0',
  `updated_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `gr_settings`
--

INSERT INTO `gr_settings` (`setting_id`, `setting`, `options`, `value`, `required`, `category`, `field_attributes`, `settings_order`, `updated_on`) VALUES
(1, 'site_name', '0', 'Site Name', 1, 'general_settings', NULL, 0, '2022-01-20 14:28:51'),
(2, 'site_description', 'textarea', 'Share what is on your mind with other people from all around the world to find new friends.', 1, 'general_settings', NULL, 0, '2022-01-27 14:02:45'),
(3, 'site_slogan', '0', 'Your Slogan Goes Here', 1, 'general_settings', NULL, 0, '2022-01-20 14:29:04'),
(4, 'meta_title', '0', 'Meet New Friends on Site Name', 1, 'general_settings', NULL, 0, '2022-01-20 23:41:46'),
(5, 'default_timezone', 'select', 'America/New_York', 1, 'general_settings', NULL, 0, '2022-10-28 22:38:22'),
(6, 'captcha', '[\"disable\",\"google_recaptcha_v2\",\"hcaptcha\"]', 'disable', 0, 'login_settings', NULL, 7, '2022-10-28 12:48:15'),
(7, 'captcha_site_key', '0', '', 0, 'login_settings', NULL, 7, '2022-10-28 22:52:51'),
(8, 'captcha_secret_key', '0', '', 0, 'login_settings', NULL, 7, '2022-10-28 22:52:51'),
(9, 'default_language', 'select', '1', 1, 'general_settings', NULL, 0, '2022-02-15 09:51:46'),
(10, 'guest_login', '[\"enable\",\"disable\"]', 'enable', 0, 'login_settings', NULL, 2, '2022-01-21 01:37:18'),
(11, 'sender_name', '0', 'Site Name', 0, 'email_settings', NULL, 0, '2022-01-20 23:44:27'),
(12, 'user_email_verification', '[\"enable\",\"disable\"]', 'disable', 0, 'login_settings', NULL, 2, '2022-10-21 16:28:46'),
(13, 'smtp_authentication', '[\"enable\",\"disable\"]', 'disable', 0, 'email_settings', NULL, 0, '2022-06-15 03:27:31'),
(14, 'smtp_host', '0', '', 0, 'email_settings', NULL, 0, '2022-03-21 01:14:51'),
(15, 'system_email_address', '0', 'email@yourdomain.test', 0, 'email_settings', NULL, 0, '2022-10-28 22:38:57'),
(16, 'smtp_username', '0', '', 0, 'email_settings', NULL, 0, '2022-03-21 01:14:51'),
(17, 'smtp_password', '0', '', 0, 'email_settings', NULL, 0, '2022-03-21 01:14:51'),
(18, 'smtp_protocol', '[\"ssl\",\"tls\"]', 'tls', 0, 'email_settings', NULL, 0, '2022-01-20 23:44:34'),
(19, 'smtp_port', '[25,587,465,2525]', '587', 0, 'email_settings', NULL, 0, '2021-09-23 00:50:10'),
(20, 'gif_search_engine', '[\"disable\",\"tenor\",\"gfycat\",\"giphy\"]', 'tenor', 0, 'message_settings', NULL, 1, '2022-10-24 04:26:33'),
(21, 'gif_search_engine_api', '0', '', 0, 'message_settings', NULL, 1, '2022-10-28 22:53:47'),
(22, 'gifs_per_load', 'number', '25', 0, 'message_settings', NULL, 1, '2021-07-22 15:56:00'),
(23, 'records_per_call', 'number', '24', 1, 'general_settings', NULL, 0, '2022-10-28 12:49:05'),
(24, 'messages_per_call', 'number', '25', 1, 'message_settings', NULL, 5, '2021-06-23 15:52:17'),
(25, 'refresh_rate', 'number', '3000', 1, 'realtime_settings', NULL, 3, '2022-07-14 10:58:28'),
(26, 'request_timeout', 'number', '1', 1, 'realtime_settings', NULL, 4, '2022-10-28 22:55:16'),
(27, 'minimum_message_length', 'number', '1', 1, 'message_settings', NULL, 6, '2022-01-21 23:45:15'),
(28, 'maximum_message_length', 'number', '2000', 1, 'message_settings', NULL, 7, '2022-01-23 14:59:36'),
(29, 'read_more_criteria', 'number', '250', 1, 'message_settings', NULL, 8, '2022-01-23 23:34:17'),
(30, 'force_https', '[\"yes\",\"no\"]', 'no', 0, 'general_settings', NULL, 0, '2022-01-20 15:33:03'),
(31, 'non_latin_usernames', '[\"enable\",\"disable\"]', 'enable', 0, 'login_settings', NULL, 4, '2021-06-23 15:52:17'),
(32, 'system_messages_groups', '[multi_select][\"on_group_creation\",\"on_join_group_chat\",\"on_removal_from_group\",\"on_leaving_group_chat\",\"on_awarding_group_badges\",\"on_getting_banned_from_group\",\"on_getting_unbanned_from_group\",\"on_getting_temporarily_banned_from_group\",\"on_updating_group_info\"]', 'a:9:{i:0;s:17:\"on_group_creation\";i:1;s:18:\"on_join_group_chat\";i:2;s:21:\"on_removal_from_group\";i:3;s:21:\"on_leaving_group_chat\";i:4;s:24:\"on_awarding_group_badges\";i:5;s:28:\"on_getting_banned_from_group\";i:6;s:30:\"on_getting_unbanned_from_group\";i:7;s:40:\"on_getting_temporarily_banned_from_group\";i:8;s:22:\"on_updating_group_info\";}', 0, 'notification_settings', NULL, 7, '2022-10-28 22:54:21'),
(33, 'site_notifications', '[multi_select][\"on_user_mention_group_chat\",\"on_group_invitation\",\"on_new_site_badges\",\"on_reply_group_messages\"]', 'a:4:{i:0;s:26:\"on_user_mention_group_chat\";i:1;s:19:\"on_group_invitation\";i:2;s:18:\"on_new_site_badges\";i:3;s:23:\"on_reply_group_messages\";}', 0, 'notification_settings', NULL, 8, '2022-10-28 22:54:21'),
(34, 'login_cookie_validity', 'number', '30', 0, 'login_settings', NULL, 5, '2022-10-28 11:58:43'),
(35, 'gravatar', '[\"enable\",\"disable\"]', 'disable', 0, 'login_settings', NULL, 8, '2021-06-23 15:52:17'),
(36, 'minimum_username_length', 'number', '4', 0, 'login_settings', NULL, 6, '2021-06-23 15:52:17'),
(37, 'maximum_username_length', 'number', '30', 0, 'login_settings', NULL, 6, '2021-06-23 15:52:17'),
(38, 'group_join_confirmation', '[\"enable\",\"disable\"]', 'enable', 0, 'general_settings', NULL, 0, '2022-01-20 15:38:52'),
(39, 'view_groups_without_login', '[\"enable\",\"disable\"]', 'enable', 0, 'general_settings', NULL, 0, '2022-06-13 11:30:39'),
(40, 'api_secret_key', '0', 'T5E23sdWwesdsdQ', 0, 'general_settings', NULL, 0, '2022-06-29 11:59:59'),
(41, 'dateformat', '[\"dmy_format\",\"mdy_format\",\"ymd_format\"]', 'dmy_format', 1, 'general_settings', NULL, 0, '2022-01-20 15:40:12'),
(42, 'autoplay_audio_player', '[\"yes\",\"no\"]', 'no', 0, 'general_settings', NULL, 0, '2022-04-02 20:10:21'),
(43, 'cookie_consent', '[\"enable\",\"disable\"]', 'enable', 0, 'general_settings', NULL, 0, '2022-01-20 21:58:26'),
(44, 'notification_tone', 'select', 'assets/files/sound_notifications/open-up.mp3', 1, 'realtime_settings', NULL, 5, '2022-06-07 04:31:56'),
(45, 'google_analytics_id', '0', '', 0, 'general_settings', NULL, 0, '2022-01-20 22:29:56'),
(46, 'time_format', '[\"24_format\",\"12_format\"]', '12_format', 1, 'general_settings', NULL, 0, '2022-06-27 01:23:34'),
(47, 'on_load_guest_login_window', '[\"enable\",\"disable\"]', 'disable', 0, 'login_settings', NULL, 2, '2022-01-21 02:48:09'),
(48, 'color_scheme', '[\"light_mode\",\"dark_mode\"]', 'dark_mode', 1, 'general_settings', NULL, 0, '2022-10-20 00:06:39'),
(49, 'default_font', 'select', 'montserrat', 1, 'general_settings', NULL, 0, '2022-10-28 00:01:06'),
(50, 'ffmpeg', '[\"enable\",\"disable\"]', 'disable', 0, 'general_settings', NULL, 0, '2022-10-28 22:38:22'),
(51, 'ffmpeg_binaries_path', '0', '/usr/bin/ffmpeg', 0, 'general_settings', NULL, 0, '2022-10-28 22:38:22'),
(52, 'profanity_filter', '[\"enable\",\"disable\",\"strict_mode\"]', 'enable', 0, 'other_settings', NULL, 0, '2022-06-14 13:24:38'),
(53, 'firewall', '[\"enable\",\"disable\"]', 'enable', 0, 'other_settings', NULL, 0, '2022-04-19 22:38:00'),
(54, 'maximum_login_attempts', 'number', '10', 0, 'login_settings', NULL, 3, '2021-06-23 15:52:17'),
(55, 'ffprobe_binaries_path', '0', '/usr/bin/ffprobe', 0, 'general_settings', NULL, 0, '2022-10-28 22:38:22'),
(56, 'user_registration', '[\"enable\",\"disable\"]', 'enable', 0, 'login_settings', NULL, 1, '2022-01-31 17:48:26'),
(57, 'push_notifications', '[\"disable\",\"webpushr\",\"onesignal\"]', 'disable', 1, 'notification_settings', '{\"class\":\"field toggle_form_fields\",\"hide_field\":\"web_push_fields\",\"show_fields\":\"onesignal|onesignal,webpushr|webpushr\"}', 1, '2022-04-10 20:26:45'),
(58, 'send_push_notification', '[multi_select][\"on_private_message\",\"on_user_mention_group_chat\",\"on_reply_group_messages\"]', 'a:3:{i:0;s:18:\"on_private_message\";i:1;s:26:\"on_user_mention_group_chat\";i:2;s:23:\"on_reply_group_messages\";}', 0, 'notification_settings', NULL, 6, '2022-10-28 22:54:21'),
(59, 'onesignal_app_id', NULL, '', 0, 'notification_settings', '{\"class\":\"field web_push_fields onesignal d-none\"}', 2, '2022-04-05 08:00:24'),
(60, 'onesignal_rest_api_key', NULL, '', 0, 'notification_settings', '{\"class\":\"field web_push_fields onesignal d-none\"}', 3, '2022-04-05 08:00:24'),
(61, 'onesignal_safari_web_id', NULL, '', 0, 'notification_settings', '{\"class\":\"field web_push_fields onesignal d-none\"}', 4, '2022-03-21 01:16:35'),
(62, 'webpushr_public_key', NULL, '', 0, 'notification_settings', '{\"class\":\"field web_push_fields webpushr d-none\"}', 5, '2022-04-10 20:26:45'),
(63, 'webpushr_rest_api_key', NULL, '', 0, 'notification_settings', '{\"class\":\"field web_push_fields webpushr d-none\"}', 5, '2022-04-10 20:26:45'),
(64, 'webpushr_authentication_token', NULL, '', 0, 'notification_settings', '{\"class\":\"field web_push_fields webpushr d-none\"}', 5, '2022-04-10 20:26:45'),
(65, 'progressive_web_application', '[\"enable\",\"disable\"]', 'enable', 0, 'pwa_settings', NULL, 0, '2022-06-04 13:21:25'),
(66, 'pwa_name', '', 'Site Name', 0, 'pwa_settings', NULL, 0, '2022-01-27 14:05:26'),
(67, 'pwa_short_name', '', 'Site Name', 0, 'pwa_settings', NULL, 0, '2022-01-27 14:05:26'),
(68, 'pwa_background_color', 'color', '#000000', 0, 'pwa_settings', NULL, 0, '2022-04-05 08:31:23'),
(69, 'pwa_theme_color', 'color', '#020202', 0, 'pwa_settings', NULL, 0, '2022-04-05 08:31:23'),
(70, 'pwa_description', 'textarea', 'Share what is on your mind with other people from all around the world to find new friends.', 0, 'pwa_settings', NULL, 0, '2022-01-27 14:05:26'),
(71, 'pwa_display', '[\"standalone\",\"minimal-ui\",\"fullscreen\",\"browser\"]', 'standalone', 0, 'pwa_settings', NULL, 0, '2022-01-27 14:05:26'),
(72, 'gif_content_filtering', '[\"high\",\"medium\",\"low\",\"off\"]', 'off', 0, 'message_settings', NULL, 1, '2022-04-11 13:32:19'),
(73, 'message_alignment', '[\"left\",\"right\"]', 'left', 1, 'message_settings', NULL, 0, '2022-10-28 03:29:26'),
(74, 'own_message_alignment', '[\"left\",\"right\"]', 'left', 1, 'message_settings', NULL, 0, '2022-10-28 12:03:43'),
(75, 'play_notification_sound', '[multi_select][\"on_new_message\",\"on_new_site_notification\",\"on_group_unread_count_change\",\"on_private_conversation_unread_count_change\"]', 'a:4:{i:0;s:14:\"on_new_message\";i:1;s:24:\"on_new_site_notification\";i:2;s:28:\"on_group_unread_count_change\";i:3;s:43:\"on_private_conversation_unread_count_change\";}', 0, 'realtime_settings', NULL, 6, '2022-10-28 22:55:20'),
(76, 'entry_page_background', '[\"slideshow\",\"static_image\"]', 'slideshow', 0, 'login_settings', NULL, 0, '2022-03-20 04:20:40'),
(77, 'change_to_idle_status_after', 'number', '3', 0, 'realtime_settings', NULL, 1, '2022-04-06 05:57:12'),
(78, 'change_to_offline_status_after', 'number', '5', 0, 'realtime_settings', NULL, 2, '2022-04-06 05:57:12'),
(79, 'chat_page_boxed_layout', '[\"enable\",\"disable\"]', 'disable', 0, 'general_settings', NULL, 0, '2022-10-28 01:49:29'),
(80, 'facebook_url', NULL, '#facebook', 0, 'other_settings', NULL, 0, '2022-03-19 10:05:13'),
(81, 'instagram_url', NULL, '#Instagram', 0, 'other_settings', NULL, 0, '2022-03-19 10:06:57'),
(82, 'twitter_url', NULL, '#Twitter', 0, 'other_settings', NULL, 0, '2022-03-20 04:38:57'),
(83, 'linkedin_url', NULL, '#LinkedIn', 0, 'other_settings', NULL, 0, '2022-03-19 10:06:57'),
(84, 'twitch_url', NULL, '#Twitch', 0, 'other_settings', NULL, 0, '2022-03-19 10:37:58'),
(85, 'landing_page', '[\"enable\",\"disable\"]', 'enable', 0, 'other_settings', NULL, 0, '2022-03-20 06:50:08'),
(86, 'enter_is_send', '[\"enable\",\"disable\"]', 'enable', 0, 'message_settings', NULL, 0, '2022-04-05 14:25:29'),
(87, 'disallowed_slugs', 'textarea', 'a:0:{}', 0, 'general_settings', NULL, 0, '2022-10-28 22:38:22'),
(88, 'mini_audio_player', '[\"enable\",\"disable\"]', 'enable', 0, 'general_settings', NULL, 0, '2022-04-05 15:51:38'),
(89, 'load_group_info_on_group_load', '[\"enable\",\"disable\"]', 'enable', 0, 'general_settings', NULL, 0, '2022-04-05 16:07:47'),
(90, 'new_user_approval', '[\"enable\",\"disable\"]', 'disable', 0, 'login_settings', NULL, 1, '2022-06-29 12:00:57'),
(91, 'custom_login_url', NULL, '', 0, 'login_settings', NULL, 4, '2022-04-08 07:34:54'),
(92, 'custom_url_on_logout', NULL, '', 0, 'login_settings', NULL, 4, '2022-04-08 07:24:11'),
(93, 'hero_section_animation', '[\"enable\",\"disable\"]', 'enable', 0, 'other_settings', NULL, 0, '2022-04-10 12:27:34'),
(94, 'hide_group_member_list_from_non_members', '[\"yes\",\"no\"]', 'no', 0, 'general_settings', NULL, 5, '2022-06-07 23:39:13'),
(95, 'display_full_file_name_of_attachments', '[\"yes\",\"no\"]', 'yes', 0, 'general_settings', NULL, 5, '2022-10-10 11:57:02'),
(96, 'groups_section_status', '[\"enable\",\"disable\"]', 'enable', 0, 'other_settings', NULL, 0, '2022-06-10 10:15:37'),
(97, 'faq_section_status', '[\"enable\",\"disable\"]', 'enable', 0, 'other_settings', NULL, 0, '2022-06-10 10:15:37'),
(98, 'view_public_group_messages_non_member', '[\"enable\",\"disable\"]', 'enable', 0, 'general_settings', NULL, 0, '2022-06-13 10:38:30'),
(99, 'hide_name_field_in_registration_page', '[\"yes\",\"no\"]', 'no', 0, 'login_settings', NULL, 1, '2022-06-20 07:01:09'),
(100, 'hide_email_address_field_in_registration_page', '[\"yes\",\"no\"]', 'no', 0, 'login_settings', NULL, 1, '2022-06-20 06:49:58'),
(101, 'hide_username_field_in_registration_page', '[\"yes\",\"no\"]', 'no', 0, 'login_settings', NULL, 1, '2022-06-20 07:08:11'),
(102, 'image_moderation', '[\"enable\",\"disable\"]', 'disable', 0, 'moderation_settings', NULL, 1, '2022-06-23 00:09:24'),
(103, 'sightengine_api_user', NULL, '', 0, 'moderation_settings', NULL, 2, '2022-06-23 00:09:24'),
(104, 'sightengine_api_secret', NULL, '', 0, 'moderation_settings', NULL, 2, '2022-06-23 00:09:24'),
(105, 'image_removal_criteria', '[multi_select][\"partial_nudity\",\"explicit_nudity\",\"wad_content\",\"offensive_signs_gestures\",\"graphic_violence_gore\"]', 'a:5:{i:0;s:14:\"partial_nudity\";i:1;s:15:\"explicit_nudity\";i:2;s:11:\"wad_content\";i:3;s:24:\"offensive_signs_gestures\";i:4;s:21:\"graphic_violence_gore\";}', 0, 'moderation_settings', NULL, 3, '2022-06-23 10:26:36'),
(106, 'minimum_score_required_partial_nudity', 'number', '40', 0, 'moderation_settings', NULL, 3, '2022-06-23 00:06:20'),
(107, 'minimum_score_required_explicit_nudity', 'number', '60', 0, 'moderation_settings', NULL, 3, '2022-06-23 00:06:20'),
(108, 'minimum_score_required_wad_content', 'number', '60', 0, 'moderation_settings', NULL, 3, '2022-06-23 00:05:50'),
(109, 'minimum_score_required_offensive', 'number', '60', 0, 'moderation_settings', NULL, 3, '2022-06-23 00:05:50'),
(110, 'minimum_score_required_graphic_violence_gore', 'number', '70', 0, 'moderation_settings', NULL, 3, '2022-06-23 00:09:09'),
(111, 'minimum_full_name_length', 'number', '5', 0, 'login_settings', NULL, 7, '2022-10-28 22:52:51'),
(112, 'maximum_full_name_length', 'number', '30', 0, 'login_settings', NULL, 7, '2022-10-09 08:46:22'),
(113, 'friend_system', '[\"enable\",\"disable\"]', 'enable', 0, 'general_settings', NULL, 1, '2022-10-10 08:25:07'),
(114, 'display_username_group_chats', '[\"enable\",\"disable\"]', 'disable', 0, 'message_settings', NULL, 1, '2022-10-19 00:00:32'),
(115, 'display_username_private_chats', '[\"enable\",\"disable\"]', 'disable', 0, 'message_settings', NULL, 1, '2022-10-19 00:01:35'),
(116, 'compress_video_files', '[\"enable\",\"disable\"]', 'enable', 0, 'general_settings', NULL, 0, '2022-01-20 15:38:52'),
(117, 'compress_image_files', '[\"enable\",\"disable\"]', 'enable', 0, 'general_settings', NULL, 0, '2022-01-20 15:38:52'),
(118, 'compress_audio_files', '[\"enable\",\"disable\"]', 'enable', 0, 'general_settings', NULL, 0, '2022-01-20 15:38:52'),
(119, 'people_nearby_feature', '[\"enable\",\"disable\"]', 'enable', 0, 'general_settings', NULL, 0, '2022-10-21 01:20:30'),
(120, 'people_nearby_max_distance', 'number', '100', 0, 'general_settings', NULL, 0, '2022-10-21 01:36:56'),
(121, 'allow_guest_users_create_accounts', '[\"yes\",\"no\"]', 'yes', 0, 'login_settings', NULL, 2, '2022-10-21 19:07:01'),
(122, 'email_validator', '[\"enable\",\"disable\",\"strict_mode\"]', 'enable', 0, 'other_settings', NULL, 0, '2022-10-28 22:35:28'),
(123, 'show_timestamp_on_mouseover', '[\"enable\",\"disable\"]', 'enable', 0, 'message_settings', NULL, 0, '2022-10-24 18:24:22'),
(124, 'search_on_change_of_input', '[\"enable\",\"disable\"]', 'disable', 0, 'general_settings', NULL, 0, '2022-10-27 22:47:13'),
(125, 'show_side_navigation_on_load', '[\"yes\",\"no\"]', 'yes', 0, 'general_settings', NULL, 0, '2022-10-27 22:50:24');

-- --------------------------------------------------------

--
-- Table structure for table `gr_site_advertisements`
--

CREATE TABLE `gr_site_advertisements` (
  `site_advert_id` bigint NOT NULL,
  `site_advert_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `site_advert_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `site_advert_placement` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `site_advert_min_height` int DEFAULT NULL,
  `site_advert_max_height` int NOT NULL DEFAULT '150',
  `disabled` int NOT NULL DEFAULT '0',
  `updated_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gr_site_notifications`
--

CREATE TABLE `gr_site_notifications` (
  `notification_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `notification_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `related_group_id` bigint DEFAULT NULL,
  `related_user_id` bigint DEFAULT NULL,
  `related_message_id` bigint DEFAULT NULL,
  `related_parameters` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `read_status` int NOT NULL DEFAULT '0' COMMENT '0 = Unread\r\n1 = Read',
  `created_on` datetime NOT NULL,
  `updated_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gr_site_roles`
--

CREATE TABLE `gr_site_roles` (
  `site_role_id` bigint NOT NULL,
  `string_constant` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `permissions` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `site_role_attribute` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `disabled` int NOT NULL DEFAULT '0',
  `updated_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `gr_site_roles`
--

INSERT INTO `gr_site_roles` (`site_role_id`, `string_constant`, `permissions`, `site_role_attribute`, `disabled`, `updated_on`) VALUES
(1, 'site_role_1', '{\"update\":\"site_roles\",\"language_id\":\"\",\"name_color\":\"#DD8400\",\"attribute\":\"unverified_users\",\"disabled\":\"no\",\"load_profile_on_page_load\":\"\",\"left_panel_content_on_page_load\":\"\",\"main_panel_content_on_page_load\":\"\",\"hide_groups_on_group_url\":\"no\",\"default_group_visibility\":\"\",\"group_join_limit\":\"100\",\"flood_control_time_difference\":\"20\",\"daily_send_limit_group_messages\":\"0\",\"daily_send_limit_private_messages\":\"0\",\"delete_message_time_limit\":\"10\",\"max_file_upload_size\":\"500\",\"maximum_storage_space\":\"500\"}', 'unverified_users', 0, '2022-10-28 22:28:20'),
(2, 'site_role_2', '{\"update\":\"site_roles\",\"language_id\":\"\",\"name_color\":\"#F06292\",\"attribute\":\"administrators\",\"disabled\":\"no\",\"load_profile_on_page_load\":\"yes\",\"left_panel_content_on_page_load\":\"groups\",\"main_panel_content_on_page_load\":\"statistics\",\"site_notifications\":[\"view\",\"delete\"],\"hide_groups_on_group_url\":\"no\",\"groups\":[\"view_public_groups\",\"view_secret_groups\",\"view_password_protected_groups\",\"view_joined_groups\",\"create_groups\",\"create_unleavable_group\",\"create_secret_group\",\"create_protected_group\",\"set_group_slug\",\"pin_groups\",\"set_auto_join_groups\",\"set_participant_settings\",\"add_meta_tags\",\"set_cover_pic\",\"set_custom_background\",\"download_attachments\",\"typing_indicator\",\"mention_users\",\"reply_messages\",\"forward_messages\",\"check_read_receipts\",\"join_group\",\"leave_group\",\"invite_users\",\"add_site_members\",\"view_reactions\",\"react_messages\",\"send_message\",\"send_audio_message\",\"attach_files\",\"attach_from_storage\",\"attach_gifs\",\"attach_stickers\",\"share_screenshot\",\"allow_sharing_links\",\"allow_sharing_email_addresses\",\"generate_link_preview\",\"clear_chat_history\",\"export_chat\",\"embed_group\",\"send_as_another_user\",\"super_privileges\"],\"default_group_visibility\":\"visible\",\"friend_system\":[\"view_friends\",\"send_requests\",\"receive_requests\"],\"private_conversations\":[\"super_privileges\",\"initiate_private_chat\",\"view_private_chats\",\"send_message\",\"message_non_friends\",\"send_audio_message\",\"attach_files\",\"attach_from_storage\",\"attach_gifs\",\"attach_stickers\",\"share_screenshot\",\"allow_sharing_links\",\"allow_sharing_email_addresses\",\"generate_link_preview\",\"typing_indicator\",\"reply_messages\",\"check_read_receipts\",\"delete_own_message\",\"download_attachments\",\"export_chat\",\"clear_chat_history\"],\"group_join_limit\":\"99999999\",\"flood_control_time_difference\":\"1\",\"daily_send_limit_group_messages\":\"0\",\"daily_send_limit_private_messages\":\"0\",\"delete_message_time_limit\":\"99999999999999\",\"storage\":[\"access_storage\",\"upload_files\",\"download_files\",\"delete_files\",\"super_privileges\"],\"max_file_upload_size\":\"5000\",\"maximum_storage_space\":\"5000\",\"allowed_file_formats\":[\"image_files\",\"video_files\",\"audio_files\",\"documents\",\"all_file_formats\"],\"site_users\":[\"block_users\",\"ignore_users\",\"create_user\",\"import_users\",\"edit_users\",\"delete_users\",\"approve_users\",\"ban_users_from_site\",\"unban_users_from_site\",\"view_site_users\",\"view_online_users\",\"view_nearby_users\",\"view_invisible_users\",\"ban_ip_addresses\",\"unban_ip_addresses\",\"manage_user_access_logs\",\"login_as_another_user\",\"set_fake_online_users\"],\"profile\":[\"edit_profile\",\"change_full_name\",\"change_username\",\"change_email_address\",\"change_avatar\",\"upload_custom_avatar\",\"set_cover_pic\",\"set_custom_background\",\"go_offline\",\"switch_languages\",\"switch_color_scheme\",\"disable_private_messages\",\"deactivate_account\"],\"site_roles\":[\"create\",\"view\",\"edit\",\"delete\"],\"group_roles\":[\"create\",\"view\",\"edit\",\"delete\"],\"custom_fields\":[\"create\",\"view\",\"edit\",\"delete\"],\"stickers\":[\"create\",\"view\",\"edit\",\"delete\"],\"custom_pages\":[\"create\",\"view\",\"edit\",\"delete\"],\"custom_menu\":[\"create\",\"view\",\"edit\",\"delete\"],\"avatars\":[\"upload\",\"view\",\"delete\"],\"languages\":[\"create\",\"view\",\"edit\",\"delete\",\"export\"],\"social_login_providers\":[\"add\",\"view\",\"edit\",\"delete\"],\"audio_player\":[\"listen_music\",\"add\",\"view\",\"edit\",\"delete\"],\"site_adverts\":[\"create\",\"view\",\"edit\",\"delete\"],\"badges\":[\"assign\",\"create\",\"view\",\"edit\",\"delete\"],\"complaints\":[\"report\",\"track_status\",\"review_complaints\",\"delete_complaints\"],\"super_privileges\":[\"monitor_group_chats\",\"monitor_private_chats\",\"view_statistics\",\"core_settings\",\"customizer\",\"slideshows\",\"group_headers\",\"header_footer\",\"firewall\",\"email_validator\",\"profanity_filter\",\"cron_jobs\"]}', 'administrators', 0, '2022-10-28 22:29:28'),
(3, 'site_role_3', '{\"update\":\"site_roles\",\"language_id\":\"\",\"name_color\":\"#00B107\",\"attribute\":\"default_site_role\",\"disabled\":\"no\",\"load_profile_on_page_load\":\"yes\",\"left_panel_content_on_page_load\":\"groups\",\"main_panel_content_on_page_load\":\"welcome_screen\",\"site_notifications\":[\"view\",\"delete\"],\"hide_groups_on_group_url\":\"no\",\"groups\":[\"view_public_groups\",\"view_password_protected_groups\",\"view_joined_groups\",\"download_attachments\",\"typing_indicator\",\"mention_users\",\"reply_messages\",\"forward_messages\",\"check_read_receipts\",\"join_group\",\"leave_group\",\"invite_users\",\"view_reactions\",\"react_messages\",\"send_message\",\"send_audio_message\",\"attach_files\",\"attach_from_storage\",\"attach_gifs\",\"attach_stickers\",\"share_screenshot\",\"allow_sharing_links\",\"allow_sharing_email_addresses\",\"generate_link_preview\",\"clear_chat_history\",\"export_chat\"],\"default_group_visibility\":\"hidden\",\"friend_system\":[\"view_friends\",\"send_requests\",\"receive_requests\"],\"private_conversations\":[\"initiate_private_chat\",\"view_private_chats\",\"send_message\",\"send_audio_message\",\"attach_files\",\"attach_from_storage\",\"attach_gifs\",\"attach_stickers\",\"share_screenshot\",\"allow_sharing_links\",\"allow_sharing_email_addresses\",\"generate_link_preview\",\"typing_indicator\",\"reply_messages\",\"check_read_receipts\",\"delete_own_message\",\"download_attachments\",\"export_chat\",\"clear_chat_history\"],\"group_join_limit\":\"100\",\"flood_control_time_difference\":\"2\",\"daily_send_limit_group_messages\":\"0\",\"daily_send_limit_private_messages\":\"0\",\"delete_message_time_limit\":\"10\",\"storage\":[\"access_storage\",\"upload_files\",\"download_files\",\"delete_files\"],\"max_file_upload_size\":\"500\",\"maximum_storage_space\":\"1000\",\"allowed_file_formats\":[\"image_files\",\"video_files\",\"audio_files\",\"documents\"],\"site_users\":[\"block_users\",\"ignore_users\",\"view_online_users\",\"view_nearby_users\"],\"profile\":[\"edit_profile\",\"change_full_name\",\"change_username\",\"change_email_address\",\"change_avatar\",\"upload_custom_avatar\",\"set_cover_pic\",\"set_custom_background\",\"go_offline\",\"switch_languages\",\"switch_color_scheme\",\"disable_private_messages\",\"deactivate_account\"],\"audio_player\":[\"listen_music\"],\"complaints\":[\"report\",\"track_status\"]}', 'default_site_role', 0, '2022-10-28 22:31:13'),
(4, 'site_role_4', '{\"update\":\"site_roles\",\"language_id\":\"\",\"name_color\":\"#FF1100\",\"attribute\":\"banned_users\",\"disabled\":\"no\",\"load_profile_on_page_load\":\"\",\"left_panel_content_on_page_load\":\"\",\"main_panel_content_on_page_load\":\"\",\"default_group_visibility\":\"\",\"group_join_limit\":\"100\",\"flood_control_time_difference\":\"20\",\"delete_message_time_limit\":\"10\",\"max_file_upload_size\":\"500\",\"maximum_storage_space\":\"500\"}', 'banned_users', 0, '2022-06-07 03:36:58'),
(5, 'site_role_5', '{\"update\":\"site_roles\",\"language_id\":\"\",\"name_color\":\"#5D01FF\",\"attribute\":\"guest_users\",\"disabled\":\"no\",\"load_profile_on_page_load\":\"yes\",\"left_panel_content_on_page_load\":\"groups\",\"main_panel_content_on_page_load\":\"welcome_screen\",\"site_notifications\":[\"view\"],\"hide_groups_on_group_url\":\"\",\"groups\":[\"view_public_groups\",\"view_joined_groups\",\"download_attachments\",\"typing_indicator\",\"mention_users\",\"reply_messages\",\"forward_messages\",\"check_read_receipts\",\"join_group\",\"leave_group\",\"invite_users\",\"view_reactions\",\"react_messages\",\"send_message\",\"send_audio_message\",\"attach_files\",\"attach_from_storage\",\"attach_gifs\",\"attach_stickers\",\"share_screenshot\",\"allow_sharing_links\",\"allow_sharing_email_addresses\",\"generate_link_preview\",\"clear_chat_history\",\"export_chat\"],\"default_group_visibility\":\"hidden\",\"private_conversations\":[\"initiate_private_chat\",\"view_private_chats\",\"send_message\",\"message_non_friends\",\"send_audio_message\",\"attach_files\",\"attach_from_storage\",\"attach_gifs\",\"attach_stickers\",\"share_screenshot\",\"allow_sharing_links\",\"allow_sharing_email_addresses\",\"generate_link_preview\",\"typing_indicator\",\"reply_messages\",\"check_read_receipts\",\"delete_own_message\",\"download_attachments\",\"export_chat\",\"clear_chat_history\"],\"group_join_limit\":\"10\",\"flood_control_time_difference\":\"3\",\"daily_send_limit_group_messages\":\"0\",\"daily_send_limit_private_messages\":\"0\",\"delete_message_time_limit\":\"10\",\"storage\":[\"access_storage\",\"upload_files\",\"download_files\"],\"max_file_upload_size\":\"100\",\"maximum_storage_space\":\"500\",\"allowed_file_formats\":[\"image_files\",\"video_files\",\"audio_files\",\"documents\"],\"site_users\":[\"block_users\",\"ignore_users\",\"view_online_users\",\"view_nearby_users\"],\"profile\":[\"edit_profile\",\"change_full_name\",\"change_avatar\",\"upload_custom_avatar\",\"set_cover_pic\",\"switch_languages\",\"switch_color_scheme\"],\"audio_player\":[\"listen_music\"],\"complaints\":[\"report\",\"track_status\"]}', 'guest_users', 0, '2022-10-28 22:34:20');

-- --------------------------------------------------------

--
-- Table structure for table `gr_site_users`
--

CREATE TABLE `gr_site_users` (
  `user_id` bigint NOT NULL,
  `display_name` varchar(70) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Unknown',
  `username` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_address` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `unverified_email_address` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `verification_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `encrypt_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'php_password_hash' COMMENT 'md5,php_password_hash OR encrypt_method_id',
  `salt` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `site_role_id` bigint NOT NULL DEFAULT '1',
  `previous_site_role_id` bigint NOT NULL DEFAULT '3',
  `online_status` int NOT NULL DEFAULT '0' COMMENT '0 = Offline\r\n1 = Online\r\n2 = Idle',
  `stay_online` int NOT NULL DEFAULT '0',
  `approved` int NOT NULL DEFAULT '1',
  `geo_latitude` decimal(10,8) DEFAULT NULL,
  `geo_longitude` decimal(11,8) DEFAULT NULL,
  `total_friends` bigint DEFAULT '0',
  `social_login_provider_id` bigint DEFAULT NULL,
  `access_token` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token_generated_on` datetime DEFAULT '1970-01-02 00:00:00',
  `created_on` datetime NOT NULL,
  `updated_on` datetime NOT NULL,
  `last_seen_on` datetime DEFAULT NULL,
  `last_login_session` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `gr_site_users`
--

INSERT INTO `gr_site_users` (`user_id`, `display_name`, `username`, `email_address`, `unverified_email_address`, `verification_code`, `password`, `encrypt_type`, `salt`, `site_role_id`, `previous_site_role_id`, `online_status`, `stay_online`, `approved`, `geo_latitude`, `geo_longitude`, `total_friends`, `social_login_provider_id`, `access_token`, `token_generated_on`, `created_on`, `updated_on`, `last_seen_on`, `last_login_session`) VALUES
(1, 'Site Admin', 'admin', 'email@yourdomain.test', NULL, NULL, '$2y$10$lmQGd7o.Gk5ETXK6EhQMyOzSF2Lk6v/aAFBvawn1.rmhE8H0gEunO', 'php_password_hash', '', 2, 2, 0, 0, 1, '11.25875310', '75.78041000', 1, NULL, '', '1970-01-02 00:00:00', '2022-04-11 08:23:17', '2022-10-29 00:50:28', '2022-10-29 00:50:28', '2022-10-28 19:20:11');

-- --------------------------------------------------------

--
-- Table structure for table `gr_site_users_blacklist`
--

CREATE TABLE `gr_site_users_blacklist` (
  `user_blacklist_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `blacklisted_user_id` bigint NOT NULL,
  `ignore` int DEFAULT '0' COMMENT '0 = False\r\n1 = True',
  `block` int NOT NULL DEFAULT '0' COMMENT '0 = False\r\n1 = True',
  `updated_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gr_site_users_device_logs`
--

CREATE TABLE `gr_site_users_device_logs` (
  `access_log_id` bigint NOT NULL,
  `login_session_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `ip_address` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_agent` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gr_site_users_settings`
--

CREATE TABLE `gr_site_users_settings` (
  `user_setting_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `offline_mode` int NOT NULL DEFAULT '0',
  `time_zone` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'Australia/Sydney',
  `language_id` bigint DEFAULT NULL,
  `notification_tone` varchar(199) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `disable_private_messages` int NOT NULL DEFAULT '0',
  `deactivated` int DEFAULT '0',
  `color_scheme` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'default',
  `updated_on` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gr_social_login_providers`
--

CREATE TABLE `gr_social_login_providers` (
  `social_login_provider_id` int NOT NULL,
  `identity_provider` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `app_id` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `app_key` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `secret_key` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `open_in_popup` int NOT NULL DEFAULT '1',
  `create_user` int NOT NULL DEFAULT '0' COMMENT '0 = Don''t Create\r\n1 = Create',
  `disabled` int NOT NULL DEFAULT '0',
  `updated_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gr_typing_status`
--

CREATE TABLE `gr_typing_status` (
  `user_input_log_id` bigint NOT NULL,
  `group_id` bigint DEFAULT NULL,
  `private_conversation_id` bigint DEFAULT NULL,
  `user_id` bigint NOT NULL,
  `created_on` datetime NOT NULL,
  `updated_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `gr_audio_player`
--
ALTER TABLE `gr_audio_player`
  ADD PRIMARY KEY (`audio_content_id`),
  ADD KEY `idx__disabled` (`disabled`);

--
-- Indexes for table `gr_badges`
--
ALTER TABLE `gr_badges`
  ADD PRIMARY KEY (`badge_id`);

--
-- Indexes for table `gr_badges_assigned`
--
ALTER TABLE `gr_badges_assigned`
  ADD PRIMARY KEY (`badge_assigned_id`),
  ADD KEY `badge_id_fk` (`badge_id`),
  ADD KEY `user_id_fk_20` (`user_id`),
  ADD KEY `group_id_fk_8` (`group_id`);

--
-- Indexes for table `gr_complaints`
--
ALTER TABLE `gr_complaints`
  ADD PRIMARY KEY (`complaint_id`),
  ADD KEY `user_id_fk_7` (`complainant_user_id`),
  ADD KEY `idx__complaint_status_complaint_id` (`complaint_status`,`complaint_id`);

--
-- Indexes for table `gr_cron_jobs`
--
ALTER TABLE `gr_cron_jobs`
  ADD PRIMARY KEY (`cron_job_id`);

--
-- Indexes for table `gr_css_variables`
--
ALTER TABLE `gr_css_variables`
  ADD PRIMARY KEY (`css_variable_id`);

--
-- Indexes for table `gr_custom_fields`
--
ALTER TABLE `gr_custom_fields`
  ADD PRIMARY KEY (`field_id`),
  ADD KEY `idx__type_id` (`field_id`);

--
-- Indexes for table `gr_custom_fields_values`
--
ALTER TABLE `gr_custom_fields_values`
  ADD PRIMARY KEY (`field_value_id`),
  ADD KEY `field_id_fk` (`field_id`),
  ADD KEY `user_id_fk_6` (`user_id`),
  ADD KEY `group_id_fk_4` (`group_id`),
  ADD KEY `idx__user_id_field_id` (`user_id`,`field_id`);

--
-- Indexes for table `gr_custom_menu_items`
--
ALTER TABLE `gr_custom_menu_items`
  ADD PRIMARY KEY (`menu_item_id`),
  ADD KEY `page_id_fk` (`page_id`),
  ADD KEY `idx__menu_item_order` (`menu_item_order`);

--
-- Indexes for table `gr_custom_pages`
--
ALTER TABLE `gr_custom_pages`
  ADD PRIMARY KEY (`page_id`);

--
-- Indexes for table `gr_friends`
--
ALTER TABLE `gr_friends`
  ADD PRIMARY KEY (`friendship_id`),
  ADD KEY `user_id_fk_23` (`to_user_id`),
  ADD KEY `user_id_fk_22` (`from_user_id`) USING BTREE;

--
-- Indexes for table `gr_groups`
--
ALTER TABLE `gr_groups`
  ADD PRIMARY KEY (`group_id`),
  ADD KEY `idx__secret_group_suspended_pin_group` (`secret_group`,`suspended`,`pin_group`);

--
-- Indexes for table `gr_group_invitations`
--
ALTER TABLE `gr_group_invitations`
  ADD PRIMARY KEY (`group_invitation_id`),
  ADD KEY `group_id_fk_6` (`group_id`),
  ADD KEY `user_id_fk_9` (`user_id`);

--
-- Indexes for table `gr_group_members`
--
ALTER TABLE `gr_group_members`
  ADD PRIMARY KEY (`group_member_id`),
  ADD KEY `group_id_fk` (`group_id`),
  ADD KEY `user_id_fk` (`user_id`),
  ADD KEY `group_role_id_fk` (`group_role_id`),
  ADD KEY `idx__user_id_group_id` (`user_id`,`group_id`),
  ADD KEY `idx__group_id_user_id` (`group_id`,`user_id`),
  ADD KEY `idx__user_id_last_read_message_id` (`user_id`,`last_read_message_id`),
  ADD KEY `idx__user_id_group_role_id` (`user_id`,`group_role_id`),
  ADD KEY `idx__last_read_message_id` (`last_read_message_id`),
  ADD KEY `idx__group_id_group_member_id` (`group_id`,`group_member_id`);

--
-- Indexes for table `gr_group_messages`
--
ALTER TABLE `gr_group_messages`
  ADD PRIMARY KEY (`group_message_id`),
  ADD KEY `group_id_fk_2` (`group_id`),
  ADD KEY `user_id_fk_2` (`user_id`),
  ADD KEY `group_message_id_fk_3` (`parent_message_id`),
  ADD KEY `idx__group_id_group_message_id` (`group_id`,`group_message_id`),
  ADD KEY `idx__attachment_type_group_id_group_message_id` (`attachment_type`,`group_id`,`group_message_id`);

--
-- Indexes for table `gr_group_messages_reactions`
--
ALTER TABLE `gr_group_messages_reactions`
  ADD PRIMARY KEY (`group_message_reaction_id`),
  ADD KEY `group_message_id_fk_4` (`group_message_id`),
  ADD KEY `user_id_fk_10` (`user_id`);

--
-- Indexes for table `gr_group_roles`
--
ALTER TABLE `gr_group_roles`
  ADD PRIMARY KEY (`group_role_id`);

--
-- Indexes for table `gr_languages`
--
ALTER TABLE `gr_languages`
  ADD PRIMARY KEY (`language_id`);

--
-- Indexes for table `gr_language_strings`
--
ALTER TABLE `gr_language_strings`
  ADD PRIMARY KEY (`string_id`),
  ADD KEY `language_id_fk` (`language_id`),
  ADD KEY `idx__string_constant` (`string_constant`(16)),
  ADD KEY `idx__skip_cache_skip_update_language_id` (`skip_cache`,`skip_update`,`language_id`);

--
-- Indexes for table `gr_login_sessions`
--
ALTER TABLE `gr_login_sessions`
  ADD PRIMARY KEY (`login_session_id`),
  ADD KEY `user_id_fk_3` (`user_id`);

--
-- Indexes for table `gr_mailbox`
--
ALTER TABLE `gr_mailbox`
  ADD PRIMARY KEY (`mail_id`),
  ADD KEY `user_id_fk_11` (`user_id`);

--
-- Indexes for table `gr_private_chat_messages`
--
ALTER TABLE `gr_private_chat_messages`
  ADD PRIMARY KEY (`private_chat_message_id`),
  ADD KEY `private_conversation_id_fk` (`private_conversation_id`),
  ADD KEY `user_id_fk_12` (`user_id`),
  ADD KEY `private_message_id_fk_2` (`parent_message_id`),
  ADD KEY `idx__read_status_private_conversation_id_user_id` (`read_status`,`private_conversation_id`,`user_id`),
  ADD KEY `idx__user_id_read_status_private_conversation_id` (`user_id`,`read_status`,`private_conversation_id`);

--
-- Indexes for table `gr_private_conversations`
--
ALTER TABLE `gr_private_conversations`
  ADD PRIMARY KEY (`private_conversation_id`),
  ADD KEY `idx__initiator_user_id_recipient_user_id` (`initiator_user_id`,`recipient_user_id`),
  ADD KEY `idx__recipient_user_id_initiator_user_id` (`recipient_user_id`,`initiator_user_id`);

--
-- Indexes for table `gr_push_subscriptions`
--
ALTER TABLE `gr_push_subscriptions`
  ADD PRIMARY KEY (`push_subscriber_id`),
  ADD KEY `user_id_fk_21` (`user_id`);

--
-- Indexes for table `gr_realtime_logs`
--
ALTER TABLE `gr_realtime_logs`
  ADD PRIMARY KEY (`realtime_log_id`);

--
-- Indexes for table `gr_settings`
--
ALTER TABLE `gr_settings`
  ADD PRIMARY KEY (`setting_id`);

--
-- Indexes for table `gr_site_advertisements`
--
ALTER TABLE `gr_site_advertisements`
  ADD PRIMARY KEY (`site_advert_id`);

--
-- Indexes for table `gr_site_notifications`
--
ALTER TABLE `gr_site_notifications`
  ADD PRIMARY KEY (`notification_id`),
  ADD KEY `idx__user_id_read_status` (`user_id`,`read_status`);

--
-- Indexes for table `gr_site_roles`
--
ALTER TABLE `gr_site_roles`
  ADD PRIMARY KEY (`site_role_id`);

--
-- Indexes for table `gr_site_users`
--
ALTER TABLE `gr_site_users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `name` (`username`),
  ADD UNIQUE KEY `email` (`email_address`),
  ADD KEY `site_role_id_fk` (`site_role_id`),
  ADD KEY `idx__online_status` (`online_status`),
  ADD KEY `idx__last_login_session` (`last_login_session`),
  ADD KEY `idx__updated_on` (`updated_on`);

--
-- Indexes for table `gr_site_users_blacklist`
--
ALTER TABLE `gr_site_users_blacklist`
  ADD PRIMARY KEY (`user_blacklist_id`),
  ADD KEY `idx__blacklisted_user_id_user_id` (`blacklisted_user_id`,`user_id`),
  ADD KEY `idx__user_id_blacklisted_user_id` (`user_id`,`blacklisted_user_id`),
  ADD KEY `idx__user_id_ignore` (`user_id`,`ignore`),
  ADD KEY `idx__user_id_block` (`user_id`,`block`);

--
-- Indexes for table `gr_site_users_device_logs`
--
ALTER TABLE `gr_site_users_device_logs`
  ADD PRIMARY KEY (`access_log_id`),
  ADD KEY `user_id_fk_18` (`user_id`);

--
-- Indexes for table `gr_site_users_settings`
--
ALTER TABLE `gr_site_users_settings`
  ADD PRIMARY KEY (`user_setting_id`),
  ADD UNIQUE KEY `user_id` (`user_id`),
  ADD KEY `user_id_fk_4` (`user_id`),
  ADD KEY `language_id_fk_2` (`language_id`);

--
-- Indexes for table `gr_social_login_providers`
--
ALTER TABLE `gr_social_login_providers`
  ADD PRIMARY KEY (`social_login_provider_id`);

--
-- Indexes for table `gr_typing_status`
--
ALTER TABLE `gr_typing_status`
  ADD PRIMARY KEY (`user_input_log_id`),
  ADD KEY `user_id_fk_19` (`user_id`),
  ADD KEY `private_conversation_id_fk_2` (`private_conversation_id`),
  ADD KEY `group_id_fk_7` (`group_id`),
  ADD KEY `idx__group_id_user_id` (`group_id`,`user_id`),
  ADD KEY `idx__group_id_updated_on` (`group_id`,`updated_on`),
  ADD KEY `idx__private_conversation_id_user_id` (`private_conversation_id`,`user_id`),
  ADD KEY `idx__private_conversation_id_updated_on` (`private_conversation_id`,`updated_on`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `gr_audio_player`
--
ALTER TABLE `gr_audio_player`
  MODIFY `audio_content_id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gr_badges`
--
ALTER TABLE `gr_badges`
  MODIFY `badge_id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gr_badges_assigned`
--
ALTER TABLE `gr_badges_assigned`
  MODIFY `badge_assigned_id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gr_complaints`
--
ALTER TABLE `gr_complaints`
  MODIFY `complaint_id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gr_cron_jobs`
--
ALTER TABLE `gr_cron_jobs`
  MODIFY `cron_job_id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gr_css_variables`
--
ALTER TABLE `gr_css_variables`
  MODIFY `css_variable_id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=427;

--
-- AUTO_INCREMENT for table `gr_custom_fields`
--
ALTER TABLE `gr_custom_fields`
  MODIFY `field_id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `gr_custom_fields_values`
--
ALTER TABLE `gr_custom_fields_values`
  MODIFY `field_value_id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `gr_custom_menu_items`
--
ALTER TABLE `gr_custom_menu_items`
  MODIFY `menu_item_id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `gr_custom_pages`
--
ALTER TABLE `gr_custom_pages`
  MODIFY `page_id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `gr_friends`
--
ALTER TABLE `gr_friends`
  MODIFY `friendship_id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gr_groups`
--
ALTER TABLE `gr_groups`
  MODIFY `group_id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gr_group_invitations`
--
ALTER TABLE `gr_group_invitations`
  MODIFY `group_invitation_id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gr_group_members`
--
ALTER TABLE `gr_group_members`
  MODIFY `group_member_id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gr_group_messages`
--
ALTER TABLE `gr_group_messages`
  MODIFY `group_message_id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gr_group_messages_reactions`
--
ALTER TABLE `gr_group_messages_reactions`
  MODIFY `group_message_reaction_id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gr_group_roles`
--
ALTER TABLE `gr_group_roles`
  MODIFY `group_role_id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `gr_languages`
--
ALTER TABLE `gr_languages`
  MODIFY `language_id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `gr_language_strings`
--
ALTER TABLE `gr_language_strings`
  MODIFY `string_id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1145;

--
-- AUTO_INCREMENT for table `gr_login_sessions`
--
ALTER TABLE `gr_login_sessions`
  MODIFY `login_session_id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gr_mailbox`
--
ALTER TABLE `gr_mailbox`
  MODIFY `mail_id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gr_private_chat_messages`
--
ALTER TABLE `gr_private_chat_messages`
  MODIFY `private_chat_message_id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gr_private_conversations`
--
ALTER TABLE `gr_private_conversations`
  MODIFY `private_conversation_id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gr_push_subscriptions`
--
ALTER TABLE `gr_push_subscriptions`
  MODIFY `push_subscriber_id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gr_realtime_logs`
--
ALTER TABLE `gr_realtime_logs`
  MODIFY `realtime_log_id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gr_settings`
--
ALTER TABLE `gr_settings`
  MODIFY `setting_id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=126;

--
-- AUTO_INCREMENT for table `gr_site_advertisements`
--
ALTER TABLE `gr_site_advertisements`
  MODIFY `site_advert_id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gr_site_notifications`
--
ALTER TABLE `gr_site_notifications`
  MODIFY `notification_id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gr_site_roles`
--
ALTER TABLE `gr_site_roles`
  MODIFY `site_role_id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `gr_site_users`
--
ALTER TABLE `gr_site_users`
  MODIFY `user_id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `gr_site_users_blacklist`
--
ALTER TABLE `gr_site_users_blacklist`
  MODIFY `user_blacklist_id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gr_site_users_device_logs`
--
ALTER TABLE `gr_site_users_device_logs`
  MODIFY `access_log_id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gr_site_users_settings`
--
ALTER TABLE `gr_site_users_settings`
  MODIFY `user_setting_id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gr_social_login_providers`
--
ALTER TABLE `gr_social_login_providers`
  MODIFY `social_login_provider_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gr_typing_status`
--
ALTER TABLE `gr_typing_status`
  MODIFY `user_input_log_id` bigint NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `gr_badges_assigned`
--
ALTER TABLE `gr_badges_assigned`
  ADD CONSTRAINT `badge_id_fk` FOREIGN KEY (`badge_id`) REFERENCES `gr_badges` (`badge_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `group_id_fk_8` FOREIGN KEY (`group_id`) REFERENCES `gr_groups` (`group_id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  ADD CONSTRAINT `user_id_fk_20` FOREIGN KEY (`user_id`) REFERENCES `gr_site_users` (`user_id`) ON DELETE CASCADE ON UPDATE RESTRICT;

--
-- Constraints for table `gr_complaints`
--
ALTER TABLE `gr_complaints`
  ADD CONSTRAINT `user_id_fk_7` FOREIGN KEY (`complainant_user_id`) REFERENCES `gr_site_users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `gr_custom_fields_values`
--
ALTER TABLE `gr_custom_fields_values`
  ADD CONSTRAINT `field_id_fk` FOREIGN KEY (`field_id`) REFERENCES `gr_custom_fields` (`field_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `group_id_fk_4` FOREIGN KEY (`group_id`) REFERENCES `gr_groups` (`group_id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  ADD CONSTRAINT `user_id_fk_6` FOREIGN KEY (`user_id`) REFERENCES `gr_site_users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `gr_custom_menu_items`
--
ALTER TABLE `gr_custom_menu_items`
  ADD CONSTRAINT `page_id_fk` FOREIGN KEY (`page_id`) REFERENCES `gr_custom_pages` (`page_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `gr_friends`
--
ALTER TABLE `gr_friends`
  ADD CONSTRAINT `user_id_fk_22` FOREIGN KEY (`from_user_id`) REFERENCES `gr_site_users` (`user_id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  ADD CONSTRAINT `user_id_fk_23` FOREIGN KEY (`to_user_id`) REFERENCES `gr_site_users` (`user_id`) ON DELETE CASCADE ON UPDATE RESTRICT;

--
-- Constraints for table `gr_group_invitations`
--
ALTER TABLE `gr_group_invitations`
  ADD CONSTRAINT `group_id_fk_6` FOREIGN KEY (`group_id`) REFERENCES `gr_groups` (`group_id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  ADD CONSTRAINT `user_id_fk_9` FOREIGN KEY (`user_id`) REFERENCES `gr_site_users` (`user_id`) ON DELETE CASCADE ON UPDATE RESTRICT;

--
-- Constraints for table `gr_group_members`
--
ALTER TABLE `gr_group_members`
  ADD CONSTRAINT `group_id_fk` FOREIGN KEY (`group_id`) REFERENCES `gr_groups` (`group_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `group_role_id_fk` FOREIGN KEY (`group_role_id`) REFERENCES `gr_group_roles` (`group_role_id`) ON UPDATE RESTRICT,
  ADD CONSTRAINT `user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `gr_site_users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `gr_group_messages`
--
ALTER TABLE `gr_group_messages`
  ADD CONSTRAINT `group_id_fk_2` FOREIGN KEY (`group_id`) REFERENCES `gr_groups` (`group_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `group_message_id_fk_3` FOREIGN KEY (`parent_message_id`) REFERENCES `gr_group_messages` (`group_message_id`) ON DELETE SET NULL ON UPDATE RESTRICT,
  ADD CONSTRAINT `user_id_fk_2` FOREIGN KEY (`user_id`) REFERENCES `gr_site_users` (`user_id`) ON DELETE CASCADE ON UPDATE RESTRICT;

--
-- Constraints for table `gr_group_messages_reactions`
--
ALTER TABLE `gr_group_messages_reactions`
  ADD CONSTRAINT `group_message_id_fk_4` FOREIGN KEY (`group_message_id`) REFERENCES `gr_group_messages` (`group_message_id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  ADD CONSTRAINT `user_id_fk_10` FOREIGN KEY (`user_id`) REFERENCES `gr_site_users` (`user_id`) ON DELETE CASCADE ON UPDATE RESTRICT;

--
-- Constraints for table `gr_language_strings`
--
ALTER TABLE `gr_language_strings`
  ADD CONSTRAINT `language_id_fk` FOREIGN KEY (`language_id`) REFERENCES `gr_languages` (`language_id`) ON DELETE CASCADE ON UPDATE RESTRICT;

--
-- Constraints for table `gr_login_sessions`
--
ALTER TABLE `gr_login_sessions`
  ADD CONSTRAINT `user_id_fk_3` FOREIGN KEY (`user_id`) REFERENCES `gr_site_users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `gr_mailbox`
--
ALTER TABLE `gr_mailbox`
  ADD CONSTRAINT `user_id_fk_11` FOREIGN KEY (`user_id`) REFERENCES `gr_site_users` (`user_id`) ON DELETE CASCADE ON UPDATE RESTRICT;

--
-- Constraints for table `gr_private_chat_messages`
--
ALTER TABLE `gr_private_chat_messages`
  ADD CONSTRAINT `private_conversation_id_fk` FOREIGN KEY (`private_conversation_id`) REFERENCES `gr_private_conversations` (`private_conversation_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `private_message_id_fk_2` FOREIGN KEY (`parent_message_id`) REFERENCES `gr_private_chat_messages` (`private_chat_message_id`) ON DELETE SET NULL ON UPDATE RESTRICT,
  ADD CONSTRAINT `user_id_fk_12` FOREIGN KEY (`user_id`) REFERENCES `gr_site_users` (`user_id`) ON DELETE CASCADE ON UPDATE RESTRICT;

--
-- Constraints for table `gr_private_conversations`
--
ALTER TABLE `gr_private_conversations`
  ADD CONSTRAINT `user_id_fk_13` FOREIGN KEY (`recipient_user_id`) REFERENCES `gr_site_users` (`user_id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  ADD CONSTRAINT `user_id_fk_14` FOREIGN KEY (`initiator_user_id`) REFERENCES `gr_site_users` (`user_id`) ON DELETE CASCADE ON UPDATE RESTRICT;

--
-- Constraints for table `gr_push_subscriptions`
--
ALTER TABLE `gr_push_subscriptions`
  ADD CONSTRAINT `user_id_fk_21` FOREIGN KEY (`user_id`) REFERENCES `gr_site_users` (`user_id`) ON DELETE CASCADE ON UPDATE RESTRICT;

--
-- Constraints for table `gr_site_notifications`
--
ALTER TABLE `gr_site_notifications`
  ADD CONSTRAINT `user_id_fk_15` FOREIGN KEY (`user_id`) REFERENCES `gr_site_users` (`user_id`) ON DELETE CASCADE ON UPDATE RESTRICT;

--
-- Constraints for table `gr_site_users`
--
ALTER TABLE `gr_site_users`
  ADD CONSTRAINT `site_role_id_fk` FOREIGN KEY (`site_role_id`) REFERENCES `gr_site_roles` (`site_role_id`);

--
-- Constraints for table `gr_site_users_blacklist`
--
ALTER TABLE `gr_site_users_blacklist`
  ADD CONSTRAINT `user_id_fk_16` FOREIGN KEY (`user_id`) REFERENCES `gr_site_users` (`user_id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  ADD CONSTRAINT `user_id_fk_17` FOREIGN KEY (`blacklisted_user_id`) REFERENCES `gr_site_users` (`user_id`) ON DELETE CASCADE ON UPDATE RESTRICT;

--
-- Constraints for table `gr_site_users_device_logs`
--
ALTER TABLE `gr_site_users_device_logs`
  ADD CONSTRAINT `user_id_fk_18` FOREIGN KEY (`user_id`) REFERENCES `gr_site_users` (`user_id`) ON DELETE CASCADE ON UPDATE RESTRICT;

--
-- Constraints for table `gr_site_users_settings`
--
ALTER TABLE `gr_site_users_settings`
  ADD CONSTRAINT `language_id_fk_2` FOREIGN KEY (`language_id`) REFERENCES `gr_languages` (`language_id`) ON DELETE SET NULL ON UPDATE RESTRICT,
  ADD CONSTRAINT `user_id_fk_4` FOREIGN KEY (`user_id`) REFERENCES `gr_site_users` (`user_id`) ON DELETE CASCADE ON UPDATE RESTRICT;

--
-- Constraints for table `gr_typing_status`
--
ALTER TABLE `gr_typing_status`
  ADD CONSTRAINT `group_id_fk_7` FOREIGN KEY (`group_id`) REFERENCES `gr_groups` (`group_id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  ADD CONSTRAINT `private_conversation_id_fk_2` FOREIGN KEY (`private_conversation_id`) REFERENCES `gr_private_conversations` (`private_conversation_id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  ADD CONSTRAINT `user_id_fk_19` FOREIGN KEY (`user_id`) REFERENCES `gr_site_users` (`user_id`) ON DELETE CASCADE ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
