-- MySQL Script generated by MySQL Workbench
-- Mon Sep 23 15:54:39 2024
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
-- -----------------------------------------------------
-- Schema new_schema1
-- -----------------------------------------------------
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Услуги`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Услуги` (
  `id_услуги` INT NOT NULL AUTO_INCREMENT,
  `Название` VARCHAR(45) NOT NULL,
  `Описание` VARCHAR(100) NOT NULL,
  `Стоимость` DECIMAL(11,2) NOT NULL,
  PRIMARY KEY (`id_услуги`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Туры`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Туры` (
  `id_тура` INT NOT NULL AUTO_INCREMENT,
  `Название` VARCHAR(45) NOT NULL,
  `Описание` VARCHAR(100) NOT NULL,
  `Длительность` DATETIME NOT NULL,
  `Стоимость` DECIMAL(11,2) NOT NULL,
  PRIMARY KEY (`id_тура`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Клиенты`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Клиенты` (
  `id_клиента` INT NOT NULL AUTO_INCREMENT,
  `ФИО` VARCHAR(60) NOT NULL,
  `Контактная информация` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`id_клиента`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Заказы`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Заказы` (
  `id_заказа` INT NOT NULL AUTO_INCREMENT,
  ` id_ клиента` INT NOT NULL,
  `id_тура` INT NOT NULL,
  `id_услуги` INT NOT NULL,
  `Дата_заказа` DATETIME NOT NULL,
  `Количество_человек` INT NOT NULL,
  `Общая_стоимость` DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (`id_заказа`),
  INDEX `id_клиента_idx` (` id_ клиента` ASC) VISIBLE,
  INDEX `id_тура_idx` (`id_тура` ASC) VISIBLE,
  INDEX `id_услуги_idx` (`id_услуги` ASC) VISIBLE,
  CONSTRAINT `id_клиента`
    FOREIGN KEY (` id_ клиента`)
    REFERENCES `mydb`.`Клиенты` (`id_клиента`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_тура`
    FOREIGN KEY (`id_тура`)
    REFERENCES `mydb`.`Туры` (`id_тура`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_услуги`
    FOREIGN KEY (`id_услуги`)
    REFERENCES `mydb`.`Услуги` (`id_услуги`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
