-- View com os usuários de Contagem e com apenas campos selecionados
CREATE VIEW
usuarios_contagem 
AS 
SELECT nome, cpf, telefone, email FROM usuario WHERE Lower(cidade) = 'contagem' 
