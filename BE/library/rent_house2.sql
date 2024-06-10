-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jun 10, 2024 at 07:25 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rent_house2`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_kategori`
--

CREATE TABLE `tbl_kategori` (
  `kategori_id` int(11) NOT NULL,
  `nama_kategori` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_kategori`
--

INSERT INTO `tbl_kategori` (`kategori_id`, `nama_kategori`) VALUES
(1, 'Apartment'),
(2, 'House'),
(3, 'Villa');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_order`
--

CREATE TABLE `tbl_order` (
  `order_id` int(11) NOT NULL,
  `tgl_orderdeng` date NOT NULL,
  `tgl_keluar` date NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `role` int(11) NOT NULL CHECK (`role` in (1,2,3,4)),
  `status` enum('pending','completed','cancelled') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_order`
--

INSERT INTO `tbl_order` (`order_id`, `tgl_orderdeng`, `tgl_keluar`, `product_id`, `user_id`, `role`, `status`) VALUES
(1, '2024-06-01', '2024-06-10', 1, 1, 1, 'pending'),
(2, '2024-06-02', '2024-06-11', 2, 1, 1, 'completed'),
(3, '2024-06-03', '2024-06-12', 3, 2, 1, 'pending');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_product`
--

CREATE TABLE `tbl_product` (
  `product_id` int(11) NOT NULL,
  `nama_product` varchar(100) NOT NULL,
  `deskripsi` text DEFAULT NULL,
  `harga` decimal(10,2) NOT NULL,
  `kategori_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_product`
--

INSERT INTO `tbl_product` (`product_id`, `nama_product`, `deskripsi`, `harga`, `kategori_id`) VALUES
(1, 'Central Park Apartment', 'A luxurious apartment in Central Park', '15000000.00', 1),
(2, 'Green House', 'A beautiful house with a green garden', '3000000.00', 2),
(3, 'Sea View Villa', 'A villa with a stunning sea view', '10000000.00', 3);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user`
--

CREATE TABLE `tbl_user` (
  `user_id` int(11) NOT NULL,
  `nama_depan` varchar(50) NOT NULL,
  `nama_belakang` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `no_tlpn` varchar(20) NOT NULL,
  `update_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `last_login` timestamp NULL DEFAULT NULL,
  `create_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `role` int(11) NOT NULL CHECK (`role` in (1,2,3,4))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_user`
--

INSERT INTO `tbl_user` (`user_id`, `nama_depan`, `nama_belakang`, `email`, `password`, `no_tlpn`, `update_time`, `last_login`, `create_time`, `role`) VALUES
(1, 'John', 'Doe', 'john.doe@example.com', 'password123', '1234567890', '2024-06-07 12:28:27', NULL, '2024-06-07 12:28:27', 1),
(2, 'Jane', 'Smith', 'jane.smith@example.com', 'password123', '0987654321', '2024-06-07 12:28:27', NULL, '2024-06-07 12:28:27', 2),
(3, 'Alice', 'Johnson', 'alice.johnson@example.com', 'password123', '1122334455', '2024-06-07 12:28:27', NULL, '2024-06-07 12:28:27', 3),
(4, 'Bob', 'Brown', 'bob.brown@example.com', 'password123', '5566778899', '2024-06-07 12:28:27', NULL, '2024-06-07 12:28:27', 4),
(5, 'dian pertiwi', 'dian', 'dian@example.com', '$2a$08$qN39Lq6OyJt5wn.Dgl384u6EABmn34Rg3h73STN9Q1fCNMQRUlqim', '1234567890', '2024-06-07 13:12:28', NULL, '2024-06-07 13:12:28', 1),
(6, 'astuti', 'as', 'as23@gmail.com', '$2a$08$0SVpb8cttE7cokn7yTHCPuaDWp6NTvwx/dKscwkCC2FPEfG3Y.9F2', '12345678900', '2024-06-07 13:21:23', NULL, '2024-06-07 13:21:23', 3),
(7, 'zidan ansori', 'zidan', 'zidan@example.com', '$2a$08$6xzg2dp9WKV7zvVTPDHnmOW0P9ze.XZpAp9R6oov6czFrJWDwA/6.', '1234567890', '2024-06-07 13:29:46', NULL, '2024-06-07 13:29:46', 2),
(9, 'zidan2 ansori', 'zidan', 'zidan2@gamil.com', '$2a$08$0EUSDtV0W6dWMtD.uLvw3evw9bO4D1seQBKptH0AFXGA01MvU9oqe', '1234567890', '2024-06-07 13:52:26', NULL, '2024-06-07 13:52:26', 2),
(10, 'dian2', 'dian2', 'dian2@gamil.com', '$2a$08$QrNUb4PoZgv3q0CF/a/A1OtQdJUH41EEG7A4YaMBzlqqN2aylVhM.', '0234567890', '2024-06-07 14:09:02', NULL, '2024-06-07 14:09:02', 4);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_kategori`
--
ALTER TABLE `tbl_kategori`
  ADD PRIMARY KEY (`kategori_id`);

--
-- Indexes for table `tbl_order`
--
ALTER TABLE `tbl_order`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `tbl_product`
--
ALTER TABLE `tbl_product`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `kategori_id` (`kategori_id`);

--
-- Indexes for table `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_kategori`
--
ALTER TABLE `tbl_kategori`
  MODIFY `kategori_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_order`
--
ALTER TABLE `tbl_order`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_product`
--
ALTER TABLE `tbl_product`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_order`
--
ALTER TABLE `tbl_order`
  ADD CONSTRAINT `tbl_order_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `tbl_product` (`product_id`),
  ADD CONSTRAINT `tbl_order_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `tbl_user` (`user_id`);

--
-- Constraints for table `tbl_product`
--
ALTER TABLE `tbl_product`
  ADD CONSTRAINT `tbl_product_ibfk_1` FOREIGN KEY (`kategori_id`) REFERENCES `tbl_kategori` (`kategori_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
