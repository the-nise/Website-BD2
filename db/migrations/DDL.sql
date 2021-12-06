
-- -----------------------------------------------------
-- Table Usuario
-- -----------------------------------------------------
DROP TABLE IF EXISTS Usuario CASCADE;

CREATE TABLE IF NOT EXISTS Usuario (
  idUsuario SERIAL NOT NULL,
  nome VARCHAR(45) NULL,
  sobrenome VARCHAR(45) NULL,
  idade INTEGER NULL,
  CPF VARCHAR(14) NULL,
  dat_ini DATE NULL,
  isLogista BOOLEAN NULL,
  isDespachante BOOLEAN NULL,
  isAdmPolo BOOLEAN NULL,
  isAdmRegiao BOOLEAN NULL,
  isAdmEmpresa BOOLEAN NULL,
  DATA_NASC DATE NULL,
  PRIMARY KEY (idUsuario))
;


-- -----------------------------------------------------
-- Table admPolo
-- -----------------------------------------------------
DROP TABLE IF EXISTS admPolo CASCADE;

CREATE TABLE IF NOT EXISTS admPolo (
  Usuario_idUsuario INTEGER NOT NULL,
  PRIMARY KEY (Usuario_idUsuario),
  CONSTRAINT fk_admPolo_Usuario1
    FOREIGN KEY (Usuario_idUsuario)
    REFERENCES Usuario (idUsuario)
    )
;


-- -----------------------------------------------------
-- Table admRegiao
-- -----------------------------------------------------
DROP TABLE IF EXISTS admRegiao CASCADE;

CREATE TABLE IF NOT EXISTS admRegiao (
  Usuario_idUsuario INTEGER NOT NULL,
  PRIMARY KEY (Usuario_idUsuario),
  CONSTRAINT fk_admRegiao_Usuario1
    FOREIGN KEY (Usuario_idUsuario)
    REFERENCES Usuario (idUsuario)
    )
;


-- -----------------------------------------------------
-- Table admEmpresa
-- -----------------------------------------------------
DROP TABLE IF EXISTS admEmpresa CASCADE;

CREATE TABLE IF NOT EXISTS admEmpresa (
  Usuario_idUsuario INTEGER NOT NULL,
  PRIMARY KEY (Usuario_idUsuario),
  CONSTRAINT fk_admEmpresa_Usuario1
    FOREIGN KEY (Usuario_idUsuario)
    REFERENCES Usuario (idUsuario)
    )
;


-- -----------------------------------------------------
-- Table regiao
-- -----------------------------------------------------
DROP TABLE IF EXISTS regiao CASCADE;

CREATE TABLE IF NOT EXISTS regiao (
  idregiao SERIAL NOT NULL,
  admRegiao_Usuario_idUsuario INTEGER NOT NULL,
  admEmpresa_Usuario_idUsuario INTEGER NOT NULL,
  dat_ini DATE NULL,
  nome VARCHAR(45) NULL,
  linkMapa VARCHAR(45) NULL,
  PRIMARY KEY (idregiao),
  CONSTRAINT fk_regiao_admRegiao1
    FOREIGN KEY (admRegiao_Usuario_idUsuario)
    REFERENCES admRegiao (Usuario_idUsuario)
    ,
  CONSTRAINT fk_regiao_admEmpresa1
    FOREIGN KEY (admEmpresa_Usuario_idUsuario)
    REFERENCES admEmpresa (Usuario_idUsuario)
    )
;




-- -----------------------------------------------------
-- Table CEPs
-- -----------------------------------------------------
DROP TABLE IF EXISTS CEPs CASCADE;

CREATE TABLE IF NOT EXISTS CEPs (
  CEP VARCHAR(10) NOT NULL,
  nomeCidade VARCHAR(45) NULL,
  PRIMARY KEY (CEP))
;


-- -----------------------------------------------------
-- Table polo
-- -----------------------------------------------------
DROP TABLE IF EXISTS polo CASCADE;

