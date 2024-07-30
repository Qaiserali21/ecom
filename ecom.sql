-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 12, 2024 at 07:24 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecom`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_users`
--

CREATE TABLE `admin_users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin_users`
--

INSERT INTO `admin_users` (`id`, `username`, `password`) VALUES
(1, 'admin', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `categories` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `categories`, `status`) VALUES
(2, 'sneakers', 1);

-- --------------------------------------------------------

--
-- Table structure for table `contact_us`
--

CREATE TABLE `contact_us` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(75) NOT NULL,
  `mobile` varchar(15) NOT NULL,
  `comment` text NOT NULL,
  `added_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `contact_us`
--

INSERT INTO `contact_us` (`id`, `name`, `email`, `mobile`, `comment`, `added_on`) VALUES
(4, 'Qaiser Ali', 'qali79614@gamil.com', '03349389184', 'testing', '2024-07-05 09:58:13'),
(5, 'Qaiser Ali', 'qali79614@gamil.com', '03349389184', 'ydfg', '2024-07-05 12:41:19');

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `address` varchar(250) NOT NULL,
  `city` varchar(50) NOT NULL,
  `pincode` int(11) NOT NULL,
  `payment_type` varchar(20) NOT NULL,
  `total_price` float NOT NULL,
  `payment_status` varchar(20) NOT NULL,
  `order_status` varchar(20) NOT NULL,
  `added_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order`
--

INSERT INTO `order` (`id`, `user_id`, `address`, `city`, `pincode`, `payment_type`, `total_price`, `payment_status`, `order_status`, `added_on`) VALUES
(1, 1, 'khan caloni st#3 lahore cantt, 2.5', 'lahore', 54810, 'COD', 100, 'pending', 'pending', '2024-07-08 09:52:07'),
(2, 1, 'khan caloni st#3 lahore cantt, 2.5', 'lahore', 54810, 'COD', 100, 'pending', 'pending', '2024-07-08 10:08:06'),
(3, 1, 'Khan Calony St#3 House No. E-721 Academy Road Lahore Cantt', 'lahore', 3434, 'COD', 300, 'pending', 'pending', '2024-07-08 10:12:07'),
(4, 6, 'Khan Calony St#3 House No. E-721 Academy Road Lahore Cantt', 'lahore', 3434, 'COD', 60000, 'pending', 'pending', '2024-07-10 08:41:00');

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `price` float NOT NULL,
  `added_on` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`id`, `order_id`, `product_id`, `qty`, `price`, `added_on`) VALUES
(1, 1, 16, 1, 100, 0),
(2, 2, 16, 1, 100, 0),
(3, 3, 16, 3, 100, 0),
(4, 4, 13, 4, 8000, 0),
(5, 4, 19, 4, 7000, 0);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `categories_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `mrp` float NOT NULL,
  `price` float NOT NULL,
  `qty` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `short_desc` varchar(2000) NOT NULL,
  `description` text NOT NULL,
  `meta_title` varchar(2000) NOT NULL,
  `meta_desc` varchar(2000) NOT NULL,
  `meta_keyword` varchar(2000) NOT NULL,
  `status` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `categories_id`, `name`, `mrp`, `price`, `qty`, `image`, `short_desc`, `description`, `meta_title`, `meta_desc`, `meta_keyword`, `status`) VALUES
