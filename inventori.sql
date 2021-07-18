-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 18, 2021 at 05:13 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.2.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `inventori`
--

-- --------------------------------------------------------

--
-- Table structure for table `barang_keluar`
--

CREATE TABLE `barang_keluar` (
  `id` int(11) NOT NULL,
  `id_transaksi` varchar(100) NOT NULL,
  `tanggal` date NOT NULL,
  `kode_barang` varchar(100) NOT NULL,
  `nama_barang` varchar(100) NOT NULL,
  `jumlah` varchar(100) NOT NULL,
  `tujuan` varchar(100) NOT NULL,
  `satuan` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Triggers `barang_keluar`
--
DELIMITER $$
CREATE TRIGGER `barang_keluar` AFTER INSERT ON `barang_keluar` FOR EACH ROW BEGIN
	UPDATE gudang SET jumlah = jumlah-new.jumlah
    WHERE kode_barang=new.kode_barang;
    END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `barang_masuk`
--

CREATE TABLE `barang_masuk` (
  `id` int(11) NOT NULL,
  `id_transaksi` varchar(100) NOT NULL,
  `tanggal` date NOT NULL,
  `kode_barang` varchar(100) NOT NULL,
  `nama_barang` varchar(100) NOT NULL,
  `pengirim` varchar(100) NOT NULL,
  `jumlah` varchar(100) NOT NULL,
  `satuan` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Triggers `barang_masuk`
--
DELIMITER $$
CREATE TRIGGER `barang_masuk` AFTER INSERT ON `barang_masuk` FOR EACH ROW BEGIN
	UPDATE gudang SET jumlah = jumlah+new.jumlah
    WHERE kode_barang=new.kode_barang;
    END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `gudang`
--

CREATE TABLE `gudang` (
  `id` int(11) NOT NULL,
  `kode_barang` varchar(100) NOT NULL,
  `nama_barang` varchar(100) NOT NULL,
  `jenis_barang` varchar(100) NOT NULL,
  `jumlah` varchar(250) NOT NULL,
  `satuan` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `gudang`
--

INSERT INTO `gudang` (`id`, `kode_barang`, `nama_barang`, `jenis_barang`, `jumlah`, `satuan`) VALUES
(2, 'BAR-0721001', 'Pentium II', 'CPU', '100', 'Unit'),
(3, 'BAR-0721002', 'Pentium III', 'CPU', '100', 'Unit'),
(4, 'BAR-0721003', 'Pentium IV Celeron 2,6 Ghz', 'CPU', '100', 'Unit'),
(5, 'BAR-0721004', 'IBM 17', 'Monitor SVGA', '100', 'Unit'),
(6, 'BAR-0721005', 'GTC 15', 'Monitor SVGA', '100', 'Buah'),
(7, 'BAR-0721006', 'Samsung 14', 'Monitor SVGA', '100', 'Buah'),
(8, 'BAR-0721007', 'Samtron 14', 'Monitor SVGA', '100', 'Buah'),
(9, 'BAR-0721008', 'USA Com 14\"', 'Monitor SVGA', '100', 'Buah'),
(10, 'BAR-0721009', 'Printer Canon BJC-2100SP', 'Lain-lain', '10', 'Buah'),
(11, 'BAR-0721010', 'Keyboard', 'Lain-lain', '10', 'Buah'),
(12, 'BAR-0721011', 'Mouse', 'Lain-lain', '100', 'Buah'),
(13, 'BAR-0721012', '24 Port', 'Ethernal HUB', '25', 'Buah'),
(15, 'BAR-0721013', '5 Port', 'Ethernal HUB', '25', 'Buah'),
(16, 'BAR-0721014', 'Subwoofer', 'Sound System', '10', 'Buah'),
(17, 'BAR-0721015', 'Speaker Biasa', 'Sound System', '10', 'Buah'),
(18, 'BAR-0721016', 'Sound merk Comteck', 'Sound System', '10', 'Buah'),
(19, 'BAR-0721017', 'Earphone', 'Sound System', '10', 'Buah'),
(20, 'BAR-0721018', 'Kursi', 'Lain-lain', '200', 'Buah'),
(21, 'BAR-0721019', 'Hardboard', 'Meja Komputer', '100', 'Buah'),
(22, 'BAR-0721020', 'Biasa', 'Meja Komputer', '100', 'Buah'),
(23, 'BAR-0721021', 'Whiteboard', 'Lain-lain', '10', 'Buah'),
(24, 'BAR-0721022', 'Korden Jendela', 'Lain-lain', '200', 'Buah'),
(25, 'BAR-0721023', 'Karpet', 'Lain-lain', '20', 'Buah'),
(26, 'BAR-0721024', 'Tempat Sampah', 'Lain-lain', '10', 'Buah'),
(27, 'BAR-0721025', '	 Penghapus Papan', 'Lain-lain', '10', 'Buah'),
(28, 'BAR-0721026', 'Jam Dinding', 'Kabel', '0', 'Unit'),
(29, 'BAR-0721027', 'Bintang Kecil', 'Obeng', '0', 'Buah'),
(30, 'BAR-0721028', 'Belimbing', 'Obeng', '0', 'Buah'),
(31, 'BAR-0721029', 'Pipih', 'Obeng', '0', 'Buah');

-- --------------------------------------------------------

--
-- Table structure for table `jenis_barang`
--

CREATE TABLE `jenis_barang` (
  `id` int(11) NOT NULL,
  `jenis_barang` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jenis_barang`
--

INSERT INTO `jenis_barang` (`id`, `jenis_barang`) VALUES
(8, 'Kabel'),
(9, 'CPU'),
(10, 'Monitor SVGA'),
(11, 'Ethernal HUB'),
(12, 'Sound System'),
(13, 'Obeng'),
(14, 'Lain-lain'),
(15, 'Meja Komputer');

-- --------------------------------------------------------

--
-- Table structure for table `satuan`
--

CREATE TABLE `satuan` (
  `id` int(11) NOT NULL,
  `satuan` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `satuan`
--

INSERT INTO `satuan` (`id`, `satuan`) VALUES
(5, 'Unit'),
(11, 'Buah'),
(12, 'Lembar');

-- --------------------------------------------------------

--
-- Table structure for table `tb_supplier`
--

CREATE TABLE `tb_supplier` (
  `id` int(100) NOT NULL,
  `kode_supplier` varchar(100) NOT NULL,
  `nama_supplier` varchar(100) NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `telepon` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_supplier`
--

INSERT INTO `tb_supplier` (`id`, `kode_supplier`, `nama_supplier`, `alamat`, `telepon`) VALUES
(10, 'SUP-1219001', 'PT Sahabat Utama', 'Jakarta Barat', '085546982020');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `nik` varchar(10) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `alamat` varchar(200) NOT NULL,
  `telepon` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `level` varchar(25) NOT NULL DEFAULT 'member',
  `foto` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `nik`, `nama`, `alamat`, `telepon`, `username`, `password`, `level`, `foto`) VALUES
(26, '1001', 'Superadmin', '', '08999444000', 'superadmin', '17c4520f6cfd1ab53d8745e84681eb49', 'superadmin', 'teacher4.png'),
(28, '09090909', 'admin', '', '081240075400', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'admin', 'download.png'),
(29, '2002', 'petugas', '', '082323546221', 'petugas', 'afb91ef692fd08c445e8cb1bab2ccf9c', 'petugas', 'images.png');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang_keluar`
--
ALTER TABLE `barang_keluar`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `barang_masuk`
--
ALTER TABLE `barang_masuk`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gudang`
--
ALTER TABLE `gudang`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jenis_barang`
--
ALTER TABLE `jenis_barang`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `satuan`
--
ALTER TABLE `satuan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_supplier`
--
ALTER TABLE `tb_supplier`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `barang_keluar`
--
ALTER TABLE `barang_keluar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `barang_masuk`
--
ALTER TABLE `barang_masuk`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `gudang`
--
ALTER TABLE `gudang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `jenis_barang`
--
ALTER TABLE `jenis_barang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `satuan`
--
ALTER TABLE `satuan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `tb_supplier`
--
ALTER TABLE `tb_supplier`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
