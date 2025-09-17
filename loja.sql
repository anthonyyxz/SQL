-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 17/09/2025 às 15:46
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `loja`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `clientes`
--

CREATE TABLE `clientes` (
  `ID_Cliente` int(11) NOT NULL,
  `Nome` varchar(100) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Senha` varchar(100) NOT NULL,
  `CPF` char(11) NOT NULL,
  `Endereco` varchar(150) DEFAULT NULL,
  `Cidade` varchar(100) DEFAULT NULL,
  `Estado` varchar(50) DEFAULT NULL,
  `CEP` char(8) DEFAULT NULL,
  `DataCadastro` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `clientes`
--

INSERT INTO `clientes` (`ID_Cliente`, `Nome`, `Email`, `Senha`, `CPF`, `Endereco`, `Cidade`, `Estado`, `CEP`, `DataCadastro`) VALUES
(1, 'Ana Souza', 'ana.souza@email.com', 'senha123', '12345678901', 'Rua das Flores, 100', 'São Paulo', 'SP', '01001-00', '2025-09-01 00:00:00'),
(2, 'Carlos Pereira', 'carlos.pereira@email.com', 'abc12345', '23456789012', 'Av. Brasil, 200', 'Rio de Janeiro', 'RJ', '20040-00', '2025-09-02 00:00:00'),
(3, 'Mariana Lima', 'mariana.lima@email.com', 'mari2025', '34567890123', 'Rua das Palmeiras, 300', 'Belo Horizonte', 'MG', '30110-00', '2025-09-03 00:00:00'),
(4, 'João Oliveira', 'joao.oliveira@email.com', 'joao@123', '45678901234', 'Av. Central, 400', 'Curitiba', 'PR', '80010-00', '2025-09-04 00:00:00'),
(5, 'Fernanda Costa', 'fernanda.costa@email.com', 'fernanda456', '56789012345', 'Rua A, 50', 'Salvador', 'BA', '40020-00', '2025-09-05 00:00:00'),
(6, 'Rafael Almeida', 'rafael.almeida@email.com', 'rafael2025', '67890123456', 'Rua B, 60', 'Porto Alegre', 'RS', '90030-00', '2025-09-06 00:00:00'),
(7, 'Beatriz Santos', 'beatriz.santos@email.com', 'bia12345', '78901234567', 'Rua C, 70', 'Recife', 'PE', '50040-00', '2025-09-07 00:00:00'),
(8, 'Lucas Martins', 'lucas.martins@email.com', 'lucas2025', '89012345678', 'Rua D, 80', 'Fortaleza', 'CE', '60050-00', '2025-09-08 00:00:00'),
(9, 'Juliana Ferreira', 'juliana.ferreira@email.com', 'juli@2025', '90123456789', 'Rua E, 90', 'Manaus', 'AM', '69060-00', '2025-09-09 00:00:00'),
(10, 'Pedro Gomes', 'pedro.gomes@email.com', 'pedro321', '01234567890', 'Av. Norte, 500', 'Florianópolis', 'SC', '88070-00', '2025-09-10 00:00:00');

-- --------------------------------------------------------

--
-- Estrutura para tabela `itenspedido`
--

CREATE TABLE `itenspedido` (
  `ID_ItemPedido` int(11) NOT NULL,
  `ID_Pedido` int(11) NOT NULL,
  `ID_Produto` int(11) NOT NULL,
  `Quantidade` int(11) NOT NULL,
  `PrecoUnitario` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `itenspedido`
--

INSERT INTO `itenspedido` (`ID_ItemPedido`, `ID_Pedido`, `ID_Produto`, `Quantidade`, `PrecoUnitario`) VALUES
(83, 11, 11, 2, 49.9);

-- --------------------------------------------------------

--
-- Estrutura para tabela `pedidos`
--

CREATE TABLE `pedidos` (
  `ID_Pedido` int(11) NOT NULL,
  `ID_Cliente` int(11) NOT NULL,
  `DataPedido` datetime DEFAULT current_timestamp(),
  `Status` varchar(50) DEFAULT 'Pendente',
  `ValorTotal` double DEFAULT 0,
  `EnderecoEntrega` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `pedidos`
--

INSERT INTO `pedidos` (`ID_Pedido`, `ID_Cliente`, `DataPedido`, `Status`, `ValorTotal`, `EnderecoEntrega`) VALUES
(11, 1, '2025-09-01 00:00:00', 'Pendente', 250.75, 'Rua das Flores, 100 - São Paulo/SP'),
(12, 2, '2025-09-02 00:00:00', 'Pago', 120.5, 'Av. Brasil, 200 - Rio de Janeiro/RJ'),
(13, 3, '2025-09-03 00:00:00', 'Enviado', 89.9, 'Rua das Palmeiras, 300 - Belo Horizonte/MG'),
(14, 4, '2025-09-04 00:00:00', 'Entregue', 450, 'Av. Central, 400 - Curitiba/PR'),
(15, 5, '2025-09-05 00:00:00', 'Cancelado', 300.2, 'Rua A, 50 - Salvador/BA'),
(16, 6, '2025-09-06 00:00:00', 'Pendente', 75, 'Rua B, 60 - Porto Alegre/RS'),
(17, 7, '2025-09-07 00:00:00', 'Pago', 180.45, 'Rua C, 70 - Recife/PE'),
(18, 8, '2025-09-08 00:00:00', 'Enviado', 999.99, 'Rua D, 80 - Fortaleza/CE'),
(19, 9, '2025-09-09 00:00:00', 'Entregue', 65.3, 'Rua E, 90 - Manaus/AM'),
(20, 10, '2025-09-10 00:00:00', 'Pago', 320, 'Av. Norte, 500 - Florianópolis/SC');

-- --------------------------------------------------------

--
-- Estrutura para tabela `produtos`
--

CREATE TABLE `produtos` (
  `ID_Produto` int(11) NOT NULL,
  `Nome` varchar(100) NOT NULL,
  `Descricao` text DEFAULT NULL,
  `Preco` double NOT NULL,
  `SKU` varchar(50) NOT NULL,
  `Estoque` int(11) DEFAULT 0,
  `DataCriacao` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `produtos`
--

INSERT INTO `produtos` (`ID_Produto`, `Nome`, `Descricao`, `Preco`, `SKU`, `Estoque`, `DataCriacao`) VALUES
(11, 'Camiseta Básica', 'Camiseta de algodão 100% na cor preta', 49.9, 'CAMI-001', 150, '2025-09-01 00:00:00'),
(12, 'Calça Jeans', 'Calça jeans azul slim fit', 129.9, 'CALC-002', 80, '2025-09-02 00:00:00'),
(13, 'Tênis Esportivo', 'Tênis leve para corrida e caminhada', 299.9, 'TENS-003', 60, '2025-09-03 00:00:00'),
(14, 'Mochila Escolar', 'Mochila com compartimento para notebook', 159, 'MOCH-004', 40, '2025-09-04 00:00:00'),
(15, 'Relógio Digital', 'Relógio resistente à água com cronômetro', 199.9, 'RELO-005', 100, '2025-09-05 00:00:00'),
(16, 'Fone de Ouvido Bluetooth', 'Fone sem fio com microfone embutido', 149.5, 'FONE-006', 120, '2025-09-06 00:00:00'),
(17, 'Teclado Mecânico', 'Teclado gamer com iluminação RGB', 350, 'TECL-007', 35, '2025-09-07 00:00:00'),
(18, 'Mouse Sem Fio', 'Mouse ergonômico com conexão USB', 89.9, 'MOUS-008', 75, '2025-09-08 00:00:00'),
(19, 'Smartwatch', 'Relógio inteligente com monitor de frequência cardíaca', 499, 'SMAR-009', 50, '2025-09-09 00:00:00'),
(20, 'Cadeira Gamer', 'Cadeira ergonômica com regulagem de altura', 899, 'CADE-010', 20, '2025-09-10 00:00:00');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`ID_Cliente`),
  ADD UNIQUE KEY `Email` (`Email`),
  ADD UNIQUE KEY `CPF` (`CPF`);

--
-- Índices de tabela `itenspedido`
--
ALTER TABLE `itenspedido`
  ADD PRIMARY KEY (`ID_ItemPedido`),
  ADD KEY `ID_Pedido` (`ID_Pedido`),
  ADD KEY `ID_Produto` (`ID_Produto`);

--
-- Índices de tabela `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`ID_Pedido`),
  ADD KEY `ID_Cliente` (`ID_Cliente`);

--
-- Índices de tabela `produtos`
--
ALTER TABLE `produtos`
  ADD PRIMARY KEY (`ID_Produto`),
  ADD UNIQUE KEY `SKU` (`SKU`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `clientes`
--
ALTER TABLE `clientes`
  MODIFY `ID_Cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT de tabela `itenspedido`
--
ALTER TABLE `itenspedido`
  MODIFY `ID_ItemPedido` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=94;

--
-- AUTO_INCREMENT de tabela `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `ID_Pedido` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT de tabela `produtos`
--
ALTER TABLE `produtos`
  MODIFY `ID_Produto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `itenspedido`
--
ALTER TABLE `itenspedido`
  ADD CONSTRAINT `itenspedido_ibfk_1` FOREIGN KEY (`ID_Pedido`) REFERENCES `pedidos` (`ID_Pedido`),
  ADD CONSTRAINT `itenspedido_ibfk_2` FOREIGN KEY (`ID_Produto`) REFERENCES `produtos` (`ID_Produto`);

--
-- Restrições para tabelas `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`ID_Cliente`) REFERENCES `clientes` (`ID_Cliente`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
