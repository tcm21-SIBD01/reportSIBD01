# C3 : Normalização

## Conversão do Modelo EA para Modelo Relacional




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

# 1ª Forma Normal (1NF)

Funcionario (_n.id, #nome, morada, nic
#_parteDia -> Turno)

  Telefonefuncionario (_nome, telefone)

Formacao (_tipoFormacao, nomeFormacao)

Turno (_parteDia, hora
#_gerencia -> Turno, #_diaSemana -> Horario)

Horario (_diaSemana, horaFim, horaInicio)

Seccao (_gerencia, cosmético, fornecedor, reposição, caixa, perfumaria, limpeza, maquilhagem)

Fornecedor (_id, #nome, tipoStock)
  
  Telefonefornecedor (_nome, telefone)

Produto (_codigo, nome, tipoProduto, validade)

Entrega (_tipoProduto, validade, reserva, quantidade
#_id -> Fornecedor)

Precisade (#_n.id -> Funcionario, #_tipoFormacao -> Formacao)

Envia (#_tipoProduto -> Entrega, #_codigo -> Produto)

Contacto (#_n.id -> Funcionario, #_id -> Fornecedor, telefone)

Tem ( #_id -> Fornecedor, #_gerencia -> Seccao, #_diaSemana ->Horario)


# 2ª Forma Normal (2NF)

Funcionario (_n.id, #nome, morada, nic
#_parteDia -> Turno)

  Telefonefuncionario (_nome, telefone)

Formacao (_tipoFormacao, nomeFormacao)

Turno (_parteDia, hora
#_gerencia -> Turno, #_diaSemana -> Horario)

Horario (_diaSemana, horaFim, horaInicio)

Seccao (_gerencia, cosmético, fornecedor, reposição, caixa, perfumaria, limpeza, maquilhagem)

Fornecedor (_id, #nome, tipoStock)
  
  Telefonefornecedor (_nome, telefone)

Produto (_codigo, nome, tipoProduto, validade)

Entrega (_tipoProduto, validade, reserva, quantidade
#_id -> Fornecedor)

Precisade (#_n.id -> Funcionario, #_tipoFormacao -> Formacao)

Envia (#_tipoProduto -> Entrega, #_codigo -> Produto)

Contacto (#_n.id -> Funcionario, #_id -> Fornecedor, telefone)

Tem ( #_id -> Fornecedor, #_gerencia -> Seccao, #_diaSemana ->Horario)


# 3ª Forma Normal (3NF)

Funcionario (_n.id, #nome, morada, nic
#_parteDia -> Turno)

  Telefonefuncionario (_nome, telefone)

Formacao (_tipoFormacao, nomeFormacao)

Turno (_parteDia, hora
#_gerencia -> Turno, #_diaSemana -> Horario)

Horario (_diaSemana, horaFim, horaInicio)

Seccao (_gerencia, cosmético, fornecedor, reposição, caixa, perfumaria, limpeza, maquilhagem)

Fornecedor (_id, #nome, tipoStock)
  
  Telefonefornecedor (_nome, telefone)

Produto (_codigo, nome, tipoProduto, validade)

Entrega (_tipoProduto, validade, reserva, quantidade
#_id -> Fornecedor)

Precisade (#_n.id -> Funcionario, #_tipoFormacao -> Formacao)

Envia (#_tipoProduto -> Entrega, #_codigo -> Produto)

Contacto (#_n.id -> Funcionario, #_id -> Fornecedor, telefone)

Tem ( #_id -> Fornecedor, #_gerencia -> Seccao, #_diaSemana ->Horario)


# Forma Normal de Boyce-Codd (BCNF)

Funcionario (_n.id, #nome, morada, nic
#_parteDia -> Turno)

  TELEFONEFUNCIONARIO (_nome, telefone)

Formacao (_tipoFormacao, nomeFormacao)

Turno (_parteDia, hora
#_gerencia -> Turno, #_diaSemana -> Horario)

Horario (_diaSemana, horaFim, horaInicio)

Seccao (_gerencia, cosmético, fornecedor, reposição, caixa, perfumaria, limpeza, maquilhagem)

Fornecedor (_id, #nome, tipoStock)
  
  TELEFONEFORNECEDOR (_nome, telefone)

Produto (_codigo, nome, tipoProduto, validade)

Entrega (_tipoProduto, validade, reserva, quantidade
#_id -> Fornecedor)

Precisade (#_n.id -> Funcionario, #_tipoFormacao -> Formacao)

Envia (#_tipoProduto -> Entrega, #_codigo -> Produto)

Contacto (#_n.id -> Funcionario, #_id -> Fornecedor, telefone)

Tem ( #_id -> Fornecedor, #_gerencia -> Seccao, #_diaSemana ->Horario)

# 4ª Forma Normal (4NF)

Funcionario (_n.id, #nome
#_parteDia -> Turno)

  Localidade (_nome, morada)
  
  Identificacao (_nome, nic)

  Telefonefuncionario (_nome, telefone)

Formacao (_tipoFormacao, nomeFormacao)

Turno (_parteDia, hora
#_gerencia -> Turno, #_diaSemana -> Horario)

Horario (_diaSemana, horaFim, horaInicio)

Seccao (_gerencia, cosmético, fornecedor, reposição, caixa, perfumaria, limpeza, maquilhagem)

Fornecedor (_id, #nome, tipoStock)
  
  Telefonefornecedor (_nome, telefone)

Produto (_codigo, nome, tipoProduto, validade)

Entrega (_tipoProduto, validade, #reserva
#_id -> Fornecedor)

  Reservaquantidade (_reserva, quantidade)

Precisade (#_n.id -> Funcionario, #_tipoFormacao -> Formacao)

Envia (#_tipoProduto -> Entrega, #_codigo -> Produto)

Contacto (#_n.id -> Funcionario, #_id -> Fornecedor, telefone)

Tem ( #_id -> Fornecedor, #_gerencia -> Seccao, #_diaSemana ->Horario)


---
[< Previous](rebd02.md) | [^ Main](https://github.com/exemploTrabalho/reportSIBD/) | [Next >](rebd04.md)
