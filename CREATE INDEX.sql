-- Índice que retorna os bairros que possuem avisos cadastrados
-- Esse índice permite saber quais bairros possuem ocorrências
DROP INDEX IF EXISTS aviso_bairro_IDX ON AVISO;
CREATE INDEX aviso_bairro_IDX ON AVISO (bairro);