CREATE TABLE IF NOT EXISTS polo (
  regiao_idregiao INTEGER NOT NULL,
  secPolo SERIAL NOT NULL,
  admPolo_Usuario_idUsuario INTEGER NOT NULL,
  admRegiao_Usuario_idUsuario INTEGER NOT NULL,
  dat_ini DATE NULL,
  nome VARCHAR(45) NULL,
  numFuncionarios INTEGER NULL,
  logradouro VARCHAR(45) NULL,
  numero INTEGER NULL,
  tipo VARCHAR(45) NULL,
  CEPs_CEP VARCHAR(10),
  PRIMARY KEY (regiao_idregiao, secPolo),
  CONSTRAINT fk_polo_admPolo1
    FOREIGN KEY (admPolo_Usuario_idUsuario)
    REFERENCES admPolo (Usuario_idUsuario)
    ,
  CONSTRAINT fk_polo_regiao1
    FOREIGN KEY (regiao_idregiao)
    REFERENCES regiao (idregiao)
    ,
  CONSTRAINT fk_polo_admRegiao1
    FOREIGN KEY (admRegiao_Usuario_idUsuario)
    REFERENCES admRegiao (Usuario_idUsuario)
    ,
  CONSTRAINT fk_polo_CEPs1
    FOREIGN KEY (CEPs_CEP)
    REFERENCES CEPs (CEP)
    )
;






-- -----------------------------------------------------
-- Table loja
-- -----------------------------------------------------
DROP TABLE IF EXISTS loja CASCADE;

CREATE TABLE IF NOT EXISTS loja (
  polo_regiao_idregiao INTEGER NOT NULL,
  polo_secPolo INTEGER NOT NULL,
  numCaixaOperantes INTEGER NULL,
  PRIMARY KEY (polo_regiao_idregiao, polo_secPolo),
  CONSTRAINT fk_loja_polo1
    FOREIGN KEY (polo_regiao_idregiao , polo_secPolo)
    REFERENCES polo (regiao_idregiao , secPolo)
    )
;


-- -----------------------------------------------------
-- Table lojista
-- -----------------------------------------------------
DROP TABLE IF EXISTS lojista CASCADE;

CREATE TABLE IF NOT EXISTS lojista (
  Usuario_idUsuario INTEGER NOT NULL,
  loja_polo_regiao_idregiao INTEGER NOT NULL,
  loja_polo_secPolo INTEGER NOT NULL,
  PRIMARY KEY (Usuario_idUsuario),
  CONSTRAINT fk_logista_Usuario
    FOREIGN KEY (Usuario_idUsuario)
    REFERENCES Usuario (idUsuario)
    ,
  CONSTRAINT fk_logista_loja1
    FOREIGN KEY (loja_polo_regiao_idregiao , loja_polo_secPolo)
    REFERENCES loja (polo_regiao_idregiao , polo_secPolo)
    )
;



-- -----------------------------------------------------
-- Table despachante
-- -----------------------------------------------------
DROP TABLE IF EXISTS despachante CASCADE;

CREATE TABLE IF NOT EXISTS despachante (
  Usuario_idUsuario INTEGER NOT NULL,
  polo_regiao_idregiao INTEGER NOT NULL,
  polo_secPolo INTEGER NOT NULL,
  tamanhoColeteCorretorDePostura VARCHAR(45) NULL,
  PRIMARY KEY (Usuario_idUsuario),
  CONSTRAINT fk_despachante_Usuario1
    FOREIGN KEY (Usuario_idUsuario)
    REFERENCES Usuario (idUsuario)
    ,
  CONSTRAINT fk_despachante_polo1
    FOREIGN KEY (polo_regiao_idregiao , polo_secPolo)
    REFERENCES polo (regiao_idregiao , secPolo)
    )
;



-- -----------------------------------------------------
-- Table galpao
-- -----------------------------------------------------
DROP TABLE IF EXISTS galpao CASCADE;

CREATE TABLE IF NOT EXISTS galpao (
  polo_regiao_idregiao INTEGER NOT NULL,
  polo_secPolo INTEGER NOT NULL,
  capacidade INTEGER NULL,
  PRIMARY KEY (polo_regiao_idregiao, polo_secPolo),
  CONSTRAINT fk_galpao_polo1
    FOREIGN KEY (polo_regiao_idregiao , polo_secPolo)
    REFERENCES polo (regiao_idregiao , secPolo)
    )
;


-- -----------------------------------------------------
-- Table veiculo
-- -----------------------------------------------------
DROP TABLE IF EXISTS veiculo CASCADE;

