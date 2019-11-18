SELECT numeroDiscriminacao, dataVistoria
FROM OCORRENCIA
WHERE aviso_id = (SELECT id FROM AVISO WHERE risco = ('Grave' OR 'Gravíssimo'));

SELECT id, nome
FROM VISTORIADOR
WHERE id = (SELECT vistoriador_id FROM ATENDIMENTO WHERE ocorrencia_id = (SELECT id FROM OCORRENCIA WHERE (DATE(dataVistoria) = CURDATE())));

SELECT numeroDiscriminacao, dataVistoria
FROM OCORRENCIA
GROUP BY status
HAVING DATE(dataVistoria) > CURDATE();

SELECT nome, dataNascimento, complemento
FROM USUARIO
GROUP BY bairro
HAVING complemento = 'Casa';

SELECT n.nome, a.id, o.dataMonitoramento
From VISTORIADOR n INNER JOIN ATENDIMENTO a ON n.id = a.vistoriador_id 
INNER JOIN OCORRENCIA o ON a.ocorrencia_id = o.id;

SELECT i.url, a.descricao, u.logradouro, u.numero, u.bairro, u.cidade
FROM IMAGENS i INNER JOIN AVISO a ON i.aviso_id = a.id
INNER JOIN USUARIO u ON a.usuario_id = u.id
WHERE a.risco = ('Gravíssimo' OR 'Grave');