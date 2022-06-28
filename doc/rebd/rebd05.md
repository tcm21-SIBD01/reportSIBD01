# C3 : SQL

## DDL


```sql

CREATE SCHEMA IF NOT EXISTS `NaturalBeauty`;

CREATE TABLE IF NOT EXISTS `NaturalBeauty`.`horario` (
`diaSemana` VARCHAR(45) NOT NULL,
`horaFim` INT NOT NULL,
`horaInicio` INT NOT NULL,
`id` INT NOT NULL AUTO_INCREMENT,
PRIMARY KEY (`id`));

CREATE TABLE IF NOT EXISTS `NaturalBeauty`.`funcionario` (
`n.id` INT NOT NULL AUTO_INCREMENT,
`nome` VARCHAR(45) NOT NULL,
`morada` VARCHAR(45) NOT NULL,
`telefone` INT NOT NULL,
`nic` INT NOT NULL,
PRIMARY KEY (`n.id`));

CREATE TABLE IF NOT EXISTS `NaturalBeauty`.`turno` (
`parteDia` VARCHAR(45) NOT NULL,
`id` INT NOT NULL AUTO_INCREMENT,
PRIMARY KEY (`id`),
INDEX `fk_Turno_Funcionario_idx` (`id` ASC),
CONSTRAINT `fk_Turno_Funcionario`
FOREIGN KEY (`id`)
REFERENCES `NaturalBeauty`.`funcionario` (`n.id`));

CREATE TABLE IF NOT EXISTS `NaturalBeauty`.`definidopor` (
`Turno_id` INT NOT NULL,
`horario_id` INT NOT NULL,
PRIMARY KEY (`Turno_id`, `horario_id`),
INDEX `fk_Turno_has_horario_horario1_idx` (`horario_id` ASC),

INDEX `fk_Turno_has_horario_Turno1_idx` (`Turno_id` ASC),
CONSTRAINT `fk_Turno_has_horario_horario1`
FOREIGN KEY (`horario_id`)
REFERENCES `NaturalBeauty`.`horario` (`id`),
CONSTRAINT `fk_Turno_has_horario_Turno1`
FOREIGN KEY (`Turno_id`)
REFERENCES `NaturalBeauty`.`turno` (`id`));

CREATE TABLE IF NOT EXISTS `NaturalBeauty`.`seccao` (
`id` INT NOT NULL AUTO_INCREMENT,
`nome` VARCHAR(45) NOT NULL,
PRIMARY KEY (`id`));

CREATE TABLE IF NOT EXISTS `NaturalBeauty`.`dependede` (
`Turno_id` INT NOT NULL,
`seccao_id` INT NOT NULL,
PRIMARY KEY (`Turno_id`, `seccao_id`),
INDEX `fk_Turno_has_seccao_seccao1_idx` (`seccao_id` ASC),
INDEX `fk_Turno_has_seccao_Turno1_idx` (`Turno_id` ASC),
CONSTRAINT `fk_Turno_has_seccao_seccao1`
FOREIGN KEY (`seccao_id`)
REFERENCES `NaturalBeauty`.`seccao` (`id`),
CONSTRAINT `fk_Turno_has_seccao_Turno1`
FOREIGN KEY (`Turno_id`)
REFERENCES `NaturalBeauty`.`turno` (`id`));

CREATE TABLE IF NOT EXISTS `NaturalBeauty`.`entrega` (
`nEntrega` INT NOT NULL AUTO_INCREMENT,
`validade` DATE NOT NULL,
`reserva` INT NOT NULL,
`quantidade` INT NOT NULL,
PRIMARY KEY (`nEntrega`));

CREATE TABLE IF NOT EXISTS `NaturalBeauty`.`produto` (
`codigo` INT NOT NULL AUTO_INCREMENT,
`nome` VARCHAR(45) NOT NULL,
`tipoProduto` VARCHAR(45) NOT NULL,
`validade` DATE NOT NULL,
PRIMARY KEY (`codigo`));

CREATE TABLE IF NOT EXISTS `NaturalBeauty`.`envia` (
`Entrega_tipoProduto` INT NOT NULL,
`Produto_codigo` INT NOT NULL,
PRIMARY KEY (`Entrega_tipoProduto`, `Produto_codigo`),
INDEX `fk_Entrega_has_Produto_Produto1_idx` (`Produto_codigo` ASC),
INDEX `fk_Entrega_has_Produto_Entrega1_idx` (`Entrega_tipoProduto` ASC),
CONSTRAINT `fk_Entrega_has_Produto_Entrega1`
FOREIGN KEY (`Entrega_tipoProduto`)
REFERENCES `NaturalBeauty`.`entrega` (`nEntrega`),
CONSTRAINT `fk_Entrega_has_Produto_Produto1`
FOREIGN KEY (`Produto_codigo`)
REFERENCES `NaturalBeauty`.`produto` (`codigo`));

CREATE TABLE IF NOT EXISTS `NaturalBeauty`.`formacao` (
`tipoFormacao` VARCHAR(45) NOT NULL,
`nome` VARCHAR(45) NOT NULL,
PRIMARY KEY (`tipoFormacao`));

CREATE TABLE IF NOT EXISTS `NaturalBeauty`.`fornecedor` (
`nid` INT NOT NULL AUTO_INCREMENT,
`nome` VARCHAR(45) NOT NULL,
`telefone` INT NOT NULL,
PRIMARY KEY (`nid`));

CREATE TABLE IF NOT EXISTS `NaturalBeauty`.`precisade` (
`Funcionario_n.id` INT NOT NULL,
`Formacao_tipoFormacao` VARCHAR(45) NOT NULL,
PRIMARY KEY (`Funcionario_n.id`, `Formacao_tipoFormacao`),
INDEX `fk_Funcionario_has_Formacao_Formacao1_idx` (`Formacao_tipoFormacao` ASC),
INDEX `fk_Funcionario_has_Formacao_Funcionario1_idx` (`Funcionario_n.id` ASC),
CONSTRAINT `fk_Funcionario_has_Formacao_Formacao1`
FOREIGN KEY (`Formacao_tipoFormacao`)
REFERENCES `NaturalBeauty`.`formacao` (`tipoFormacao`),
CONSTRAINT `fk_Funcionario_has_Formacao_Funcionario1`
FOREIGN KEY (`Funcionario_n.id`)
REFERENCES `NaturalBeauty`.`funcionario` (`n.id`));

CREATE TABLE IF NOT EXISTS `NaturalBeauty`.`tem` (
`horario_id` INT NOT NULL,
`Fornecedor_nid` INT NOT NULL,
PRIMARY KEY (`horario_id`, `Fornecedor_nid`),
INDEX `fk_horario_has_Fornecedor_Fornecedor1_idx` (`Fornecedor_nid` ASC),
INDEX `fk_horario_has_Fornecedor_horario1_idx` (`horario_id` ASC),
CONSTRAINT `fk_horario_has_Fornecedor_Fornecedor1`
FOREIGN KEY (`Fornecedor_nid`)
REFERENCES `NaturalBeauty`.`fornecedor` (`nid`),
CONSTRAINT `fk_horario_has_Fornecedor_horario1`
FOREIGN KEY (`horario_id`)
REFERENCES `NaturalBeauty`.`horario` (`id`));

```


