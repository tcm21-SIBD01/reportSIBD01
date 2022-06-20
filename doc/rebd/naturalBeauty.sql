CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;



CREATE TABLE IF NOT EXISTS `mydb`.`Funcionario` (
`n.id` INT NOT NULL AUTO_INCREMENT,
`nome` VARCHAR(45) NOT NULL,
`morada` VARCHAR(45) NOT NULL,
`telefone` INT NOT NULL,
`nic` INT NOT NULL,
PRIMARY KEY (`n.id`))
ENGINE = InnoDB;



CREATE TABLE IF NOT EXISTS `mydb`.`Formacao` (
`tipoFormacao` VARCHAR(45) NOT NULL,
`nome` VARCHAR(45) NOT NULL,
PRIMARY KEY (`tipoFormacao`))
ENGINE = InnoDB;



CREATE TABLE IF NOT EXISTS `mydb`.`Turno` (
`parteDia` VARCHAR(45) NOT NULL,
`id` INT NOT NULL AUTO_INCREMENT,
PRIMARY KEY (`id`),
INDEX `fk_Turno_Funcionario_idx` (`id` ASC) VISIBLE,
CONSTRAINT `fk_Turno_Funcionario`
FOREIGN KEY (`id`)
REFERENCES `mydb`.`Funcionario` (`n.id`)
ON DELETE NO ACTION
ON UPDATE NO ACTION)
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `mydb`.`horario` (
`diaSemana` VARCHAR(45) NOT NULL,
`horaFim` INT NOT NULL,
`horaInicio` INT NOT NULL,
`id` INT NOT NULL AUTO_INCREMENT,
PRIMARY KEY (`id`))
ENGINE = InnoDB;



CREATE TABLE IF NOT EXISTS `mydb`.`seccao` (
`id` INT NOT NULL AUTO_INCREMENT,
`nome` VARCHAR(45) NOT NULL,
PRIMARY KEY (`id`))
ENGINE = InnoDB;



CREATE TABLE IF NOT EXISTS `mydb`.`Entrega` (
`nEntrega` INT NOT NULL AUTO_INCREMENT,
`validade` INT NOT NULL,
`reserva` INT NOT NULL,
`quantidade` INT NOT NULL,
PRIMARY KEY (`nEntrega`))
ENGINE = InnoDB;



