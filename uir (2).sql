-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : ven. 13 nov. 2020 à 17:41
-- Version du serveur :  10.4.11-MariaDB
-- Version de PHP : 7.4.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
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
-- Structure de la table `loisir`
--

CREATE TABLE `loisir` (
  `id_loisir` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `latitude` varchar(255) NOT NULL,
  `longitude` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `loisir`
--

INSERT INTO `loisir` (`id_loisir`, `nom`, `description`, `latitude`, `longitude`) VALUES
(1, 'Mini Football', 'Disponible de 8h30-00h00', '33.984894', '-6.722248'),
(2, 'Piscine', 'Disponible selon la semaine', '33.985081', ' -6.722919'),
(3, 'Tennis', 'Disponible de 8h30-00h00', '33.984440', '-6.722974'),
(4, 'Salle de Musculation', 'Disponible de 17h-22h', '33.986215', '-6.721950'),
(5, 'Basket', 'Disponible de 8h30-00h00', '33.984722', '-6.722662');

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
  `branch` varchar(50) NOT NULL,
  `nb_block` int(11) NOT NULL,
  `date_debut_block` date NOT NULL,
  `date_fin_block` date NOT NULL,
  `token` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id_user`, `first_name`, `last_name`, `email`, `password`, `penalty`, `gender`, `profile`, `reset`, `code`, `year`, `branch`, `nb_block`, `date_debut_block`, `date_fin_block`, `token`) VALUES
(1, 'rida', 'essadiki', 'rida.essadiki@uir.ac.ma', '123678', 1, 'male', 'User', 760581, '105180', '5 eme', 'ISI', 0, '2020-11-02', '2020-11-02', 'aqwed3456mg'),
(3, 'yassine', 'benjaddi', 'yassine.benjaddi@uir.ac.ma', 'yass', 0, 'male', 'User', 78354, '123465', '5eme', 'ISI', 0, '0000-00-00', '0000-00-00', 'jdg23vcikd'),
(4, 'manal', 'el ouardani', 'manal.elouardani@uir.ac.ma', '123000', 0, 'female', 'User', 0, '159786', '5 eme', 'ISI', 0, '0000-00-00', '0000-00-00', ''),
(5, 'Ilias', 'siyassi', 'ilias.siyassi@uir.ac.ma', '123455', 0, 'male', 'User', 0, '145786', '5 eme', 'ISI ', 0, '0000-00-00', '0000-00-00', ''),
(6, 'Wail', 'Lamhannad', 'test', '11', 0, 'male', 'User', 0, '157896', '5 eme', 'ISI', 3, '2020-11-02', '2020-11-03', '');

--
-- Index pour les tables déchargées
--

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
-- Index pour la table `loisir`
--
ALTER TABLE `loisir`
  ADD PRIMARY KEY (`id_loisir`);

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
-- AUTO_INCREMENT pour la table `loisir`
--
ALTER TABLE `loisir`
  MODIFY `id_loisir` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
