CREATE TABLE `Medico` (
  `ID` int PRIMARY KEY,
  `Nome` varchar(255),
  `DataNascimento` date,
  `Endereco` varchar(255),
  `Telefone` varchar(255),
  `Email` varchar(255),
  `Tipo` varchar(255)
);

CREATE TABLE `Especialidade` (
  `ID` int PRIMARY KEY,
  `NomeEspecialidade` varchar(255)
);

CREATE TABLE `MedicoEspecialidade` (
  `ID` int PRIMARY KEY,
  `ID_Medico` int,
  `ID_Especialidade` int
);

CREATE TABLE `Paciente` (
  `ID` int PRIMARY KEY,
  `Nome` varchar(255),
  `DataNascimento` date,
  `Endereco` varchar(255),
  `Telefone` varchar(255),
  `Email` varchar(255),
  `CPF` varchar(255),
  `RG` varchar(255)
);

CREATE TABLE `Convenio` (
  `ID` int PRIMARY KEY,
  `Nome` varchar(255),
  `CNPJ` varchar(255),
  `TempoCarencia` varchar(255)
);

CREATE TABLE `Consulta` (
  `ID` int PRIMARY KEY,
  `DataHoraRealizacao` datetime,
  `ID_Medico` int,
  `ID_Paciente` int,
  `ValorConsulta` decimal,
  `ID_Convenio` int,
  `NumeroCarteira` varchar(255),
  `EspecialidadeSolicitada` varchar(255)
);

CREATE TABLE `Receita` (
  `ID` int PRIMARY KEY,
  `ID_Consulta` int,
  `MedicamentosPrescritos` text,
  `QuantidadeMedicamentos` int,
  `InstrucoesUso` text
);

CREATE TABLE `Enfermeiro` (
  `ID` int PRIMARY KEY,
  `Nome` varchar(255),
  `CPF` varchar(255),
  `RegistroConselhoEnfermagem` varchar(255)
);

CREATE TABLE `Internacao` (
  `ID` int PRIMARY KEY,
  `DataEntrada` date,
  `DataPrevistaAlta` date,
  `DataEfetivaAlta` date,
  `Procedimentos` text,
  `ID_Quarto` int,
  `ID_Paciente` int,
  `ID_Medico` int
);

CREATE TABLE `Quarto` (
  `ID` int PRIMARY KEY,
  `Numeracao` varchar(255),
  `Tipo` varchar(255),
  `DescricaoTipo` text,
  `ValorDiario` decimal
);

CREATE TABLE `EnfermeiroInternacao` (
  `ID` int PRIMARY KEY,
  `ID_Enfermeiro` int,
  `ID_Internacao` int
);

ALTER TABLE `MedicoEspecialidade` ADD FOREIGN KEY (`ID_Medico`) REFERENCES `Medico` (`ID`);

ALTER TABLE `MedicoEspecialidade` ADD FOREIGN KEY (`ID_Especialidade`) REFERENCES `Especialidade` (`ID`);

ALTER TABLE `Consulta` ADD FOREIGN KEY (`ID_Medico`) REFERENCES `Medico` (`ID`);

ALTER TABLE `Consulta` ADD FOREIGN KEY (`ID_Paciente`) REFERENCES `Paciente` (`ID`);

ALTER TABLE `Consulta` ADD FOREIGN KEY (`ID_Convenio`) REFERENCES `Convenio` (`ID`);

ALTER TABLE `Receita` ADD FOREIGN KEY (`ID_Consulta`) REFERENCES `Consulta` (`ID`);

ALTER TABLE `Internacao` ADD FOREIGN KEY (`ID_Quarto`) REFERENCES `Quarto` (`ID`);

ALTER TABLE `Internacao` ADD FOREIGN KEY (`ID_Paciente`) REFERENCES `Paciente` (`ID`);

ALTER TABLE `Internacao` ADD FOREIGN KEY (`ID_Medico`) REFERENCES `Medico` (`ID`);

ALTER TABLE `EnfermeiroInternacao` ADD FOREIGN KEY (`ID_Enfermeiro`) REFERENCES `Enfermeiro` (`ID`);

ALTER TABLE `EnfermeiroInternacao` ADD FOREIGN KEY (`ID_Internacao`) REFERENCES `Internacao` (`ID`);
