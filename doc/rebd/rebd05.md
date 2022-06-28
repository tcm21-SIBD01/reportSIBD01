# C3 : SQL

## DDL

CREATE SCHEMA IF NOT EXISTS `natural beauty`;

CREATE TABLE IF NOT EXISTS `natural beauty`.`horario` (
  `diaSemana` VARCHAR(45) NOT NULL,
  `horaFim` INT NOT NULL,
  `horaInicio` INT NOT NULL,
  `id` INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`));
  
CREATE TABLE IF NOT EXISTS `natural beauty`.`funcionario` (
  `n.id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `morada` VARCHAR(45) NOT NULL,
  `telefone` INT NOT NULL,
  `nic` INT NOT NULL,
  PRIMARY KEY (`n.id`));
  
  CREATE TABLE IF NOT EXISTS `natural beauty`.`turno` (
  `parteDia` VARCHAR(45) NOT NULL,
  `id` INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  INDEX `fk_Turno_Funcionario_idx` (`id` ASC),
  CONSTRAINT `fk_Turno_Funcionario`
    FOREIGN KEY (`id`)
    REFERENCES `natural beauty`.`funcionario` (`n.id`));
    
    CREATE TABLE IF NOT EXISTS `natural beauty`.`definidopor` (
  `Turno_id` INT NOT NULL,
  `horario_id` INT NOT NULL,
  PRIMARY KEY (`Turno_id`, `horario_id`),
  INDEX `fk_Turno_has_horario_horario1_idx` (`horario_id` ASC),
  INDEX `fk_Turno_has_horario_Turno1_idx` (`Turno_id` ASC),
  CONSTRAINT `fk_Turno_has_horario_horario1`
    FOREIGN KEY (`horario_id`)
    REFERENCES `natural beauty`.`horario` (`id`),
  CONSTRAINT `fk_Turno_has_horario_Turno1`
    FOREIGN KEY (`Turno_id`)
    REFERENCES `natural beauty`.`turno` (`id`));
    
    CREATE TABLE IF NOT EXISTS `natural beauty`.`seccao` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`));
  
  CREATE TABLE IF NOT EXISTS `natural beauty`.`dependede` (
  `Turno_id` INT NOT NULL,
  `seccao_id` INT NOT NULL,
  PRIMARY KEY (`Turno_id`, `seccao_id`),
  INDEX `fk_Turno_has_seccao_seccao1_idx` (`seccao_id` ASC),
  INDEX `fk_Turno_has_seccao_Turno1_idx` (`Turno_id` ASC),
  CONSTRAINT `fk_Turno_has_seccao_seccao1`
    FOREIGN KEY (`seccao_id`)
    REFERENCES `natural beauty`.`seccao` (`id`),
  CONSTRAINT `fk_Turno_has_seccao_Turno1`
    FOREIGN KEY (`Turno_id`)
    REFERENCES `natural beauty`.`turno` (`id`));

CREATE TABLE IF NOT EXISTS `natural beauty`.`entrega` (
  `nEntrega` INT NOT NULL AUTO_INCREMENT,
  `validade` DATE NOT NULL,
  `reserva` INT NOT NULL,
  `quantidade` INT NOT NULL,
  PRIMARY KEY (`nEntrega`));
  
  CREATE TABLE IF NOT EXISTS `natural beauty`.`produto` (
  `codigo` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `tipoProduto` VARCHAR(45) NOT NULL,
  `validade` DATE NOT NULL,
  PRIMARY KEY (`codigo`));

CREATE TABLE IF NOT EXISTS `natural beauty`.`envia` (
  `Entrega_tipoProduto` INT NOT NULL,
  `Produto_codigo` INT NOT NULL,
  PRIMARY KEY (`Entrega_tipoProduto`, `Produto_codigo`),
  INDEX `fk_Entrega_has_Produto_Produto1_idx` (`Produto_codigo` ASC),
  INDEX `fk_Entrega_has_Produto_Entrega1_idx` (`Entrega_tipoProduto` ASC),
  CONSTRAINT `fk_Entrega_has_Produto_Entrega1`
    FOREIGN KEY (`Entrega_tipoProduto`)
    REFERENCES `natural beauty`.`entrega` (`nEntrega`),
  CONSTRAINT `fk_Entrega_has_Produto_Produto1`
    FOREIGN KEY (`Produto_codigo`)
    REFERENCES `natural beauty`.`produto` (`codigo`));

CREATE TABLE IF NOT EXISTS `natural beauty`.`formacao` (
  `tipoFormacao` VARCHAR(45) NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`tipoFormacao`));
  
  CREATE TABLE IF NOT EXISTS `natural beauty`.`fornecedor` (
  `nid` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `telefone` INT NOT NULL,
  PRIMARY KEY (`nid`));

CREATE TABLE IF NOT EXISTS `natural beauty`.`precisade` (
  `Funcionario_n.id` INT NOT NULL,
  `Formacao_tipoFormacao` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Funcionario_n.id`, `Formacao_tipoFormacao`),
  INDEX `fk_Funcionario_has_Formacao_Formacao1_idx` (`Formacao_tipoFormacao` ASC),
  INDEX `fk_Funcionario_has_Formacao_Funcionario1_idx` (`Funcionario_n.id` ASC),
  CONSTRAINT `fk_Funcionario_has_Formacao_Formacao1`
    FOREIGN KEY (`Formacao_tipoFormacao`)
    REFERENCES `natural beauty`.`formacao` (`tipoFormacao`),
  CONSTRAINT `fk_Funcionario_has_Formacao_Funcionario1`
    FOREIGN KEY (`Funcionario_n.id`)
    REFERENCES `natural beauty`.`funcionario` (`n.id`));

