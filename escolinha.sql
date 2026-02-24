-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 24-Fev-2026 às 02:09
-- Versão do servidor: 10.4.27-MariaDB
-- versão do PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `escolinha`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `aluno`
--

CREATE TABLE `aluno` (
  `idAluno` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Extraindo dados da tabela `aluno`
--

INSERT INTO `aluno` (`idAluno`, `nome`) VALUES
(1, 'Davy Joggers'),
(2, 'Davy Jogger'),
(3, 'Davy Jogge');

-- --------------------------------------------------------

--
-- Estrutura da tabela `alunokypc`
--

CREATE TABLE `alunokypc` (
  `idRelacao` int(11) NOT NULL,
  `idAluno` int(11) DEFAULT NULL,
  `idCurso` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Extraindo dados da tabela `alunokypc`
--

INSERT INTO `alunokypc` (`idRelacao`, `idAluno`, `idCurso`) VALUES
(1, 3, 1),
(2, 2, 1),
(3, 1, 2),
(4, 1, 3);

-- --------------------------------------------------------

--
-- Estrutura da tabela `kypc`
--

CREATE TABLE `kypc` (
  `idCurso` int(11) NOT NULL,
  `materia` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Extraindo dados da tabela `kypc`
--

INSERT INTO `kypc` (`idCurso`, `materia`) VALUES
(1, 'ADM'),
(2, 'TI'),
(3, 'LETRAS');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `aluno`
--
ALTER TABLE `aluno`
  ADD PRIMARY KEY (`idAluno`);

--
-- Índices para tabela `alunokypc`
--
ALTER TABLE `alunokypc`
  ADD PRIMARY KEY (`idRelacao`),
  ADD KEY `fk_aluno` (`idAluno`),
  ADD KEY `fk_Curso` (`idCurso`);

--
-- Índices para tabela `kypc`
--
ALTER TABLE `kypc`
  ADD PRIMARY KEY (`idCurso`);

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `alunokypc`
--
ALTER TABLE `alunokypc`
  ADD CONSTRAINT `fk_Curso` FOREIGN KEY (`idCurso`) REFERENCES `kypc` (`idCurso`),
  ADD CONSTRAINT `fk_aluno` FOREIGN KEY (`idAluno`) REFERENCES `aluno` (`idAluno`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
