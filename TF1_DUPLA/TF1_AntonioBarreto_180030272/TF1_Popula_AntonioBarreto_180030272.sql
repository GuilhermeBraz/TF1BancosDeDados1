-- -------- <<  AntonioBarreto - TRABALHO FINAL TEMA 1 >> ----------
--
--                    SCRIPT DE POPULACAO (DML)
--
-- Data Criacao ...........: 25/10/2021
-- Autor(es) ..............: Antonio Ruan Moura Barreto e Guilherme Verissimo Cerveira Braz
-- Banco de Dados .........: MySQL 8.0
-- Base de Dados (nome) ...: AntonioBarreto
--
--
-- PROJETO => 01 Base de Dados
--         => 14 Tabelas
--
-- ---------------------------------------------------------------------

-- BASE DE DADOS

USE AntonioBarreto;

-- TABELAS

INSERT INTO APICULTOR (cpfApicultor, nome, emailApicultor) VALUES
    (11111111111, 'Teresinha Renata Camila Duarte', 'teresinhaduarte@creativeinteriores.com.br'),
    (22222222222, 'Cristiane Marlene Andrea Freitas', 'marleneandreafreitas@rodrigofranco.com'),
    (33333333333, 'Rodrigo Lucas Yago Freitas', 'rodrigolucasyagofreitas@coraza.com.br'),
    (44444444444, 'Fabiana Clarice Elza Moreira', 'fabianaclariceelzamoreira@yahoo.co.uk'),
    (55555555555, 'Sara Kamilly Daniela Bernardes', 'sarakamillydanielabernardes-86@mastria.com.br');


INSERT INTO telefoneApicultor (cpfApicultor, telefone) VALUES
    (11111111111, 61998873452),
    (22222222222, 61991284012),
    (33333333333, 61993412322),
    (44444444444, 61997239461),
    (55555555555, 61993458692);


INSERT INTO HABILIDADES (habilidade) VALUES
    ('Extracao Cera'),
    ('Doencas Abelhas'),
    ('Mercado'),
    ('Extracao Polen'),
    ('Seguranca Trabalho');


INSERT INTO possui (cpfApicultor, idHabilidade) VALUES
    (11111111111, 1),
    (22222222222, 2),
    (33333333333, 3),
    (44444444444, 4),
    (44444444444, 5);


INSERT INTO SINDICATO (registro, nome) VALUES
    (12332112343, 'Apicultores de Planaltina'),
    (89201735015, 'Apicultores do Gama'),
    (12347120395, 'Sociedade dos apicultores da FGA'),
    (32459087234, 'Apicultores de Sobradinho'),
    (19280374111, 'Apicultores de Goiania');


INSERT INTO defende (registro, cpfApicultor, registroApicultor) VALUES
    (12332112343, 11111111111, 98778998766),
    (89201735015, 22222222222, 97865923874),
    (12347120395, 33333333333, 21376419222),
    (32459087234, 44444444444, 78352945262),
    (19280374111, 44444444444, 27649182376);


INSERT INTO APIARIO (cep, numero, bairro, cidade, estado, cpfApicultor, complemento) VALUES
    (54440495, 537, 'Candeias', 'Jaboatao dos Guararapes', 'PE', 11111111111, 'Chacara 12'),
    (63900173, 916, 'Centro', 'Quixada', 'CE', 22222222222, 'Chacara 231'),
    (29170760, 946, 'Jardim Guarara', 'Santo Andre', 'SP', 33333333333, 'Chacara 133'),
    (72302514, 925, 'Samambaia Sul ', 'Brasilia', 'DF', 44444444444, 'Chacara 234'),
    (29103750, 113, 'Guaranhuns', 'Vila Velha', 'ES', 55555555555, 'Chacara 121');


