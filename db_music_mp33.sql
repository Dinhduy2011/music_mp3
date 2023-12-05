-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th10 10, 2023 lúc 08:39 AM
-- Phiên bản máy phục vụ: 10.4.17-MariaDB
-- Phiên bản PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `db_music_mp3`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(24) NOT NULL,
  `password` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`) VALUES
(1, 'admin', '$2y$10$hGg02aSLIpMkAAXngodN8Om2PeOw4jvNPKNP6AVZz3gPdmQ0I1Fx2');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `blocked`
--

CREATE TABLE `blocked` (
  `id` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`id`, `name`) VALUES
(21, 'Classical'),
(22, 'Country'),
(23, 'Electronic'),
(25, 'Hip-Hop'),
(26, 'Jazz'),
(27, 'Metal'),
(28, 'Pop'),
(29, 'Reggae'),
(30, 'World'),
(31, 'Business'),
(32, 'Comedy'),
(33, 'Entertainment'),
(34, 'Learning');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chat`
--

CREATE TABLE `chat` (
  `id` int(11) NOT NULL,
  `from` int(11) NOT NULL,
  `to` int(11) NOT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `read` int(11) NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `tid` int(11) NOT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `downloads`
--

CREATE TABLE `downloads` (
  `id` int(11) NOT NULL,
  `by` int(11) NOT NULL,
  `track` int(11) NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `info_pages`
--

CREATE TABLE `info_pages` (
  `id` int(11) NOT NULL,
  `title` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `public` tinyint(4) NOT NULL,
  `content` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `info_pages`
--

INSERT INTO `info_pages` (`id`, `title`, `url`, `public`, `content`) VALUES
(1, '{$lng->developers}', 'developers', 1, 'Our API allows you to retrieve informations from our website via <strong>GET</strong> request and supports the following query parameters:\r\n						<br><br>\r\n						<table border=\"1\" width=\"100%\">\r\n							<tr>\r\n								<td width=\"20%\" valign=\"top\">Name</td>\r\n								<td width=\"20%\" valign=\"top\">Meaning</td>\r\n								<td width=\"60%\" valign=\"top\">Description</td>\r\n							</tr>\r\n							<tr>\r\n								<td width=\"20%\" valign=\"top\"><strong>t (required)</strong></td>\r\n								<td width=\"20%\" valign=\"top\">Query type.</td>\r\n								<td width=\"60%\" valign=\"top\">This parameter specify the type of the query, <strong><code>u</code></strong> is for profile informations, <strong><code>t</code></strong> is for tracks informations.</td>\r\n							</tr>\r\n							<tr>\r\n								<td width=\"20%\" valign=\"top\"><strong>q (required)</strong></td>\r\n								<td width=\"20%\" valign=\"top\">Requested <strong>username</strong>.</td>\r\n								<td width=\"60%\" valign=\"top\">The <code>t</code> parameter supports two values: \r\n								<ul>\r\n									<li>u = <strong>username</strong> [returns basic profile informations containing the following]\r\n										<ul>\r\n											<li><code>id</code> = returns the unique user id</li>\r\n											<li><code>username</code> = returns the username</li>\r\n											<li><code>first_name</code> = returns the first name</li>\r\n											<li><code>last_name</code> = returns the last bame</li></li>\r\n											<li><code>website</code> = returns the website</li></li>\r\n											<li><code>country</code> = returns the country</li></li>\r\n											<li><code>city</code> = returns the city</li></li>\r\n											<li><code>image</code> = returns the profile avatar image</li></li>\r\n											<li><code>cover</code> = returns the profile cover image</li></li>\r\n										</ul>\r\n									</li>\r\n										\r\n									<li>t = <strong>username</strong> [returns a list of latest 20 tracks uploaded by a user containing the following]\r\n										<ul>\r\n											<li><code>id</code> = returns the unique track id</li>\r\n											<li><code>by</code> = returns the unique user id</li>\r\n											<li><code>title</code> = returns the track title</li>\r\n											<li><code>description</code> = returns the description of the track</li>\r\n											<li><code>art</code> = returns the track artwork image</li>\r\n											<li><code>tag</code> = returns the tag list</li>\r\n											<li><code>buy</code> = returns the purchase url</li>\r\n											<li><code>record</code> = returns the record label</li></li>\r\n											<li><code>release</code> = returns the release date</li></li>\r\n											<li><code>license</code> = returns the license type</li></li>\r\n											<li><code>time</code> = returns the date time when was published</li>\r\n											<li><code>likes</code> = returns the number of likes</li>\r\n											<li><code>views</code> = returns the number of views (times played)</li>\r\n										</ul>\r\n									</li>\r\n								</ul></td>\r\n							</tr>\r\n						</table>\r\n						<br>\r\n						<div class=\"divider\"></div>\r\n						<br>\r\n						<div id=\"jump-url\"><strong>Examples of requests:</strong></div><br>\r\n						For profile information of a user:\r\n						<br>\r\n						<code class=\"api-request\">{$site_url}/api.php?t=u&q=USERNAME</code>\r\n						<br><br>\r\n						For a list of latest 20 tracks uploaded by a user:\r\n						<br>\r\n						<code class=\"api-request\">{$site_url}/api.php?t=t&q=USERNAME</code>\r\n						<br><br>\r\n						<div class=\"divider\"></div>\r\n						<br>\r\n						An example of <strong>json</strong> decoding would be the following PHP code:\r\n						<br><br>\r\n						<code>\r\n						&lt;?php<br>\r\n							header(\'Content-Type: text/plain; charset=utf-8;\');\r\n							<br>\r\n							$file = file_get_contents(\"{$site_url}/api.php?t=t&q=USERNAME\");<br>\r\n							print_r(json_decode($file));<br>\r\n						?&gt;\r\n						</code>');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `likes`
--

CREATE TABLE `likes` (
  `id` int(11) NOT NULL,
  `track` int(11) NOT NULL,
  `by` int(11) NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `newsletters`
--

CREATE TABLE `newsletters` (
  `id` int(11) NOT NULL,
  `title` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `from` int(11) NOT NULL,
  `to` int(11) NOT NULL DEFAULT 0,
  `parent` int(11) NOT NULL DEFAULT 0,
  `child` int(11) NOT NULL DEFAULT 0,
  `type` int(11) NOT NULL,
  `read` int(11) NOT NULL DEFAULT 0,
  `time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `payments`
--

CREATE TABLE `payments` (
  `id` int(11) NOT NULL,
  `by` int(11) NOT NULL,
  `payer_id` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `payer_first_name` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `payer_last_name` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `payer_email` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `payer_country` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `txn_id` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `amount` decimal(10,0) NOT NULL,
  `currency` varchar(3) COLLATE utf8_unicode_ci NOT NULL,
  `type` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `valid` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `time` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `playlistentries`
--

CREATE TABLE `playlistentries` (
  `id` int(11) NOT NULL,
  `playlist` int(11) NOT NULL,
  `track` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `playlists`
--

CREATE TABLE `playlists` (
  `id` int(11) NOT NULL,
  `by` int(11) NOT NULL,
  `name` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `public` int(11) NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `relations`
--

CREATE TABLE `relations` (
  `id` int(11) NOT NULL,
  `leader` int(11) NOT NULL,
  `subscriber` int(11) NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `reports`
--

CREATE TABLE `reports` (
  `id` int(12) NOT NULL,
  `track` varchar(11) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `parent` int(11) NOT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `type` int(11) NOT NULL,
  `by` int(11) NOT NULL,
  `state` int(11) NOT NULL DEFAULT 0,
  `time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `settings`
--

CREATE TABLE `settings` (
  `title` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `theme` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `perpage` int(11) NOT NULL,
  `volume` varchar(4) NOT NULL,
  `captcha` int(11) NOT NULL,
  `intervaln` int(11) NOT NULL,
  `time` int(11) NOT NULL,
  `size` int(11) NOT NULL,
  `format` varchar(256) NOT NULL,
  `mail` int(11) NOT NULL,
  `artsize` int(11) NOT NULL,
  `artformat` varchar(256) NOT NULL,
  `tracksize` int(11) NOT NULL,
  `trackformat` varchar(128) NOT NULL,
  `tracksizetotal` bigint(12) NOT NULL,
  `cperpage` int(11) NOT NULL,
  `ilimit` int(11) NOT NULL,
  `mlimit` int(11) NOT NULL,
  `rperpage` int(11) NOT NULL,
  `sperpage` int(11) NOT NULL,
  `nperpage` tinyint(4) NOT NULL,
  `nperwidget` tinyint(4) NOT NULL,
  `lperpost` int(11) NOT NULL,
  `aperip` int(11) NOT NULL,
  `conline` int(4) NOT NULL,
  `ronline` tinyint(4) NOT NULL,
  `mperpage` tinyint(4) NOT NULL,
  `chatr` int(11) NOT NULL,
  `email_activation` tinyint(4) NOT NULL,
  `email_comment` tinyint(4) NOT NULL,
  `email_like` tinyint(4) NOT NULL,
  `email_new_friend` tinyint(4) NOT NULL,
  `smiles` tinyint(4) NOT NULL,
  `permalinks` tinyint(4) NOT NULL,
  `fbapp` int(11) NOT NULL,
  `fbappid` varchar(128) NOT NULL,
  `fbappsecret` varchar(128) NOT NULL,
  `smtp_email` int(11) NOT NULL,
  `smtp_host` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `smtp_port` int(11) NOT NULL,
  `smtp_secure` varchar(32) NOT NULL,
  `smtp_auth` int(11) NOT NULL,
  `smtp_username` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `smtp_password` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `language` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `timezone` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `as3` int(11) NOT NULL,
  `as3_key` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `as3_secret` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `as3_region` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `as3_bucket` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `paypalapp` int(11) NOT NULL,
  `paypaluser` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `paypalpass` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `paypalsign` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `paypalsand` int(11) NOT NULL,
  `currency` varchar(3) NOT NULL,
  `promonth` decimal(6,2) NOT NULL,
  `proyear` decimal(6,2) NOT NULL,
  `protracksize` int(11) NOT NULL,
  `protracktotal` bigint(12) NOT NULL,
  `ad1` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `ad2` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `ad3` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `ad4` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `ad5` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `ad6` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `ad7` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `tracking_code` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `settings`
--

INSERT INTO `settings` (`title`, `theme`, `perpage`, `volume`, `captcha`, `intervaln`, `time`, `size`, `format`, `mail`, `artsize`, `artformat`, `tracksize`, `trackformat`, `tracksizetotal`, `cperpage`, `ilimit`, `mlimit`, `rperpage`, `sperpage`, `nperpage`, `nperwidget`, `lperpost`, `aperip`, `conline`, `ronline`, `mperpage`, `chatr`, `email_activation`, `email_comment`, `email_like`, `email_new_friend`, `smiles`, `permalinks`, `fbapp`, `fbappid`, `fbappsecret`, `smtp_email`, `smtp_host`, `smtp_port`, `smtp_secure`, `smtp_auth`, `smtp_username`, `smtp_password`, `language`, `timezone`, `as3`, `as3_key`, `as3_secret`, `as3_region`, `as3_bucket`, `paypalapp`, `paypaluser`, `paypalpass`, `paypalsign`, `paypalsand`, `currency`, `promonth`, `proyear`, `protracksize`, `protracktotal`, `ad1`, `ad2`, `ad3`, `ad4`, `ad5`, `ad6`, `ad7`, `tracking_code`) VALUES
('phpSound', 'sound', 10, '0.80', 0, 60000, 0, 2097152, 'png,jpg,gif,jpeg', 1, 2097152, 'png,jpg,gif,jpeg', 5242880, 'mp3,m4a,mp4', 104857600, 10, 9, 1000, 20, 10, 100, 30, 5, 0, 600, 7, 10, 30, 0, 1, 1, 1, 1, 0, 0, '', '', 0, '', 0, '', 0, '', '', 'english', '', 0, '', '', '', '', 0, '', '', '', 0, 'USD', '3.00', '29.00', 52428800, 1073741824, '', '', '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tracks`
--

CREATE TABLE `tracks` (
  `id` int(12) NOT NULL,
  `uid` int(32) NOT NULL,
  `title` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(512) COLLATE utf8_unicode_ci NOT NULL,
  `tag` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `art` varchar(512) COLLATE utf8_unicode_ci NOT NULL,
  `buy` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `record` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `release` date DEFAULT NULL,
  `license` int(11) NOT NULL,
  `size` int(11) NOT NULL,
  `as3_track` int(11) NOT NULL,
  `download` int(11) NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `public` int(11) NOT NULL,
  `likes` int(11) NOT NULL DEFAULT 0,
  `downloads` int(11) NOT NULL DEFAULT 0,
  `views` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `idu` int(11) NOT NULL,
  `username` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(256) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(256) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `first_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `country` varchar(64) NOT NULL DEFAULT '',
  `city` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `website` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` varchar(160) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `date` date DEFAULT NULL,
  `facebook` varchar(256) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `twitter` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `gplus` varchar(256) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `youtube` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `vimeo` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tumblr` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `soundcloud` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `myspace` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `lastfm` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `image` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `private` int(11) NOT NULL DEFAULT 0,
  `suspended` int(11) NOT NULL DEFAULT 0,
  `salted` varchar(256) NOT NULL DEFAULT '',
  `login_token` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `cover` varchar(128) NOT NULL,
  `gender` tinyint(4) NOT NULL DEFAULT 0,
  `online` int(11) NOT NULL DEFAULT 0,
  `offline` tinyint(4) NOT NULL DEFAULT 0,
  `ip` varchar(45) NOT NULL,
  `notificationl` tinyint(4) NOT NULL,
  `notificationc` tinyint(4) NOT NULL,
  `notificationd` tinyint(4) NOT NULL,
  `notificationf` tinyint(4) NOT NULL,
  `email_comment` tinyint(4) NOT NULL,
  `email_like` tinyint(4) NOT NULL,
  `email_new_friend` tinyint(4) NOT NULL,
  `email_newsletter` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`idu`, `username`, `password`, `email`, `first_name`, `last_name`, `country`, `city`, `website`, `description`, `date`, `facebook`, `twitter`, `gplus`, `youtube`, `vimeo`, `tumblr`, `soundcloud`, `myspace`, `lastfm`, `image`, `private`, `suspended`, `salted`, `login_token`, `cover`, `gender`, `online`, `offline`, `ip`, `notificationl`, `notificationc`, `notificationd`, `notificationf`, `email_comment`, `email_like`, `email_new_friend`, `email_newsletter`) VALUES
(1, 'admin', '$2y$10$nJ4sSBNMn5etHVEhaUCaD.3OwYfQTsnGxo/0K4AHCRnB.cqTDvteK', 'admin@admin.com', '', '', '', '', '', '', '2020-03-13', '', '', '', '', '', '', '', '', '', 'default.png', 0, 0, '', NULL, 'default.png', 0, 1584111694, 0, '::1', 1, 1, 1, 1, 1, 1, 1, 1),
(2, 'dinhduy', '$2y$10$EY9Uy4Fvgu9ugCHM/H6yIeOXDFOKvi..zoebXMOIzdBiXmZwnbWg6', 'dinhduy20112001@gmail.com', '', '', '', '', '', '', '2023-10-10', '', '', '', '', '', '', '', '', '', 'default.png', 0, 0, '', NULL, 'default.png', 0, 1696919922, 0, '::1', 1, 1, 1, 1, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `views`
--

CREATE TABLE `views` (
  `id` int(11) NOT NULL,
  `by` int(11) NOT NULL,
  `track` int(11) NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `views`
--

INSERT INTO `views` (`id`, `by`, `track`, `time`) VALUES
(1, 1, 1, '2020-03-13 14:56:57');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `blocked`
--
ALTER TABLE `blocked`
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `uid` (`uid`,`by`);

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `chat`
--
ALTER TABLE `chat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `from` (`from`,`to`,`read`),
  ADD KEY `to` (`to`,`read`);

--
-- Chỉ mục cho bảng `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`),
  ADD KEY `tid` (`tid`),
  ADD KEY `time` (`time`);

--
-- Chỉ mục cho bảng `downloads`
--
ALTER TABLE `downloads`
  ADD PRIMARY KEY (`id`),
  ADD KEY `track` (`track`),
  ADD KEY `by` (`by`);

--
-- Chỉ mục cho bảng `info_pages`
--
ALTER TABLE `info_pages`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `time` (`time`),
  ADD KEY `by` (`by`);

--
-- Chỉ mục cho bảng `newsletters`
--
ALTER TABLE `newsletters`
  ADD UNIQUE KEY `id` (`id`);

--
-- Chỉ mục cho bảng `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `to` (`to`,`type`,`read`),
  ADD KEY `from` (`from`,`type`);

--
-- Chỉ mục cho bảng `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `by` (`by`);

--
-- Chỉ mục cho bảng `playlistentries`
--
ALTER TABLE `playlistentries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `playlist` (`playlist`);

--
-- Chỉ mục cho bảng `playlists`
--
ALTER TABLE `playlists`
  ADD PRIMARY KEY (`id`),
  ADD KEY `by` (`by`),
  ADD KEY `name` (`name`);

--
-- Chỉ mục cho bảng `relations`
--
ALTER TABLE `relations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `subscriber` (`subscriber`),
  ADD KEY `leader` (`leader`),
  ADD KEY `leader_2` (`leader`,`subscriber`);

--
-- Chỉ mục cho bảng `reports`
--
ALTER TABLE `reports`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `state` (`state`),
  ADD KEY `time` (`time`);

--
-- Chỉ mục cho bảng `tracks`
--
ALTER TABLE `tracks`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `uid` (`uid`),
  ADD KEY `title` (`title`),
  ADD KEY `tag` (`tag`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD UNIQUE KEY `id` (`idu`),
  ADD KEY `username` (`username`),
  ADD KEY `first_name` (`first_name`),
  ADD KEY `last_name` (`last_name`),
  ADD KEY `suspended` (`suspended`),
  ADD KEY `email_newsletter` (`email_newsletter`);

--
-- Chỉ mục cho bảng `views`
--
ALTER TABLE `views`
  ADD PRIMARY KEY (`id`),
  ADD KEY `by` (`by`),
  ADD KEY `time` (`time`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `blocked`
--
ALTER TABLE `blocked`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT cho bảng `chat`
--
ALTER TABLE `chat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `downloads`
--
ALTER TABLE `downloads`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `info_pages`
--
ALTER TABLE `info_pages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `likes`
--
ALTER TABLE `likes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `newsletters`
--
ALTER TABLE `newsletters`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `playlistentries`
--
ALTER TABLE `playlistentries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `playlists`
--
ALTER TABLE `playlists`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `relations`
--
ALTER TABLE `relations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `reports`
--
ALTER TABLE `reports`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `tracks`
--
ALTER TABLE `tracks`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `idu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `views`
--
ALTER TABLE `views`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
