
-- Inserção Usuario Teste 1
INSERT INTO usuario (nome, telefone, cpf, email, dataNascimento, logradouro, numero, complemento, bairro, cep) VALUES
	('Caique Ribeiro', '31999999999', '12345678912', 'caique@gmail.com', '1993-12-08', 'Rua Scania', '50', 'Casa', 'Industrial', 32997150);

    -- Inserção Usuario Teste 2
INSERT INTO usuario (perfil, nome, telefone, cpf, email, dataNascimento, logradouro, numero, complemento, bairro, cep) VALUES
	('Gestor', 'Samuel Silva', '31999234929', '12245328910', 'sam.silva@gmail.com', '1984-12-08', 'Rua Paraíba', '17', 'Apto 12', 'Inconfidentes', 32515072);

-- Inserção Aviso Teste 1
INSERT INTO aviso (idSequencia, tipo, descricao, usuario_id)
VALUES ('0001/2019', 'Inundação', 'Inundação devido a chuva', 1);

-- Inserção Aviso Teste 2
INSERT INTO aviso (idSequencia, tipo, descricao, usuario_id)
VALUES ('0002/2019', 'Risco construtivo', 'Estrutura de prédio com rachaduras', 2);