CREATE TABLE IF NOT EXISTS veiculo (
  regiao_idregiao INTEGER NOT NULL,
  secVeiculo SERIAL NOT NULL,
  capacidade INTEGER NULL,
  situacao VARCHAR(45) NULL,
  placa VARCHAR(45) NULL,
  marca VARCHAR(45) NULL,
  ano VARCHAR(45) NULL,
  PRIMARY KEY (regiao_idregiao, secVeiculo),
  CONSTRAINT fk_veiculo_regiao1
    FOREIGN KEY (regiao_idregiao)
    REFERENCES regiao (idregiao)
    )
;


-- -----------------------------------------------------
-- Table cidade
-- -----------------------------------------------------
DROP TABLE IF EXISTS cidade CASCADE;

CREATE TABLE IF NOT EXISTS cidade (
  idcidade SERIAL NOT NULL,
  CEPs_CEP VARCHAR(10),
  PRIMARY KEY (idcidade),
  CONSTRAINT fk_cidade_CEPs1
    FOREIGN KEY (CEPs_CEP)
    REFERENCES CEPs (CEP)
    )
;



-- -----------------------------------------------------
-- Table Pacote
-- -----------------------------------------------------
DROP TABLE IF EXISTS Pacote CASCADE;

CREATE TABLE IF NOT EXISTS Pacote (
  idPacote SERIAL NOT NULL,
  veiculo_regiao_idregiao INTEGER NOT NULL,
  veiculo_secVeiculo INTEGER NOT NULL,
  cidade_idcidade INTEGER NOT NULL,
  cidade_idcidade1 INTEGER NOT NULL,
  logista_Usuario_idUsuario INTEGER NOT NULL,
  nomeRemetente VARCHAR(45) NULL,
  sobreNomeRemetente VARCHAR(45) NULL,
  nomeDestinatario VARCHAR(45) NULL,
  sobrenomeDestinatario VARCHAR(45) NULL,
  destLogradouro VARCHAR(45) NULL,
  destNumero VARCHAR(45) NULL,
  destCEP VARCHAR(10) NULL,
  situcao VARCHAR(45) NULL,
  posAtual VARCHAR(45) NULL,
  previaEntrega VARCHAR(45) NULL,
  PRIMARY KEY (idPacote),
  CONSTRAINT fk_Pacote_veiculo1
    FOREIGN KEY (veiculo_regiao_idregiao , veiculo_secVeiculo)
    REFERENCES veiculo (regiao_idregiao , secVeiculo)
    ,
  CONSTRAINT fk_Pacote_cidade1
    FOREIGN KEY (cidade_idcidade)
    REFERENCES cidade (idcidade)
    ,
  CONSTRAINT fk_Pacote_cidade2
    FOREIGN KEY (cidade_idcidade1)
    REFERENCES cidade (idcidade)
    ,
  CONSTRAINT fk_Pacote_logista1
    FOREIGN KEY (logista_Usuario_idUsuario)
    REFERENCES lojista (Usuario_idUsuario)
    )
;






-- -----------------------------------------------------
-- Table deslocamento
-- -----------------------------------------------------
DROP TABLE IF EXISTS deslocamento CASCADE;

CREATE TABLE IF NOT EXISTS deslocamento (
  cidade_idcidadeOrigem INTEGER NOT NULL,
  cidade_idcidadeDestino INTEGER NOT NULL,
  distancia FLOAT NULL,
  preco FLOAT NULL,
  tempo DECIMAL NULL,
  PRIMARY KEY (cidade_idcidadeOrigem, cidade_idcidadeDestino),
  CONSTRAINT fk_cidade_has_cidade_cidade1
    FOREIGN KEY (cidade_idcidadeOrigem)
    REFERENCES cidade (idcidade)
    ,
  CONSTRAINT fk_cidade_has_cidade_cidade2
    FOREIGN KEY (cidade_idcidadeDestino)
    REFERENCES cidade (idcidade)
    )
;




-- -----------------------------------------------------
-- Table rota
-- -----------------------------------------------------
DROP TABLE IF EXISTS rota CASCADE;

