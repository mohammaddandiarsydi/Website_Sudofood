-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 04, 2022 at 05:43 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sudofood`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id_cart` varchar(20) NOT NULL,
  `tanggal` datetime NOT NULL,
  `kode` varchar(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `harga` varchar(10) NOT NULL,
  `qty` varchar(10) NOT NULL,
  `jumlah` varchar(10) NOT NULL,
  `session` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id_cart`, `tanggal`, `kode`, `nama`, `harga`, `qty`, `jumlah`, `session`) VALUES
('20180206152934', '2018-02-06 15:29:34', '58', 'Oseng Kacan', '6000', '1', '6000', '20170820071826');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `kd_cus` varchar(20) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `alamat` varchar(50) NOT NULL,
  `no_telp` varchar(15) NOT NULL,
  `username` varchar(15) NOT NULL,
  `password` text NOT NULL,
  `gambar` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`kd_cus`, `nama`, `alamat`, `no_telp`, `username`, `password`, `gambar`) VALUES
('20170820071826', 'hakko', 'hakko', 'hakko', 'hakko', 'fb92eb16a09ed530c91a0e17d9d61a7758754013', '../admin/gambar_customer/images.jpg'),
('20180205073805', 'niqoweb', 'niqoweb', 'niqoweb', 'niqoweb', '6414e69bf25357d8d63353f469b35a7416963ab1', '');

-- --------------------------------------------------------

--
-- Table structure for table `konfirmasi`
--

CREATE TABLE `konfirmasi` (
  `id_kon` int(6) NOT NULL,
  `nopo` varchar(20) NOT NULL,
  `kd_cus` varchar(20) NOT NULL,
  `bayar_via` varchar(30) NOT NULL,
  `tanggal` datetime NOT NULL,
  `jumlah` int(10) NOT NULL,
  `bukti_transfer` varchar(50) NOT NULL,
  `status` enum('Bayar','Belum') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `konfirmasi`
--

INSERT INTO `konfirmasi` (`id_kon`, `nopo`, `kd_cus`, `bayar_via`, `tanggal`, `jumlah`, `bukti_transfer`, `status`) VALUES
(20, '20180205073805', '20180205073805', '0', '2018-02-05 07:38:37', 26000, '0', 'Belum'),
(22, '20170820071826', '20170820071826', 'Cash On Delivery (CO', '2018-02-05 09:44:53', 21000, '0', 'Belum');

-- --------------------------------------------------------

--
-- Table structure for table `po`
--

CREATE TABLE `po` (
  `nopo` varchar(20) NOT NULL,
  `tanggalkirim` date NOT NULL,
  `status` enum('Proses','Selesai','Terkirim','') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `po_terima`
--

CREATE TABLE `po_terima` (
  `id` int(10) NOT NULL,
  `nopo` varchar(20) NOT NULL,
  `kd_cus` varchar(20) NOT NULL,
  `kode` int(4) NOT NULL,
  `tanggal` datetime NOT NULL,
  `qty` int(8) NOT NULL,
  `total` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `po_terima`
--

INSERT INTO `po_terima` (`id`, `nopo`, `kd_cus`, `kode`, `tanggal`, `qty`, `total`) VALUES
(38, '20180205073805', '20180205073805', 17, '2018-02-05 07:38:23', 2, 26000),
(39, '20170820071826', '20170820071826', 57, '2018-02-05 09:44:15', 1, 6000),
(40, '20170820071826', '20170820071826', 54, '2018-02-05 09:44:19', 1, 15000);

-- --------------------------------------------------------

--
-- Table structure for table `produk`
--

CREATE TABLE `produk` (
  `kode` int(10) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `jenis` varchar(10) NOT NULL,
  `harga` int(10) NOT NULL,
  `keterangan` varchar(100) NOT NULL,
  `stok` int(3) NOT NULL,
  `gambar` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `produk`
--

INSERT INTO `produk` (`kode`, `nama`, `jenis`, `harga`, `keterangan`, `stok`, `gambar`) VALUES
(1, 'Burger', 'Makanan', 20000, 'Classic Big Beef Burger', 98, 'gambar_produk/burger.png'),
(2, 'Kebab', 'Makanan', 18000, 'Spesial Kebab Extra Keju', 100, 'gambar_produk/kebab.png'),
(3, 'Brown Sugar Boba', 'Minuman', 12000, 'Brown Sugar Boba with Fresh Milk', 100, 'gambar_produk/bobaa.png'),
(4, 'Donat', 'Makanan', 15000, 'Donat Premium 6pcs', 100, 'gambar_produk/donat.png'),
(5, 'Corndog', 'Makanan', 15000, 'Big Crispy Corndog with Mozarella Cheese', 100, 'gambar_produk/corndog.png'),
(22, 'Coffee Milk', 'Minuman', 20000, 'Coffee Milk with Palm Sugar', 100, 'gambar_produk/coffee.png'),
(23, 'Crepes', 'Makanan', 8000, 'Choco Custard Crepes', 100, 'gambar_produk/crepes.png'),
(24, 'Croffle', 'Makanan', 10000, 'Croflle Sweet Palm Sugar', 100, 'gambar_produk/croffle.png'),
(25, 'Croissant', 'Makanan', 20000, 'Bonchef Croissant Dough', 100, 'gambar_produk/croissant.png'),
(26, 'Cup Cake', 'Makanan', 18000, 'Cupcake Cheese and Choco Melted 2pcs', 100, 'gambar_produk/cupcake.png'),
(27, 'Ice Milk', 'Minuman', 12000, 'Ice Milk with Premium Choco', 100, 'gambar_produk/escoklat.png'),
(28, 'Ice Cream', 'Makanan', 10000, 'Ice Cream Vanila', 100, 'gambar_produk/eskrim.png'),
(29, 'Ice Coffee', 'Makanan', 21000, 'Ice Classic Latte with Caramel', 100, 'gambar_produk/eskopi.png'),
(30, 'Brownies Lumer', 'Makanan', 15000, 'Brownies Lumer with Chocochips', 100, 'gambar_produk/brownies.png'),
(31, 'Fried Noodles', 'Makanan', 12000, 'Spicy Fried Noodles with Egg', 100, 'gambar_produk/mie.png'),
(32, 'Pancake', 'Makanan', 8000, 'Original Pancake with Sweet Honey', 100, 'gambar_produk/pancake.png'),
(33, 'Popcorn', 'Makanan', 12000, 'Medium Caramel Popcorn', 100, 'gambar_produk/popcorn.png'),
(34, 'Oolong Tea', 'Minuman', 12000, 'Japanesse Orginal Oolong Tea', 100, 'gambar_produk/teh.png'),
(35, 'Dimsum', 'Makanan', 12000, '4pcs Dimsum Smoke Beef, Chicken Dimsum, Fish Dimsum, Mushroom Dimsum', 100, 'gambar_produk/dimsum.png'),
(36, 'Hotdog', 'Makanan', 18000, 'Hotdog Beef Chili and Cheese', 100, 'gambar_produk/hotdog.png'),
(37, 'Fried Chicken', 'Makanan', 12000, 'Spicy Fried Chicken', 100, 'gambar_produk/fc.png'),
(38, 'French Fries', 'Makanan', 8000, 'Special French Fries', 100, 'gambar_produk/ff.png'),
(39, 'Tteokpokki', 'Makanan', 20000, 'Toppoki Mozarella', 100, 'gambar_produk/toppoki.png'),
(40, 'Spaghetti', 'Makanan', 20000, 'Spaghetti Chicken Mentai', 100, 'gambar_produk/spaghetti.png'),
(41, 'Sushi', 'Makanan', 25000, 'Sushi Tuna Mayo Teriyaki Roll', 100, 'gambar_produk/sushi.png'),
(42, 'Rice Bowl', 'Makanan', 18000, 'Rice Bowl Chicken Teriyaki', 80, 'gambar_produk/rice.png'),
(43, 'Takoyaki', 'Makanan', 15000, '3pcs Takoyaki Beef, Takoyaki Cheese and Takoyaki Crab Stick', 100, 'gambar_produk/takoyaki.png');

-- --------------------------------------------------------

--
-- Table structure for table `tmp_po_terima`
--

CREATE TABLE `tmp_po_terima` (
  `id` int(10) NOT NULL,
  `nopo` varchar(10) NOT NULL,
  `kd_cus` varchar(10) NOT NULL,
  `kode` int(4) NOT NULL,
  `tanggal` date NOT NULL,
  `qty` int(8) NOT NULL,
  `total` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(10) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` text NOT NULL,
  `fullname` varchar(30) NOT NULL,
  `gambar` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `username`, `password`, `fullname`, `gambar`) VALUES
(1, 'hakko', 'fb92eb16a09ed530c91a0e17d9d61a7758754013', 'Hakko Bio Richard', 'gambar_admin/hakkoblogs.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id_cart`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`kd_cus`);

--
-- Indexes for table `konfirmasi`
--
ALTER TABLE `konfirmasi`
  ADD PRIMARY KEY (`id_kon`);

--
-- Indexes for table `po`
--
ALTER TABLE `po`
  ADD PRIMARY KEY (`nopo`);

--
-- Indexes for table `po_terima`
--
ALTER TABLE `po_terima`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`kode`);

--
-- Indexes for table `tmp_po_terima`
--
ALTER TABLE `tmp_po_terima`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `konfirmasi`
--
ALTER TABLE `konfirmasi`
  MODIFY `id_kon` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `po_terima`
--
ALTER TABLE `po_terima`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `produk`
--
ALTER TABLE `produk`
  MODIFY `kode` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT for table `tmp_po_terima`
--
ALTER TABLE `tmp_po_terima`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
