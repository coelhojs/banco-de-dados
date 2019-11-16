-- Índice que retorna os bairros que possuem avisos cadastrados
-- Esse índice permite saber quais bairros possuem ocorrências
DROP INDEX IF EXISTS IX_bairros ON AVISO;
CREATE INDEX IX_bairros ON AVISO (bairro);