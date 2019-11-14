CREATE TABLE USUARIO (
  id INT,
  tipo VARCHAR(255) NOT NULL,
  nome VARCHAR(255),
  telefone VARCHAR(14),
  cpf VARCHAR(11) NOT NULL,
  email VARCHAR(100) NOT NULL,
  dataNascimento DATE,
  logradouro VARCHAR(255),
  numero VARCHAR(10),
  complemento VARCHAR(255),
  bairro VARCHAR(255),
  cidade VARCHAR(255),
  cep VARCHAR(8),
  PRIMARY KEY(id)
);
CREATE TABLE AVISO (
  id INT,
  idSequencia VARCHAR(10) NOT NULL,
  status VARCHAR(255),
  tipo VARCHAR(255),
  gravidade VARCHAR(255),
  dataHora VARCHAR(255),
  descricao VARCHAR(10),
  usuario_id INT,
  logradouro VARCHAR(255),
  numero VARCHAR(10),
  bairro VARCHAR(255),
  latitude VARCHAR(255),
  longitude VARCHAR(255),
  PRIMARY KEY(id),
  FOREIGN KEY(usuario_id) REFERENCES USUARIO(id)
);
CREATE TABLE IMAGENS (
  id INT NOT NULL,
  aviso_id INT NOT NULL,
  url VARCHAR(255) NOT NULL,
  PRIMARY KEY(id),
  FOREIGN KEY (aviso_id) REFERENCES USUARIO(id)
);
CREATE TABLE OCORRENCIA (
  id INT,
  idSequencia VARCHAR(10) NOT NULL,
  usuario_id INT NOT NULL,
  aviso_id INT NOT NULL,
  status VARCHAR(255),
  numeroDiscriminacao VARCHAR(255),
  dataVistoria VARCHAR(255),
  pessoasEnvolvidas INT,
  equipeVistoria VARCHAR(255),
  ROsAnteriores VARCHAR(255),
  numeroOficioEncaminhado VARCHAR(255),
  orgaoDestinoOficio VARCHAR(255),
  doacao VARCHAR(255),
  vitimaParcial VARCHAR(255),
  vitimaFatal VARCHAR(255),
  interdicao VARCHAR(255),
  dataMonitoramento VARCHAR(255),
  situacaoAtual VARCHAR(255),
  retornoVistoria VARCHAR(255),
  dataRequisicao VARCHAR(255),
  PRIMARY KEY(id),
  FOREIGN KEY (usuario_id) REFERENCES USUARIO(id),
  FOREIGN KEY (aviso_id) REFERENCES AVISO(id)
);
CREATE TABLE VISTORIADOR(
  id INT,
  nome VARCHAR(250),
  email VARCHAR(100),
  PRIMARY KEY (id)
);
