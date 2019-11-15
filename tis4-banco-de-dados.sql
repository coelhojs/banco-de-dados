-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           10.1.38-MariaDB - mariadb.org binary distribution
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              10.1.0.5464
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Copiando estrutura do banco de dados para tis4
DROP DATABASE IF EXISTS `tis4`;
CREATE DATABASE IF NOT EXISTS `tis4` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `tis4`;

-- Copiando estrutura para tabela tis4.aviso
DROP TABLE IF EXISTS `aviso`;
CREATE TABLE IF NOT EXISTS `aviso` (
  `id` int(11) NOT NULL,
  `idSequencia` varchar(10) NOT NULL,
  `status` varchar(255) DEFAULT NULL,
  `tipo` varchar(255) DEFAULT NULL,
  `gravidade` varchar(255) DEFAULT NULL,
  `dataHora` varchar(255) DEFAULT NULL,
  `descricao` varchar(10) DEFAULT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  `logradouro` varchar(255) DEFAULT NULL,
  `numero` varchar(10) DEFAULT NULL,
  `bairro` varchar(255) DEFAULT NULL,
  `latitude` varchar(255) DEFAULT NULL,
  `longitude` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_usuario_id` (`usuario_id`),
  CONSTRAINT `fk_usuario_id` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela tis4.aviso: ~0 rows (aproximadamente)
DELETE FROM `aviso`;
/*!40000 ALTER TABLE `aviso` DISABLE KEYS */;
/*!40000 ALTER TABLE `aviso` ENABLE KEYS */;

-- Copiando estrutura para tabela tis4.imagens
DROP TABLE IF EXISTS `imagens`;
CREATE TABLE IF NOT EXISTS `imagens` (
  `id` int(11) NOT NULL,
  `aviso_id` int(11) NOT NULL,
  `url` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `aviso_id` (`aviso_id`),
  CONSTRAINT `imagens_ibfk_1` FOREIGN KEY (`aviso_id`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela tis4.imagens: ~0 rows (aproximadamente)
DELETE FROM `imagens`;
/*!40000 ALTER TABLE `imagens` DISABLE KEYS */;
/*!40000 ALTER TABLE `imagens` ENABLE KEYS */;

-- Copiando estrutura para tabela tis4.ocorrencia
DROP TABLE IF EXISTS `ocorrencia`;
CREATE TABLE IF NOT EXISTS `ocorrencia` (
  `id` int(11) NOT NULL,
  `idSequencia` varchar(10) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `aviso_id` int(11) NOT NULL,
  `status` varchar(255) DEFAULT NULL,
  `numeroDiscriminacao` varchar(255) DEFAULT NULL,
  `dataVistoria` varchar(255) DEFAULT NULL,
  `pessoasEnvolvidas` int(11) DEFAULT NULL,
  `equipeVistoria` varchar(255) DEFAULT NULL,
  `ROsAnteriores` varchar(255) DEFAULT NULL,
  `numeroOficioEncaminhado` varchar(255) DEFAULT NULL,
  `orgaoDestinoOficio` varchar(255) DEFAULT NULL,
  `doacao` varchar(255) DEFAULT NULL,
  `vitimaParcial` varchar(255) DEFAULT NULL,
  `vitimaFatal` varchar(255) DEFAULT NULL,
  `interdicao` varchar(255) DEFAULT NULL,
  `dataMonitoramento` varchar(255) DEFAULT NULL,
  `situacaoAtual` varchar(255) DEFAULT NULL,
  `retornoVistoria` varchar(255) DEFAULT NULL,
  `dataRequisicao` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `usuario_id` (`usuario_id`),
  KEY `aviso_id` (`aviso_id`),
  CONSTRAINT `ocorrencia_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`),
  CONSTRAINT `ocorrencia_ibfk_2` FOREIGN KEY (`aviso_id`) REFERENCES `aviso` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela tis4.ocorrencia: ~0 rows (aproximadamente)
DELETE FROM `ocorrencia`;
/*!40000 ALTER TABLE `ocorrencia` DISABLE KEYS */;
/*!40000 ALTER TABLE `ocorrencia` ENABLE KEYS */;

-- Copiando estrutura para tabela tis4.permissoes
DROP TABLE IF EXISTS `permissoes`;
CREATE TABLE IF NOT EXISTS `permissoes` (
  `id` int(11) NOT NULL,
  `permissao` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela tis4.permissoes: ~0 rows (aproximadamente)
DELETE FROM `permissoes`;
/*!40000 ALTER TABLE `permissoes` DISABLE KEYS */;
/*!40000 ALTER TABLE `permissoes` ENABLE KEYS */;

-- Copiando estrutura para tabela tis4.usuario
DROP TABLE IF EXISTS `usuario`;
CREATE TABLE IF NOT EXISTS `usuario` (
  `id` int(11) NOT NULL,
  `tipo` varchar(255) NOT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `telefone` varchar(14) DEFAULT NULL,
  `cpf` varchar(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `dataNascimento` date DEFAULT NULL,
  `logradouro` varchar(255) DEFAULT NULL,
  `numero` varchar(10) DEFAULT NULL,
  `complemento` varchar(255) DEFAULT NULL,
  `bairro` varchar(255) DEFAULT NULL,
  `cidade` varchar(255) DEFAULT NULL,
  `cep` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Index 2` (`cpf`,`nome`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela tis4.usuario: ~0 rows (aproximadamente)
DELETE FROM `usuario`;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` (`id`, `tipo`, `nome`, `telefone`, `cpf`, `email`, `dataNascimento`, `logradouro`, `numero`, `complemento`, `bairro`, `cidade`, `cep`) VALUES
	(0, '', 'Caique', '31999999999', '12345678912', 'caique@gmail.com', '2019-12-08', 'Rua Das Scanias', '69', 'Beco', 'Insdustrial', 'contagem', NULL);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;

-- Copiando estrutura para view tis4.usuarios_contagem
DROP VIEW IF EXISTS `usuarios_contagem`;
-- Criando tabela temporária para evitar erros de dependência de VIEW
CREATE TABLE `usuarios_contagem` (
	`nome` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`cpf` VARCHAR(11) NOT NULL COLLATE 'latin1_swedish_ci',
	`telefone` VARCHAR(14) NULL COLLATE 'latin1_swedish_ci',
	`email` VARCHAR(100) NOT NULL COLLATE 'latin1_swedish_ci'
) ENGINE=MyISAM;

-- Copiando estrutura para tabela tis4.vistoriador
DROP TABLE IF EXISTS `vistoriador`;
CREATE TABLE IF NOT EXISTS `vistoriador` (
  `id` int(11) NOT NULL,
  `nome` varchar(250) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela tis4.vistoriador: ~0 rows (aproximadamente)
DELETE FROM `vistoriador`;
/*!40000 ALTER TABLE `vistoriador` DISABLE KEYS */;
/*!40000 ALTER TABLE `vistoriador` ENABLE KEYS */;

-- Copiando estrutura para view tis4.usuarios_contagem
DROP VIEW IF EXISTS `usuarios_contagem`;
-- Removendo tabela temporária e criando a estrutura VIEW final
DROP TABLE IF EXISTS `usuarios_contagem`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `usuarios_contagem` AS SELECT nome, cpf, telefone, email FROM usuario WHERE Lower(cidade) = 'contagem' ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
