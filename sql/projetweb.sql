-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  ven. 07 mai 2021 à 09:01
-- Version du serveur :  10.4.10-MariaDB
-- Version de PHP :  7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `projetweb`
--
CREATE DATABASE IF NOT EXISTS `projetweb` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `projetweb`;

-- --------------------------------------------------------

--
-- Structure de la table `articles`
--

DROP TABLE IF EXISTS `articles`;
CREATE TABLE IF NOT EXISTS `articles` (
  `Id_article` int(11) NOT NULL,
  `public` varchar(10) NOT NULL,
  `couleur` varchar(16) NOT NULL,
  `description` text DEFAULT NULL,
  `illustration` varchar(30) DEFAULT NULL,
  `prix` int(11) NOT NULL,
  `nom_article` varchar(30) NOT NULL,
  PRIMARY KEY (`Id_article`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `cartebancaire`
--

DROP TABLE IF EXISTS `cartebancaire`;
CREATE TABLE IF NOT EXISTS `cartebancaire` (
  `n_carte` varchar(16) NOT NULL,
  `Date_validite` date NOT NULL,
  `num_secret` int(3) NOT NULL,
  `nom_owner` varchar(20) NOT NULL,
  `Id_user` varchar(11) NOT NULL,
  PRIMARY KEY (`n_carte`),
  KEY `Id_user` (`Id_user`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

DROP TABLE IF EXISTS `commande`;
CREATE TABLE IF NOT EXISTS `commande` (
  `Id_article` int(11) NOT NULL,
  `id_user` varchar(11) NOT NULL,
  `quantite` int(11) NOT NULL,
  `Ptt` int(11) NOT NULL,
  `date_commande` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `role`
--

DROP TABLE IF EXISTS `role`;
CREATE TABLE IF NOT EXISTS `role` (
  `Id_role` int(11) NOT NULL,
  `Role` varchar(30) NOT NULL,
  PRIMARY KEY (`Id_role`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `role`
--

INSERT INTO `role` (`Id_role`, `Role`) VALUES
(0, 'administrateur'),
(1, 'client');

-- --------------------------------------------------------

--
-- Structure de la table `utilisateurs`
--

DROP TABLE IF EXISTS `utilisateurs`;
CREATE TABLE IF NOT EXISTS `utilisateurs` (
  `id_user` varchar(11) NOT NULL,
  `Id_Role` int(11) DEFAULT NULL,
  `mdp` varchar(30) NOT NULL,
  PRIMARY KEY (`id_user`),
  KEY `Id_Role` (`Id_Role`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `utilisateurs`
--

INSERT INTO `utilisateurs` (`id_user`, `Id_Role`, `mdp`) VALUES
('EdMak', 0, 'Azert07'),
('Njmi', 0, 'Azert70'),
('Paul', 1, 'Azert07');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