(13, 2, 'Air Force', 7000, 8000, 6, '10922829_WhatsApp Image 2024-07-10 at 08.46.51_1d9f8448.jpg', 'White Sneakers', 'White sneakers are versatile and stylish footwear typically made from leather, canvas, or synthetic materials. They feature a clean, minimalistic design and are often characterized by a low-top silhouette, lace-up closure, and cushioned soles for comfort. White sneakers are popular for their ability to complement a wide range of outfits, from casual to semi-formal, making them a wardrobe staple for many.', 'White sneakers are versatile and stylish footwear typically made from leather, canvas, or synthetic materials. They feature a clean, minimalistic design and are often characterized by a low-top silhouette, lace-up closure, and cushioned soles for comfort. White sneakers are popular for their ability to complement a wide range of outfits, from casual to semi-formal, making them a wardrobe staple for many.', 'White sneakers are versatile and stylish footwear typically made from leather, canvas, or synthetic materials. They feature a clean, minimalistic design and are often characterized by a low-top silhouette, lace-up closure, and cushioned soles for comfort. White sneakers are popular for their ability to complement a wide range of outfits, from casual to semi-formal, making them a wardrobe staple for many.', '3', 1),
(14, 8, 'asas', 100, 100, 4, '10828698_Main Image.webp', 'asas', 'asas', 'asas', 'asas', '2', 1),
(15, 8, 'asasas', 100, 80, 4, '10035156_Main Image (97).png', 'asasa', 'asasas', 'asas', 'asas', '1', 1),
(16, 5, 'dsadas', 100, 100, 4, '10923590_Main Image (1).webp', 'fsdfsfs', 'fsfsdf', 'fsfds', 'fsfsf', '3', 1),
(17, 2, 'sneaskers', 7000, 8000, 6, '11101339_WhatsApp Image 2024-07-10 at 08.46.52_e1b15095.jpg', 'White sneakers are versatile and stylish footwear typically made from leather, canvas, or synthetic materials. They feature a clean, minimalistic design and are often characterized by a low-top silhouette, lace-up closure, and cushioned soles for comfort. White sneakers are popular for their ability to complement a wide range of outfits, from casual to semi-formal, making them a wardrobe staple for many.', 'White sneakers are versatile and stylish footwear typically made from leather, canvas, or synthetic materials. They feature a clean, minimalistic design and are often characterized by a low-top silhouette, lace-up closure, and cushioned soles for comfort. White sneakers are popular for their ability to complement a wide range of outfits, from casual to semi-formal, making them a wardrobe staple for many.', '', '', '', 1),
(18, 2, 'sneakers', 8000, 7000, 6, '10304332_WhatsApp Image 2024-07-10 at 08.46.52_e428fd93.jpg', 'White sneakers are versatile and stylish footwear typically made from leather, canvas, or synthetic materials. They feature a clean, minimalistic design and are often characterized by a low-top silhouette, lace-up closure, and cushioned soles for comfort. White sneakers are popular for their ability to complement a wide range of outfits, from casual to semi-formal, making them a wardrobe staple for many.', 'White sneakers are versatile and stylish footwear typically made from leather, canvas, or synthetic materials. They feature a clean, minimalistic design and are often characterized by a low-top silhouette, lace-up closure, and cushioned soles for comfort. White sneakers are popular for their ability to complement a wide range of outfits, from casual to semi-formal, making them a wardrobe staple for many.', '', '', '', 1),
(19, 2, 'Nike', 8000, 7000, 6, '10445017_WhatsApp Image 2024-07-10 at 08.46.52_3d0c94e6.jpg', 'White sneakers are versatile and stylish footwear typically made from leather, canvas, or synthetic materials. They feature a clean, minimalistic design and are often characterized by a low-top silhouette, lace-up closure, and cushioned soles for comfort. White sneakers are popular for their ability to complement a wide range of outfits, from casual to semi-formal, making them a wardrobe staple for many.', 'White sneakers are versatile and stylish footwear typically made from leather, canvas, or synthetic materials. They feature a clean, minimalistic design and are often characterized by a low-top silhouette, lace-up closure, and cushioned soles for comfort. White sneakers are popular for their ability to complement a wide range of outfits, from casual to semi-formal, making them a wardrobe staple for many.', 'White sneakers are versatile and stylish footwear typically made from leather, canvas, or synthetic materials. They feature a clean, minimalistic design and are often characterized by a low-top silhouette, lace-up closure, and cushioned soles for comfort. White sneakers are popular for their ability to complement a wide range of outfits, from casual to semi-formal, making them a wardrobe staple for many.', 'White sneakers are versatile and stylish footwear typically made from leather, canvas, or synthetic materials. They feature a clean, minimalistic design and are often characterized by a low-top silhouette, lace-up closure, and cushioned soles for comfort. White sneakers are popular for their ability to complement a wide range of outfits, from casual to semi-formal, making them a wardrobe staple for many.', '2', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `password` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `mobile` varchar(15) NOT NULL,
  `added_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `password`, `email`, `mobile`, `added_on`) VALUES
(6, 'Qaiser Ali', '123456', 'Phillip@onlinepharmacy-4u.co.uk', '03021467564', '2024-07-10 08:39:45');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_users`
--
ALTER TABLE `admin_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact_us`
--
ALTER TABLE `contact_us`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
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
-- AUTO_INCREMENT for table `admin_users`
--
ALTER TABLE `admin_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `contact_us`
--
ALTER TABLE `contact_us`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