CREATE TABLE IF NOT EXISTS `natural beauty`.`tem` (
  `horario_id` INT NOT NULL,
  `Fornecedor_nid` INT NOT NULL,
  PRIMARY KEY (`horario_id`, `Fornecedor_nid`),
  INDEX `fk_horario_has_Fornecedor_Fornecedor1_idx` (`Fornecedor_nid` ASC),
  INDEX `fk_horario_has_Fornecedor_horario1_idx` (`horario_id` ASC),
  CONSTRAINT `fk_horario_has_Fornecedor_Fornecedor1`
    FOREIGN KEY (`Fornecedor_nid`)
    REFERENCES `natural beauty`.`fornecedor` (`nid`),
  CONSTRAINT `fk_horario_has_Fornecedor_horario1`
    FOREIGN KEY (`horario_id`)
    REFERENCES `natural beauty`.`horario` (`id`));



## DML


INSERT INTO `funcionario` (nome, telefonepessoal, telefonecasa, morada, nic, nid) VALUES 
('Ana Sousa',960000001,200000001,'100000001','1' ),
('Tania Fonseca',960000002,200000002, 'morada2', '100000002','2'),
('Teresa Moreira',960000003,200000003, 'morada3', '100000003', '3'),
('Rita Vaz',960000004,200000004, 'morada4', '100000004', '4'),
('Joao Silva',960000005,200000005, 'morada5', '100000005', '5'),
('Fabio Ferreira',960000006,200000006, '650', '100000006', '6'),
('Joana Lamelas',960000007,200000007, '320', '100000007', '7'),
('Claudia Santos',960000008,200000008, '100', '100000008', '8'),
('Juliana Bastos',960000009,200000009, '635', '100000009', '9'),
('Isabel Costa',960000010,200000010, '635', '100000010', '10'),
('Liliana Campos',960000011,200000011, '320', '100000011', '11'),
('Elisabete Fernandes',960000012,200000012, '700', '12'),
('Filipa Cunha',960000013,200000013, '100', '13'),
('Luisa Sampaio',960000014,200000014, '700', '14'),
('Joana Barbosa',960000015,200000015, '700', '15'),
('Pedro Goncalves',960000016,200000016, '700', '16');


INSERT INTO `seccao` (nome, id) VALUES 
('maquilhagem', '1'),
('comesticos', '2'),
('perfumaria', '3'),
('caixa', '4'),
('reposiçao', '5'),
('gerencia', '6'),
('limpeza', '7'),
('fornecedores', '8');


INSERT INTO `fornecedor` (nome, id, telefonepessoal, telefoneempresa) VALUES
('nome1', ' 1', '960000017', '200000017'),
('nome3', ' 3', '2960000018', '200000018'),
('nome5', '5', '960000019', '200000019');


INSERT INTO `horario` (id,horafim,horainicio, diasemana ) VALUES
('1', '10:00', '21:00', 'segundafeira'),
('2', '10:00', '21:00', 'terçafeira'),
('3', '10:00', '21:00', 'quartafeira'),
('4', '10:00', '21:00', 'quintafeira'),
('5' , '10:00', '22:00', 'sextafeira'),
('6', '10:00', '21:00', 'sabado'),
('7', '10:00', '18:00', 'domingo');

INSERT INTO `entrega` (nentrega, validade, reserva , quantidade) VALUES
('1', '21/03/2023', '45854833', '57'),
('2', '20/09/2023', '4585454', '34'),
('3', '10/02/2023', '21:00', '67');

INSERT INTO `produto` (nome, tipoproduto, codigo , validade) VALUES
('nome1 ', 'maquilhagem', '25894', '10/02/2024'),
('nome2', 'comestico', '5849', '10/02/2024'),
('nome3 ', 'perfumes', '94924', '15/06/2024'),
('nome4 ', 'maquilhagem', '67324', '15/06/2024'),
('nome5 ', 'perfumes', '53224', '20/01/2025'),
('nome6 ', 'comestico', '9524', '28/06/2024'),
('nome7 ', 'perfumes', '94924', '19/04/2024'),
('nome8 ', 'maquilhagem', '22524', '03/11/2024'),
('nome9 ', 'comesticos', '58424', '15/06/2024'),
('nome10 ', 'perfumes', '94924', '15/11/2024'),
('nome11 ', 'perfumes', '94924', '12/10/2024'),
('nome12 ', 'comesticos', '64334', '01/02/2024'),
('nome13 ', 'perfumes', '32114', '02/03/2024'),
('nome14 ', 'maquilhagem', '785334', '08/08/2024'),
('nome15 ', 'perfumes', '235753', '1/09/2025'),
('nome16 ', 'perfumes', '5632', '12/09/2024'),
('nome17 ', 'comesticos', '49493', '15/06/2024'),
('nome18 ', 'comesticos', '34532', '02/06/2024'),
('nome19 ', 'perfumes', '753432', '11/12/2024');

INSERT INTO `turno` (id, partedia, hora) VALUES
('1', 'manha', '09:30'),
('2', 'tarde', '13:00'),
('3', 'tarde', '17:00'),
('4', 'noite', '19:00'),
('5', 'noite', '21:00');

INSERT INTO `formaçao` (nome, tipoformaçao) VALUES
('nome1', 'maquilhagem'),
('nome2', 'cosmestica'),
('nome3', 'perfumaria');




---
[< Previous](rebd04.md) | [^ Main](https://github.com/exemploTrabalho/reportSIBD/) | Next >
:--- | :---: | ---: 
