-- -------- <<  TF1AntonioBarreto - TRABALHO FINAL TEMA 1 >> ----------
--
--                    SCRIPT DE CRIACAO (DDL)
--
-- Data Criacao ...........: 15/09/2021
-- Autor(es) ..............: Antonio Ruan Moura Barreto e Guilherme Verissimo Cerveira Braz
-- Banco de Dados .........: MySQL 8.0
-- Base de Dados (nome) ...: TF1AntonioBarreto
--
--
-- PROJETO => 01 Base de Dados
--         => 14 Tabelas
--
-- ---------------------------------------------------------------------

-- BASE DE DADOS

CREATE DATABASE
	IF NOT EXISTS 			TF1AntonioBarreto
	DEFAULT CHARACTER SET 	utf8mb4
	DEFAULT COLLATE 		utf8mb4_unicode_ci;

USE TF1AntonioBarreto;

-- TABELAS
CREATE TABLE APICULTOR (
    cpfApicultor	BIGINT(11) 		NOT NULL,
    nome 			VARCHAR(60) 	NOT NULL,
    emailApicultor 	VARCHAR(50) 	NOT NULL,
   CONSTRAINT APICULTOR_PK PRIMARY KEY (cpfApicultor)
) ENGINE = InnoDB, DEFAULT CHARSET = utf8mb4;

CREATE TABLE telefoneApicultor (
    cpfApicultor    BIGINT(11) 	NOT NULL,
    telefone 		BIGINT(11)	NOT NULL,
   CONSTRAINT telefone_cpfApicultor_UK UNIQUE (cpfApicultor, telefone),
   CONSTRAINT APICULTOR_TELEFONE_FK  FOREIGN KEY (cpfApicultor)
 		REFERENCES APICULTOR (cpfApicultor)
        ON DELETE CASCADE
        ON UPDATE CASCADE
) ENGINE = InnoDB, DEFAULT CHARSET = utf8mb4;

CREATE TABLE HABILIDADES (
    idHabilidade    INT         NOT NULL AUTO_INCREMENT,
    habilidade      VARCHAR(50) NOT NULL,
  CONSTRAINT HABILIDADES_PK PRIMARY KEY (idHabilidade)
) ENGINE = InnoDB, DEFAULT CHARSET = utf8mb4, AUTO_INCREMENT = 1;

CREATE TABLE possui (
    cpfApicultor    BIGINT(11)  NOT NULL,
    idHabilidade    INT			NOT NULL,
  CONSTRAINT POSSUI_APICULTOR_FK FOREIGN KEY (cpfApicultor)
        REFERENCES APICULTOR (cpfApicultor)
        ON DELETE RESTRICT
        ON UPDATE RESTRICT,
  CONSTRAINT POSSUI_HABILIDADES_FK FOREIGN KEY (idHabilidade)
        REFERENCES HABILIDADES (idHabilidade)
        ON DELETE RESTRICT
        ON UPDATE RESTRICT
) ENGINE = InnoDB, DEFAULT CHARSET = utf8mb4;

CREATE TABLE SINDICATO (
    registro    BIGINT(11)  NOT NULL,
    nome        VARCHAR(50) NOT NULL,
  CONSTRAINT SINDICATO_PK PRIMARY KEY (registro)
) ENGINE = InnoDB, DEFAULT CHARSET = utf8mb4;

CREATE TABLE defende (
    registro            BIGINT(11)  NOT NULL,
    cpfApicultor	    BIGINT(11) 	NOT NULL,
    registroApicultor   BIGINT(11)  NOT NULL,
  CONSTRAINT DEFENDE_SINDICATO_FK FOREIGN KEY (registro)
        REFERENCES SINDICATO(registro)
        ON DELETE RESTRICT
        ON UPDATE RESTRICT,
  CONSTRAINT DEFENDE_APICULTOR_FK FOREIGN KEY (cpfApicultor)
        REFERENCES APICULTOR (cpfApicultor)
        ON DELETE RESTRICT
        ON UPDATE RESTRICT
) ENGINE = InnoDB, DEFAULT CHARSET = utf8mb4;

CREATE TABLE APIARIO (
    cep             BIGINT(8)   NOT NULL,
    numero          INT         NOT NULL,
    bairro          VARCHAR(50) NOT NULL,
    cidade          VARCHAR(50) NOT NULL,
    estado          CHAR(2)     NOT NULL,
    cpfApicultor    BIGINT(11) 	NOT NULL,
    complemento     VARCHAR(50) NOT NULL,
  CONSTRAINT APIARIO_PK PRIMARY KEY (cep, numero, bairro, cidade, estado),
  CONSTRAINT APIARIO_APICULTOR_FK FOREIGN KEY (cpfApicultor)
        REFERENCES APICULTOR (cpfApicultor)
        ON DELETE RESTRICT
        ON UPDATE RESTRICT
) ENGINE = InnoDB, DEFAULT CHARSET = utf8mb4;

