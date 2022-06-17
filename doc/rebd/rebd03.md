# C3 : Normalização

## Conversão do Modelo EA para Modelo Relacional

### Passo 1: Entidades tipo

Funcionario (nome, morada, nic, _nidentificao_)

Seccao (nome, _id_)

Fornecedor (nome, _nid_)

Horario (_id_, horafim, horainicio, diasemana)

Entrega (_numeroentrega_, validade, reserva, quantidade)

Produto (nome, tipoproduto, _codigo_, validade)

Turno (_id_, partedia, hora)

Formacao (nome, _tipoformacao_)

### Passo 2: Associações 1:1

Não existe associações com carnalidade 1:1

### Passo 3: Associações 1:N

Funcionario (nome, morada, nic, _nidentificao_,
#_id_ -> Turno)

Seccao (nome, _id_)

Fornecedor (nome, _nid_)

Horario (_id_, horafim, horainicio, diasemana)

Entrega (_numeroentrega_, validade, reserva, quantidade,
#_nid_ -> Fornecedor)

Produto (nome, tipoproduto, _codigo_, validade)

Turno (_id_, partedia, hora)

Formacao (nome, _tipoformacao_)


### Passo 4: Associações N:M

Funcionario (nome, morada, nic, _nidentificao_,
#_id_ -> Turno)

Seccao (nome, _id_)

Fornecedor (nome, _nid_)

Horario (_id_, horafim, horainicio, diasemana)

Entrega (_numeroentrega_, validade, reserva, quantidade,
#_nid_ -> Fornecedor)

Produto (nome, tipoproduto, _codigo_, validade)

Turno (_id_, partedia, hora)

Formacao (nome, _tipoformacao_)

PrecisaDe (# _nidentificacao_ -> Funcionario, #_tipoformacao_ -> Formacao)

DependeDe (#_id_ -> Turno, #_id_-> Seccao)

DefinidoPor (#_id_ ->Tuno, #_id_-> Horario)

Tem (#_nid_-> Fornecedor, # _id_-> Horario)

Envia (#_numeroentrega_ -> Entrega, #_codigo_ -> Produto)

### Passo 5: Atributo Multivalor

Funcionario (nome, morada, nic, _nidentificao_,
#_id_ -> Turno)

Seccao (nome, _id_)

Fornecedor (nome, _nid_)

Horario (_id_, horafim, horainicio, diasemana)

Entrega (_numeroentrega_, validade, reserva, quantidade,
#_nid_ -> Fornecedor)

Produto (nome, tipoproduto, _codigo_, validade)

Turno (_id_, partedia, hora)

Formacao (nome, _tipoformacao_)

PrecisaDe (# _nidentificacao_ -> Funcionario, #_tipoformacao_ -> Formacao)

DependeDe (#_id_ -> Turno, #_id_-> Seccao)

DefinidoPor (#_id_ ->Tuno, # _id_-> Horario)

Tem (#_nid_-> Fornecedor, #_id_-> Horario)

Envia (#_numeroentrega_ -> Entrega, #_codigo_ -> Produto)

Contacto (# _nidentificacao_ -> Funcionario, #_nid_ -> Fornecedor, _telefone_)

### Passo 6: Associações ternárias

Não existe associações ternárias

### Passo 7: Entidades Fracas

Não existe entidades fracas




## Relacoes 


|Funcionario   |    |      |   |              |
|--------------|----|------|---|--------------|
|_nidenticacao_|nome|morada|nic|#_id_ -> Turno|

|Seccao|    |    
|------|----|
|_id_  |nome|

|Fornecedor|    |
|----------|----|
|_id_      |nome|

|Horario|       |          |         |
|-------|-------|----------|---------|
|_id_   |horafim|horainicio|diasemana|

|Entrega        |        |       |          |                    |
|---------------|--------|-------|----------|--------------------|
|_numeroentrega_|validade|reserva|quantidade|#_nid_ -> Fornecedor|

|Produto |    |           |        |
|--------|----|-----------|--------|
|_codigo_|nome|tipoproduto|validade|


|Turno|        |    |
|-----|--------|----|
|_id_ |partedia|hora|

|Formacao      |    |
|--------------|----|
|_tipoformacao_|nome|


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
