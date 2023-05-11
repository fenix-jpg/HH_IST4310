-- MySQL dump 10.13  Distrib 8.0.33, for Linux (x86_64)
--
-- Host: localhost    Database: hardwarehub
-- ------------------------------------------------------
-- Server version	8.0.33

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admin`
--

CREATE TABLE IF NOT EXISTS `HardwareHub_db`.`admin` (
  `adminID` INT NOT NULL,
  `fname` VARCHAR(25) NOT NULL,
  `lname` VARCHAR(25) NOT NULL,
  `password` VARCHAR(25) NOT NULL,
  PRIMARY KEY (`adminID`),
  UNIQUE INDEX `adminID_UNIQUE` (`adminID` ASC) VISIBLE)
ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Table structure for table 'cart'
--

CREATE TABLE IF NOT EXISTS `HardwareHub_db`.`cart` (
  `cartID` INT NOT NULL,
  `userID` INT NOT NULL,
  `productID` INT NOT NULL,
  `name` VARCHAR(50) NOT NULL,
  `quantity` INT NOT NULL,
  `price` INT NOT NULL,
  PRIMARY KEY (`cartID`),
  UNIQUE INDEX `idcart_UNIQUE` (`cartID` ASC) VISIBLE,
  INDEX `cart_userID_idx` (`userID` ASC) VISIBLE,
  INDEX `cart_productID_idx` (`productID` ASC) VISIBLE,
  CONSTRAINT `cart_userID`
    FOREIGN KEY (`userID`)
    REFERENCES `HardwareHub_db`.`users` (`userID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `cart_productID`
    FOREIGN KEY (`productID`)
    REFERENCES `HardwareHub_db`.`products` (`productID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Table structure for table 'messages'
--

CREATE TABLE IF NOT EXISTS `HardwareHub_db`.`messages` (
  `messageID` INT NOT NULL,
  `userID` INT NOT NULL,
  `email` VARCHAR(50) NOT NULL,
  `fname` VARCHAR(25) NOT NULL,
  `lname` VARCHAR(25) NOT NULL,
  `message` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`messageID`),
  UNIQUE INDEX `idmessages_UNIQUE` (`messageID` ASC) VISIBLE,
  INDEX `userID_idx` (`userID` ASC) VISIBLE,
  CONSTRAINT `message_userID`
    FOREIGN KEY (`userID`)
    REFERENCES `HardwareHub_db`.`users` (`userID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- table structure for table 'orders'
--

CREATE TABLE IF NOT EXISTS `HardwareHub_db`.`orders` (
  `orderID` INT NOT NULL,
  `userID` VARCHAR(50) NOT NULL,
  `address` VARCHAR(50) NOT NULL,
  `state` VARCHAR(2) NOT NULL,
  `zip` INT NOT NULL,
  `phone` INT NULL,
  `email` VARCHAR(50) NOT NULL,
  `productID` INT NOT NULL,
  `quantity` INT NOT NULL,
  `price` INT NOT NULL,
  `date` DATE NOT NULL,
  PRIMARY KEY (`orderID`),
  UNIQUE INDEX `idorders_UNIQUE` (`orderID` ASC) VISIBLE,
  INDEX `orders_productID_idx` (`productID` ASC) VISIBLE,
  CONSTRAINT `orders_productID`
    FOREIGN KEY (`productID`)
    REFERENCES `HardwareHub_db`.`products` (`productID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- table structure for table 'products'
--

CREATE TABLE IF NOT EXISTS `HardwareHub_db`.`products` (
  `productID` INT NOT NULL,
  `pname` VARCHAR(45) NOT NULL,
  `description` VARCHAR(80) NULL,
  `price` INT NOT NULL,
  `image` BLOB NOT NULL,
  PRIMARY KEY (`productID`),
  UNIQUE INDEX `idproducts_UNIQUE` (`productID` ASC) VISIBLE)
ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- table structure for table 'users'
--

CREATE TABLE IF NOT EXISTS `HardwareHub_db`.`users` (
  `userID` INT NOT NULL,
  `fname` VARCHAR(25) NOT NULL,
  `lname` VARCHAR(25) NOT NULL,
  `email` VARCHAR(50) NOT NULL,
  `password` VARCHAR(25) NOT NULL,
  `address` VARCHAR(50) NULL,
  `state` VARCHAR(2) NULL,
  `zip` INT NULL,
  `phone` INT NULL,
  PRIMARY KEY (`userID`),
  UNIQUE INDEX `idusers_UNIQUE` (`userID` ASC) VISIBLE)
ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
