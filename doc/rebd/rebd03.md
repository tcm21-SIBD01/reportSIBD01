# C3 : Normalização

## Conversão do Modelo EA para Modelo Relacional

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


- Não existem associações 1:1 , nem associações ternárias, nem entidades fracas. 

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

---
# Normalização do Esquema Relacional

#### Dependências Funcionais:

Tipoformacao --> nome

ParteDia --> id

Id --> nome

Id --> horaFim, horaInicio, diaSemana

Nid --> nome, telefone

nEntrega --> quantidade, reserva, validade

código --> nome, tipoProduto, validade

n.id --> telefone, nome, morada, nic

---
FORMACAO (nome, <ins>tipoformacao</ins> )

1NF

Já se encontra na 1NF

2NF

Já se encontra na 2NF

3NF

Já se encontra na 3NF

----
FUNCIONARIO (nome, {telefone (telefonepessoal, telefonecasa)}, morada, nic , <ins>nidentificacao</ins>)

1NF

FUNCIONARIO (nome, morada, nic, <ins>nidentificacao</ins>)

TELEFONE (#nidentificacao --> telefonepessoal, telefonecasa)

2NF

Já se encontra na 2NF

3NF

Já se encontra na 3NF

----
TURNO (<ins>id</ins>, partedia ,hora)

1NF

Já se encontra na 1NF

2NF

Já se encontra na 2NF

3NF

Já se encontra na 3NF

----
SECCAO (nome,<ins>id</ins>) 

1NF

Já se encontra na 1NF

2NF

Já se encontra na 2NF

3NF

Já se encontra na 3NF

----
HORARIO (<ins>id</ins>, horafim, horainicio, diasemana)

1NF

Já se encontra na 1NF

2NF

Já se encontra na 2NF

3NF

Já se encontra na 3NF

----
FORNECEDOR (nome, <ins>nid</ins> , {telefone (telefonepessoal, telefoneempresa) })

1NF

FORNECEDOR (nome, <ins>nid</ins>)

TELEFONE (#nid --> telefonepessoal, telefonecasa)

2NF

Já se encontra na 2NF

3NF

Já se encontra na 3NF

----
ENTREGA (<ins>nentrega</ins> , validade, reserva, quantidade)

1NF

Já se encontra na 1NF

2NF

Já se encontra na 2NF

3NF

ENTREGA (<ins>nentrega</ins> , validade, reserva)
ENCOMENDA (#reserva --> quantidade)

----
PRODUTO (nome,tipoproduto, <ins>codigo</ins> ,validade )

1NF

Já se encontra na 1NF

2NF

Já se encontra na 2NF

3NF

Já se encontra na 3NF

----


---
[< Previous](rebd02.md) | [^ Main](https://github.com/exemploTrabalho/reportSIBD/) | [Next >](rebd04.md)
