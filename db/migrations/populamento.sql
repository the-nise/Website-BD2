-- CREATE SEQUENCE idUsuario INCREMENT 1 START 1;

-- CREATE SEQUENCE idregiao INCREMENT 1 START 1;

-- CREATE SEQUENCE secPolo INCREMENT 1 START 1;

-- CREATE SEQUENCE secVeiculo INCREMENT 1 START 1;

-- CREATE SEQUENCE idcidade INCREMENT 1 START 1;

-- CREATE SEQUENCE idPacote INCREMENT 1 START 1;

-- CREATE SEQUENCE idrota INCREMENT 1 START 1;

-- CREATE SEQUENCE idViagem INCREMENT 1 START 1;

-- Table Usuário
INSERT INTO Usuario (nome, sobrenome, idade, CPf, dat_ini, isLogista, isDespachante, isAdmPolo, isAdmRegiao, isAdmEmpresa, DATA_NASC)
VALUES 
('Lucas', 'Gonçalves', 54, '41319557800', '2005-9-24', FALSE, FALSE, FALSE, FALSE, TRUE, '1967-4-13'), 	-- adm empresa 1 (SELECT idUsuario FROM Usuario WHERE CPf = '41319557800')
('Luka', 'Albinno', 20, '12349557800', '2020-5-23', FALSE, FALSE, FALSE, TRUE, FALSE, '2001-7-23'),    	-- adm região 2 (SELECT idUsuario FROM Usuario WHERE CPf = '12349557800')
('João', 'Macedo', 30, '78946557800', '2010-5-12', FALSE, FALSE, TRUE, FALSE, FALSE, '1991-1-1'),        	-- adm polo 3 (SELECT idUsuario FROM Usuario WHERE CPf = '78946557800')
('Matias', 'Barbosa', 30, '78919287800', '2014-6-22', FALSE, TRUE, FALSE, FALSE, FALSE, '1991-2-4'),     	-- despachante 4 (SELECT idUsuario FROM Usuario WHERE CPf = '78919287800')
('Guilherme', 'Pereira', 30, '78919128349', '20119-2-28', TRUE, FALSE, FALSE, FALSE, FALSE, '1991-2-4'), 	-- lojista 5 (SELECT idUsuario FROM Usuario WHERE CPf = '78919128349')
('André', 'dos Santos', 30, '19193557800', '2015-12-15', FALSE, FALSE, FALSE, TRUE, FALSE, '2001-7-23'), 	-- adm região 6 (SELECT idUsuario FROM Usuario WHERE CPf = '19193557800')
('Eduardo', 'Machado', 30, '09876557800', '2011-5-12', FALSE, FALSE, TRUE, FALSE, FALSE, '1991-1-1'),	 	-- adm polo 7 (SELECT idUsuario FROM Usuario WHERE CPf = '09876557800')

('Ederson', 'Rodrigo',   24, '11597452401', '2019-3-10', FALSE, FALSE, FALSE, TRUE, FALSE, '1997-8-4'),   --adm regiao 8 (SELECT idUsuario FROM Usuario WHERE CPf = '11597452401')
('João', 'Paulo Santos', 21, '11364715100', '2020-1-15', FALSE, FALSE, FALSE, TRUE, FALSE, '2000-12-22'), --adm regiao 9 (SELECT idUsuario FROM Usuario WHERE CPf = '11364715100')
('Alisson', 'Gabriel',   31, '10156894415', '2016-8-07', FALSE, FALSE, FALSE, TRUE, FALSE, '1990-5-13'),  --adm regiao 10 (SELECT idUsuario FROM Usuario WHERE CPf = '10156894415')

('Douglas', 'Paulo', 55, '06481548425', '2019-3-10', FALSE, FALSE, TRUE, FALSE, FALSE, '1966-11-21'),   --adm polo 11 (SELECT idUsuario FROM Usuario WHERE CPf = '06481548425')
('João', 'Vitor',    36, '12044714485', '2020-1-15', FALSE, FALSE, TRUE, FALSE, FALSE, '1985-06-14'),   --adm polo 12 (SELECT idUsuario FROM Usuario WHERE CPf = '12044714485')
('Breno', 'Campos',  70, '00957821577', '2016-8-07', FALSE, FALSE, TRUE, FALSE, FALSE, '1951-2-17'),    --adm polo 13 (SELECT idUsuario FROM Usuario WHERE CPf = '00957821577')

