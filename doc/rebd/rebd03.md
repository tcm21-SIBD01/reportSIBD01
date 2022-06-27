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
#turnoId -> Turno NN)

Seccao (nome, _ id _)

Fornecedor (nome, _ nid _)

Horario (_ id _, horafim, horainicio, diasemana)

Entrega (_ numeroentrega _, validade, reserva, quantidade,
#fornecedorNid -> Fornecedor NN)

Produto (nome, tipoproduto, _ codigo _, validade)

Turno (_ id _, partedia, hora)

Formacao (nome, _ tipoformacao _)


### Passo 4: Associações N:M

Funcionario (nome, morada, nic, _ nidentificao _,
#turnoId -> Turno NN)

Seccao (nome, _ id _)

Fornecedor (nome, _ nid _)

Horario (_ id _, horafim, horainicio, diasemana)

Entrega (_ numeroentrega _, validade, reserva, quantidade,
#fornecedorNid -> Fornecedor NN)

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
#turnoId -> Turno NN)

Seccao (nome, _ id _)

Fornecedor (nome, _ nid _)

Horario (_ id _, horafim, horainicio, diasemana)

Entrega (_ numeroentrega _, validade, reserva, quantidade,
#fornecedorNid -> Fornecedor NN)

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


|Funcionario     |    |      |   |                   |         |
|----------------|----|------|---|-------------------|---------|
|_ nidenticacao _|nome|morada|nic|#turnoId-> Turno NN| Cargo NN|

|Seccao  |    |    
|--------|----|
|_ id _  |nome|

|Fornecedor  |    |
|------------|----|
|_ id _      |nome|

|Horario|       |          |         |
|-------|-------|----------|---------|
|_ id _ |horafim|horainicio|diasemana|

|Entrega          |        |       |          |                               |        |
|-----------------|--------|-------|----------|-------------------------------|--------|
|_ numeroentrega _|validade|reserva|quantidade|#fornecedorNid -> Fornecedor NN|Cargo NN|

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

### 1ª Forma Normal (1NF)


FUNCIONARIO (nome, #telefone, morada, nic, _ nidentificacao _)

CONTACTO (_ telefone _, telefonepessoal, telefonetrabalho)

FORNECEDOR (nome, #telefone, _ nid _)

CONTACTO (_ telefone _,telefonepessoal, telefonetrabalho)


### 2ª Forma Normal (2NF)

Já se encontra na 2NF


### 3ª Forma Normal (3NF)

ENTREGA (_ numeroentrega _,validade, #reserva)

reservaquantidade (_ reserva _, quantidade)


### Forma Normal de Boyce-Codd (BCNF)

Já se encontra na BCNF


### 4ª Forma Normal (4NF)

Já se encontra na 4NF


---
[< Previous](rebd02.md) | [^ Main](https://github.com/exemploTrabalho/reportSIBD/) | [Next >](rebd04.md)
