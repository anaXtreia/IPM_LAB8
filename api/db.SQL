-- phpMyAdmin SQL Dump
-- version 4.0.10.11
-- http://www.phpmyadmin.net
--
-- Host: 10.10.23.183
-- Generation Time: Oct 22, 2020 at 03:23 PM
-- Server version: 5.5.46-0+deb8u1
-- PHP Version: 5.6.30-0+deb8u1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `password_digest` varchar(255) DEFAULT NULL,
  `remember_digest` varchar(255) DEFAULT NULL,
  `admin` tinyint(1) DEFAULT '0',
  `activation_digest` varchar(255) DEFAULT NULL,
  `activated` tinyint(1) DEFAULT NULL,
  `activated_at` datetime DEFAULT NULL,
  `reset_digest` varchar(255) DEFAULT NULL,
  `reset_sent_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_users_on_email` (`email`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `created_at`, `updated_at`, `password_digest`, `remember_digest`, `admin`, `activation_digest`, `activated`, `activated_at`, `reset_digest`, `reset_sent_at`) VALUES
(2, 'Jose Bastos', 'jose.bastos@gmail.com', '2016-09-30 18:54:49', '2016-09-30 18:54:49', '1873b45aaf4317c32dbde506bf09d646', '6a67ff2a8f83756dae554b8b25b5b5d2', 0, NULL, NULL, NULL, 'f817c3db99522ad077be1a7f3f44fb67', '2019-10-31 22:05:41'),
(4, 'Maria Silva', 'maria.silva@gmail.com', '2016-10-18 01:18:19', '2016-10-18 01:18:19', 'f8ba9d424c67b8812dc06b46ec801787', NULL, 0, NULL, NULL, NULL, NULL, NULL),
(5, 'Paulo Silva', 'a22297@ualg.pt', '2016-10-18 12:03:13', '2016-10-18 12:03:13', 'f8ba9d424c67b8812dc06b46ec801787', NULL, 0, NULL, NULL, NULL, NULL, NULL),
(6, 'mais_um', 'a52495@ualg.pt', '2016-10-18 12:12:29', '2016-10-18 12:12:29', '827ccb0eea8a706c4c34a16891f84e7b', ' ', 0, NULL, NULL, NULL, NULL, NULL),
(7, 'DÃ¡rio Hermann', 'a49728@ualg.pt', '2016-10-18 12:13:47', '2016-10-18 12:13:47', 'ec5883451bb7d0aa6b5950e39ed5f16d', NULL, 0, NULL, NULL, NULL, NULL, NULL),
(8, 'Banana Bananas', 'bananas@hotmail.com', '2016-10-18 12:14:13', '2016-10-18 12:14:13', 'db763be15e695777689418be7364e0a3', NULL, 0, NULL, NULL, NULL, NULL, NULL),
(9, 'Pedro GraÃ§a', 'kabasizubo@hostcalls.com', '2016-10-18 12:26:56', '2016-10-18 12:26:56', 'e10adc3949ba59abbe56e057f20f883e', NULL, 0, NULL, NULL, NULL, NULL, NULL),
(10, 'Minion ', 'minionsforever@hotmail.com', '2016-10-18 12:32:51', '2016-10-18 12:32:51', '2157ab29713b48cb69a0fc7a1282eaa9', NULL, 0, NULL, NULL, NULL, NULL, NULL),
(11, 'Dank Blogger', 'dank@blogger.ru', '2016-10-18 14:12:00', '2016-10-18 14:12:00', '7de954b5bd633a219020a277230727ba', NULL, 0, NULL, NULL, NULL, NULL, NULL),
(12, 'Bananao', 'banana@banana.com', '2016-10-18 14:33:19', '2016-10-18 14:33:19', '8a0bf547786f70a9adc7dc8a5f3edae8', NULL, 0, NULL, NULL, NULL, NULL, NULL),
(13, 'Mario Andrade', 'mario.andrade@gmail.com', '2016-10-18 21:06:30', '2016-10-18 21:06:30', 'f8ba9d424c67b8812dc06b46ec801787', NULL, 0, NULL, NULL, NULL, NULL, NULL),
(14, 'asdasd', 'asdasd@asdasd.com', '2016-10-24 19:58:05', '2016-10-24 19:58:05', '4297f44b13955235245b2497399d7a93', NULL, 0, NULL, NULL, NULL, NULL, NULL),
(15, 'ayy', 'lmao@gmail.com', '2016-10-24 23:12:42', '2016-10-24 23:12:42', '0e1b8b3ef01dad60a89c3b16b6eeff54', NULL, 0, NULL, NULL, NULL, NULL, NULL),
(16, 'ion', 'a52115@ualg.pt', '2016-10-25 02:07:31', '2016-10-25 02:07:31', '8b82bd2ef31d867db598fba5014e1762', NULL, 0, NULL, NULL, NULL, NULL, NULL),
(17, 'hufeh', 'lifelnfa@hgor.com', '2016-10-25 13:07:55', '2016-10-25 13:07:55', 'fcea920f7412b5da7be0cf42b8c93759', NULL, 0, NULL, NULL, NULL, NULL, NULL),
(18, 'AndrÃ© Generoso', 'a50366@hotmail.com', '2016-10-25 13:26:16', '2016-10-25 13:26:16', '9f3b9486daba74b7766b7919bb493f47', NULL, 0, NULL, NULL, NULL, NULL, NULL),
(19, 'anton', 'a12345@ualg.pt', '2016-10-25 15:44:35', '2016-10-25 15:44:35', '827ccb0eea8a706c4c34a16891f84e7b', NULL, 0, NULL, NULL, NULL, NULL, NULL),
(20, 'skdfhvdsfkjvh sdfvasdf', 'asdfgh@ualg.pt', '2016-10-25 16:44:23', '2016-10-25 16:44:23', 'e10adc3949ba59abbe56e057f20f883e', NULL, 0, NULL, NULL, NULL, NULL, NULL),
(21, 'Diogo LuÃ­s', 'diogorramosluid@gmail.com', '2016-10-26 12:05:35', '2016-10-26 12:05:35', 'c32a28b6afa6d758210e1841ba8d5110', NULL, 0, NULL, NULL, NULL, NULL, NULL),
(22, 'Jose Ribeiro', 'jose.a.s.ribeiro@sapo.pt', '2016-10-30 18:04:40', '2016-10-30 18:04:40', '266898b908ea2e57dd874ccebd762fa5', NULL, 0, NULL, NULL, NULL, '', '0000-00-00 00:00:00'),
(23, 'ola', '', '2016-11-02 22:55:36', '0000-00-00 00:00:00', 'bfa99df33b137bc8fb5f5407d7e58da8', '8aa21e2855e2daae4aaefa4946eda0fa', 0, NULL, NULL, NULL, 'ffd942fe41092b74c9fd56baecee697d', '2019-11-24 15:29:19'),
(24, 'iopb', 'jsadkajs@hotmail.com', '2016-11-03 00:14:35', '2016-11-03 00:14:35', '093a266a4e2e70b80dd2badb0c9bde7e', NULL, 0, NULL, NULL, NULL, NULL, NULL),
(29, 'fsd', 'fsd@fdfd.com', '2016-11-03 16:01:13', '2016-11-03 16:01:13', '827ccb0eea8a706c4c34a16891f84e7b', NULL, 0, NULL, NULL, NULL, NULL, NULL),
(30, 'xzc', 'zxczxc@asd.com', '2016-11-05 12:39:12', '2016-11-05 12:39:12', '236d1336e98985dce3a625d46aebfd02', NULL, 0, NULL, NULL, NULL, NULL, NULL),
(31, 'mais_um', 'a9999@ualg.pt', '2016-11-05 17:23:54', '2016-11-05 17:23:54', '827ccb0eea8a706c4c34a16891f84e7b', NULL, 0, NULL, NULL, NULL, NULL, NULL),
(32, 'wddfcsc', 'sdcswdcedvc@ualg.pt', '2016-11-06 02:45:59', '2016-11-06 02:45:59', '25d55ad283aa400af464c76d713c07ad', NULL, 0, NULL, NULL, NULL, NULL, NULL),
(33, 'coco', '123456@hotmail.com', '2016-11-06 05:57:33', '2016-11-06 05:57:33', '827ccb0eea8a706c4c34a16891f84e7b', NULL, 0, NULL, NULL, NULL, NULL, NULL),
(37, 'teste', 'teste@teste.com', '2016-11-06 06:33:19', '2016-11-06 06:33:19', '827ccb0eea8a706c4c34a16891f84e7b', NULL, 0, NULL, NULL, NULL, NULL, NULL),
(38, 'andre', 'andre@andre.pt', '2016-11-06 17:13:48', '2016-11-06 17:13:48', '19984dcaea13176bbb694f62ba6b5b35', '98a30af214ec3cf4d17c8c00f24f8c9a', 0, NULL, NULL, NULL, NULL, NULL),
(39, 'senhor_do_sabugal', 'sabugal@sabugal.com', '2016-11-07 12:13:46', '2016-11-07 12:13:46', '72b302bf297a228a75730123efef7c41', NULL, 0, NULL, NULL, NULL, NULL, NULL),
(40, 'senhor', 'sabug2al@sabugal.com', '2016-11-07 12:39:40', '2016-11-07 12:39:40', '827ccb0eea8a706c4c34a16891f84e7b', NULL, 0, NULL, NULL, NULL, NULL, NULL),
(41, 'joao', 'joao@joa.pt', '2016-11-07 13:51:56', '2016-11-07 13:51:56', 'e10adc3949ba59abbe56e057f20f883e', NULL, 0, NULL, NULL, NULL, NULL, NULL),
(42, 'andre', 'a51767@ualg.pt', '2016-11-07 16:38:18', '2016-11-07 16:38:18', 'e10adc3949ba59abbe56e057f20f883e', NULL, 0, NULL, NULL, NULL, NULL, NULL),
(43, 'Hello', 'Hello@gmail.com', '2016-11-07 17:27:14', '2016-11-07 17:27:14', 'c0c3e5247487147b0d4746f18bfcaabc', NULL, 0, NULL, NULL, NULL, NULL, NULL),
(44, 'banananas', 'olaola@hotmail.com', '2016-11-07 20:46:01', '2016-11-07 20:46:01', 'e10adc3949ba59abbe56e057f20f883e', NULL, 0, NULL, NULL, NULL, NULL, NULL),
(45, 'André Gonçalves', 'a48052@ualg.pt', '2016-11-07 23:38:01', '2016-11-07 23:38:01', '3c82df09d80472526bcf47b7cd8f9523', NULL, 0, NULL, NULL, NULL, NULL, NULL),
(46, 'Jose', 'alo@alo.com', '2016-11-08 02:37:36', '2016-11-08 02:37:36', '827ccb0eea8a706c4c34a16891f84e7b', NULL, 0, NULL, NULL, NULL, NULL, NULL),
(47, 'sdfsdf', 'sdfsdf@a.com', '2016-11-08 03:07:03', '2016-11-08 03:07:03', 'd58e3582afa99040e27b92b13c8f2280', NULL, 0, NULL, NULL, NULL, NULL, NULL),
(48, 'Dusk', 'Dusk252@gmail.com', '2016-11-08 05:52:17', '2016-11-08 05:52:17', '978c1c56566a640d1002af5cc386c3c7', NULL, 0, NULL, NULL, NULL, NULL, NULL),
(49, 'dfdfd', 'xx@gmail.com', '2016-11-08 08:26:48', '2016-11-08 08:26:48', 'd458decd2384f5e6ed16bef258e6756a', NULL, 0, NULL, NULL, NULL, NULL, NULL),
(50, 'dfsdfsdgsd', 'ff@gmail.com', '2016-11-08 08:27:10', '2016-11-08 08:27:10', '827ccb0eea8a706c4c34a16891f84e7b', NULL, 0, NULL, NULL, NULL, NULL, NULL),
(51, 'dfgdgdg', 'jiko@gmail.com', '2016-11-08 08:29:58', '2016-11-08 08:29:58', '5d41402abc4b2a76b9719d911017c592', NULL, 0, NULL, NULL, NULL, NULL, NULL),
(52, 'pinksoulgem', 'homuhomu@gmail.com', '2016-11-08 08:37:38', '2016-11-08 08:37:38', '1c487c56a6ed97f7c7f7e8a0c5f5ee2c', NULL, 0, NULL, NULL, NULL, NULL, NULL),
(53, 'abv', 'rr@a.com', '2016-11-08 11:21:24', '2016-11-08 11:21:24', '827ccb0eea8a706c4c34a16891f84e7b', NULL, 0, NULL, NULL, NULL, NULL, NULL),
(54, 'banana', 'Ricardo_dos_santos@pt.pt', '2016-11-08 11:25:57', '2016-11-08 11:25:57', '827ccb0eea8a706c4c34a16891f84e7b', NULL, 0, NULL, NULL, NULL, NULL, NULL),
(55, 'abcdef', '12345@gmail.com', '2016-11-08 12:07:03', '2016-11-08 12:07:03', '827ccb0eea8a706c4c34a16891f84e7b', NULL, 0, NULL, NULL, NULL, NULL, NULL),
(56, 'abc', 'abc@abc.com', '2016-11-08 12:30:17', '2016-11-08 12:30:17', '61a60170273e74a5be90355ffe8e86ad', NULL, 0, NULL, NULL, NULL, '41a8175d3fe47baf423a09c87eed42be', '2017-11-12 23:58:56'),
(57, 'gg gg', 'gg@g.com', '2016-11-08 12:46:42', '2016-11-08 12:46:42', '9a0fe27c8bcc9aad51eda55e1b735eb5', NULL, 0, NULL, NULL, NULL, NULL, NULL),
(58, 'gg gg', '123@ht.com', '2016-11-08 12:47:04', '2016-11-08 12:47:04', '827ccb0eea8a706c4c34a16891f84e7b', NULL, 0, NULL, NULL, NULL, NULL, NULL),
(59, 'asss', 'as@ho.com', '2016-11-08 13:07:52', '2016-11-08 13:07:52', '827ccb0eea8a706c4c34a16891f84e7b', NULL, 0, NULL, NULL, NULL, NULL, NULL),
(60, 'asbn', 'qwqe@ja.com', '2016-11-08 13:09:19', '2016-11-08 13:09:19', '827ccb0eea8a706c4c34a16891f84e7b', NULL, 0, NULL, NULL, NULL, NULL, NULL),
(61, 'dotora', 'dotora@dr.pt', '2016-11-10 16:05:10', '2016-11-10 16:05:10', '827ccb0eea8a706c4c34a16891f84e7b', NULL, 0, NULL, NULL, NULL, NULL, NULL),
(62, '', 'peter.smith@gmail.com', '2016-11-10 18:20:57', '2016-11-10 18:20:57', '827ccb0eea8a706c4c34a16891f84e7b', NULL, 0, NULL, NULL, NULL, NULL, NULL),
(63, '', 'josee.bastos@gmail.com', '2016-11-10 18:36:07', '2016-11-10 18:36:07', '827ccb0eea8a706c4c34a16891f84e7b', NULL, 0, NULL, NULL, NULL, NULL, NULL),
(64, 'dtore', 'dr@dr.dr', '2016-11-10 18:38:05', '2016-11-10 18:38:05', '827ccb0eea8a706c4c34a16891f84e7b', NULL, 0, NULL, NULL, NULL, NULL, NULL),
(65, 'Meitas', 'beita@chup.pt', '2016-11-10 23:42:52', '2016-11-10 23:42:52', '827ccb0eea8a706c4c34a16891f84e7b', NULL, 0, NULL, NULL, NULL, NULL, NULL),
(66, 'andre ', 'andre.teixeira3690@gmail.com', '2016-11-13 20:12:17', '2016-11-13 20:12:17', 'e10adc3949ba59abbe56e057f20f883e', NULL, 0, NULL, NULL, NULL, NULL, NULL),
(67, 'Jose', 'a51804@ualg.pt', '2016-11-14 17:37:10', '2016-11-14 17:37:10', '827ccb0eea8a706c4c34a16891f84e7b', '9370ecd3cab995fc110245d9421e78ea', 0, NULL, NULL, NULL, NULL, NULL),
(68, 'Manel Bidente', 'andre.quarteira@gmail.com', '2016-11-15 11:22:25', '2016-11-15 11:22:25', '827ccb0eea8a706c4c34a16891f84e7b', NULL, 0, NULL, NULL, NULL, NULL, NULL),
(69, 'Alexandra', 'alexandra@alexandra.com', '2016-11-15 12:38:36', '2016-11-15 12:38:36', '9db3c8f773c85206e661d7538de50fe7', NULL, 0, NULL, NULL, NULL, NULL, NULL),
(70, '', 'joao@jodsfsda.pt', '2016-11-25 13:20:55', '2016-11-25 13:20:55', '827ccb0eea8a706c4c34a16891f84e7b', NULL, 0, NULL, NULL, NULL, NULL, NULL),
(71, '', 'asd@asd.asd', '2016-11-27 14:04:23', '2016-11-27 14:04:23', '7815696ecbf1c96e6894b779456d330e', NULL, 0, NULL, NULL, NULL, NULL, NULL),
(72, '', 'test123@gmail.com', '2016-11-29 01:29:12', '2016-11-29 01:29:12', '25f9e794323b453885f5181f1b624d0b', NULL, 0, NULL, NULL, NULL, NULL, NULL),
(73, '', 'joao@ualg.pt', '2016-11-29 12:41:36', '2016-11-29 12:41:36', 'dccd96c256bc7dd39bae41a405f25e43', NULL, 0, NULL, NULL, NULL, NULL, NULL),
(74, 'Jose Bastos', 'jbastos@ualg.pt', '2016-12-11 00:11:20', '2019-11-27 10:37:06', '827ccb0eea8a706c4c34a16891f84e7b', 'a52d1dfe2484a284c4bb2b8d570a9a8e', 0, NULL, NULL, NULL, NULL, NULL),
(76, 'Jose Bastos', 'jmatbastos@hotmail.com', '2016-12-11 00:16:06', '2016-12-11 00:16:06', '73608990fda4db21bedced8e4ee5740f\n', NULL, 0, NULL, NULL, NULL, NULL, NULL),
(77, 'Jose Bastos', 'sigdeei@ualg.pt', '2016-12-11 00:55:24', '2016-12-11 00:55:24', '73608990fda4db21bedced8e4ee5740f\n', NULL, 0, NULL, NULL, NULL, NULL, NULL),
(78, 'username', 'danielstantchev@me.com', '2017-01-09 18:12:17', '2017-01-09 18:12:17', '25d55ad283aa400af464c76d713c07ad', '1c50e4d83ff55d7763e1e36fb2d38b92', 0, NULL, NULL, NULL, NULL, NULL),
(79, 'penelope', 'penelope@gmail.com', '2017-01-09 18:14:00', '2017-01-09 18:14:00', '827ccb0eea8a706c4c34a16891f84e7b', '663d4a5c61d8fe3ceecc52fad5eb53a2', 0, NULL, NULL, NULL, NULL, NULL),
(80, 'Adriano Vaz', 'adriano_vaz@live.com.pt', '2017-01-09 18:14:59', '2017-01-09 18:14:59', '79df64f73eab9bc0d7b448d2008d876e', NULL, 0, NULL, NULL, NULL, NULL, NULL),
(81, 'ricardoreais', 'ricardoreais@gmail.com', '2017-01-09 18:15:15', '2017-01-09 18:15:15', 'e10adc3949ba59abbe56e057f20f883e', 'a8012fe294b838edbf910fd718078090', 0, NULL, NULL, NULL, NULL, NULL),
(84, 'ricardo', 'a48374@ualg.pt', '2017-01-09 18:18:50', '2017-01-09 18:18:50', 'e10adc3949ba59abbe56e057f20f883e', NULL, 0, NULL, NULL, NULL, NULL, NULL),
(89, 'patricia', 'a34693@ualg.pt', '2017-01-09 18:24:23', '2017-01-09 18:24:23', '5f4dcc3b5aa765d61d8327deb882cf99', '5c4a8093ec3bb4201115f3c51f955d0c', 0, NULL, NULL, NULL, NULL, NULL),
(90, 'Doutor', 'doutor@sapo.pt', '2017-01-09 18:27:04', '2017-01-09 18:27:04', '827ccb0eea8a706c4c34a16891f84e7b', 'b1bd237b02733f90d8a969d2fb601bcb', 0, NULL, NULL, NULL, NULL, NULL),
(92, 'Cyrill', 'CB@CB.CB', '2017-01-09 18:29:49', '2017-01-09 18:29:49', '827ccb0eea8a706c4c34a16891f84e7b', '123', 0, NULL, NULL, NULL, NULL, NULL),
(93, 'ramalho', 'a52777@ualg.pt', '2017-01-09 17:31:31', '2017-01-09 17:31:31', '827ccb0eea8a706c4c34a16891f84e7b', 'd39b83e5ed4e20df94b6b13904b65530', 0, NULL, NULL, NULL, NULL, NULL),
(94, 'testtest', '123@123.com', '2017-01-09 18:32:04', '2017-01-09 18:32:04', '827ccb0eea8a706c4c34a16891f84e7b', '21ae8df77b93087297f5e42c7e12216e', 0, NULL, NULL, NULL, NULL, NULL),
(96, 'ion', 'ion@hotmail.com', '2017-01-09 18:33:35', '2017-01-09 18:33:35', 'fcea920f7412b5da7be0cf42b8c93759', NULL, 0, NULL, NULL, NULL, NULL, NULL),
(98, 'Yayaka', 'YYK@gmail.com', '2017-01-09 19:07:30', '2017-01-09 19:07:30', 'e3a102e4dec3d927ea2776e2554124d8', 'aa998c616d22b85f47341be2af120376', 0, NULL, NULL, NULL, NULL, NULL),
(99, 'AndrÃ©T', 'pedrodds1@hotmail.com', '2017-01-09 19:10:38', '2017-01-09 19:10:38', '827ccb0eea8a706c4c34a16891f84e7b', NULL, 0, NULL, NULL, NULL, NULL, NULL),
(100, 'olaolaola', 'olaola@ola.pt', '2017-01-09 19:12:32', '2017-01-09 19:12:32', '236d1336e98985dce3a625d46aebfd02', NULL, 0, NULL, NULL, NULL, NULL, NULL);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- --------------------------------------------------------

