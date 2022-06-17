# C3 : Normalização

## Conversão do Modelo EA para Modelo Relacional

### Passo 1: Entidades tipo

Funcionario (nome, morada, nic, _ nidentificao _)

Seccao (nome, _ id _)

Fornecedor (nome, _ nid _)

Horario (_ id _, horafim, horainicio, diasemana)

Entrega (_ numeroentrega _, validade, reserva, quantidade)

Produto (nome, tipoproduto, _ codigo _, validade)

Turno (_ id _, partedia, hora)

Formacao (nome, _ tipoformacao _)

### Passo 2: Associações 1:1

Não existe associações com carnalidade 1:1

### Passo 3: Associações 1:N

Funcionario (nome, morada, nic, _ nidentificao _,
#_ id _ -> Turno)

Seccao (nome, _ id _)

Fornecedor (nome, _ nid _)

Horario (_ id _, horafim, horainicio, diasemana)

Entrega (_ numeroentrega _, validade, reserva, quantidade,
#_ nid _ -> Fornecedor)

Produto (nome, tipoproduto, _ codigo _, validade)

Turno (_ id _, partedia, hora)

Formacao (nome, _ tipoformacao _)


### Passo 4: Associações N:M

Funcionario (nome, morada, nic, _ nidentificao _,
#_ id _ -> Turno)

Seccao (nome, _ id _)

Fornecedor (nome, _ nid _)

Horario (_ id _, horafim, horainicio, diasemana)

Entrega (_ numeroentrega _, validade, reserva, quantidade,
#_ nid _ -> Fornecedor)

Produto (nome, tipoproduto, _ codigo _, validade)

Turno (_ id _, partedia, hora)

Formacao (nome, _ tipoformacao _)

PrecisaDe (# _ nidentificacao _ -> Funcionario, #_ tipoformacao _ -> Formacao)

DependeDe (#_ id _ -> Turno, #_ id _-> Seccao)

DefinidoPor (#_ id _ ->Turno, #_ id _-> Horario)

Tem (#_ nid _-> Fornecedor, # _ id _-> Horario)

Envia (#_ numeroentrega _ -> Entrega, #_ codigo _ -> Produto)

### Passo 5: Atributo Multivalor

Funcionario (nome, morada, nic, _ nidentificao _,
#_ id _ -> Turno)

Seccao (nome, _ id _)

Fornecedor (nome, _ nid _)

Horario (_ id _, horafim, horainicio, diasemana)

Entrega (_ numeroentrega _, validade, reserva, quantidade,
#_ nid _ -> Fornecedor)

Produto (nome, tipoproduto, _ codigo _, validade)

Turno (_ id _, partedia, hora)

Formacao (nome, _ tipoformacao _)

PrecisaDe (# _ nidentificacao _ -> Funcionario, #_ tipoformacao _ -> Formacao)

DependeDe (# _ id _ -> Turno, # _ id _-> Seccao)

DefinidoPor (#_ id _ ->Turno, # _ id _-> Horario)

Tem (# _ nid _-> Fornecedor, # _ id _-> Horario)

Envia (#_ numeroentrega _ -> Entrega, #_ codigo _ -> Produto)

Contacto (# _ nidentificacao _ -> Funcionario, #_ nid _ -> Fornecedor, _ telefone _)

### Passo 6: Associações ternárias

Não existe associações ternárias

### Passo 7: Entidades Fracas

Não existe entidades fracas




## Relacoes 


|Funcionario     |    |      |   |                |
|----------------|----|------|---|----------------|
|_ nidenticacao _|nome|morada|nic|#_ id _ -> Turno|

|Seccao  |    |    
|--------|----|
|_ id _  |nome|

|Fornecedor  |    |
|------------|----|
|_ id _      |nome|

|Horario|       |          |         |
|-------|-------|----------|---------|
|_ id _ |horafim|horainicio|diasemana|

|Entrega          |        |       |          |                      |
|-----------------|--------|-------|----------|----------------------|
|_ numeroentrega _|validade|reserva|quantidade|#_ nid _ -> Fornecedor|

|Produto   |    |           |        |
|----------|----|-----------|--------|
|_ codigo _|nome|tipoproduto|validade|


|Turno  |        |    |
|-------|--------|----|
|_ id _ |partedia|hora|

|Formacao        |    |
|----------------|----|
|_ tipoformacao _|nome|


|PrecisaDe                        |                            |
|---------------------------------|----------------------------|
|#_ nidentificacao _ ->Funcionario|#_ tipoformacao _ ->Formacao|

|DependeDe      |               |        
|---------------|---------------|
|#_ id _ ->Turno|#_ id _->Seccao|
 
|DefinidoPor     |                | 
|----------------|----------------|
|#_ id _ -> Turno|#_ id _->Horario|

|Envia                        |                     |            
|-----------------------------|---------------------|
|#_ nunmeroentrega _ ->Entrega|#_ codigo _ ->Produto|

|Contacto                         |                     |            |  
|---------------------------------|---------------------|------------|
|#_ nidentificacao _ ->Funcionario|#_ nid _ ->Fornecedor|_ telefone _|


# Normalização do Esquema Relacional

#### Dependências Funcionais:

TURNO (#_ nid  _ ->FUNCIONARIO, _ id _, partedia, hora)

FORMACAO (#_ nid  _ ->FUNCIONARIO, _ tipoformacao _, nome)

SECCAO (#_ id  _ ->TURNO, _ id _, nome)

HORARIO (#_ id  _ ->TURNO, _ id _, horafim, horainicio, diasemana)

HORARIO (#_ nid  _ ->FORNECEDOR, _ id _, horafim, horainicio, diasemana)

PRODUTO (#_ nentrega  _ ->ENTREGA, _ codigo _, nome, tipoproduto, validade)

ENTREGA (#_ nid  _ ->FORNECEDOR, _ codigo _, nome, tipoproduto, validade

## 1ª Forma Normal (1NF)

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


## 2ª Forma Normal (2NF)

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


## 3ª Forma Normal (3NF)

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


## Forma Normal de Boyce-Codd (BCNF)

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

## 4ª Forma Normal (4NF)

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
