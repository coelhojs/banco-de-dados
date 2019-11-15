-- View que retorna os funcionários cadastrados na aplicação
DROP VIEW IF EXISTS Funcionarios_Defesa_Civil_Contagem;
CREATE VIEW Funcionarios_Defesa_Civil_Contagem AS
SELECT id, nome, perfil
FROM USUARIO
WHERE perfil != 'Cidadao';

DROP VIEW IF EXISTS Avisos_Pendentes;
CREATE VIEW Avisos_Pendentes AS
SELECT idSequencia, status, tipo, risco, bairro, logradouro
FROM aviso
WHERE status = 'Pendente';