## DML

Em baixo apresentamos alguns dados inseridos em cada uma das colunas com uma respetiva print do mesmo no mysql.

### funcionario

```sql
INSERT INTO naturalbeauty.funcionario VALUES ('1', 'Ana Sousa', 'morada1', '960000001', '100000001');
INSERT INTO naturalbeauty.funcionario VALUES ('2', 'Tania Fonseca', 'morada2', '960000002', '100000002');
INSERT INTO naturalbeauty.funcionario VALUES ('3', 'Teresa Moreira', 'morada3', '960000003', '100000003');
INSERT INTO naturalbeauty.funcionario VALUES ('4', 'Rita Vaz', 'morada4', '960000004', '100000004');
INSERT INTO naturalbeauty.funcionario VALUES ('5', 'Joao Silva', 'morada5', '960000005', '100000005');
INSERT INTO naturalbeauty.funcionario VALUES ('6', 'Fabio Vieira', 'morada6', '960000006', '100000006');
INSERT INTO naturalbeauty.funcionario VALUES ('7', 'Joana Lamelas', 'morada7', '960000007', '100000007');
INSERT INTO naturalbeauty.funcionario VALUES ('8', 'Claudio Santos', 'morada8', '960000008', '100000008');
INSERT INTO naturalbeauty.funcionario VALUES ('9', 'Juliana Bastos', 'morada9', '960000009', '100000009');
INSERT INTO naturalbeauty.funcionario VALUES ('10', 'Isabel Costa', 'morada10', '960000010', '100000010');
INSERT INTO naturalbeauty.funcionario VALUES ('11', 'Liliana Campos', 'morada11', '960000011', '100000011');
INSERT INTO naturalbeauty.funcionario VALUES ('12', 'Elisabete fernandes', 'morada12', '960000012', '100000012');
INSERT INTO naturalbeauty.funcionario VALUES ('13', 'Filipa Cunha', 'morada13', '960000013', '100000013');
INSERT INTO naturalbeauty.funcionario VALUES ('14', 'Luisa Sampaio', 'morada14', '960000014', '100000014');
INSERT INTO naturalbeauty.funcionario VALUES ('15', 'Joana Barbosa', 'morada15', '960000015', '100000015');
INSERT INTO naturalbeauty.funcionario VALUES ('16', 'Pedro Golcalves', 'morada16', '960000016', '100000016');
```
```sql
SELECT * FROM naturalbeauty.funcionario
```

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
