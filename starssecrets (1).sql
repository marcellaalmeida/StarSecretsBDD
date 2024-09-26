-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 26-Set-2024 às 21:29
-- Versão do servidor: 8.0.29
-- versão do PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `starssecrets`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `comentario`
--

CREATE TABLE `comentario` (
  `id` int NOT NULL,
  `id_noticia` int DEFAULT NULL,
  `id_usuario` int DEFAULT NULL,
  `conteudo` text NOT NULL,
  `data_comentario` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `noticia`
--

CREATE TABLE `noticia` (
  `id` int NOT NULL,
  `categoria` varchar(50) DEFAULT NULL,
  `conteudo` text NOT NULL,
  `data` date NOT NULL,
  `titulo` varchar(100) NOT NULL,
  `foto` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `noticia`
--

INSERT INTO `noticia` (`id`, `categoria`, `conteudo`, `data`, `titulo`, `foto`) VALUES
(1, NULL, 'eeeee', '2024-09-05', 'eee', 'img/brasil-sp-guilherme-boulos-mtst-reintegracao-de-posse-20170117-01.webp'),
(2, NULL, 'eeeee', '2024-09-05', 'eee', 'img/brasil-sp-guilherme-boulos-mtst-reintegracao-de-posse-20170117-01.webp');

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

CREATE TABLE `usuario` (
  `id` int NOT NULL,
  `nome` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `curso` varchar(50) DEFAULT NULL,
  `ano_serie` varchar(10) DEFAULT NULL,
  `senha` varchar(255) NOT NULL,
  `estudante` tinyint(1) DEFAULT '1',
  `foto_perfil` blob
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`id`, `nome`, `email`, `curso`, `ano_serie`, `senha`, `estudante`, `foto_perfil`) VALUES
(1, 'uu', 'n@gmail.com', 'informatica', NULL, '6277e2a7446059985dc9bcf0a4ac1a8f', 1, 0x696d672f696d6167655f706c616365686f6c6465722d312d6173706563742d726174696f2d3531322d3332302d312d3631342e77656270);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `comentario`
--
ALTER TABLE `comentario`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_noticia` (`id_noticia`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Índices para tabela `noticia`
--
ALTER TABLE `noticia`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `comentario`
--
ALTER TABLE `comentario`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `noticia`
--
ALTER TABLE `noticia`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `comentario`
--
ALTER TABLE `comentario`
  ADD CONSTRAINT `comentario_ibfk_1` FOREIGN KEY (`id_noticia`) REFERENCES `noticia` (`id`),
  ADD CONSTRAINT `comentario_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
