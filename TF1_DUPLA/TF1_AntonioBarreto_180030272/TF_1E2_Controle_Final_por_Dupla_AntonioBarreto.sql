-- -------- <<  AntonioBarreto - TRABALHO FINAL TEMA 1 >> ----------
--
--                    SCRIPT DE CONTROLE (DDL)
--
-- Data Criacao ...........: 27/10/2021
-- Autor(es) ..............: Antonio Ruan Moura Barreto e Guilherme Verissimo Cerveira Braz
-- Banco de Dados .........: MySQL 8.0
-- Base de Dados (nome) ...: AntonioBarreto
--
--
-- PROJETO => 01 Base de Dados
--         => 03 Usuarios
--         => 14 Tabelas
--
-- ---------------------------------------------------------------------

-- BASE DE DADOS
USE AntonioBarreto;


-- USUARIO
CREATE USER 'staff'
  IDENTIFIED BY 'stafifou';

CREATE USER 'apicultor'
  IDENTIFIED BY 'apipipi';

CREATE USER 'fazendeiro'
  IDENTIFIED BY 'fazendinha32';

-- PRIVILEGIO admin
GRANT ALL PRIVILEGES ON AntonioBarreto TO 'admin';

-- PRIVILEGIO apicultor
GRANT SELECT ON AntonioBarreto.* TO 'apicultor';
GRANT INSERT, UPDATE, DELETE ON AntonioBarreto.APICULTOR TO 'apicultor';
GRANT INSERT, UPDATE, DELETE ON AntonioBarreto.APIARIO TO 'apicultor';
GRANT INSERT, UPDATE, DELETE ON AntonioBarreto.ENXAME TO 'apicultor';
GRANT INSERT, UPDATE, DELETE ON AntonioBarreto.telefoneApicultor TO 'apicultor';
    
-- PRIVILEGIO fazendeiro
GRANT SELECT ON AntonioBarreto.* TO 'fazendeiro';
GRANT INSERT, UPDATE, DELETE ON AntonioBarreto.FAZENDEIRO TO 'fazendeiro';
GRANT INSERT, UPDATE, DELETE ON AntonioBarreto.FAZENDA TO 'fazendeiro';
GRANT INSERT, UPDATE, DELETE ON AntonioBarreto.PLANTACAO TO 'fazendeiro';
GRANT INSERT, UPDATE, DELETE ON AntonioBarreto.telefoneFazendeiro TO 'fazendeiro';


FLUSH PRIVILEGES;