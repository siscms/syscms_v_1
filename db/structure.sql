-- MySQL Script generated by MySQL Workbench
-- Tue Aug 11 08:59:22 2015
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema cms
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Table `user_role`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `user_role` (
  `role_id` INT(11) NOT NULL AUTO_INCREMENT,
  `role_name` VARCHAR(100) NULL DEFAULT NULL,
  `input_date` TIMESTAMP NULL DEFAULT NULL,
  `last_update` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`role_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;


-- -----------------------------------------------------
-- Table `user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `user` (
  `user_id` INT(11) NOT NULL AUTO_INCREMENT,
  `user_name` VARCHAR(100) NULL DEFAULT NULL,
  `user_full_name` VARCHAR(255) NULL DEFAULT NULL,
  `user_password` VARCHAR(45) NULL DEFAULT NULL,
  `user_email` VARCHAR(45) NULL DEFAULT NULL,
  `user_description` TEXT NULL DEFAULT NULL,
  `input_date` TIMESTAMP NULL DEFAULT NULL,
  `last_update` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `role_id` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  INDEX `fk_user_g_user_role1_idx` (`role_id` ASC),
  CONSTRAINT `fk_user_g_user_role1`
    FOREIGN KEY (`role_id`)
    REFERENCES `user_role` (`role_id`)
    ON DELETE SET NULL
    ON UPDATE SET NULL)
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;


-- -----------------------------------------------------
-- Table `activity_log`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `activity_log` (
  `log_id` INT(11) NOT NULL AUTO_INCREMENT,
  `log_date` TIMESTAMP NULL DEFAULT NULL,
  `log_action` VARCHAR(45) NULL DEFAULT NULL,
  `log_module` VARCHAR(45) NULL DEFAULT NULL,
  `log_info` TEXT NULL DEFAULT NULL,
  `user_id` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`log_id`),
  INDEX `fk_g_activity_log_g_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_g_activity_log_g_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`user_id`)
    ON DELETE SET NULL
    ON UPDATE SET NULL)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;


-- -----------------------------------------------------
-- Table `ci_sessions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ci_sessions` (
  `id` VARCHAR(40) NOT NULL,
  `ip_address` VARCHAR(45) NOT NULL,
  `timestamp` INT(10) UNSIGNED NOT NULL DEFAULT '0',
  `data` BLOB NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `ci_sessions_timestamp` (`timestamp` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;