--
-- Table structure for table `microposts`
--

CREATE TABLE IF NOT EXISTS `microposts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text CHARACTER SET utf8 COLLATE utf8_bin,
  `user_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `likes` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 ;

--
-- Dumping data for table `microposts`
--

INSERT INTO `microposts` (`id`, `content`, `user_id`, `created_at`, `updated_at`, `likes`) VALUES
(3, 'bla bla bla\r\n', 4, '2016-10-18 01:21:58', '2016-10-18 01:23:25', 12),
(4, '\r\nNecessito ajuda para o lab4', 5, '2016-10-18 12:03:47', '2016-10-18 12:03:47', 9),
(5, '\r\nmais um.', 6, '2016-10-18 12:13:02', '2016-10-18 12:13:02', 9),
(6, ':/\r\n', 7, '2016-10-18 12:14:51', '2016-10-18 12:14:51', 9),
(7, 'Pois, então bananas.', 8, '2016-10-18 12:15:19', '2016-10-18 12:15:19', 9),
(8, 'O pedras é  um macho latino,', 9, '2016-10-18 12:33:36', '2016-10-18 12:33:36', 9),
(9, 'Today we have learned how to template using pear. Have a great day, student!', 11, '2016-10-18 14:14:02', '2016-10-18 14:14:02', 9),
(13, 'GGWP', 18, '2016-10-25 13:26:58', '2016-10-25 13:26:58', 9),
(16, '\r\n', 48, '2016-11-10 17:21:03', '2016-11-10 17:22:21', 9),
(17, '\r\nOY', 64, '2016-11-10 18:38:31', '2016-11-10 18:38:31', 15),
(18, 'Props pro peçoal XD!\r\n\r\n\r\n\r\n', 65, '2016-11-10 23:43:57', '2016-11-11 09:41:55', 10),
(25, 'Os caracteres já estão bem!', 9, '2016-11-11 13:13:01', '2016-11-11 13:13:01', 11),
(29, 'Boa tarde\r\n', 67, '2016-11-14 19:31:07', '2016-11-14 19:31:07', 9),
(30, 'Boa tarde pessoal!\r\n\r\n', 67, '2016-11-14 19:31:31', '2016-11-14 19:37:41', 9),
(32, 'Olá', 68, '2016-11-15 11:23:59', '2016-11-15 11:23:59', 10),
(33, '\r\najksdka', 63, '2016-11-15 12:10:50', '2016-11-15 12:10:50', 15),
(35, 'Please contact the server administrator, root@diana.uceh.ualg.pt and inform them of the time the error occurred, and anything you might have done that may have caused the error.\r\n\r\nMore information about this error may be available in the server error log.\r\n\r\nApache/1.3.34 Server at intranet.deei.fct.ualg.pt Port 80', 5, '2016-11-21 22:43:54', '2017-01-23 13:29:02', 14),
(36, '123', 46, '2016-11-29 00:37:16', '2016-11-29 00:37:16', 10),
(37, 'Este é o meu novo post actualizado\r\n  \r\n  \r\n', 2, '2016-12-16 20:21:39', '2017-02-11 20:01:48', 69),
(38, 'aaaaa111222\r\n\r\n', 78, '2017-01-09 18:13:47', '2017-01-09 19:02:29', 16),
(39, '\r\noi', 94, '2017-01-09 18:49:06', '2017-01-09 18:49:06', 11),
(40, '\r\nsadsadsaasdsad', 79, '2017-01-09 18:50:44', '2017-01-09 18:50:44', 15),
(41, '\r\ncoisas', 90, '2017-01-09 19:01:34', '2017-01-09 19:01:34', 12),
(44, '\r\nfeaffw', 89, '2017-01-09 19:21:58', '2017-01-09 19:21:58', 15),
(45, 'hello\r\n', 38, '2017-01-09 19:23:27', '2017-01-09 19:23:27', 17),
(46, '\r\nits me', 92, '2017-01-09 19:26:53', '2017-01-09 19:26:53', 15),
(48, '\r\nI Love SO', 37, '2017-01-09 19:37:01', '2017-01-09 19:37:01', 26),
(50, '123', 81, '2017-01-09 19:38:52', '2017-01-09 19:38:52', 30),
(51, 'Boa tarde\r\n', 67, '2017-01-09 19:44:28', '2017-01-09 19:44:28', 15),
(53, '\r\nç§ã®å®ç‰©ã¯ã‚³ã‚³ãƒŠã ï¼ï¼ï¼ï¼ï¼', 98, '2017-01-09 19:46:04', '2017-01-09 19:46:04', 16),
(54, '\r\naaaa', 78, '2017-01-09 19:46:25', '2017-01-09 19:46:25', 15),
(55, '\r\nteste auto', 6, '2017-01-09 19:47:01', '2017-01-09 19:47:01', 15),
(56, '\r\noi 123\r\n\r\n', 94, '2017-01-09 19:53:56', '2017-01-09 20:10:04', 14),
(57, '\r\nyolo', 94, '2017-01-09 20:10:18', '2017-01-09 20:10:18', 16),
(58, '\r\nI love spd <3', 37, '2017-01-09 20:12:35', '2017-01-09 20:12:35', 21),
(60, '2nd try', 2, '2017-02-11 20:03:38', '2017-02-11 20:03:38', 10),
(62, 'O portal do forum de DAW tem agora uma nova funcionalidade: post replies!\r\n     ', 2, '2017-10-02 00:27:21', '2017-11-18 20:30:48', 3),
(64, '\r\n<h1> isto Ã© muito grande </h1>\r\n<p><a href="http://olx.pt"> link para o olx! </a></p>\r\n\r\n<p>isto Ã©  uma imagem</p>\r\n<img src="https://cdn2.autoexpress.co.uk/sites/autoexpressuk/files/styles/gallery_adv/public/2018/04/gialloauge_road_dynamic_10.jpg?itok=Z5RwkQ4V" width="200px">\r\n\r\n\r\n\r\n\r\n\r\n', 2, '2017-10-10 13:43:43', '2018-10-10 16:55:34', 0),
(65, '\r\nOlÃ¡aaaaaaa', 7, '2017-10-21 19:19:07', '2017-10-21 19:19:07', 0),
(67, 'test\r\n', 22, '2017-10-30 16:30:47', '2017-10-30 16:30:47', 0),
(71, 'Mais um teste 456\r\n\r\n\r\n', 74, '2017-11-11 15:36:07', '2019-10-29 11:27:12', 0),
(72, 'mais um teste <br>\r\n\r\n12345\r\n\r\n\r\n\r\n\r\n', 74, '2017-11-11 22:08:01', '2017-12-11 19:05:10', 0),
(74, 'O Paulo é o maior!!!', 74, '2018-10-10 00:00:00', '2019-10-29 09:49:44', 25),
(78, 'THIS IS A DRILL', 50, '2018-01-13 17:54:43', '2018-01-13 17:54:43', 668);


--
-- Table structure for table `comments`
--


CREATE TABLE IF NOT EXISTS `comments` (
 `id` int(11) NOT NULL AUTO_INCREMENT,
 `content` text CHARACTER SET utf8 COLLATE utf8_bin,
 `user_id` int(11) DEFAULT NULL,
 `micropost_id` int(11) DEFAULT NULL,
 `created_at` datetime NOT NULL,
 PRIMARY KEY (`id`),
 KEY (`user_id`),
 KEY (`micropost_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `microposts`
--
ALTER TABLE `microposts`
  ADD CONSTRAINT FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
ALTER TABLE `comments`
  ADD CONSTRAINT FOREIGN KEY (`micropost_id`) REFERENCES `microposts` (`id`); 

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
