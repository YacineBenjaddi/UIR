-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 09, 2020 at 01:35 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `BDD`
--

-- --------------------------------------------------------

--
-- Table structure for table `blacklist`
--

CREATE TABLE `blacklist` (
  `id` int(11) NOT NULL,
  `nb_block` int(11) DEFAULT NULL,
  `date_block` date NOT NULL,
  `date_fin_block` date NOT NULL,
  `id_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `blacklist`
--

INSERT INTO `blacklist` (`id`, `nb_block`, `date_block`, `date_fin_block`, `id_user`) VALUES
(1, 2, '2020-11-01', '2020-11-04', 6);

-- --------------------------------------------------------

--
-- Table structure for table `horraire_basket`
--

CREATE TABLE `horraire_basket` (
  `id_basket` int(11) NOT NULL,
  `creneau` varchar(25) DEFAULT NULL,
  `numero` int(11) DEFAULT NULL,
  `dispo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `horraire_basket`
--

INSERT INTO `horraire_basket` (`id_basket`, `creneau`, `numero`, `dispo`) VALUES
(1, '9:00 - 10:00', 1, 0),
(2, '9:00 - 10:00', 2, 0),
(3, '10:00 - 11:00', 1, 0),
(4, '10:00 - 11:00', 2, 0);

-- --------------------------------------------------------

--
-- Table structure for table `horraire_foot`
--

CREATE TABLE `horraire_foot` (
  `id_foot` int(11) NOT NULL,
  `creneau` varchar(30) NOT NULL,
  `disponibilite` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `horraire_foot`
--

INSERT INTO `horraire_foot` (`id_foot`, `creneau`, `disponibilite`) VALUES
(1, '9:00 - 10:00', 0),
(2, '10:00 - 11:00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `horraire_piscine`
--

CREATE TABLE `horraire_piscine` (
  `id_piscine` int(11) NOT NULL,
  `crenau` varchar(25) DEFAULT NULL,
  `gender` varchar(25) DEFAULT NULL,
  `semaine` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `horraire_tennis`
--

CREATE TABLE `horraire_tennis` (
  `id_tennis` int(11) NOT NULL,
  `creneau` varchar(50) NOT NULL,
  `dispo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `horraire_tennis`
--

INSERT INTO `horraire_tennis` (`id_tennis`, `creneau`, `dispo`) VALUES
(1, '9:00 - 10:00', 0),
(2, '10:00 - 11:00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `loisir`
--

CREATE TABLE `loisir` (
  `id_loisir` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `latitude` varchar(255) NOT NULL,
  `longitude` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `loisir`
--

INSERT INTO `loisir` (`id_loisir`, `nom`, `description`, `latitude`, `longitude`) VALUES
(1, 'Mini Football', 'Disponible de 8h30-00h00', '33.984894', '-6.722248'),
(2, 'Piscine', 'Disponible selon la semaine', '33.985081', ' -6.722919'),
(3, 'Tennis', 'Disponible de 8h30-00h00', '33.984440', '-6.722974'),
(4, 'Salle de Musculation', 'Disponible de 17h-22h', '33.986215', '-6.721950'),
(5, 'Basket', 'Disponible de 8h30-00h00', '33.984722', '-6.722662');

-- --------------------------------------------------------

--
-- Table structure for table `reservation_basket`
--

CREATE TABLE `reservation_basket` (
  `id_res_basket` int(11) NOT NULL,
  `id_user` int(11) DEFAULT NULL,
  `id_basket` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `reservation_piscine`
--

CREATE TABLE `reservation_piscine` (
  `id_res_piscine` int(11) NOT NULL,
  `id_user` int(11) DEFAULT NULL,
  `id_piscine` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `reservation_tennis`
--

CREATE TABLE `reservation_tennis` (
  `id_res_tennis` int(11) NOT NULL,
  `id_user` int(11) DEFAULT NULL,
  `id_tennis` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `resrvation_foot`
--

CREATE TABLE `resrvation_foot` (
  `id_res_foot` int(11) NOT NULL,
  `id_user` int(11) DEFAULT NULL,
  `id_foot` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `first_name` varchar(40) NOT NULL,
  `last_name` varchar(40) NOT NULL,
  `email` varchar(60) NOT NULL,
  `password` varchar(60) NOT NULL,
  `penalty` int(11) NOT NULL,
  `gender` varchar(30) NOT NULL,
  `profile` varchar(20) NOT NULL,
  `reset` int(11) NOT NULL,
  `code` varchar(50) NOT NULL,
  `year` varchar(50) NOT NULL,
  `branch` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `first_name`, `last_name`, `email`, `password`, `penalty`, `gender`, `profile`, `reset`, `code`, `year`, `branch`) VALUES
(1, 'rida', 'essadiki', 'rida.essadiki@uir.ac.ma', '123678', 1, 'male', 'User', 760581, '105180', '5 eme', 'ISI'),
(3, 'yassine', 'benjaddi', 'yassine.benjaddi@uir.ac.ma', 'yass', 0, 'male', 'User', 78354, '123465', '5eme', 'ISI'),
(4, 'manal', 'el ouardani', 'manal.elouardani@uir.ac.ma', '123000', 0, 'female', 'User', 0, '159786', '5 eme', 'ISI'),
(5, 'Ilias', 'siyassi', 'ilias.siyassi@uir.ac.ma', '123455', 0, 'male', 'User', 0, '145786', '5 eme', 'ISI '),
(6, 'Wail', 'Lamhannad', 'test', '11', 0, 'male', 'User', 0, '157896', '5 eme', 'ISI');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `blacklist`
--
ALTER TABLE `blacklist`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `horraire_basket`
--
ALTER TABLE `horraire_basket`
  ADD PRIMARY KEY (`id_basket`);

--
-- Indexes for table `horraire_foot`
--
ALTER TABLE `horraire_foot`
  ADD PRIMARY KEY (`id_foot`);

--
-- Indexes for table `horraire_piscine`
--
ALTER TABLE `horraire_piscine`
  ADD PRIMARY KEY (`id_piscine`);

--
-- Indexes for table `horraire_tennis`
--
ALTER TABLE `horraire_tennis`
  ADD PRIMARY KEY (`id_tennis`);

--
-- Indexes for table `loisir`
--
ALTER TABLE `loisir`
  ADD PRIMARY KEY (`id_loisir`);

--
-- Indexes for table `reservation_basket`
--
ALTER TABLE `reservation_basket`
  ADD PRIMARY KEY (`id_res_basket`);

--
-- Indexes for table `reservation_piscine`
--
ALTER TABLE `reservation_piscine`
  ADD PRIMARY KEY (`id_res_piscine`);

--
-- Indexes for table `reservation_tennis`
--
ALTER TABLE `reservation_tennis`
  ADD PRIMARY KEY (`id_res_tennis`);

--
-- Indexes for table `resrvation_foot`
--
ALTER TABLE `resrvation_foot`
  ADD PRIMARY KEY (`id_res_foot`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `blacklist`
--
ALTER TABLE `blacklist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `horraire_basket`
--
ALTER TABLE `horraire_basket`
  MODIFY `id_basket` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `horraire_foot`
--
ALTER TABLE `horraire_foot`
  MODIFY `id_foot` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `horraire_piscine`
--
ALTER TABLE `horraire_piscine`
  MODIFY `id_piscine` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `horraire_tennis`
--
ALTER TABLE `horraire_tennis`
  MODIFY `id_tennis` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `loisir`
--
ALTER TABLE `loisir`
  MODIFY `id_loisir` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `reservation_basket`
--
ALTER TABLE `reservation_basket`
  MODIFY `id_res_basket` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reservation_piscine`
--
ALTER TABLE `reservation_piscine`
  MODIFY `id_res_piscine` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reservation_tennis`
--
ALTER TABLE `reservation_tennis`
  MODIFY `id_res_tennis` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `resrvation_foot`
--
ALTER TABLE `resrvation_foot`
  MODIFY `id_res_foot` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `blacklist`
--
ALTER TABLE `blacklist`
  ADD CONSTRAINT `blacklist_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
