# C3 : Normalização

## Conversão do Modelo EA para Modelo Relacional

### Passo 1: Entidades e Atributos

Funcionario (_n.id, nome, morada, nic, telefone*)

Formacao (_tipoFormacao, nomeFormacao)

Turno (_parteDia, hora)

Horario (_diaSemana, horaFim, horaInicio)

Seccao (_gerencia, cosmético, fornecedor, reposição, caixa, perfumaria, limpeza, maquilhagem)

Fornecedor (_id, nome, tipoStock, telefone*)

Produto (_codigo, nome, tipoProduto, validade)

Entrega(_tipoProduto, validade, reserva, quantidade)

### Passo 2: Associações 1:1
Não existe associações de carnalidade 1:1

#### Passo 3: Associações 1:N

Funcionario (_n.id, nome, morada, nic, telefone*
#_parteDia -> Turno)

Formacao (_tipoFormacao, nomeFormacao)

Turno (_parteDia, hora
#_gerencia -> Turno, #_diaSemana -> Horario)

Horario (_diaSemana, horaFim, horaInicio)

Seccao (_gerencia, cosmético, fornecedor, reposição, caixa, perfumaria, limpeza, maquilhagem)

Fornecedor (_id, nome, tipoStock, telefone*)

Produto (_codigo, nome, tipoProduto, validade)

Entrega (_tipoProduto, validade, reserva, quantidade
#_id -> Fornecedor)

### Passo 4: Associações N:M

Funcionario (_n.id, nome, morada, nic, telefone*
#_parteDia -> Turno)

Formacao (_tipoFormacao, nomeFormacao)

Turno (_parteDia, hora
#_gerencia -> Turno, #_diaSemana -> Horario)

Horario (_diaSemana, horaFim, horaInicio)

Seccao (_gerencia, cosmético, fornecedor, reposição, caixa, perfumaria, limpeza, maquilhagem)

Fornecedor (_id, nome, tipoStock, telefone*)

Produto (_codigo, nome, tipoProduto, validade)

Entrega (_tipoProduto, validade, reserva, quantidade
#_id -> Fornecedor)

Precisade ( #_n.id -> Funcionario, #_tipoFormacao -> Formacao)

Envia (#_tipoProduto -> Entrega, #_codigo -> Produto)

### Passo 5: Atributo Multivalor

Funcionario (_n.id, nome, morada, nic, telefone*
#_parteDia -> Turno)

Formacao (_tipoFormacao, nomeFormacao)

Turno (_parteDia, hora
#_gerencia -> Turno, #_diaSemana -> Horario)

Horario (_diaSemana, horaFim, horaInicio)

Seccao (_gerencia, cosmético, fornecedor, reposição, caixa, perfumaria, limpeza, maquilhagem)

Fornecedor (_id, nome, tipoStock, telefone*)

Produto (_codigo, nome, tipoProduto, validade)

Entrega (_tipoProduto, validade, reserva, quantidade
#_id -> Fornecedor)

Precisade (#_n.id -> Funcionario, #_tipoFormacao -> Formacao)

Envia (#_tipoProduto -> Entrega, #_codigo -> Produto)

Contacto (#_n.id -> Funcionario, #_id -> Fornecedor, telefone)


### Passo 6: Associação ternária


Funcionario (_n.id, nome, morada, nic, telefone*
#_parteDia -> Turno)

Formacao (_tipoFormacao, nomeFormacao)

Turno (_parteDia, hora
#_gerencia -> Turno, #_diaSemana -> Horario)

Horario (_diaSemana, horaFim, horaInicio)

Seccao (_gerencia, cosmético, fornecedor, reposição, caixa, perfumaria, limpeza, maquilhagem)

Fornecedor (_id, nome, tipoStock, telefone*)

Produto (_codigo, nome, tipoProduto, validade)

Entrega (_tipoProduto, validade, reserva, quantidade
#_id -> Fornecedor)

Precisade (#_n.id -> Funcionario, #_tipoFormacao -> Formacao)

Envia (#_tipoProduto -> Entrega, #_codigo -> Produto)

Contacto (#_n.id -> Funcionario, #_id -> Fornecedor, telefone)

Tem ( #_id -> Fornecedor, #_gerencia -> Seccao, #_diaSemana ->Horario)


### Passo 7: Entidades Fracas

Não existe Entidades Fracas



## Relacoes 


|Funcionario|    |      |   |         |                   |
|-----------|----|------|---|---------|-------------------|
|_n.id      |nome|morada|nic|telefone*|#_parteDia -> Turno|

|Formacao     |            |    
|-------------|------------|
|_tipoFormacao|nomeFormacao|

|Turno    |    |                 |                    |
|---------|----|-----------------|--------------------|
|_parteDia|hora|#_gerencia->Turno|#_diaSemana->Horario|

|Horario   |       |          |      
|----------|-------|----------|
|_diaSemana|horaFim|horaInicio|

|Seccao   |         |          |         |                        |           |
|---------|---------|----------|---------|------------------------|-----------|
|_gerencia|cosmetico|fornecedor|reposicao|caixa|perfumaria|limpeza|maquilhagem|

|Fornecedor|    |         |         |
|----------|----|---------|---------|
|_id       |nome|tipoStock|telefone*|


|Produto|    |           |        |
|-------|----|-----------|--------|
|_codigo|nome|tipoProduto|validade|

|Entrega     |        |       |          |                |
|------------|--------|-------|----------|----------------|
|_tipoProduto|validade|reserva|quantidade|#_id->Fornecedor|


|PrecisaDe          |                        |
|-------------------|------------------------|
|#_n.id->Funcionario|#_tipoFormacao->Formacao|

|Envia                 |                 |        
|----------------------|-----------------|
|#_tipoProduto->Entrega|#_codigo->Produto|

|Contacto           |                 |        |
|-------------------|-----------------|--------|
|#_n.id->Funcionario|#_codigo->Produto|telefone|

|Tem             |                  |                     |             
|----------------|------------------|---------------------|
|#_id->Fornecedor|#_gerencia->Seccao|#p_diaSemana->Horario|


## Normalização do Esquema Relacional






---
[< Previous](rebd02.md) | [^ Main](https://github.com/exemploTrabalho/reportSIBD/) | [Next >](rebd04.md)