INSERT INTO ENXAME (cep, numero, bairro, cidade, estado, populacao, dtNascRainha, tipo) VALUES
    (54440495, 537, 'Candeias', 'Jaboatao dos Guararapes', 'PE', 32, '2016-07-22', 'Abelha Europeia'),
    (63900173, 916, 'Centro', 'Quixada', 'CE', 43, '2015-08-20', 'Abelha Asiatica'),
    (29170760, 946, 'Jardim Guarara', 'Santo Andre', 'SP', 59, '2016-04-13', 'Abelha Gigante'),
    (72302514, 925, 'Samambaia Sul ', 'Brasilia', 'DF', 53, '2016-12-31', 'Apis armbrusteri'),
    (29103750, 113, 'Guaranhuns', 'Vila Velha', 'ES', 50, '2021-01-01', 'Abelha das Filipinas');


INSERT INTO PRODUTO (ncmProduto, nomeProduto) VALUES
    (07101000, 'batata'),
    (08101000, 'morango'),
    (08061000, 'uva fresca'),
    (08051000, 'laranja'),
    (07020000, 'tomate');


INSERT INTO FAZENDEIRO (cpfFazendeiro, nome, emailFazendeiro) VALUES
    (66666666666, 'Edson Thiago Nicolas Barbosa', 'nicolasbarbosa@imoveisvillani.com.br'),
    (77777777777, 'Otavio Vinicius Porto', 'otavioviniciusporto@lins.net.br'),
    (88888888888, 'Fernando Lucas Severino Moura', 'lucasseverinomoura@athos.srv.br'),
    (99999999999, 'Noah Luan Benjamin Freitas', 'benjaminfreitas-91@transicao.com'),
    (12345678900, 'Fatima Sônia Daiane Viana', 'daianeviana@meteorus.com.br');


INSERT INTO telefoneFazendeiro (cpfFazendeiro, telefone) VALUES
    (66666666666, 61929483724),
    (77777777777, 61945674654),
    (88888888888, 61923452346),
    (99999999999, 61958745672),
    (12345678900, 61956487356);


INSERT INTO FAZENDA (cep, numero, bairro, cidade, estado, cpfFazendeiro, complemento) VALUES
    (93415150, 497, 'Ouro Branco', 'Novo Hamburgo', 'RS', 66666666666, 'Fazenda 14'),
    (75024901, 458, 'Setor Central', 'Anapolis', 'GO', 77777777777, 'Fazenda 23'),
    (58434161, 527, 'Serrotao', 'Campina Grande', 'PB', 88888888888, 'Fazenda 65'),
    (78088838, 573, 'Jardim Passaredo', 'Cuiaba', 'MT', 99999999999, 'Fazenda 11'),
    (69312454, 310, 'Cinturao Verde', 'Boa Vista', 'RR', 12345678900, 'Fazenda 03');


INSERT INTO PLANTACAO (cep, numero, bairro, cidade, estado, ncmProduto, areaPlantacao, agrotoxicoAplicado, intervaloAgrotoxico, duracaoAplicacao) VALUES
    (93415150, 497, 'Ouro Branco', 'Novo Hamburgo', 'RS', 07101000,  50, 'Herbicidas', 'A cada semana', '2 dias'),
    (75024901, 458, 'Setor Central', 'Anapolis', 'GO', 08101000, 48, 'Inseticidas', 'A cada 15 dias', '1 dia'),
    (58434161, 527, 'Serrotao', 'Campina Grande', 'PB', 08061000, 34, 'Fungicidas', 'A cada 20 dias', '4 dias'),
    (78088838, 573, 'Jardim Passaredo', 'Cuiaba', 'MT', 08051000, 39, 'Abelhicida', 'Diariamente', '1 dia'),
    (69312454, 310, 'Cinturao Verde', 'Boa Vista', 'RR', 07020000, 40, 'Bactericidas', 'Mensalmente', '5 dias');


INSERT INTO aloca (idPlantacao, idEnxame, dtInicioAlocacao, dtFImAlocacao) VALUES
    (1, 5, '2021-01-01', '2021-02-02'),
    (2, 4, '2021-03-03', '2021-04-04'),
    (3, 3, '2021-05-05', '2021-06-06'),
    (4, 2, '2021-07-07', '2021-08-08'),
    (5, 1, '2021-09-09', '2021-10-10');