('André', 'Mathias',      45, '35454854847', '2010-2-1', FALSE, TRUE, FALSE, FALSE, FALSE, '1976-3-12'),   -- despachante 14 (SELECT idUsuario FROM Usuario WHERE CPf = '35454854847')
('Neto', 'Gouveia',       41,'24810451755', '2013-5-19', TRUE, FALSE, FALSE, FALSE, FALSE, '1980-7-27'),  -- lojista 15 (SELECT idUsuario FROM Usuario WHERE CPf = '24810451755')
('Roberto', 'Nascimento', 51, '78451254887', '2012-9-12', TRUE, FALSE, FALSE, FALSE, FALSE, '1970-7-14');  -- lojista 16 (SELECT idUsuario FROM Usuario WHERE CPf = '78451254887')

-- Table admEmpresa
INSERT INTO admEmpresa (Usuario_idUsuario)
VALUES 
(1);

-- Table admRegião
INSERT INTO admRegiao (Usuario_idUsuario)
VALUES 
(2),
(6),
(8),
(9),
(10);

-- Table admPolo
INSERT INTO admPolo (Usuario_idUsuario)
VALUES
(3),
(11),
(12),
(13),
(7);

-- Table Região
INSERT INTO regiao (admRegiao_Usuario_idUsuario, admEmpresa_Usuario_idUsuario, dat_ini, nome, linkMapa)
VALUES 
(2, 1, '2014-6-22', 'São Paulo', 'www.linkmapa.com/SP'),      --Região ID 1
(6, 1, '2013-12-9', 'Bahia', 'www.linkmapa.com/BA'),		  --Região ID 2
(8, 1, '2015-3-12', 'Minas Gerais', 'www.linkmapa.com/MG'),	  --Região ID 3
(9, 1, '2017-10-22', 'Paraná', 'www.linkmapa.com/PR'),		  --Região ID 4
(10, 1, '2019-2-28', 'Goiás', 'www.linkmapa.com/GO');		  --Região ID 5
-- Table CEPs
INSERT INTO CEPs (CEP, nomeCidade)
VALUES
('14020370', 'Ribeirão Preto'),
('1469420', 'Ribeirão Preto'),
('45600013', 'Itabuna'),

('39853000', 'Novo Horizonte'),
('81880370', 'Curitiba'),
('75690000', 'Caldas Novas');

-- Table Polos
INSERT INTO polo (regiao_idregiao, admPolo_Usuario_idUsuario, admRegiao_Usuario_idUsuario, dat_ini, nome, numFuncionarios, logradouro, numero, tipo, CEPs_CEP)
VALUES 
(1, 3, 2, '2018-5-22', 'Loja Independencia', 15, 'Rua Doutor Soares Romeu', '370', 'loja', '14020370'),				--Polo id 1, 1
(2, 7, 6, '2019-11-9', 'Galpão Centro', 5, 'Avenida José Soares Pinheiro', '182', 'galpão', '45600013'),			--Polo id 2, 2
(3, 11, 8,  '2015-5-21',  'Galpão Sul', 6, 'Rua Saúde Almeida', '225', 'galpão', '39853000'),						--Polo id 3, 3
(4, 12, 9,  '2017-12-12', 'Loja Ipiranga', 10, 'Rua Chile', '101', 'loja', '81880370'),								--Polo id 4, 4
(5, 13, 10, '2019-5-23',  'Loja Francisco Junqueira', 8, 'Rua Umbelina Garbarela', '115', 'loja', '75690000');		--Polo id 5, 5

-- Table loja
INSERT INTO loja (polo_regiao_idregiao, polo_secPolo, numCaixaOperantes)
VALUES 
(1, 1, 5),
(4, 4, 6),
(5, 5, 5);

-- Table galpao
INSERT INTO galpao (polo_regiao_idregiao, polo_secPolo, capacidade)
VALUES 
(2, 2, 500),
(3, 3, 750);

-- Table lojista
INSERT INTO lojista (Usuario_idUsuario, loja_polo_regiao_idregiao, loja_polo_secPolo)
VALUES 
(5, 1, 1),

(15, 4, 4),
(16, 5, 5);

-- Table despachante
INSERT INTO despachante (Usuario_idUsuario, polo_regiao_idregiao, polo_secPolo, tamanhoColeteCorretorDePostura)
VALUES 
(4, 2, 2, '42'),

(14, 3, 3, '45');

