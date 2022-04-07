-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:8889
-- Généré le : jeu. 07 avr. 2022 à 09:55
-- Version du serveur : 5.7.34
-- Version de PHP : 7.4.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `biblio`
--

-- --------------------------------------------------------

--
-- Structure de la table `AUTEUR`
--

CREATE TABLE `AUTEUR` (
  `ID_Auteur` int(11) NOT NULL,
  `Nom_Auteur` varchar(20) NOT NULL,
  `Prenom_Auteur` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `CLASSEMENT`
--

CREATE TABLE `CLASSEMENT` (
  `ID_Genre` int(11) NOT NULL,
  `ISBN` varchar(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `EMPRUNTEUR`
--

CREATE TABLE `EMPRUNTEUR` (
  `ID_Emprunteur` int(11) NOT NULL,
  `ID_Mail` varchar(60) NOT NULL,
  `Prenom_Emprunteur` varchar(20) NOT NULL,
  `Telephone` int(11) NOT NULL,
  `Actif` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `EMPRUNTS`
--

CREATE TABLE `EMPRUNTS` (
  `ISBN` varchar(13) NOT NULL,
  `ID_Emprunteur` int(11) NOT NULL,
  `Date_Emprunt` date NOT NULL,
  `Date_Rendu` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `GENRE`
--

CREATE TABLE `GENRE` (
  `ID_Genre` int(11) NOT NULL,
  `Genre` varchar(20) NOT NULL,
  `Description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `LIVRE`
--

CREATE TABLE `LIVRE` (
  `ISBN` varchar(13) NOT NULL,
  `Titre_Livre` varchar(70) DEFAULT NULL,
  `ID_Auteur` int(11) NOT NULL,
  `Annee_Edition` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `UTILISATEUR`
--

CREATE TABLE `UTILISATEUR` (
  `Mail` varchar(60) NOT NULL,
  `Role` varchar(50) NOT NULL,
  `Mot_de_passe` char(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `AUTEUR`
--
ALTER TABLE `AUTEUR`
  ADD PRIMARY KEY (`ID_Auteur`);

--
-- Index pour la table `CLASSEMENT`
--
ALTER TABLE `CLASSEMENT`
  ADD KEY `ID_Genre` (`ID_Genre`),
  ADD KEY `ISBN` (`ISBN`);

--
-- Index pour la table `EMPRUNTEUR`
--
ALTER TABLE `EMPRUNTEUR`
  ADD PRIMARY KEY (`ID_Emprunteur`),
  ADD KEY `ID_Mail` (`ID_Mail`);

--
-- Index pour la table `EMPRUNTS`
--
ALTER TABLE `EMPRUNTS`
  ADD KEY `ISBN` (`ISBN`),
  ADD KEY `ID_Emprunteur` (`ID_Emprunteur`);

--
-- Index pour la table `GENRE`
--
ALTER TABLE `GENRE`
  ADD PRIMARY KEY (`ID_Genre`);

--
-- Index pour la table `LIVRE`
--
ALTER TABLE `LIVRE`
  ADD PRIMARY KEY (`ISBN`),
  ADD KEY `ID_Auteur` (`ID_Auteur`);

--
-- Index pour la table `UTILISATEUR`
--
ALTER TABLE `UTILISATEUR`
  ADD PRIMARY KEY (`Mail`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `AUTEUR`
--
ALTER TABLE `AUTEUR`
  MODIFY `ID_Auteur` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `EMPRUNTEUR`
--
ALTER TABLE `EMPRUNTEUR`
  MODIFY `ID_Emprunteur` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `GENRE`
--
ALTER TABLE `GENRE`
  MODIFY `ID_Genre` int(11) NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `CLASSEMENT`
--
ALTER TABLE `CLASSEMENT`
  ADD CONSTRAINT `classement_ibfk_1` FOREIGN KEY (`ID_Genre`) REFERENCES `GENRE` (`ID_Genre`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `classement_ibfk_2` FOREIGN KEY (`ISBN`) REFERENCES `EMPRUNTS` (`ISBN`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `EMPRUNTS`
--
ALTER TABLE `EMPRUNTS`
  ADD CONSTRAINT `emprunts_ibfk_1` FOREIGN KEY (`ID_Emprunteur`) REFERENCES `EMPRUNTEUR` (`ID_Emprunteur`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `LIVRE`
--
ALTER TABLE `LIVRE`
  ADD CONSTRAINT `livre_ibfk_1` FOREIGN KEY (`ID_Auteur`) REFERENCES `AUTEUR` (`ID_Auteur`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `UTILISATEUR`
--
ALTER TABLE `UTILISATEUR`
  ADD CONSTRAINT `utilisateur_ibfk_1` FOREIGN KEY (`Mail`) REFERENCES `EMPRUNTEUR` (`ID_Mail`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
