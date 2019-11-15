DROP DATABASE IF EXISTS DEFESACIVILCONTAGEM;
CREATE DATABASE IF NOT EXISTS DEFESACIVILCONTAGEM;
USE DEFESACIVILCONTAGEM;
DROP TABLE IF EXISTS USUARIO;
CREATE TABLE IF NOT EXISTS USUARIO (
  id int(5) NOT NULL AUTO_INCREMENT,
  perfil ENUM('Cidadao', 'Atendente', 'Vistoriador', 'Gestor') DEFAULT 'Cidadao',
  nome varchar(255) NOT NULL,
  telefone varchar(14),
  cpf varchar(11) NOT NULL,
  email varchar(100) NOT NULL,
  dataNascimento date,
  logradouro varchar(255),
  numero varchar(10),
  complemento varchar(255),
  bairro varchar(255),
  cidade varchar(255) DEFAULT 'Contagem',
  cep int(8) NOT NULL,
  PRIMARY KEY (id),
  CONSTRAINT UQ_cpf_email UNIQUE(cpf, email)
);
DROP TABLE IF EXISTS AVISO;
CREATE TABLE IF NOT EXISTS AVISO (
  id int(5) NOT NULL AUTO_INCREMENT,
  idSequencia varchar(10) NOT NULL,
  status ENUM('Pendente', 'Processado', 'Cancelado') DEFAULT 'Pendente',
  tipo ENUM(
    'Risco Construtivo',
    'Interdição',
    'Escorregamento',
    'Remoção',
    'Abatimento',
    'Solo',
    'Solopamento',
    'Drenagem',
    'Erosão',
    'Inundação',
    'Alagamento',
    'Desabamento',
    'Terreno',
    'impróprio',
    'Outros/Sem dados'
  ) DEFAULT 'Outros/Sem dados',
  risco ENUM(
    'Inexistente ou Baixo',
    'Médio',
    'Alto',
    'Muito Alto'
  ) DEFAULT 'Inexistente ou Baixo',
  dataHora TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  descricao varchar(255) NOT NULL,
  usuario_id int(5),
  logradouro varchar(255) NOT NULL,
  numero varchar(10),
  bairro varchar(255) NOT NULL,
  latitude varchar(255),
  longitude varchar(255),
  PRIMARY KEY (id),
  CONSTRAINT UQ_id_seq UNIQUE(idSequencia),
  CONSTRAINT fk_usuario_id FOREIGN KEY (usuario_id) REFERENCES USUARIO (id) ON DELETE
  SET
    NULL
);
DROP TABLE IF EXISTS IMAGENS;
CREATE TABLE IF NOT EXISTS IMAGENS (
  id int(5) NOT NULL AUTO_INCREMENT,
  aviso_id INT NOT NULL,
  url VARCHAR(255) NOT NULL,
  PRIMARY KEY(id),
  CONSTRAINT UQ_url UNIQUE(url),
  CONSTRAINT fk_aviso_id FOREIGN KEY (aviso_id) REFERENCES AVISO(id) ON DELETE CASCADE
);
DROP TABLE IF EXISTS OCORRENCIA;
CREATE TABLE IF NOT EXISTS OCORRENCIA (
  id int(5) NOT NULL AUTO_INCREMENT,
  idSequencia VARCHAR(10) NOT NULL,
  aviso_id INT NOT NULL,
  status ENUM(
    'Pendente',
    'Em aberto',
    'Concluído',
    'Em Espera',
    'Cancelado'
  ) DEFAULT 'Pendente',
  dataHora TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  numeroDiscriminacao VARCHAR(255) NOT NULL,
  dataVistoria VARCHAR(255) NOT NULL,
  pessoasEnvolvidas INT NOT NULL,
  equipeVistoria VARCHAR(255) NOT NULL,
  ROsAnteriores VARCHAR(255),
  numeroOficioEncaminhado VARCHAR(255),
  orgaoDestinoOficio VARCHAR(255),
  doacao VARCHAR(255),
  vitimaParcial VARCHAR(255) NOT NULL,
  vitimaFatal VARCHAR(255) NOT NULL,
  interdicao VARCHAR(255) NOT NULL,
  dataMonitoramento VARCHAR(255) NOT NULL,
  situacaoAtual VARCHAR(255) NOT NULL,
  retornoVistoria VARCHAR(255) NOT NULL,
  dataRequisicao VARCHAR(255) NOT NULL,
  PRIMARY KEY(id),
  CONSTRAINT UQ_id_seq UNIQUE(idSequencia),
  FOREIGN KEY (aviso_id) REFERENCES AVISO(id)
);
DROP TABLE IF EXISTS VISTORIADOR;
CREATE TABLE IF NOT EXISTS VISTORIADOR (
  id int(5) NOT NULL AUTO_INCREMENT,
  nome VARCHAR(250) NOT NULL,
  email VARCHAR(100) NOT NULL,
  PRIMARY KEY (id),
  CONSTRAINT UQ_vistoriador UNIQUE(nome, email)
);
DROP TABLE IF EXISTS ATENDIMENTO;
CREATE TABLE IF NOT EXISTS ATENDIMENTO (
  id int(5) NOT NULL AUTO_INCREMENT,
  ocorrencia_id int(5) NOT NULL,
  vistoriador_id int(5) NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (ocorrencia_id) REFERENCES OCORRENCIA(id),
  FOREIGN KEY (vistoriador_id) REFERENCES VISTORIADOR(id)
);
DROP TABLE IF EXISTS PERMISSAO;
CREATE TABLE IF NOT EXISTS PERMISSAO (
  codigo_acesso int(5) NOT NULL AUTO_INCREMENT,
  modulo VARCHAR(255) NOT NULL,
  PRIMARY KEY (codigo_acesso)
);
DROP TABLE IF EXISTS NOTICIA;
CREATE TABLE IF NOT EXISTS NOTICIA (
  id int(5) NOT NULL AUTO_INCREMENT,
  url VARCHAR(255) NOT NULL,
  PRIMARY KEY (id),
  CONSTRAINT UQ_url UNIQUE(url)
);
DROP TABLE IF EXISTS ALERTA;
CREATE TABLE IF NOT EXISTS ALERTA (
  id int(5) NOT NULL AUTO_INCREMENT,
  descricao varchar(255) NOT NULL,
  texto VARCHAR(255) NOT NULL,
  dataHora TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id)
);