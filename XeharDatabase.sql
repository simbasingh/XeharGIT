-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema xehardb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema xehardb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `xehardb` DEFAULT CHARACTER SET utf8 ;
USE `xehardb` ;

-- -----------------------------------------------------
-- Table `xehardb`.`agegroup`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `xehardb`.`agegroup` (
  `AGID` INT(11) NOT NULL AUTO_INCREMENT,
  `Group` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`AGID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `xehardb`.`attributes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `xehardb`.`attributes` (
  `AID` INT(11) NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`AID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `xehardb`.`clothingsize`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `xehardb`.`clothingsize` (
  `CSID` INT(11) NOT NULL AUTO_INCREMENT,
  `Size` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`CSID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `xehardb`.`colors`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `xehardb`.`colors` (
  `CID` INT(11) NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NOT NULL,
  `Group` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`CID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `xehardb`.`customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `xehardb`.`customers` (
  `CID` INT(11) NOT NULL,
  `FirstName` VARCHAR(50) CHARACTER SET 'big5' COLLATE 'big5_bin' NOT NULL,
  `LastName` VARCHAR(50) CHARACTER SET 'big5' COLLATE 'big5_bin' NOT NULL,
  `Email` VARCHAR(80) CHARACTER SET 'big5' COLLATE 'big5_bin' NOT NULL,
  `Street Address` VARCHAR(70) CHARACTER SET 'big5' COLLATE 'big5_bin' NOT NULL,
  `City` VARCHAR(60) CHARACTER SET 'big5' COLLATE 'big5_bin' NOT NULL,
  `Zip` VARCHAR(10) CHARACTER SET 'big5' COLLATE 'big5_bin' NULL DEFAULT NULL,
  `Country` VARCHAR(60) CHARACTER SET 'big5' COLLATE 'big5_bin' NULL DEFAULT NULL,
  `Company` VARCHAR(60) CHARACTER SET 'big5' COLLATE 'big5_bin' NULL DEFAULT NULL,
  `Phone` VARCHAR(10) CHARACTER SET 'big5' COLLATE 'big5_bin' NULL DEFAULT NULL,
  `Purchasing Site` VARCHAR(45) NULL,
  PRIMARY KEY (`CID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = big5
COLLATE = big5_bin
COMMENT = ' ';


-- -----------------------------------------------------
-- Table `xehardb`.`products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `xehardb`.`products` (
  `PID` INT(11) NOT NULL AUTO_INCREMENT,
  `SKU` VARCHAR(60) NULL DEFAULT NULL,
  `Product Name` VARCHAR(100) NOT NULL,
  `Description` VARCHAR(500) NOT NULL,
  `Model Number` VARCHAR(60) NOT NULL,
  `Department` VARCHAR(60) NULL,
  `Tax Code` VARCHAR(45) NOT NULL,
  `Brand` VARCHAR(45) NULL DEFAULT NULL,
  `Manufactuer` VARCHAR(45) NULL DEFAULT NULL,
  `Vendor Cost` DECIMAL(5,2) NOT NULL COMMENT 'How much we buy it for from vendor',
  `Gender` VARCHAR(10) NULL DEFAULT NULL,
  `Warranty` TINYINT(4) NOT NULL,
  `Weight` DECIMAL(4,3) NULL DEFAULT NULL,
  `StartDate` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `EndDate` DATETIME NULL DEFAULT NULL,
  `Qaulity` VARCHAR(30) NULL DEFAULT NULL,
  `SupplierCost` DECIMAL(5,2) NULL DEFAULT NULL COMMENT 'How much we sell product to customer',
  `CountryOrigin` VARCHAR(45) NULL DEFAULT NULL,
  `Replinishable` TINYINT(4) NULL DEFAULT NULL,
  `Expeditable` TINYINT(4) NULL DEFAULT NULL,
  `Reorder Time` INT(11) NULL COMMENT 'Measrued in days',
  `Sold Quantity` INT(11) NULL,
  PRIMARY KEY (`PID`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `xehardb`.`ordersDetails`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `xehardb`.`ordersDetails` (
  `OID` INT(11) NOT NULL,
  `PID` INT(11) NOT NULL,
  `UnitPrice` DECIMAL(5,2) NULL DEFAULT NULL,
  `Quantity` INT(11) NULL DEFAULT NULL,
  `Discount` DECIMAL(4,4) NULL,
  PRIMARY KEY (`OID`, `PID`),
  INDEX `fk_orders_products1_idx` (`PID` ASC),
  CONSTRAINT `fk_orders_products1`
    FOREIGN KEY (`PID`)
    REFERENCES `xehardb`.`products` (`PID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `xehardb`.`customerorders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `xehardb`.`customerorders` (
  `OID` INT(11) NOT NULL,
  `CID` INT(11) NOT NULL,
  PRIMARY KEY (`OID`, `CID`),
  INDEX `fk_customerOrders_customers1_idx` (`CID` ASC),
  CONSTRAINT `fk_customerOrders_customers1`
    FOREIGN KEY (`CID`)
    REFERENCES `xehardb`.`customers` (`CID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_customerOrders_customers2`
    FOREIGN KEY (`CID`)
    REFERENCES `xehardb`.`customers` (`CID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_customerOrders_orders1`
    FOREIGN KEY (`OID`)
    REFERENCES `xehardb`.`ordersDetails` (`OID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `xehardb`.`customerphonetype`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `xehardb`.`customerphonetype` (
  `PTID` INT(11) NOT NULL,
  `CID` INT(11) NOT NULL,
  PRIMARY KEY (`PTID`, `CID`),
  INDEX `fk_customerphonetype_customers1_idx` (`CID` ASC),
  CONSTRAINT `fk_customerphonetype_customers1`
    FOREIGN KEY (`CID`)
    REFERENCES `xehardb`.`customers` (`CID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `xehardb`.`features`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `xehardb`.`features` (
  `FID` INT(11) NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`FID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `xehardb`.`images`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `xehardb`.`images` (
  `IMID` INT(11) NOT NULL AUTO_INCREMENT,
  `Image` BLOB NULL DEFAULT NULL,
  `Link` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`IMID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `xehardb`.`keywords`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `xehardb`.`keywords` (
  `KID` INT(11) NOT NULL AUTO_INCREMENT,
  `Words` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`KID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `xehardb`.`materials`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `xehardb`.`materials` (
  `MID` INT(11) NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(60) NULL DEFAULT NULL,
  PRIMARY KEY (`MID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `xehardb`.`phonetype`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `xehardb`.`phonetype` (
  `PTID` INT(11) NOT NULL,
  `Name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`PTID`),
  CONSTRAINT `fk_phonetype_customerphonetype1`
    FOREIGN KEY (`PTID`)
    REFERENCES `xehardb`.`customerphonetype` (`PTID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `xehardb`.`productagegroup`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `xehardb`.`productagegroup` (
  `AGID` INT(11) NOT NULL,
  `PID` INT(11) NOT NULL,
  PRIMARY KEY (`AGID`, `PID`),
  INDEX `fk_ProductAgeGroup_Products1_idx` (`PID` ASC),
  CONSTRAINT `fk_ProductAgeGroup_Age Group1`
    FOREIGN KEY (`AGID`)
    REFERENCES `xehardb`.`agegroup` (`AGID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ProductAgeGroup_Products1`
    FOREIGN KEY (`PID`)
    REFERENCES `xehardb`.`products` (`PID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `xehardb`.`productattributes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `xehardb`.`productattributes` (
  `AID` INT(11) NOT NULL,
  `PID` INT(11) NOT NULL,
  PRIMARY KEY (`AID`, `PID`),
  INDEX `fk_ProductAttributes_Products1_idx` (`PID` ASC),
  CONSTRAINT `fk_ProductAttributes_Attributes1`
    FOREIGN KEY (`AID`)
    REFERENCES `xehardb`.`attributes` (`AID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ProductAttributes_Products1`
    FOREIGN KEY (`PID`)
    REFERENCES `xehardb`.`products` (`PID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `xehardb`.`productclothingsize`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `xehardb`.`productclothingsize` (
  `CSID` INT(11) NOT NULL,
  `PID` INT(11) NOT NULL,
  PRIMARY KEY (`CSID`, `PID`),
  INDEX `fk_ProductClothingSize_Products1_idx` (`PID` ASC),
  CONSTRAINT `fk_ProductClothingSize_ClothingSize1`
    FOREIGN KEY (`CSID`)
    REFERENCES `xehardb`.`clothingsize` (`CSID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ProductClothingSize_Products1`
    FOREIGN KEY (`PID`)
    REFERENCES `xehardb`.`products` (`PID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `xehardb`.`productcolors`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `xehardb`.`productcolors` (
  `PID` INT(11) NOT NULL,
  `CID` INT(11) NOT NULL,
  PRIMARY KEY (`PID`, `CID`),
  INDEX `fk_ProductColors_Colors1_idx` (`CID` ASC),
  CONSTRAINT `fk_ProductColors_Colors1`
    FOREIGN KEY (`CID`)
    REFERENCES `xehardb`.`colors` (`CID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ProductColors_Products`
    FOREIGN KEY (`PID`)
    REFERENCES `xehardb`.`products` (`PID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `xehardb`.`productfeatures`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `xehardb`.`productfeatures` (
  `FID` INT(11) NOT NULL,
  `PID` INT(11) NOT NULL,
  PRIMARY KEY (`FID`, `PID`),
  INDEX `fk_ProductFeatures_Products1_idx` (`PID` ASC),
  CONSTRAINT `fk_ProductFeatures_Features1`
    FOREIGN KEY (`FID`)
    REFERENCES `xehardb`.`features` (`FID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ProductFeatures_Products1`
    FOREIGN KEY (`PID`)
    REFERENCES `xehardb`.`products` (`PID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `xehardb`.`productimages`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `xehardb`.`productimages` (
  `IMID` INT(11) NOT NULL,
  `PID` INT(11) NOT NULL,
  PRIMARY KEY (`IMID`, `PID`),
  INDEX `fk_ProductImages_Products1_idx` (`PID` ASC),
  CONSTRAINT `fk_ProductImages_Images1`
    FOREIGN KEY (`IMID`)
    REFERENCES `xehardb`.`images` (`IMID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ProductImages_Products1`
    FOREIGN KEY (`PID`)
    REFERENCES `xehardb`.`products` (`PID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `xehardb`.`productkeywords`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `xehardb`.`productkeywords` (
  `KID` INT(11) NOT NULL,
  `PID` INT(11) NOT NULL,
  PRIMARY KEY (`KID`, `PID`),
  INDEX `fk_ProductKeywords_Products1_idx` (`PID` ASC),
  CONSTRAINT `fk_ProductKeywords_Keywords1`
    FOREIGN KEY (`KID`)
    REFERENCES `xehardb`.`keywords` (`KID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ProductKeywords_Products1`
    FOREIGN KEY (`PID`)
    REFERENCES `xehardb`.`products` (`PID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `xehardb`.`productmaterials`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `xehardb`.`productmaterials` (
  `MID` INT(11) NOT NULL,
  `PID` INT(11) NOT NULL,
  PRIMARY KEY (`MID`, `PID`),
  INDEX `fk_ProductMaterials_Products1_idx` (`PID` ASC),
  CONSTRAINT `fk_ProductMaterials_Materials1`
    FOREIGN KEY (`MID`)
    REFERENCES `xehardb`.`materials` (`MID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ProductMaterials_Products1`
    FOREIGN KEY (`PID`)
    REFERENCES `xehardb`.`products` (`PID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `xehardb`.`warranty`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `xehardb`.`warranty` (
  `WID` INT(11) NOT NULL,
  `PID` INT(11) NOT NULL,
  `Provider` VARCHAR(45) NULL DEFAULT NULL,
  `Company` VARCHAR(45) NULL DEFAULT NULL,
  `Phone` VARCHAR(10) NULL DEFAULT NULL,
  `Length` INT(11) NULL DEFAULT NULL COMMENT 'Stored in Days',
  `warrantycol` VARCHAR(45) NULL,
  PRIMARY KEY (`WID`),
  INDEX `fk_warranty_products1_idx` (`PID` ASC),
  CONSTRAINT `fk_warranty_products1`
    FOREIGN KEY (`PID`)
    REFERENCES `xehardb`.`products` (`PID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `xehardb`.`orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `xehardb`.`orders` (
  `OID` INT NOT NULL,
  `CID` INT NOT NULL,
  `OrderDate` DATETIME NULL,
  `ShipDate` DATETIME NULL,
  `ShipVia` VARCHAR(45) NULL,
  `Freight` DECIMAL(4,4) NULL,
  `ShipName` VARCHAR(45) NULL,
  `ShipAddress` VARCHAR(60) NULL,
  `ShipCity` VARCHAR(45) NULL,
  `ShipRegion` VARCHAR(60) NULL,
  `ShipZip` VARCHAR(10) NULL,
  `ShipCountry` VARCHAR(45) NULL,
  PRIMARY KEY (`OID`, `CID`),
  INDEX `fk_orders_customers1_idx` (`CID` ASC),
  CONSTRAINT `fk_orders_ordersDetails`
    FOREIGN KEY (`OID`)
    REFERENCES `xehardb`.`ordersDetails` (`OID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_orders_customers1`
    FOREIGN KEY (`CID`)
    REFERENCES `xehardb`.`customers` (`CID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `xehardb`.`tags`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `xehardb`.`tags` (
  `TID` INT NOT NULL,
  `Name` VARCHAR(45) NULL,
  `tagscol` VARCHAR(45) NULL,
  PRIMARY KEY (`TID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `xehardb`.`imageTags`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `xehardb`.`imageTags` (
  `IMID` INT NOT NULL,
  `TID` INT NOT NULL,
  PRIMARY KEY (`IMID`, `TID`),
  INDEX `fk_imageTags_tags1_idx` (`TID` ASC),
  CONSTRAINT `fk_imageTags_images1`
    FOREIGN KEY (`IMID`)
    REFERENCES `xehardb`.`images` (`IMID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_imageTags_tags1`
    FOREIGN KEY (`TID`)
    REFERENCES `xehardb`.`tags` (`TID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `xehardb`.`vendors`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `xehardb`.`vendors` (
  `VID` INT(11) NOT NULL DEFAULT 1,
  `Name` VARCHAR(45) NOT NULL,
  `VIN` VARCHAR(45) NOT NULL,
  `PID` INT(11) NOT NULL,
  `Phone Number` VARCHAR(10) NOT NULL,
  `Street` VARCHAR(45) NOT NULL,
  `City` VARCHAR(45) NOT NULL,
  `State` VARCHAR(45) NOT NULL,
  `Zip` INT(5) NOT NULL,
  `Country` VARCHAR(45) NULL,
  `Email` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`VID`),
  INDEX `fk_vendors_products1_idx` (`PID` ASC),
  CONSTRAINT `fk_vendors_products1`
    FOREIGN KEY (`PID`)
    REFERENCES `xehardb`.`products` (`PID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
