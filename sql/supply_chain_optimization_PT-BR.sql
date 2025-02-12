-- Criando o banco de dados de Otimização da Cadeia de Suprimentos
CREATE DATABASE otimizacao_cadeia_suprimentos;
USE otimizacao_cadeia_suprimentos;

-- Tabela de Fornecedores
CREATE TABLE fornecedores (
    fornecedor_id INT AUTO_INCREMENT PRIMARY KEY,
    nome_fornecedor VARCHAR(100) NOT NULL,
    email_contato VARCHAR(100),
    telefone VARCHAR(20),
    localizacao VARCHAR(100),
    confiabilidade DECIMAL(3,2) CHECK (confiabilidade BETWEEN 0 AND 10)
);

-- Tabela de Armazéns
CREATE TABLE armazens (
    armazem_id INT AUTO_INCREMENT PRIMARY KEY,
    nome_armazem VARCHAR(100) NOT NULL,
    localizacao VARCHAR(100),
    capacidade INT NOT NULL
);

-- Tabela de Remessas
CREATE TABLE remessas (
    remessa_id INT AUTO_INCREMENT PRIMARY KEY,
    fornecedor_id INT,
    armazem_id INT,
    nome_produto VARCHAR(100) NOT NULL,
    quantidade INT NOT NULL,
    data_entrega DATE NOT NULL,
    status ENUM('Pendente', 'Em Trânsito', 'Entregue') DEFAULT 'Pendente',
    FOREIGN KEY (fornecedor_id) REFERENCES fornecedores(fornecedor_id),
    FOREIGN KEY (armazem_id) REFERENCES armazens(armazem_id)
);

-- Tabela de Estoque
CREATE TABLE estoque (
    estoque_id INT AUTO_INCREMENT PRIMARY KEY,
    armazem_id INT,
    nome_produto VARCHAR(100) NOT NULL,
    nivel_estoque INT NOT NULL,
    ultima_atualizacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (armazem_id) REFERENCES armazens(armazem_id)
);

-- Consulta para rastrear remessas pendentes
SELECT * FROM remessas WHERE status = 'Pendente';

-- Consulta para verificar os níveis de estoque por armazém
SELECT nome_armazem, nome_produto, nivel_estoque 
FROM estoque 
JOIN armazens ON estoque.armazem_id = armazens.armazem_id;
