-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : lun. 28 déc. 2020 à 15:07
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
-- Structure de la table `horaire`
--

CREATE TABLE `horaire` (
  `id_horaire` int(11) NOT NULL,
  `creneau` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `horaire`
--

INSERT INTO `horaire` (`id_horaire`, `creneau`) VALUES
(9, '9:00 - 10:00'),
(10, '10:00 - 11:00'),
(11, '11:00 - 12:00'),
(12, '12:00 - 13:00'),
(13, '13:00 - 14:00'),
(14, '14:00 - 15:00'),
(15, '15:00 - 16:00'),
(16, '16:00 - 17:00'),
(17, '17:00-18:00'),
(18, '18:00 - 19:00'),
(19, '19:00 - 20:00'),
(20, '20:00 - 21:00'),
(21, '21:00 - 22:00'),
(22, '22:00 - 23:00'),
(23, '23:00 - 00:00');

-- --------------------------------------------------------

--
-- Structure de la table `loisir`
--

CREATE TABLE `loisir` (
  `id_loisir` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `latitude` varchar(255) NOT NULL,
  `longitude` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `capacite` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `loisir`
--

INSERT INTO `loisir` (`id_loisir`, `nom`, `description`, `latitude`, `longitude`, `type`, `capacite`) VALUES
(1, 'Mini Football', 'Disponible de 8h30-00h00', '33.984894', '-6.722248', 'foot', 1),
(2, 'Piscine', 'Disponible selon la semaine', '33.985081', ' -6.722919', 'piscine', 5),
(3, 'Tennis', 'Disponible de 8h30-00h00', '33.984440', '-6.722974', 'tennis', 2),
(4, 'Salle de Musculation', 'Disponible de 17h-22h', '33.986215', '-6.721950', 'musc', 5),
(5, 'Basket', 'Disponible de 8h30-00h00', '33.984722', '-6.722662', 'basket', 2);

-- --------------------------------------------------------

--
-- Structure de la table `photos`
--

CREATE TABLE `photos` (
  `id_photo` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `id_loisir` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `photos`
--

INSERT INTO `photos` (`id_photo`, `nom`, `id_loisir`) VALUES
(3, 'Piscine.jpg', 2),
(4, 'basket 1.jpg', 5),
(5, 'basket 2.jpg', 5),
(6, 'basket 3.jpg', 5),
(7, 'basket 4.jpg', 5),
(10, 'tennis 1.jpg', 3),
(11, 'tennis 2.jpg', 3),
(14, 'muscu.jpg', 4),
(15, 'muscu 2.jpg', 4),
(16, 'muscu 3.jpg', 4),
(17, 'mini foot 1.jpg', 1),
(18, 'mini foot 5.jpg', 1),
(19, 'mini foot 3.jpg', 1),
(20, 'mini foot 4.jpg', 1);

-- --------------------------------------------------------

--
-- Structure de la table `reservation`
--

CREATE TABLE `reservation` (
  `id_res` int(11) NOT NULL,
  `id_user` int(11) DEFAULT NULL,
  `id_horaire` int(11) DEFAULT NULL,
  `date_res` date DEFAULT NULL,
  `id_loisir` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `reservation`
--

INSERT INTO `reservation` (`id_res`, `id_user`, `id_horaire`, `date_res`, `id_loisir`) VALUES
(20, 1, 9, '2020-12-15', 1),
(25, 1, 21, '2020-12-09', 5),
(28, 1, 10, '2020-12-12', 5),
(30, 1, 9, '2020-12-26', 2),
(36, 5, 16, '2020-12-14', 3),
(37, 1, 16, '2020-12-14', 3),
(38, 1, 22, '2020-12-14', 1),
(39, 3, 22, '2020-12-14', 4),
(40, 6, 14, '2020-12-22', 5),
(41, 4, 16, '2020-12-31', 3),
(42, 1, 16, '2020-12-14', 3);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `first_name` varchar(40) NOT NULL,
  `last_name` varchar(40) NOT NULL,
  `email` varchar(60) NOT NULL,
  `password` varchar(60) DEFAULT NULL,
  `penalty` int(11) DEFAULT 0,
  `gender` varchar(30) NOT NULL,
  `profile` varchar(20) NOT NULL DEFAULT 'User',
  `reset` int(11) DEFAULT 0,
  `code` varchar(50) NOT NULL,
  `year` varchar(50) NOT NULL,
  `branch` varchar(50) NOT NULL,
  `nb_block` int(11) NOT NULL DEFAULT 0,
  `date_debut_block` date NOT NULL DEFAULT '2001-01-01',
  `date_fin_block` date NOT NULL DEFAULT '2001-01-01',
  `photo` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id_user`, `first_name`, `last_name`, `email`, `password`, `penalty`, `gender`, `profile`, `reset`, `code`, `year`, `branch`, `nb_block`, `date_debut_block`, `date_fin_block`, `photo`) VALUES
(1, 'rida', 'essadiki', 'rida', '12', 1, 'male', 'User', 760581, '105180', '5 eme', 'ISI', 0, '2020-11-02', '2020-11-02', 'wail.lamhannad@uir.ac.ma'),
(3, 'yassine', 'benjaddi', 'yassine.benjaddi@uir.ac.ma', 'yass', 0, 'male', 'User', 78354, '123465', '5eme', 'ISI', 0, '2001-01-01', '2001-01-01', ''),
(4, 'manal', 'el ouardani', 'manal', '123', 0, 'female', 'User', 0, '159786', '5 eme', 'ISI', 0, '2001-01-01', '2001-01-01', ''),
(5, 'Ilias', 'siyassi', 'ilias.siyassi@uir.ac.ma', '123455', 0, 'male', 'User', 0, '145786', '5 eme', 'ISI ', 0, '2001-01-01', '2001-01-01', ''),
(6, 'Wail', 'Lamhannad', 'wail.lamhannad@uir.ac.ma', '11', 0, 'male', 'User', 0, '157896', '5 eme', 'ISI', 2, '2020-11-02', '2020-11-03', ''),
(7, 'basma', 'guermah', 'basma.guermah@uir.ac.ma', '123456', 0, 'female', 'Personnel', 0, '0', '2020/2021', 'Ingenierie d\'informatique', 0, '2001-01-01', '2001-01-01', ''),
(9, 'secretary', 'test', 'admin@uir.ac.ma', '123456', 0, 'male', 'Admin', 0, '0', '0', 'test', 0, '2001-01-01', '2001-01-01', 'mysql.png'),
(18, 'ba', 'essadiki', 'badr.essadiki@uir.ac.ma', NULL, 0, 'male', 'User', 0, '1111', '2', 'Archi', 0, '2020-12-02', '2020-12-04', 'test.jpeg');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `horaire`
--
ALTER TABLE `horaire`
  ADD PRIMARY KEY (`id_horaire`);

--
-- Index pour la table `loisir`
--
ALTER TABLE `loisir`
  ADD PRIMARY KEY (`id_loisir`);

--
-- Index pour la table `photos`
--
ALTER TABLE `photos`
  ADD PRIMARY KEY (`id_photo`),
  ADD KEY `FK_Loisir` (`id_loisir`);

--
-- Index pour la table `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`id_res`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_horaire` (`id_horaire`),
  ADD KEY `id_loisir` (`id_loisir`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `horaire`
--
ALTER TABLE `horaire`
  MODIFY `id_horaire` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT pour la table `loisir`
--
ALTER TABLE `loisir`
  MODIFY `id_loisir` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `photos`
--
ALTER TABLE `photos`
  MODIFY `id_photo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT pour la table `reservation`
--
ALTER TABLE `reservation`
  MODIFY `id_res` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `photos`
--
ALTER TABLE `photos`
  ADD CONSTRAINT `FK_Loisir` FOREIGN KEY (`id_loisir`) REFERENCES `loisir` (`id_loisir`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `reservation_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`),
  ADD CONSTRAINT `reservation_ibfk_3` FOREIGN KEY (`id_horaire`) REFERENCES `horaire` (`id_horaire`),
  ADD CONSTRAINT `reservation_ibfk_4` FOREIGN KEY (`id_loisir`) REFERENCES `loisir` (`id_loisir`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