CREATE TABLE IF NOT EXISTS rota (
  idrota SERIAL NOT NULL,
  qualidade VARCHAR(45) NULL,
  tempo FLOAT NULL,
  num_polos INTEGER NULL,
  PRIMARY KEY (idrota))
;


-- -----------------------------------------------------
-- Table posicaoPoloRota
-- -----------------------------------------------------
DROP TABLE IF EXISTS posicaoPoloRota CASCADE;

CREATE TABLE IF NOT EXISTS posicaoPoloRota (
  rota_idrota INTEGER NOT NULL,
  polo_regiao_idregiao INTEGER NOT NULL,
  polo_secPolo INTEGER NOT NULL,
  posicaoPolo INTEGER NULL,
  PRIMARY KEY (rota_idrota, polo_regiao_idregiao, polo_secPolo),
  CONSTRAINT fk_rota_has_polo_rota1
    FOREIGN KEY (rota_idrota)
    REFERENCES rota (idrota)
    ,
  CONSTRAINT fk_rota_has_polo_polo1
    FOREIGN KEY (polo_regiao_idregiao , polo_secPolo)
    REFERENCES polo (regiao_idregiao , secPolo)
    )
;




-- -----------------------------------------------------
-- Table ViagemNEW
-- -----------------------------------------------------
DROP TABLE IF EXISTS ViagemNEW CASCADE;

CREATE TABLE IF NOT EXISTS ViagemNEW (
  idViagem SERIAL NOT NULL,
  poloSAIDA_regiao_idregiao INTEGER NOT NULL,
  poloSAIDA_secPolo INTEGER NOT NULL,
  poloCHEGADA_regiao_idregiao INTEGER NOT NULL,
  poloCHEGADA_secPolo INTEGER NOT NULL,
  rota_idrota INTEGER NOT NULL,
  veiculo_regiao_idregiao INTEGER NOT NULL,
  veiculo_secVeiculo INTEGER NOT NULL,
  PRIMARY KEY (idViagem),
  CONSTRAINT fk_Viagem_polo1
    FOREIGN KEY (poloSAIDA_regiao_idregiao , poloSAIDA_secPolo)
    REFERENCES polo (regiao_idregiao , secPolo)
    ,
  CONSTRAINT fk_Viagem_rota1
    FOREIGN KEY (rota_idrota)
    REFERENCES rota (idrota)
    ,
  CONSTRAINT fk_ViagemNEW_polo1
    FOREIGN KEY (poloCHEGADA_regiao_idregiao , poloCHEGADA_secPolo)
    REFERENCES polo (regiao_idregiao , secPolo)
    ,
  CONSTRAINT fk_ViagemNEW_veiculo1
    FOREIGN KEY (veiculo_regiao_idregiao , veiculo_secVeiculo)
    REFERENCES veiculo (regiao_idregiao , secVeiculo)
    )
;





-- -----------------------------------------------------
-- Table curriculo
-- -----------------------------------------------------
DROP TABLE IF EXISTS curriculo CASCADE;

CREATE TABLE IF NOT EXISTS curriculo (
  formacao VARCHAR(40) NOT NULL,
  lojista_Usuario_idUsuario INTEGER NOT NULL,
  PRIMARY KEY (formacao),
  CONSTRAINT fk_curriculo_lojista1
    FOREIGN KEY (lojista_Usuario_idUsuario)
    REFERENCES lojista (Usuario_idUsuario)
    )
;



-- -----------------------------------------------------
-- Table Pacote_ViagemNEW
-- -----------------------------------------------------
DROP TABLE IF EXISTS Pacote_ViagemNEW CASCADE;

CREATE TABLE IF NOT EXISTS Pacote_ViagemNEW (
  Pacote_idPacote INTEGER NOT NULL,
  ViagemNEW_idViagem INTEGER NOT NULL,
  PRIMARY KEY (Pacote_idPacote, ViagemNEW_idViagem),
  CONSTRAINT fk_Pacote_ViagemNEW_Pacote1
    FOREIGN KEY (Pacote_idPacote)
    REFERENCES Pacote (idPacote)
    ,
  CONSTRAINT fk_Pacote_ViagemNEW_ViagemNEW1
    FOREIGN KEY (ViagemNEW_idViagem)
    REFERENCES ViagemNEW (idViagem)
    )
;
