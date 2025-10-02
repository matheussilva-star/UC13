-- Criação do Banco de Dados
CREATE DATABASE IF NOT EXISTS ecommerce_pc
    DEFAULT CHARACTER SET = 'utf8mb4';

-- Sinalizando a utilização do banco
USE ecommerce_pc;

CREATE TABLE Clientes (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    senha VARCHAR(100) NOT NULL,
    endereco TEXT,
    criado_em DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Categoria (
    id_categoria INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL UNIQUE,
    descricao TEXT
);

CREATE TABLE Produto (
    id_produto INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT,
    preco DECIMAL(10, 2) NOT NULL,
    estoque INT DEFAULT 0,
    id_categoria INT,
    criado_em DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_categoria) REFERENCES Categoria(id_categoria)  
);

CREATE TABLE Pedido (
    id_pedido INT PRIMARY KEY AUTO_INCREMENT,
    id_cliente INT,    
    data DATETIME DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR(50) DEFAULT 'Em andamento',
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente)
);

CREATE TABLE Item_Pedido (
    id__item_pedido INT PRIMARY KEY AUTO_INCREMENT,
    id_pedido INT,    
    id_produto INT,    
    quantidade INT DEFAULT 1,
    preco_unitario DECIMAL(10, 2),
    FOREIGN KEY (id_pedido) REFERENCES Pedido(id_pedido),
    FOREIGN KEY (id_produto) REFERENCES Produto(id_produto)
);

INSERT INTO Categoria (nome, descricao) VALUES
('Placas de Vídeo', 'GPUs para jogos e renderização'),
('Armazenamento', 'Dispositivos como SSDs e HDs'),
('Placas-mãe', 'Motherboards compatíveis com CPUs e periféricos');

INSERT INTO Clientes (nome, email, senha, endereco) VALUES
('João Silva', 'joao@email.com', '123456', 'Rua A, 123'),
('Maria Oliveira', 'maria@email.com', 'abcdef', 'Av.Central, 456'),
('Carlos Souza', 'carlos@email.com', 'senha123', 'Rua das Flores, 78'),
('Ana Costa', 'ana@email.com', 'senha456', 'Rua da Paz, 10'),
('Pedro Lima', 'pedro@email.com', 'minhasenha', 'Rua Verde, 98');

INSERT INTO Produto (nome, descricao, preco, estoque, id_categoria) VALUES
('Intel Core i5-10400', '6 núcleos, 12 threads, 2.9GHz', 899.90, 10, 1),
('AMD Ryzen 5 5600X', '6 núcleos, 12 threads, até 4GHz', 1099.99, 7, 1),
('Memória DDR4 8GB 2666MHz', 'Kingston Fury Beast', 189.90, 20, 2),
('Memória DDR4 16GB 3200MHz', 'Corsair Vengeance LPX', 349.50, 15, 2),
('NVIDIA GeForce GTX 1660', '6GB GDD25, 192-bit', 1450.00, 5, 12),
('NVIDIA RTX 3060', '12GB GDD26, Ray Tracing', 2100.00, 3, 12),
('SSD Kingston 240GB', 'SATA 2.5', 149.90, 25, 13),
('HD Seagate 1TB', '7200RPM, 3,5', 230.00, 12, 13),
('Placa-Mãe ASUS Prime B450M', 'Socket AM4, DDR4', 499.99, 8, 14),
('Placa-Mãe Gigabyte H510M', 'Socket LGA1200, DDR4', 429.99, 9, 14);

SELECT * FROM `Clientes`;

