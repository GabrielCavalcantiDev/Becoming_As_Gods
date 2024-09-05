-- Arquivo de apoio, caso você queira criar tabelas como as aqui criadas para a API funcionar.
-- Você precisa executar os comandos no banco de dados para criar as tabelas,
-- ter este arquivo aqui não significa que a tabela em seu BD estará como abaixo!

/*
comandos para mysql - banco local - ambiente de desenvolvimento
*/

CREATE DATABASE IF NOT EXISTS Nier_automata;

USE Nier_automata;

/* Usuário */
CREATE TABLE IF NOT EXISTS `user` (
  `userid` INT NOT NULL AUTO_INCREMENT,
  `nome_usuario` VARCHAR(16) NOT NULL,
  `email` VARCHAR(255) NULL,
  `senha` VARCHAR(32) NOT NULL,
  `criacao` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`userid`));

/* Usuário */

/* Mensagens */

CREATE TABLE IF NOT EXISTS `Mensagem` (
  `idMensagem` INT NOT NULL AUTO_INCREMENT,
  `autor` INT NOT NULL,
  `Titulo_mensagem` VARCHAR(128) NULL,
  `Mensagem` VARCHAR(258) NULL,
  PRIMARY KEY (`idMensagem`, `autor`),
  INDEX `fk_Mensagem_user1_idx` (`autor` ASC) VISIBLE,
  CONSTRAINT `fk_Mensagem_user1`
    FOREIGN KEY (`autor`)
    REFERENCES `user` (`userid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


/* Mensagens */

/* Favoritos */


CREATE TABLE IF NOT EXISTS `Favoritos` (
  `fkusuario` INT NOT NULL,
  `fkmensagem` INT NOT NULL,
  PRIMARY KEY (`fkusuario`, `fkmensagem`),
  INDEX `fk_Favoritos_Mensagem1_idx` (`fkmensagem` ASC) VISIBLE,
  CONSTRAINT `fk_Favoritos_user1`
    FOREIGN KEY (`fkusuario`)
    REFERENCES `user` (`userid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Favoritos_Mensagem1`
    FOREIGN KEY (`fkmensagem`)
    REFERENCES `Mensagem` (`idMensagem`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

/* Favoritos */
