-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 11, 2022 at 10:21 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mantap`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id_admin` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `nama_lengkap` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id_admin`, `username`, `password`, `nama_lengkap`) VALUES
(1, 'katun', 'katun', 'katun Silungkang'),
(2, 'tiarma', 'tiarma', 'tiarma gurning');

-- --------------------------------------------------------

--
-- Table structure for table `datasensor`
--

CREATE TABLE `datasensor` (
  `id_sensor` int(11) NOT NULL,
  `ppm` varchar(255) NOT NULL,
  `ketinggian_air` varchar(255) NOT NULL,
  `waktu` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `datasensor`
--

INSERT INTO `datasensor` (`id_sensor`, `ppm`, `ketinggian_air`, `waktu`) VALUES
(1, '1012', '11', '2022-04-01'),
(2, '998', '15', '2022-04-02'),
(3, '1001', '13', '2022-04-03'),
(4, '987', '9', '2022-04-04');

-- --------------------------------------------------------

--
-- Table structure for table `tanaman`
--

CREATE TABLE `tanaman` (
  `id_tanaman` int(11) NOT NULL,
  `nama_tanaman` varchar(100) NOT NULL,
  `mode` varchar(255) NOT NULL,
  `foto_tanaman` varchar(100) NOT NULL,
  `deskripsi_tanaman` text NOT NULL,
  `keterangan` varchar(255) NOT NULL,
  `masapanen` varchar(99) NOT NULL,
  `dosisnutrisi` varchar(99) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tanaman`
--

INSERT INTO `tanaman` (`id_tanaman`, `nama_tanaman`, `mode`, `foto_tanaman`, `deskripsi_tanaman`, `keterangan`, `masapanen`, `dosisnutrisi`) VALUES
(4, 'Pakcoy', 'Manual', 'pakcoy.jpg', 'Pakcoy merupakan tanaman dari keluarga Cruciferae yang masih berada\r\ndalam satu genus dengan sawi putih/petsai dan sawi hijau/caisim. \r\n	', 'Menambahkan 100 PPM', '40-50 Hari', '1250 - 1350 PPM'),
(5, 'Selada', 'Otomatis', 'selada.jpg', 'Selada atau daun sla (Lactuca sativa) adalah tumbuhan sayur yang biasa ditanam di daerah beriklim sedang maupun daerah tropika.\r\n', 'Menambahkan 220 PPM', '30 - 45 Hari', '900 PPM'),
(6, 'Kangkung', 'Manual', 'kangkung.jpg', 'Kangkung, juga dikenal dengan istilah bayam air, adalah tanaman perairan di daerah rawa-rawa.', 'Menambahkan 150 PPM', '30-45 hari', '1200 PPM'),
(8, 'Bayam', 'Otomatis', 'bayam.jpg', 'Bayam (Amaranthus) adalah tumbuhan yang biasa ditanam untuk dikonsumsi daunnya sebagai sayuran hijau. Tumbuhan ini berasal dari Amerika tropik', 'Menambahkan 180 PPM', '4-6 Minggu', '800-1200 PPM'),
(9, 'Seledri', 'Otomatis', 'seledri.jpg', 'Seledri adalah terna kecil, kurang dari 1m tingginya. Daun tersusun gemuk dengan tangkai pendek.', 'Menambahkan 300 PPM', '1-3 Bulan', '1500 PPM'),
(10, 'Sawi', 'Manual', 'sawi.jpg', 'Sawi adalah sekelompok tumbuhan dari marga Brassica yang dimanfaatkan daun atau bunganya sebagai bahan pangan (sayuran), baik segar maupun diolah.', 'Menambahkan 298 PPM', '45 Hari', '1300 PPM'),
(11, 'Leek', 'Manual', 'leek.jpg', 'Leek adalah tanaman sejenis bawang dengan bentuk daun seperti silinder yang panjang dan ramping.', 'Menambahkan 320 PPM', '2 Bulan', '1250 PPM'),
(12, 'Kale', 'Otomatis', 'kale.jpg', 'kale adalah jenis sayuran berdaun hijau yang tergolong dalam keluarga kubis, seperti sayur brokoli. Tanaman ini bernama latin Brassica oleracea acephala.', 'Menambahkan 500 PPM', '45 Hari', '1050 -1400 PPM');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `email_user` varchar(100) NOT NULL,
  `password_user` varchar(50) NOT NULL,
  `nama_user` varchar(100) NOT NULL,
  `telepon_user` varchar(25) NOT NULL,
  `alamat_user` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `email_user`, `password_user`, `nama_user`, `telepon_user`, `alamat_user`) VALUES
(1, 'cepo@gmail.com', 'cepo123', 'cepo123', '082361647111', ''),
(5, 'nola@gmail.com', '', 'layla', '098765432', ''),
(7, 'fandi@gmail.com', 'fandi123', 'fandi', '098765432', 'medan'),
(8, 'naldo@gmail.com', 'naldo123', 'naldo', '09876543', 'medan'),
(9, 'joni@gmail.com', 'joni123', 'joni', '0987654321', 'siheang parsoburan'),
(10, 'mutiaramagdalena.simamora@yahoo.co.id', 'tia', 'Mutiara simamora', '5667790', 'kesehatan'),
(11, 'tiarmagurning810@gmail.com', 'tiarma123', 'Tiarma Elfrida Gurning', '085831312084', 'Desa Lumban Gurning'),
(12, 'daniel15@gmail.com', 'daniel123nd', 'daniel', '081200987542', 'balige'),
(13, 'samuel02@gmail.com', 'samuel123', 'Samuel Saragi', '085831312084', 'tarutung'),
(14, 'evita@gmail.com', 'evita123', 'Evita', '081273663621', 'silaen'),
(15, 'tiarmael@gmail.com', 'gurning123', 'Tiarma Elfrida Gurning', '085831312084', 'Desa Lumban Gurning');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indexes for table `datasensor`
--
ALTER TABLE `datasensor`
  ADD PRIMARY KEY (`id_sensor`);

--
-- Indexes for table `tanaman`
--
ALTER TABLE `tanaman`
  ADD PRIMARY KEY (`id_tanaman`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id_admin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tanaman`
--
ALTER TABLE `tanaman`
  MODIFY `id_tanaman` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
