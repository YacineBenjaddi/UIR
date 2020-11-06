-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : sam. 07 nov. 2020 à 00:44
-- Version du serveur :  10.4.14-MariaDB
-- Version de PHP : 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `uir`
--

-- --------------------------------------------------------

--
-- Structure de la table `blacklist`
--

CREATE TABLE `blacklist` (
  `id` int(11) NOT NULL,
  `nb_block` int(11) DEFAULT NULL,
  `date_block` date NOT NULL,
  `date_fin_block` date NOT NULL,
  `id_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `blacklist`
--

INSERT INTO `blacklist` (`id`, `nb_block`, `date_block`, `date_fin_block`, `id_user`) VALUES
(1, 2, '2020-11-01', '2020-11-04', 6);

-- --------------------------------------------------------

--
-- Structure de la table `horraire_basket`
--

CREATE TABLE `horraire_basket` (
  `id_basket` int(11) NOT NULL,
  `creneau` varchar(25) DEFAULT NULL,
  `numero` int(11) DEFAULT NULL,
  `dispo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `horraire_basket`
--

INSERT INTO `horraire_basket` (`id_basket`, `creneau`, `numero`, `dispo`) VALUES
(1, '9:00 - 10:00', 1, 0),
(2, '9:00 - 10:00', 2, 0),
(3, '10:00 - 11:00', 1, 0),
(4, '10:00 - 11:00', 2, 0);

-- --------------------------------------------------------

--
-- Structure de la table `horraire_foot`
--

CREATE TABLE `horraire_foot` (
  `id_foot` int(11) NOT NULL,
  `creneau` varchar(30) NOT NULL,
  `disponibilite` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `horraire_foot`
--

INSERT INTO `horraire_foot` (`id_foot`, `creneau`, `disponibilite`) VALUES
(1, '9:00 - 10:00', 0),
(2, '10:00 - 11:00', 0);

-- --------------------------------------------------------

--
-- Structure de la table `horraire_piscine`
--

CREATE TABLE `horraire_piscine` (
  `id_piscine` int(11) NOT NULL,
  `crenau` varchar(25) DEFAULT NULL,
  `gender` varchar(25) DEFAULT NULL,
  `semaine` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `horraire_tennis`
--

CREATE TABLE `horraire_tennis` (
  `id_tennis` int(11) NOT NULL,
  `creneau` varchar(50) NOT NULL,
  `dispo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `horraire_tennis`
--

INSERT INTO `horraire_tennis` (`id_tennis`, `creneau`, `dispo`) VALUES
(1, '9:00 - 10:00', 0),
(2, '10:00 - 11:00', 0);

-- --------------------------------------------------------

--
-- Structure de la table `reservation_basket`
--

CREATE TABLE `reservation_basket` (
  `id_res_basket` int(11) NOT NULL,
  `id_user` int(11) DEFAULT NULL,
  `id_basket` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `reservation_piscine`
--

CREATE TABLE `reservation_piscine` (
  `id_res_piscine` int(11) NOT NULL,
  `id_user` int(11) DEFAULT NULL,
  `id_piscine` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `reservation_tennis`
--

CREATE TABLE `reservation_tennis` (
  `id_res_tennis` int(11) NOT NULL,
  `id_user` int(11) DEFAULT NULL,
  `id_tennis` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `resrvation_foot`
--

CREATE TABLE `resrvation_foot` (
  `id_res_foot` int(11) NOT NULL,
  `id_user` int(11) DEFAULT NULL,
  `id_foot` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `user`
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
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id_user`, `first_name`, `last_name`, `email`, `password`, `penalty`, `gender`, `profile`, `reset`, `code`, `year`, `branch`) VALUES
(1, 'rida', 'essadiki', 'rida.essadiki@uir.ac.ma', '123678', 1, 'male', 'User', 760581, '105180', '5 eme', 'ISI'),
(3, 'yassine', 'benjaddi', 'yassine.benjaddi@uir.ac.ma', 'yass', 0, 'male', 'User', 78354, '123465', '5eme', 'ISI'),
(4, 'manal', 'el ouardani', 'manal.elouardani@uir.ac.ma', '123000', 0, 'female', 'User', 0, '159786', '5 eme', 'ISI'),
(5, 'Ilias', 'siyassi', 'ilias.siyassi@uir.ac.ma', '123455', 0, 'male', 'User', 0, '145786', '5 eme', 'ISI '),
(6, 'Wail', 'Lamhannad', 'test', '11', 0, 'male', 'User', 0, '157896', '5 eme', 'ISI');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `blacklist`
--
ALTER TABLE `blacklist`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_user` (`id_user`);

--
-- Index pour la table `horraire_basket`
--
ALTER TABLE `horraire_basket`
  ADD PRIMARY KEY (`id_basket`);

--
-- Index pour la table `horraire_foot`
--
ALTER TABLE `horraire_foot`
  ADD PRIMARY KEY (`id_foot`);

--
-- Index pour la table `horraire_piscine`
--
ALTER TABLE `horraire_piscine`
  ADD PRIMARY KEY (`id_piscine`);

--
-- Index pour la table `horraire_tennis`
--
ALTER TABLE `horraire_tennis`
  ADD PRIMARY KEY (`id_tennis`);

--
-- Index pour la table `reservation_basket`
--
ALTER TABLE `reservation_basket`
  ADD PRIMARY KEY (`id_res_basket`);

--
-- Index pour la table `reservation_piscine`
--
ALTER TABLE `reservation_piscine`
  ADD PRIMARY KEY (`id_res_piscine`);

--
-- Index pour la table `reservation_tennis`
--
ALTER TABLE `reservation_tennis`
  ADD PRIMARY KEY (`id_res_tennis`);

--
-- Index pour la table `resrvation_foot`
--
ALTER TABLE `resrvation_foot`
  ADD PRIMARY KEY (`id_res_foot`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `blacklist`
--
ALTER TABLE `blacklist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `horraire_basket`
--
ALTER TABLE `horraire_basket`
  MODIFY `id_basket` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `horraire_foot`
--
ALTER TABLE `horraire_foot`
  MODIFY `id_foot` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `horraire_piscine`
--
ALTER TABLE `horraire_piscine`
  MODIFY `id_piscine` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `horraire_tennis`
--
ALTER TABLE `horraire_tennis`
  MODIFY `id_tennis` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `reservation_basket`
--
ALTER TABLE `reservation_basket`
  MODIFY `id_res_basket` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `reservation_piscine`
--
ALTER TABLE `reservation_piscine`
  MODIFY `id_res_piscine` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `reservation_tennis`
--
ALTER TABLE `reservation_tennis`
  MODIFY `id_res_tennis` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `resrvation_foot`
--
ALTER TABLE `resrvation_foot`
  MODIFY `id_res_foot` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `blacklist`
--
ALTER TABLE `blacklist`
  ADD CONSTRAINT `blacklist_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
