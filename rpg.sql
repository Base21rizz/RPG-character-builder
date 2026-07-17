-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 17, 2026 at 09:23 PM
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
-- Database: `rpg`
--

-- --------------------------------------------------------

--
-- Table structure for table `artifact_sets`
--

CREATE TABLE `artifact_sets` (
  `ArtID` varchar(10) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `PowerBonus` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `artifact_sets`
--

INSERT INTO `artifact_sets` (`ArtID`, `Name`, `PowerBonus`) VALUES
('art1', 'Gladiator\'s Finale', 350),
('art10', 'Blizzard Strayer', 360),
('art2', 'Wanderer\'s Troupe', 310),
('art3', 'Emblem of Severed Fate', 380),
('art4', 'Crimson Witch of Flames', 370),
('art5', 'Viridescent Venerer', 340),
('art6', 'Deepwood Memories', 320),
('art7', 'Marechaussee Hunter', 390),
('art8', 'Noblesse Oblige', 330),
('art9', 'Gilded Dreams', 350);

-- --------------------------------------------------------

--
-- Table structure for table `characters`
--

CREATE TABLE `characters` (
  `CharID` int(11) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Element` varchar(30) DEFAULT NULL,
  `Role` varchar(50) DEFAULT NULL,
  `Img_URL` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `characters`
--

INSERT INTO `characters` (`CharID`, `Name`, `Element`, `Role`, `Img_URL`) VALUES
(1, 'Yelan', 'Hydro', 'Hydro DPS', 'https://picsum.photos/seed/Yelan/150/150'),
(2, 'Zibai', 'Pyro', 'Pyro Vanguard', 'https://picsum.photos/seed/Zibai/150/150'),
(3, 'Kaelen', 'Anemo', 'Anemo Trickster', 'https://picsum.photos/seed/Kaelen/150/150'),
(4, 'Raiden', 'Electro', 'Electro Archon', 'https://picsum.photos/seed/Raiden/150/150'),
(5, 'Zhongli', 'Geo', 'Geo Shield', 'https://picsum.photos/seed/Zhongli/150/150'),
(6, 'Ganyu', 'Cryo', 'Cryo Sniper', 'https://picsum.photos/seed/Ganyu/150/150'),
(7, 'Hu Tao', 'Pyro', 'Pyro DPS', 'https://picsum.photos/seed/HuTao/150/150'),
(8, 'Ayaka', 'Cryo', 'Cryo Enforcer', 'https://picsum.photos/seed/Ayaka/150/150'),
(9, 'Kazuha', 'Anemo', 'Anemo Support', 'https://picsum.photos/seed/Kazuha/150/150'),
(10, 'Bennett', 'Pyro', 'Pyro Healer', 'https://picsum.photos/seed/Bennett/150/150');

-- --------------------------------------------------------

--
-- Table structure for table `player_builds`
--

CREATE TABLE `player_builds` (
  `BuildID` int(11) NOT NULL,
  `CharID` int(11) NOT NULL,
  `WeaponID` int(11) NOT NULL,
  `CharLevel` int(11) DEFAULT 1,
  `WeaponLevel` int(11) DEFAULT 1,
  `Flower` varchar(10) DEFAULT NULL,
  `Plume` varchar(10) DEFAULT NULL,
  `Sands` varchar(10) DEFAULT NULL,
  `Goblet` varchar(10) DEFAULT NULL,
  `Circlet` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `player_builds`
--

INSERT INTO `player_builds` (`BuildID`, `CharID`, `WeaponID`, `CharLevel`, `WeaponLevel`, `Flower`, `Plume`, `Sands`, `Goblet`, `Circlet`) VALUES
(10, 4, 5, 90, 90, 'art3', 'art3', 'art3', 'art3', 'art3'),
(11, 3, 3, 90, 90, 'art2', 'art6', 'art4', 'art4', 'art8'),
(12, 3, 9, 90, 90, 'art4', 'art4', 'art4', 'art4', 'art4');

-- --------------------------------------------------------

--
-- Table structure for table `weapons`
--

CREATE TABLE `weapons` (
  `WeaponID` int(11) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Weapon_Type` varchar(30) NOT NULL,
  `Img_URL` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `weapons`
--

INSERT INTO `weapons` (`WeaponID`, `Name`, `Weapon_Type`, `Img_URL`) VALUES
(1, 'Stormcaller Bow', 'Bow', 'https://enka.network/ui/UI_EquipIcon_Bow_Amos.png'),
(2, 'Lumen Catalyst', 'Catalyst', 'https://enka.network/ui/UI_EquipIcon_Catalyst_Zephyrus.png'),
(3, 'Voidedge Sword', 'Sword', 'https://enka.network/ui/UI_EquipIcon_Sword_Zephyrus.png'),
(4, 'Ashfall Claymore', 'Claymore', 'https://enka.network/ui/UI_EquipIcon_Claymore_Wolfmound.png'),
(5, 'Engulfing Lightning', 'Polearm', 'https://enka.network/ui/UI_EquipIcon_Pole_Narukami.png'),
(6, 'Amos Bow', 'Bow', 'https://enka.network/ui/UI_EquipIcon_Bow_Amos.png'),
(7, 'Black Tassel', 'Polearm', 'https://enka.network/ui/UI_EquipIcon_Pole_Halberd.png'),
(8, 'Staff of Homa', 'Polearm', 'https://enka.network/ui/UI_EquipIcon_Pole_Homa.png'),
(9, 'Mistsplitter Reforged', 'Sword', 'https://enka.network/ui/UI_EquipIcon_Sword_Narukami.png'),
(10, 'Wolf\'s Gravestone', 'Claymore', 'https://enka.network/ui/UI_EquipIcon_Claymore_Wolfmound.png');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `artifact_sets`
--
ALTER TABLE `artifact_sets`
  ADD PRIMARY KEY (`ArtID`);

--
-- Indexes for table `characters`
--
ALTER TABLE `characters`
  ADD PRIMARY KEY (`CharID`);

--
-- Indexes for table `player_builds`
--
ALTER TABLE `player_builds`
  ADD PRIMARY KEY (`BuildID`),
  ADD KEY `CharID` (`CharID`),
  ADD KEY `WeaponID` (`WeaponID`),
  ADD KEY `Flower` (`Flower`),
  ADD KEY `Plume` (`Plume`),
  ADD KEY `Sands` (`Sands`),
  ADD KEY `Goblet` (`Goblet`),
  ADD KEY `Circlet` (`Circlet`);

--
-- Indexes for table `weapons`
--
ALTER TABLE `weapons`
  ADD PRIMARY KEY (`WeaponID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `player_builds`
--
ALTER TABLE `player_builds`
  MODIFY `BuildID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `player_builds`
--
ALTER TABLE `player_builds`
  ADD CONSTRAINT `player_builds_ibfk_1` FOREIGN KEY (`CharID`) REFERENCES `characters` (`CharID`) ON DELETE CASCADE,
  ADD CONSTRAINT `player_builds_ibfk_2` FOREIGN KEY (`WeaponID`) REFERENCES `weapons` (`WeaponID`) ON DELETE CASCADE,
  ADD CONSTRAINT `player_builds_ibfk_3` FOREIGN KEY (`Flower`) REFERENCES `artifact_sets` (`ArtID`) ON DELETE SET NULL,
  ADD CONSTRAINT `player_builds_ibfk_4` FOREIGN KEY (`Plume`) REFERENCES `artifact_sets` (`ArtID`) ON DELETE SET NULL,
  ADD CONSTRAINT `player_builds_ibfk_5` FOREIGN KEY (`Sands`) REFERENCES `artifact_sets` (`ArtID`) ON DELETE SET NULL,
  ADD CONSTRAINT `player_builds_ibfk_6` FOREIGN KEY (`Goblet`) REFERENCES `artifact_sets` (`ArtID`) ON DELETE SET NULL,
  ADD CONSTRAINT `player_builds_ibfk_7` FOREIGN KEY (`Circlet`) REFERENCES `artifact_sets` (`ArtID`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
