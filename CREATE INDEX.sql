-- Índice que retorna os bairros que possuem avisos cadastrados
-- Esse índice permite saber quais bairros possuem ocorrências
DROP INDEX IF EXISTS aviso_bairro_IDX ON AVISO;
CREATE INDEX aviso_bairro_IDX ON AVISO (bairro);

-- Esse índice facilita as pesquisas na Tabela Usuários
ALTER TABLE `usuario`
	ADD INDEX `campos_mais_usados_IDX` (`cpf`, `cidade`);
