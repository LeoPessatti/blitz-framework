-- MySQL Script generated by MySQL Workbench
-- Mon Apr  5 23:24:34 2021
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Blitz_boilerplate
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Blitz_boilerplate
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Blitz_boilerplate` DEFAULT CHARACTER SET utf8 ;
USE `Blitz_boilerplate` ;

-- -----------------------------------------------------
-- Table `Blitz_boilerplate`.`empresa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Blitz_boilerplate`.`empresa` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `cnpj` VARCHAR(45) NOT NULL,
  `is_deleted` TIMESTAMP NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `cnpj_UNIQUE` (`cnpj` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Blitz_boilerplate`.`pessoa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Blitz_boilerplate`.`pessoa` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NULL,
  `email` VARCHAR(90) NOT NULL,
  `is_deleted` TIMESTAMP NULL,
  `empresa_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_pessoa_empresa1_idx` (`empresa_id` ASC) VISIBLE,
  CONSTRAINT `fk_pessoa_empresa1`
    FOREIGN KEY (`empresa_id`)
    REFERENCES `Blitz_boilerplate`.`empresa` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Blitz_boilerplate`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Blitz_boilerplate`.`usuario` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `login` VARCHAR(45) NOT NULL,
  `pwd` VARCHAR(45) NOT NULL,
  `hierarchy` INT NOT NULL,
  `is_deleted` TIMESTAMP NULL,
  `pessoa_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `login_UNIQUE` (`login` ASC) VISIBLE,
  INDEX `fk_usuario_pessoa1_idx` (`pessoa_id` ASC) VISIBLE,
  CONSTRAINT `fk_usuario_pessoa1`
    FOREIGN KEY (`pessoa_id`)
    REFERENCES `Blitz_boilerplate`.`pessoa` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