CREATE TABLE ENXAME (
    idEnxame        INT         NOT NULL AUTO_INCREMENT,
    cep             BIGINT(8)   NOT NULL,
    numero          INT         NOT NULL,
    bairro          VARCHAR(50) NOT NULL,
    cidade          VARCHAR(50) NOT NULL,
    estado          CHAR(2)     NOT NULL,
    populacao       INT         NOT NULL,
    dtNascRainha    DATE        NOT NULL,
    tipo            VARCHAR(50) NOT NULL,
  CONSTRAINT ENXAME_PK PRIMARY KEY (idEnxame),
  CONSTRAINT ENXAME_APIARIO_FK FOREIGN KEY (cep, numero, bairro, cidade, estado)
        REFERENCES APIARIO (cep, numero, bairro, cidade, estado)
        ON DELETE RESTRICT
        ON UPDATE RESTRICT
) ENGINE = InnoDB, DEFAULT CHARSET = utf8mb4, AUTO_INCREMENT = 1;

CREATE TABLE PRODUTO (
    ncmProduto  BIGINT(8)   NOT NULL,
    nomeProduto VARCHAR(50) NOT NULL,
  CONSTRAINT PRODUTO_PK PRIMARY KEY (ncmProduto)
) ENGINE = InnoDB, DEFAULT CHARSET = utf8mb4;

CREATE TABLE FAZENDEIRO (
    cpfFazendeiro   BIGINT(11)  NOT NULL,
    nome            VARCHAR(60) NOT NULL,
    emailFazendeiro VARCHAR(50),
  CONSTRAINT FAZENDEIRO_PK PRIMARY KEY (cpfFazendeiro)
) ENGINE = InnoDB, DEFAULT CHARSET = utf8mb4;

CREATE TABLE telefoneFazendeiro (
    cpfFazendeiro   BIGINT(11) 	NOT NULL,
    telefone 		BIGINT(11)	NOT NULL,
   CONSTRAINT telefone_cpfFazendeiro_UK UNIQUE (cpfFazendeiro, telefone),
   CONSTRAINT FAZENDEIRO_TELEFONE_FK  FOREIGN KEY (cpfFazendeiro)
 		REFERENCES FAZENDEIRO (cpfFazendeiro)
        ON DELETE CASCADE
        ON UPDATE CASCADE
) ENGINE = InnoDB, DEFAULT CHARSET = utf8mb4;

CREATE TABLE FAZENDA (
    cep             BIGINT(8)   NOT NULL,
    numero          INT         NOT NULL,
    bairro          VARCHAR(50) NOT NULL,
    cidade          VARCHAR(50) NOT NULL,
    estado          CHAR(2)     NOT NULL,
    cpfFazendeiro   BIGINT(11) 	NOT NULL,
    complemento     VARCHAR(50) NOT NULL,
  CONSTRAINT FAZENDA_PK PRIMARY KEY (cep, numero, bairro, cidade, estado),
  CONSTRAINT FAZENDA_FAZENDEIRO_FK FOREIGN KEY (cpfFazendeiro)
        REFERENCES FAZENDEIRO (cpfFazendeiro)
        ON DELETE RESTRICT
        ON UPDATE RESTRICT
) ENGINE = InnoDB, DEFAULT CHARSET = utf8mb4;

CREATE TABLE PLANTACAO (
    idPlantacao         INT         NOT NULL AUTO_INCREMENT,
    cep                 BIGINT(8)   NOT NULL,
    numero              INT         NOT NULL,
    bairro              VARCHAR(50) NOT NULL,
    cidade              VARCHAR(50) NOT NULL,
    estado              CHAR(2)     NOT NULL,
    ncmProduto          BIGINT(8)   NOT NULL,
    areaPlantacao       BIGINT      NOT NULL,
    agrotoxicoAplicado  VARCHAR(30),
    intervaloAgrotoxico VARCHAR(30),
    duracaoAplicacao    VARCHAR(30),
  CONSTRAINT PLANTACAO_PK PRIMARY KEY (idPlantacao),
  CONSTRAINT PLANTACAO_FAZENDA_FK FOREIGN KEY (cep, numero, bairro, cidade, estado)
        REFERENCES FAZENDA (cep, numero, bairro, cidade, estado)
        ON DELETE RESTRICT
        ON UPDATE RESTRICT,
  CONSTRAINT PLANTACAO_PRODUTO_FK FOREIGN KEY (ncmProduto)
        REFERENCES PRODUTO (ncmProduto)
        ON DELETE RESTRICT
        ON UPDATE RESTRICT
) ENGINE = InnoDB, DEFAULT CHARSET = utf8mb4, AUTO_INCREMENT = 1;

CREATE TABLE aloca (
    idPlantacao         INT     NOT NULL,
    idEnxame            INT     NOT NULL,
    dtInicioAlocacao    DATE    NOT NULL,
    dtFImAlocacao       DATE    NOT NULL,
  CONSTRAINT aloca_PLANTACAO_FK FOREIGN KEY (idPlantacao)
        REFERENCES PLANTACAO (idPlantacao)
        ON DELETE RESTRICT
        ON UPDATE RESTRICT,
  CONSTRAINT aloca_ENXAME_FK FOREIGN KEY (idEnxame)
        REFERENCES ENXAME (idEnxame)
        ON DELETE RESTRICT
        ON UPDATE RESTRICT
) ENGINE = InnoDB, DEFAULT CHARSET = utf8mb4;