-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Fornecedor` (
`nid` INT NOT NULL AUTO_INCREMENT,
`nome` VARCHAR(45) NOT NULL,
`telefone` INT NOT NULL,
`Entrega_tipoProduto` INT NOT NULL,
PRIMARY KEY (`nid`, `Entrega_tipoProduto`),
INDEX `fk_Fornecedor_Entrega1_idx` (`Entrega_tipoProduto` ASC) VISIBLE,
CONSTRAINT `fk_Fornecedor_Entrega1`
FOREIGN KEY (`Entrega_tipoProduto`)
REFERENCES `mydb`.`Entrega` (`nEntrega`)
ON DELETE NO ACTION
ON UPDATE NO ACTION)
ENGINE = InnoDB;




CREATE TABLE IF NOT EXISTS `mydb`.`Produto` (
`codigo` INT NOT NULL AUTO_INCREMENT,
`nome` VARCHAR(45) NOT NULL,
`tipoProduto` VARCHAR(45) NOT NULL,
`validade` INT NOT NULL,
PRIMARY KEY (`codigo`))
ENGINE = InnoDB;




CREATE TABLE IF NOT EXISTS `mydb`.`envia` (
`Entrega_tipoProduto` INT NOT NULL,
`Produto_codigo` INT NOT NULL,
PRIMARY KEY (`Entrega_tipoProduto`, `Produto_codigo`),
INDEX `fk_Entrega_has_Produto_Produto1_idx` (`Produto_codigo` ASC) VISIBLE,
INDEX `fk_Entrega_has_Produto_Entrega1_idx` (`Entrega_tipoProduto` ASC) VISIBLE,
CONSTRAINT `fk_Entrega_has_Produto_Entrega1`
FOREIGN KEY (`Entrega_tipoProduto`)
REFERENCES `mydb`.`Entrega` (`nEntrega`)
ON DELETE NO ACTION
ON UPDATE NO ACTION,
CONSTRAINT `fk_Entrega_has_Produto_Produto1`
FOREIGN KEY (`Produto_codigo`)
REFERENCES `mydb`.`Produto` (`codigo`)
ON DELETE NO ACTION
ON UPDATE NO ACTION)
ENGINE = InnoDB;



CREATE TABLE IF NOT EXISTS `mydb`.`precisaDe` (
`Funcionario_n.id` INT NOT NULL,
`Formacao_tipoFormacao` VARCHAR(45) NOT NULL,
PRIMARY KEY (`Funcionario_n.id`, `Formacao_tipoFormacao`),
INDEX `fk_Funcionario_has_Formacao_Formacao1_idx` (`Formacao_tipoFormacao` ASC) VISIBLE,
INDEX `fk_Funcionario_has_Formacao_Funcionario1_idx` (`Funcionario_n.id` ASC) VISIBLE,
CONSTRAINT `fk_Funcionario_has_Formacao_Funcionario1`
FOREIGN KEY (`Funcionario_n.id`)
REFERENCES `mydb`.`Funcionario` (`n.id`)
ON DELETE NO ACTION
ON UPDATE NO ACTION,
CONSTRAINT `fk_Funcionario_has_Formacao_Formacao1`
FOREIGN KEY (`Formacao_tipoFormacao`)
REFERENCES `mydb`.`Formacao` (`tipoFormacao`)
ON DELETE NO ACTION
ON UPDATE NO ACTION)
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `mydb`.`definidoPor` (
`Turno_id` INT NOT NULL,
`horario_id` INT NOT NULL,
PRIMARY KEY (`Turno_id`, `horario_id`),
INDEX `fk_Turno_has_horario_horario1_idx` (`horario_id` ASC) VISIBLE,
INDEX `fk_Turno_has_horario_Turno1_idx` (`Turno_id` ASC) VISIBLE,
CONSTRAINT `fk_Turno_has_horario_Turno1`
FOREIGN KEY (`Turno_id`)
REFERENCES `mydb`.`Turno` (`id`)
ON DELETE NO ACTION
ON UPDATE NO ACTION,
CONSTRAINT `fk_Turno_has_horario_horario1`
FOREIGN KEY (`horario_id`)
REFERENCES `mydb`.`horario` (`id`)
ON DELETE NO ACTION
ON UPDATE NO ACTION)
ENGINE = InnoDB;



CREATE TABLE IF NOT EXISTS `mydb`.`tem` (
`horario_id` INT NOT NULL,
`Fornecedor_nid` INT NOT NULL,
PRIMARY KEY (`horario_id`, `Fornecedor_nid`),
INDEX `fk_horario_has_Fornecedor_Fornecedor1_idx` (`Fornecedor_nid` ASC) VISIBLE,
INDEX `fk_horario_has_Fornecedor_horario1_idx` (`horario_id` ASC) VISIBLE,
CONSTRAINT `fk_horario_has_Fornecedor_horario1`
FOREIGN KEY (`horario_id`)
REFERENCES `mydb`.`horario` (`id`)
ON DELETE NO ACTION
ON UPDATE NO ACTION,
CONSTRAINT `fk_horario_has_Fornecedor_Fornecedor1`
FOREIGN KEY (`Fornecedor_nid`)
REFERENCES `mydb`.`Fornecedor` (`nid`)
ON DELETE NO ACTION
ON UPDATE NO ACTION)
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `mydb`.`dependeDe` (
`Turno_id` INT NOT NULL,
`seccao_id` INT NOT NULL,
PRIMARY KEY (`Turno_id`, `seccao_id`),
INDEX `fk_Turno_has_seccao_seccao1_idx` (`seccao_id` ASC) VISIBLE,
INDEX `fk_Turno_has_seccao_Turno1_idx` (`Turno_id` ASC) VISIBLE,
CONSTRAINT `fk_Turno_has_seccao_Turno1`
FOREIGN KEY (`Turno_id`)
REFERENCES `mydb`.`Turno` (`id`)
ON DELETE NO ACTION
ON UPDATE NO ACTION,
CONSTRAINT `fk_Turno_has_seccao_seccao1`
FOREIGN KEY (`seccao_id`)
REFERENCES `mydb`.`seccao` (`id`)
ON DELETE NO ACTION
ON UPDATE NO ACTION)
ENGINE = InnoDB;


INSERT INTO `funcionario` (nome, telefonepessoal, telefonecasa, morada, nic, nid) VALUES 
('Ana Sousa',960000001,200000001,'100000001','1' ),
('Tania Fonseca',960000002,200000002, 'morada2', '100000002','2'),
('Teresa Moreira',960000003,200000003, 'morada3', '100000003', '3'),
('Rita Vaz',960000004,200000004, 'morada4', '100000004', '4'),
('Joao Silva',960000005,200000005, 'morada5', '100000005', '5'),
('Fabio Ferreira',960000006,200000006, '100000006', '6'),
('Joana Lamelas',960000007,200000007, '100000007', '7'),
('Claudia Santos',960000008,200000008, '100000008', '8'),
('Juliana Bastos',960000009,200000009, '100000009', '9'),
('Isabel Costa',960000010,200000010,  '100000010', '10'),
('Liliana Campos',960000011,200000011,  '100000011', '11'),
('Elisabete Fernandes',960000012,200000012, '12'),
('Filipa Cunha',960000013,200000013,'13'),
('Luisa Sampaio',960000014,200000014,'14'),
('Joana Barbosa',960000015,200000015,'15'),
('Pedro Goncalves',960000016,200000016, '16');


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


