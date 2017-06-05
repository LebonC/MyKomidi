-- phpMyAdmin SQL Dump
-- version 4.0.10.6
-- http://www.phpmyadmin.net
--
-- Host: mysql-lebonc.alwaysdata.net
-- Generation Time: Jun 05, 2017 at 10:42 AM
-- Server version: 10.1.20-MariaDB
-- PHP Version: 5.6.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `lebonc_db_komidi`
--

-- --------------------------------------------------------

--
-- Table structure for table `kdi_genre`
--

CREATE TABLE IF NOT EXISTS `kdi_genre` (
  `Gre_code` int(11) NOT NULL AUTO_INCREMENT,
  `Gre_nom` varchar(30) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`Gre_code`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `kdi_genre`
--

INSERT INTO `kdi_genre` (`Gre_code`, `Gre_nom`) VALUES
(1, 'Action'),
(2, 'Animation'),
(3, 'ComÃ©die'),
(4, 'Drame'),
(7, 'ThÃ©Ã¢tre'),
(9, 'Musical');

-- --------------------------------------------------------

--
-- Table structure for table `kdi_horaire`
--

CREATE TABLE IF NOT EXISTS `kdi_horaire` (
  `Hor_id` int(11) NOT NULL,
  `Hor_Debut` time NOT NULL,
  PRIMARY KEY (`Hor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `kdi_note`
--

CREATE TABLE IF NOT EXISTS `kdi_note` (
  `Note` int(11) DEFAULT NULL,
  `Spe_id` int(11) NOT NULL,
  `EmailUtilisateur` varchar(250) NOT NULL,
  PRIMARY KEY (`Spe_id`,`EmailUtilisateur`),
  KEY `FK_kdi_note_EmailUtilisateur` (`EmailUtilisateur`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kdi_note`
--

INSERT INTO `kdi_note` (`Note`, `Spe_id`, `EmailUtilisateur`) VALUES
(5, 1, '174721@supinfo.com'),
(3, 1, 'jerome.athion@orange.fr'),
(4, 1, 'kazenon@live.fr'),
(3, 1, 'lion.heart@live.fr'),
(5, 1, 'root'),
(4, 1, 'titi@live.fr'),
(4, 2, 'root'),
(3, 4, 'root'),
(5, 5, '174721@supinfo.com'),
(4, 5, 'root'),
(4, 6, 'root'),
(5, 6, 'titi@live.fr'),
(5, 8, '174721@supinfo.com'),
(4, 8, 'kazenon@live.fr'),
(4, 8, 'root');

-- --------------------------------------------------------

--
-- Table structure for table `kdi_salle`
--

CREATE TABLE IF NOT EXISTS `kdi_salle` (
  `Sal_id` int(11) NOT NULL,
  `Sal_nom` varchar(30) NOT NULL,
  `Sal_latitude` double DEFAULT NULL,
  `Sal_longitude` double DEFAULT NULL,
  `Sal_jauge` smallint(6) DEFAULT NULL,
  `Sal_adresse` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Sal_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `kdi_salle`
--

INSERT INTO `kdi_salle` (`Sal_id`, `Sal_nom`, `Sal_latitude`, `Sal_longitude`, `Sal_jauge`, `Sal_adresse`) VALUES
(0, 'Césaire', -20.9138081, 55.6106246, 110, 'Saint-Suzanne'),
(1, 'Le Royal', -21.380171, 55.616111, 400, 'Saint Joseph'),
(2, 'Gymnase du lycée de Vincendo', -21.3768, 55.6685, NULL, 'Vincendo'),
(3, 'Auditorium', -21.378829, 55.615206, 170, 'Saint Joseph'),
(4, 'Pierre Poivre', -21.373768, 55.624068, 50, 'Rue Hippolyte Foucque Saint Joseph'),
(5, 'Antoine Roussin', -21.273437, 55.414074, NULL, 'Rue Leconte de Lisle Saint Louis'),
(6, 'Langenier', -21.33367, 55.465727, 210, '1-13 Rue De La Republique Saint Pierre'),
(7, 'Blanche Pierson', -21.377093, 55.614798, 60, '4, rue Roland Garros St Joseph'),
(8, 'Fangourin', -21.355097, 55.566001, 190, '20 Rue du General de Gaulle Petite Ile'),
(9, 'Achile Grondin', -21.377889, 55.607305, NULL, '17 Rue Justinien Vitry Saint-Joseph'),
(10, 'Hall du Marché', NULL, NULL, 600, 'Saint-Joseph'),
(11, 'MpT Jean Petit', -21.339488, 55.628922, 50, '56-58 Rue Amélie Lebon Saint-Joseph'),
(12, 'MpT Plaine des Grègues', -21.326836, 55.607609, 100, '2-12 Rue du Rond Saint-Joseph'),
(13, 'Madoré', -21.359956, 55.767228, 240, '1 Rue du Stade Saint-Philippe'),
(14, 'Césaire', -20.9138081, 55.6106246, 110, 'Saint-Suzanne'),
(15, 'Lespas', -21.002227, 55.1926142, 160, 'Saint-Paul'),
(16, 'Pierrefonds', NULL, NULL, 230, 'Saint-Pierre');

-- --------------------------------------------------------

--
-- Table structure for table `kdi_seance`
--

CREATE TABLE IF NOT EXISTS `kdi_seance` (
  `Sec_date` date NOT NULL,
  `Sal_id` int(11) NOT NULL,
  `Hor_id` int(11) NOT NULL,
  `Spe_id` int(11) NOT NULL,
  PRIMARY KEY (`Sec_date`),
  KEY `FK_kdi_seance_Sal_id` (`Sal_id`),
  KEY `FK_kdi_seance_Hor_id` (`Hor_id`),
  KEY `FK_kdi_seance_Spe_id` (`Spe_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `kdi_spectacle`
--

CREATE TABLE IF NOT EXISTS `kdi_spectacle` (
  `Spe_id` int(11) NOT NULL AUTO_INCREMENT,
  `Spe_titre` varchar(50) NOT NULL,
  `Spe_annee` int(11) DEFAULT NULL,
  `Spe_mes` varchar(50) NOT NULL,
  `Spe_acteur` text,
  `Spe_cie` varchar(80) NOT NULL,
  `Spe_duree` int(11) NOT NULL,
  `Spe_Lang` varchar(2) DEFAULT NULL,
  `Spe_public` enum('tout','Scolaire') DEFAULT NULL,
  `Spe_affiche` varchar(50) NOT NULL,
  `Spe_resume_court` varchar(500) NOT NULL,
  `Spe_resume_long` text,
  `Gre_code` int(11) NOT NULL,
  PRIMARY KEY (`Spe_id`),
  KEY `FK_kdi_spectacle_Gre_code` (`Gre_code`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `kdi_spectacle`
--

INSERT INTO `kdi_spectacle` (`Spe_id`, `Spe_titre`, `Spe_annee`, `Spe_mes`, `Spe_acteur`, `Spe_cie`, `Spe_duree`, `Spe_Lang`, `Spe_public`, `Spe_affiche`, `Spe_resume_court`, `Spe_resume_long`, `Gre_code`) VALUES
(1, 'ATTENDS !', 2016, 'Laurent Salle', 'Laurent Salle                                                                                                                                                                                                            ', 'Circus Nout Pai (Reunion)', 45, 'Fr', 'tout', 'Attends_!_.jpg', 'Jean-Louis Grindsl a encore rate le bus... Mais loin il attend le suivant ...                                                                                                                                                                                                            ', 'Jean-Louis Grindsl a encore rat le bus...Mais il attend le suivant. Assis sur un banc, Jean-Louis, qui ne manque pas une occasion de prendre du bon temps, laisse alors libre court a  son imagination. \nAvec son ami Doudou, une peluche, il rit aux eclats, s''amuse de la pluie et s''invente d''etranges danses¹ les objets prennent vie...                                                                                                                                                                                                            ', 3),
(2, 'AVENUE ZERO', 2016, 'test', '', 'test', 50, 'Fr', 'Scolaire', '616107.jpg', 'Avenue ZÃ©ro, c''est l''instant zÃ©ro, celui oÃ¹ tout commence.', 'Avenue ZÃ©ro, c''est l''instant zÃ©ro, celui oÃ¹ tout commence.\r\nC''est l''histoire d''une ville qui se vide. Cinq individus, perchÃ©s sur le fil de leur solitude, finiront par se regarder, se retrouver afin d''Ã©crire une nouvelle page.\r\nTenir dans ses mains la fragilitÃ© du monde. Il suffit d''un souffle et la valse humaine, enfin, reprend son temps.', 1),
(3, 'AU BORD DE L''EAU', 2016, 'Eve Bonfanti et Yves Hunstad', 'Eve Bonfanti\r\nYves Hunstad            ', 'La Fabrique Imaginaire (Belgique)', 80, 'Fr', 'tout', 'AU BORD DE L''EAU.jpg', 'Deux siÃ¨ges sagement posÃ©s derriÃ¨re une table...et un Ã©tang.            ', 'Deux siÃ¨ges sagement posÃ©s derriÃ¨re une table...et un Ã©tang. Le dÃ©cor est campÃ©, la lecture de la piÃ¨ce peut commencer. Mais attention, les deux acteurs, Eve Bonfanti et Yves Hunstad, vont vous embarquer dans un trompe l''oeil permanent. Qui parle? Qui est devant vous ?            ', 1),
(4, 'BIG ONE', 2016, 'test', 'Sergio Grondin\r\nLucie le Renard            ', 'test', 50, 'Fr', 'tout', 'Everest.jpg', 'Janvier 2015, la RÃ©union subit un cyclone d''une rare violence, baptisÃ© Big One...            ', 'Janvier 2015, la RÃ©union subit un cyclone d''une rare violence, baptisÃ© Big One le mÃ©tÃ©ore ravagera l''Ã®le pendant toute une semaine. CoincÃ©s par les crues sur un Ã®let des hauteurs de Saint-Joseph, une vingtaine d''adolescents affrontent ensemble les vents violents et les pluies torrentielles. Un moment qui marquera Ã  jamais leur vie.            ', 1),
(5, 'COMMENT ÉPOUSER UN MILLIARDAIRE', 2016, 'test', 'Audrey Vernon                        ', 'test', 90, 'te', 'Scolaire', 'COMMENT ÉPOUSER UN MILLIARDAIRE.jpg', 'Issue du thÃ©Ã¢tre classique, Audrey Vernon s''est fait connaitre par des programmes courts sur Canal + DÃ©calÃ©, notamment sa minute quotidienne oÃ¹ elle incarne Ã  la derniÃ¨re speakerine du PAF "...                        ', 'Issue du thï¿½ï¿½tre classique, Audrey Vernon s''est fait connaitre par des programmes courts sur Canal + Dï¿½calï¿½, notamment sa minute quotidienne oï¿½ elle incarne ï¿½ la derniï¿½re speakerine du PAF ". Aprï¿½s â€œLe spectacle le plus drï¿½le du mondeâ€, son premier spectacle crï¿½e en 2005 et jouï¿½ pendant deux ans, elle porte, avec â€œComment ï¿½pouser un milliardaireâ€, un regard hallucinï¿½ sur les inï¿½galitï¿½s entre riches et pauvres. Incarnant une jeune femme qui se marie le lendemain avec lâ€™un des hommes les plus riches de la planÃ¨te, elle Ã©pluche les pages saumon du Figaro et la liste des plus grandes fortunes du monde Ã©tablie par Forbes, jonglant avec les chiffres et les comparaisons. PÃ©tillante et faussement naÃ¯ve, elle se pose quelques questions dÃ©sarmantes sur le rÃ´le du travail, la place de lâ€™argent... Un Â« one-woman-show Â» drÃ´le, pertinent et percutant.                         ', 1),
(6, 'CYRANO DE BERGERAC', 2016, 'test', 'Edmond Rostand', 'NEYAC (RÃ©union, Italie, Allemagne, Hongrie)', 75, '', 'Scolaire', 'Cyrano de Bergerac.jpg', 'Ã€ cause de sa laideur, Cyrano n''ose pas avouer son amour Ã  Roxane.', 'Ã€ cause de sa laideur, Cyrano n''ose pas avouer son amour Ã  Roxane. Christian est Ã©galement amoureux de la belle, mais si ce dernier est fort jolie garÃ§on, il manque cruellement d''esprit. Cyrano propose alors Ã  Christian "d''Ãªtre ses mots" pour sÃ©duire Roxane. Il sera la beautÃ© et lui l''esprit.', 1),
(7, 'D''AUTRES VIES QUE LA MIENNE', 2016, 'Tatiana Werner', 'Emmanuel CarrÃ¨re                                    ', 'Les ailes de Clarence', 80, 'Fr', 'Scolaire', 'D''AUTRES VIES QUE LA MIENNE.jpg', 'AprÃ¨s le "NAZI ET LE BARBIER" le nouveau seul-en-scÃ¨ne jouÃ© par David NATHANSON. L''adaptation du magnifique rÃ©cit D''Emmanuel CarrÃ¨re, un moment de thÃ©Ã¢tre unique.                                    ', 'AprÃ¨s le "NAZI ET LE BARBIER" le nouveau seul-en-scÃ¨ne jouÃ¨ par David NATHANSON. L''adaptation du magnifique rÃ©cit D''Emmanuel CarrÃ¨re, un momentde thÃ©Ã¢tre unique.\r\n"Tu me fais rire... T''es le seul type que je connaise capable de penser que l''amitiÃ© de deux juges boiteux et cancÃ©reux qui Ã©pluchent des dossiers de surendettement au Tribunal d''Instance de Vienne, c''est un sujet en or, Et en plus ils couchent pas ensemble t Ã  la fin elle meurt. j''ai bien rÃ©sumÃ©? C''est ca l''histoire ?"                                    ', 1),
(8, 'EN ATTENDANT DODO', 2016, 'Sergio Grondin', '', 'Karanbolaz (RÃ©union)', 45, 'Fr', 'Scolaire', 'En attendant dodo.jpg', 'Gustave est au CP, il n''a pas d''amis, il n''aime rien faire comme les autres.', 'Gustave est au CP, il n''a pas d''amis, il n''aime rien faire comme les autres. Il est ... diffÃ©rent. Depuis tout petit, il voit partout autour de lui de drÃ´les d''oiseaux. Si ses parents sont Ã©merveillÃ©s par sa crÃ©ativitÃ©, ce n''est pas l''avis de la pÃ©dopsychatre, qui essaie de lui faire entendre raison:\r\n\r\nLes dodos, Ã§a n''existe plus! Si, rÃ©pond Gustave, et il va le prouver. Devenu mÃ©decin aventurier-vÃ©tÃ©rinaire, il parcourt le monde.\r\nA leur recherche. Quan dil apprend que le dernier est mort, il ne perd pas espoir. Il va se dÃ©brouiller\r\n\r\nAutrement qpour le trouver, son Dodo !', 1),
(9, 'JE N''AI PAS DE NOM', 2016, 'Christophe Tarkos', 'Soumette Ahmed', 'CCAC-Manuva (Comores)', 55, 'Fr', 'Scolaire', 'Je n''ai pas de nom.jpg', 'Un homme sans nom, sans identitÃ©, nous embarque dans une folie, un va-et-vient entre son imaginaire et la rÃ©alitÃ©.', 'Un homme sans nom, sans identitÃ©, nous embarque dans une folie, un va-et-vient entre son imaginaire et la rÃ©alitÃ©. Sans cesse interpellÃ© par les mots-maux, son exutoire, le spectateur est entrainÃ© dans une folie dynamique portÃ©e par un mÃ©lange des arts, des jeux techniques et scÃ©niques. Une mise en exergue de la folie qui tient en haleine dans le rire, "les mots-scions'', l''amour, l''inquiÃ©tude, l''espoir."', 1);

-- --------------------------------------------------------

--
-- Table structure for table `kdi_utilisateur`
--

CREATE TABLE IF NOT EXISTS `kdi_utilisateur` (
  `EmailUtilisateur` varchar(250) NOT NULL,
  `MDPUtilisateur` varchar(50) NOT NULL,
  `NomUtilisateur` varchar(250) DEFAULT NULL,
  `PrenomUtilisateur` varchar(250) DEFAULT NULL,
  `TelUtilisateur` varchar(11) DEFAULT NULL,
  `StatutUtilisateur` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`EmailUtilisateur`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kdi_utilisateur`
--

INSERT INTO `kdi_utilisateur` (`EmailUtilisateur`, `MDPUtilisateur`, `NomUtilisateur`, `PrenomUtilisateur`, `TelUtilisateur`, `StatutUtilisateur`) VALUES
('', '', 'Test', '', NULL, 0),
('174721@supinfo.com', 'azerty', 'Legros', 'Richard', '692214026', 0),
('aaaa@gmail.com', 'test', 'aaaa', 'aaaa', NULL, 0),
('Averell@hotmail.fr', 'azerty', 'Dalton', 'Averell', '01234567890', 0),
('gvgv974@gmail.com', 'test', 'Vitry', 'Gael', NULL, 0),
('jerome.athion@orange.fr', '123456789', 'ATHION', 'JÃ©rÃ´me', '0262124568', 1),
('kazenon@live.fr', '123456', 'Legros', 'Olivier', '0692214026', 1),
('lion.heart@live.fr', 'azerty', 'Legros', 'Vincent', '0630368393', 1),
('root', 'root', 'root', 'root', '0692214026', 1),
('root@root.fr', 'root', 'root', 'root', '0692000000', 1),
('TES2T@gmail.commdp=test', '', 'TESTaa', 'TESTaa', NULL, 0),
('TEST@gmail.com', 'TEST', 'TEST', 'TEST', NULL, 0),
('teste@test.com', 'yolo', 'teste', 'test', '0692159483', 0),
('titi@live.fr', 'azerty', 'Titi', 'Jean', '34534636', 0);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `kdi_note`
--
ALTER TABLE `kdi_note`
  ADD CONSTRAINT `FK_kdi_note_EmailUtilisateur` FOREIGN KEY (`EmailUtilisateur`) REFERENCES `kdi_utilisateur` (`EmailUtilisateur`),
  ADD CONSTRAINT `FK_kdi_note_Spe_id` FOREIGN KEY (`Spe_id`) REFERENCES `kdi_spectacle` (`Spe_id`);

--
-- Constraints for table `kdi_seance`
--
ALTER TABLE `kdi_seance`
  ADD CONSTRAINT `FK_kdi_seance_Hor_id` FOREIGN KEY (`Hor_id`) REFERENCES `kdi_horaire` (`Hor_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_kdi_seance_Sal_id` FOREIGN KEY (`Sal_id`) REFERENCES `kdi_salle` (`Sal_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_kdi_seance_Spe_id` FOREIGN KEY (`Spe_id`) REFERENCES `kdi_spectacle` (`Spe_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `kdi_spectacle`
--
ALTER TABLE `kdi_spectacle`
  ADD CONSTRAINT `FK_kdi_spectacle_Gre_code` FOREIGN KEY (`Gre_code`) REFERENCES `kdi_genre` (`Gre_code`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