-- Table veiculo
INSERT INTO veiculo (regiao_idregiao, capacidade, situacao, placa, marca, ano)
VALUES 
(1, 100, 'no polo tal', 'AEB-1234', 'volkswagen', 2010),
(2, 200, 'no polo ali', 'MEO-7430', 'tesla', 2019),
(3, 140, 'no polo desse modo', 'TEB-4444', 'chevrolet', 2016),
(4, 160, 'no polo assim', 'AID-3115', 'hyundai', 2014),
(5, 220, 'no polo assado', 'FOI-1114', 'fiat', 2015);

-- Table cidade
INSERT INTO cidade (CEPs_CEP)
VALUES 
('1469420'),   
('14020370'),  --Tem Polo 1
('39853000'),  --Tem Polo 3 é Galpão
('81880370'),  --Tem Polo 4
('75690000'),  --Tem Polo 5
('45600013');  --Tem Polo 2 é Galpão

-- Table Pacote
INSERT INTO Pacote (veiculo_regiao_idregiao, veiculo_secVeiculo, cidade_idcidade, cidade_idcidade1, logista_Usuario_idUsuario, nomeRemetente, sobreNomeRemetente,
                    nomeDestinatario, sobrenomeDestinatario, destLogradouro, destNumero, destCEP, situcao, posAtual, previaEntrega)
VALUES 
(1, 1, 2, 3, 5, 'Guilherme', 'Campos', 'Diego', 'Silva', 'Rua Mario Marques', '125', '39853000', 'em transito', 'avenida independencia', 'previa entrega'),
(1, 1, 2, 4, 5, 'Lucas', 'Santos', 'Thiago', 'Carvalho', 'Rua Mendes Magal', '696', '81880370', 'em transito', 'rua doutor soares romeu', 'previa entrega'),
(4, 4, 4, 1, 15, 'Mateus', 'Monte', 'Pedro', 'Cortes', 'Rua Marte Marelo', '21', '14020370', 'entregue', 'avenida martins ciro', 'previa entrega'),
(4, 4, 4, 5, 15, 'Marcos', 'Menezes', 'Paulo', 'Teixeira', 'Rua Monte Majestade', '496', '75690000', 'em transito', 'rua pedro 2', 'previa entrega'),
(5, 5, 5, 4, 16, 'Leandro', 'Bossi', 'Evandro', 'Caetano', 'Rua Mundo Mar', '776', '81880370', 'em transito', 'avenida costa e barriga', 'previa entrega');

-- Table deslocamento
INSERT INTO deslocamento (cidade_idcidadeOrigem, cidade_idcidadeDestino, distancia, preco, tempo)
VALUES 
(3, 1, 1505, 50, 20),
(4, 1, 105, 10, 3),
(2, 3, 705, 25, 13),
(2, 1, 350, 20, 7),
(5, 4, 150, 12, 5);

-- Table rota
INSERT INTO rota (qualidade, tempo, num_polos)
VALUES 
('muito boa', 20, 2),
('razoavel', 10, 2),
('ruim', 15, 4),
('pessima', 30, 3),
('otima', 33, 5);

-- Table posicaoPoloRota
INSERT INTO posicaoPoloRota (rota_idrota, polo_regiao_idregiao, polo_secPolo, posicaoPolo)
VALUES 
(1, 1, 1, 0), 
(1, 3, 3, 1),

(2, 2, 2, 0),
(2, 5, 5, 1),

(3, 3, 3, 0),
(3, 2, 2, 1),

(4, 4, 4, 0),
(4, 1, 1, 1),

(5, 5, 5, 0),
(5, 4, 4, 1);

-- Table ViagemNEW
INSERT INTO ViagemNEW (poloSAIDA_regiao_idregiao, poloSAIDA_secPolo, poloCHEGADA_regiao_idregiao, poloCHEGADA_secPolo, rota_idrota, veiculo_regiao_idregiao, veiculo_secVeiculo)
VALUES 
(1, 1, 3, 3, 1, 1, 1),
(1, 1, 4, 4, 4, 1, 1),
(4, 4, 1, 1, 4, 4, 4),
(4, 4, 5, 5, 5, 4, 4),
(5, 5, 4, 4, 5, 5, 5);

-- Table curriculo
INSERT INTO curriculo (formacao, lojista_Usuario_idUsuario)
VALUES 
('Administração', 5),
('Contabilidade', 15),
('Gestão de RH', 16);

-- Table Pacote_ViagemNEW
INSERT INTO Pacote_ViagemNEW (Pacote_idPacote, ViagemNEW_idViagem)
VALUES 
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);