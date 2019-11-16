-- View que retorna os funcionários cadastrados na aplicação
-- A partir dessa view pode-se saber quais usuários podem acessar a aplicação web.
DROP VIEW IF EXISTS Funcionarios_Defesa_Civil_Contagem;
CREATE VIEW Funcionarios_Defesa_Civil_Contagem AS
SELECT id, nome, perfil
FROM USUARIO
WHERE perfil != 'Cidadao';


-- View que retorna os avisos pendentes.
-- Essa view facilita a obtenção dos avisos da população que precisam de atendimento
DROP VIEW IF EXISTS Avisos_Pendentes;
CREATE VIEW Avisos_Pendentes AS
SELECT idSequencia, status, tipo, risco, bairro, logradouro
FROM aviso
WHERE status = 'Pendente';


-- View com os usuários de Contagem e com apenas campos selecionados
DROP VIEW IF EXISTS usuarios_contagem;
CREATE VIEW
usuarios_contagem 
AS 
SELECT nome, cpf, telefone, email FROM usuario WHERE Lower(cidade) = 'contagem' 
